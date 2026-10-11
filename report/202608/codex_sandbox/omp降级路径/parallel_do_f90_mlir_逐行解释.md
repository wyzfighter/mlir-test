# `parallel_do.f90.mlir` 逐行解释

> 输入文件：`/home/wangyz/.llvm/test/openacc/parallel_do/parallel_do.f90.mlir`
> 快照：2026-08-22，共 **30 行**（注：8/19 最初版本为 78 行，含 `a(i)=i` 写数组与
> `print` 输出；当前为精简版，只剩“并行空循环写私有变量”，更适合聚焦 omp 降级研究）。
> 生成方式：`tco -emit-final-mlir`（FIR → 代码生成后停留在 LLVM dialect + OpenMP
> dialect，尚未降级到 LLVM IR）。
> 对照图：直译路径 [openmp_dispatch.png](openmp_dispatch.png)，降级产物
> [parallel_do.f90.ll](/home/wangyz/test/openacc/parallel_do/parallel_do.f90.ll)。

---

## 全文（带行号）

```mlir
  1| module attributes {dlti.dl_spec = ...(9 个模块属性)...} {
  2|   omp.private {type = private} @_QFEi_private_i32 : i32
  3|   llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
  4|     %0 = llvm.mlir.constant(1 : i64) : i64
  5|     %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
  6|     %2 = llvm.mlir.constant(100 : i32) : i32
  7|     %3 = llvm.mlir.constant(1 : i32) : i32
  8|     %4 = llvm.mlir.constant(1 : i64) : i64
  9|     omp.parallel {
 10|       omp.wsloop private(@_QFEi_private_i32 %1 -> %arg0 : !llvm.ptr) {
 11|         omp.loop_nest (%arg1) : i32 = (%3) to (%2) inclusive step (%3) {
 12|           llvm.store %arg1, %arg0 {tbaa = ...} : i32, !llvm.ptr
 13|           omp.yield
 14|         }
 15|       }
 16|       omp.terminator
 17|     }
 18|     llvm.return
 19|   }
 20|   llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
 21|   llvm.func @_FortranAProgramEndStatement() attributes {sym_visibility = "private"}
 22|   llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
 23|     %0 = llvm.mlir.constant(0 : i32) : i32
 24|     %1 = llvm.mlir.zero : !llvm.ptr
 25|     llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %1) {fastmathFlags = #llvm.fastmath<contract>} : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
 26|     llvm.call @_QQmain() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
 27|     llvm.call @_FortranAProgramEndStatement() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
 28|     llvm.return %0 : i32
 29|   }
 30| }
```

---

## 第 1 行：模块头（module attributes）

一行挂了 9 个模块级属性，前 6 个是平台/编译信息，后 3 个（`omp.*`）是 OpenMP 降级配置：

| 属性 | 含义 | 谁消费 |
|---|---|---|
| `dlti.dl_spec = #dlti.dl_spec<...>` | DLTI 方言的数据布局描述：`!llvm.ptr<270/271/272>`（flang 使用的三类指针空间）位宽 32/32/64，`i64=64`、`i128=128`、`f80=128`、`i1/i8=8`…，含 `endianness="little"`、`mangling_mode="e"`、`legal_int_widths=[8,16,32,64]`、`stack_alignment=128` | 数据布局查询、优化/合法化 |
| `fir.defaultkind = "a1c4d8i4l4r4"` | flang 默认 kind：character=1、complex=4、double=8、integer=4、logical=4、real=4 | flang 前端语义 |
| `fir.kindmap = ""` | kind 映射表为空（未自定义 `-fdefault-*`） | flang 前端 |
| `llvm.data_layout = "e-m:e-..."` | LLVM 数据布局字符串，与 `dlti.dl_spec` 对应；最终写进 LLVM module | 直译出口（`translateModuleToLLVMIR`） |
| `llvm.ident = "flang version 22.1.8 (...)"` | 编译器标识，进 `.ll` 的 `!llvm.ident` | 直译出口 |
| `llvm.target_triple = "x86_64-unknown-linux-gnu"` | 目标三元组 | 直译出口 |
| `omp.is_gpu = false` | 非 GPU 编译；`amendOperation` 写入 `OpenMPIRBuilderConfig.IsGPU` | OpenMP 翻译接口（[OpenMPToLLVMIRTranslation.cpp:7188](//home/wangyz/.llvm/llvm-project/mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp:7188)） |
| `omp.is_target_device = false` | 非 target device；`convertOperation` 据此走 host 分支（:7279） | OpenMP 翻译接口 |
| `omp.target_triples = []` | offload 目标列表为空 | OpenMP 翻译接口 |
| `omp.version = #omp.version<version = 31>` | OpenMP 3.1；翻译时写 module flag `"openmp"=31`（:7216） | OpenMP 翻译接口 |

---

## 第 2 行：`omp.private` 声明

```mlir
omp.private {type = private} @_QFEi_private_i32 : i32
```

- 声明一个**私有化配方**：符号 `@_QFEi_private_i32`（对应 Fortran 变量 `i`，`i32` 类型），
  `type = private` 表示普通 private（区别于 firstprivate）。
- 它本身不做事，是“声明”，被 `omp.wsloop` 的 `private(...)` 子句引用。
- 降级时（`convertOmpWsloop` 的 `PrivateVarsInfo`）据此在 outlined 区里生成
  `%omp.private.alloc` 并插入初始化/清理。

---

## 第 3–19 行：主函数 `llvm.func @_QQmain`

### 第 3 行

```mlir
llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
```

- flang 主程序的内部函数名 `_QQmain`（对应 Fortran `program main`）；
- `fir.bindc_name = "MAIN"`：绑定的 C 名字是 `MAIN`（Fortran 主程序标准名）。

### 第 4–8 行：常量与栈分配

```mlir
%0 = llvm.mlir.constant(1 : i64) : i64      // 4: alloca 元素个数
%1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr   // 5
%2 = llvm.mlir.constant(100 : i32) : i32    // 6: 循环上界（Fortran n=100 已被常数折叠）
%3 = llvm.mlir.constant(1 : i32) : i32      // 7: 循环下界与步长
%4 = llvm.mlir.constant(1 : i64) : i64      // 8: 当前文件中未使用（8/19 完整版用于 a(1) 下标）
```

- 第 4–5 行：给循环变量 `i` 分配一个 `i32` 的栈槽，返回指针 `%1`；
- 第 6–7 行：`100` 与 `1`——对应源码 `n = 100; do i = 1, n`，`n` 被折叠成常数 100；
- 第 8 行：`%4` 定义后无引用（可 `rg '%4'` 验证），属 codegen 精简后遗留的常量。

### 第 9–17 行：OpenMP 结构（本文件核心）

```mlir
 9|     omp.parallel {
10|       omp.wsloop private(@_QFEi_private_i32 %1 -> %arg0 : !llvm.ptr) {
11|         omp.loop_nest (%arg1) : i32 = (%3) to (%2) inclusive step (%3) {
12|           llvm.store %arg1, %arg0 {tbaa = ...} : i32, !llvm.ptr
13|           omp.yield
14|         }
15|       }
16|       omp.terminator
17|     }
```

| 行 | 解释 |
|---|---|
| 9 | `omp.parallel`：并行区（`singleRegion=true`，唯一的 region 就是 body）。降级时被 outline 成独立函数，外部用 `__kmpc_fork_call` 调用 |
| 10 | `omp.wsloop private(...)`：工作共享循环。`private(@_QFEi_private_i32 %1 -> %arg0 : !llvm.ptr)` 表示：原变量地址 `%1`（栈上的 `i`）在并行区里被私有化为块参数 `%arg0`；`@_QFEi_private_i32` 指向第 2 行的配方 |
| 11 | `omp.loop_nest (%arg1) : i32 = (%3) to (%2) inclusive step (%3)`：规范化循环——iv `%arg1` 类型 `i32`，下界 `%3`=1，上界 `%2`=100（含端点），步长 `%3`=1。**iv 是 i32 无符号 → 直译时选 `__kmpc_for_static_init_4u`**（`createForStaticInitFunction` 的 IVSize=32、无符号） |
| 12 | 循环体唯一语句：`llvm.store %arg1, %arg0`——把 iv 写进私有 `i`。`tbaa` 元数据（根 `"Flang function root _QQmain"`、`"any data access"`）供 LLVM 别名分析用 |
| 13 | `omp.yield`：循环体终结符（翻译时省略，结构由父 op 建好） |
| 14–15 | 闭合 `loop_nest` 与 `wsloop` |
| 16 | `omp.terminator`：并行区终结符（翻译成 `__kmpc_barrier` 前的收尾点） |
| 17 | 闭合 `omp.parallel` |

### 第 18–19 行

```mlir
18|     llvm.return
19|   }
```

`_QQmain` 无返回值，`llvm.return` 结束函数体。

---

## 第 20–21 行：flang 运行时声明

```mlir
20|   llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
21|   llvm.func @_FortranAProgramEndStatement() attributes {sym_visibility = "private"}
```

- 只声明不定义（`sym_visibility = "private"`），链接时从 libFortranRuntime 提供；
- `ProgramStart` 负责运行时初始化（命令行、环境等）；`ProgramEndStatement` 负责收尾。

---

## 第 22–29 行：C 入口 `llvm.func @main`

```mlir
22|   llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
23|     %0 = llvm.mlir.constant(0 : i32) : i32
24|     %1 = llvm.mlir.zero : !llvm.ptr
25|     llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %1) ...
26|     llvm.call @_QQmain() ...
27|     llvm.call @_FortranAProgramEndStatement() ...
28|     llvm.return %0 : i32
29|   }
```

| 行 | 解释 |
|---|---|
| 22 | C ABI 入口：`argc`（i32）、`argv`（ptr）、`envp`（ptr），返回 `i32`（退出码） |
| 23 | 退出码 0 |
| 24 | `llvm.mlir.zero : !llvm.ptr` 生成空指针（传给 ProgramStart 的第 4 参，本程序未用） |
| 25 | 运行时初始化 |
| 26 | **真正的程序逻辑**（`_QQmain`，含 omp 并行区） |
| 27 | 运行时收尾 |
| 28 | `return 0` |

---

## 全局视角：这个文件在降级链中的位置

```
parallel_do.f90（源码）
  → flang 前端（FIR）
  → tco -emit-final-mlir   ← 本文件（LLVM dialect + OpenMP dialect 并存）
  → addLLVMDialectToLLVMPass（直译）
  → parallel_do.f90.ll（__kmpc_fork_call / __kmpc_for_static_init_4u / barrier）
```

与 `.ll` 的对应关系：

| 本文件 | `.ll` 产物 |
|---|---|
| `omp.parallel`（第 9 行） | `__kmpc_global_thread_num` + `__kmpc_fork_call` + outline 函数 `_QQmain..omp_par` |
| `omp.wsloop`（第 10 行） | `__kmpc_for_static_init_4u(..., 34 /* static */, ...)` + `__kmpc_for_static_fini` |
| `omp.loop_nest` iv `: i32`（第 11 行） | `_4u` 后缀（i32 无符号） |
| `omp.terminator`（第 16 行） | `__kmpc_barrier` |
| `omp.private @_QFEi_private_i32`（第 2 行） | outlined 区里的 `%omp.private.alloc` |
| `omp.version = 31`（第 1 行） | `!llvm.module.flags = {i32 7, !"openmp", i32 31}` |

---

## 关键机制索引

- omp op 的声明源头：[OpenMPOps.td:191](//home/wangyz/.llvm/llvm-project/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td:191)（`def ParallelOp`），
  逐行解释见同目录 [OpenMPOps_td_ParallelOp_逐行解析.md](../OpenMPOps_td_ParallelOp_逐行解析.md)；
- 直译三层分派：见 [openmp_dispatch.png](openmp_dispatch.png) 与
  `mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp`；
- runtime 函数名选择：[OMPIRBuilder.cpp:8039](//home/wangyz/.llvm/llvm-project/llvm/lib/Frontend/OpenMP/OMPIRBuilder.cpp:8039)
  `createForStaticInitFunction`；
- 验证方法：见同目录 [验证策略.md](验证策略.md)。

> 注意：本文件是 2026-08-22 的快照，若后续重新生成（源码或 flang 版本变化），行号与
> 内容可能变化；解释以当时磁盘内容为准。
