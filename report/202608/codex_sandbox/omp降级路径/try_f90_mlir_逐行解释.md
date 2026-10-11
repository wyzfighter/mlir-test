# `try.f90.mlir` 逐行解释

> 输入文件：`/home/wangyz/.llvm/test/openacc/acc_loop/try.f90.mlir`
> （注意：目录名实际是 `acc_loop`，不是 `accloop`）
> 快照：2026-08-22，共 **38 行**。生成方式：`tco -emit-final-mlir`。
> 源码（`try.f90`）：
>
> ```fortran
> program main
>   implicit none
>   integer :: i
>   !$acc parallel loop
>   do i = 1, 100
>   end do
>   !$acc end parallel loop
> end program
> ```
>
> 重要：这是 **OpenACC** 测试（`acc` dialect），不是 OpenMP。它展示的是
> `!$acc parallel loop` 组合构造在 MLIR 里的形态：`acc.parallel combined(loop)` +
> `acc.loop combined(parallel)`。

---

## 全文（带行号）

```mlir
  1| module attributes {dlti.dl_spec = ...(6 个模块属性)...} {
  2|   acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  3|   ^bb0(%arg0: !fir.ref<i32>):
  4|     %0 = llvm.mlir.constant(1 : i64) : i64
  5|     %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
  6|     %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
  7|     %3 = llvm.mlir.constant(1 : i64) : i64
  8|     acc.yield %2 : !fir.ref<i32>
  9|   }
 10|   llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
 11|     %0 = llvm.mlir.constant(1 : i64) : i64
 12|     %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
 13|     %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
 14|     %3 = llvm.mlir.constant(100 : i32) : i32
 15|     %4 = llvm.mlir.constant(1 : i32) : i32
 16|     %5 = llvm.mlir.constant(1 : i64) : i64
 17|     acc.parallel combined(loop) {
 18|       %6 = acc.private varPtr(%2 : !fir.ref<i32>) recipe(@privatization_ref_i32) -> !fir.ref<i32> {implicit = true, name = "i"}
 19|       %7 = builtin.unrealized_conversion_cast %6 : !fir.ref<i32> to !llvm.ptr
 20|       acc.loop combined(parallel) private(%6 : !fir.ref<i32>) control(%arg0 : i32) = (%4 : i32) to (%3 : i32)  step (%4 : i32) {
 21|         llvm.store %arg0, %7 {tbaa = ...any data access...} : i32, !llvm.ptr
 22|         acc.yield
 23|       } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
 24|       acc.yield
 25|     }
 26|     llvm.return
 27|   }
 28|   llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
 29|   llvm.func @_FortranAProgramEndStatement() attributes {sym_visibility = "private"}
 30|   llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
 31|     %0 = llvm.mlir.constant(0 : i32) : i32
 32|     %1 = llvm.mlir.zero : !llvm.ptr
 33|     llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %1) {fastmathFlags = #llvm.fastmath<contract>} : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
 34|     llvm.call @_QQmain() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
 35|     llvm.call @_FortranAProgramEndStatement() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
 36|     llvm.return %0 : i32
 37|   }
 38| }
```

---

## 第 1 行：模块头

6 个模块属性，与 omp 版本相比**没有 `omp.*` 属性**（这是 OpenACC，目标属性由 acc
构造自身携带）：

| 属性 | 说明 |
|---|---|
| `dlti.dl_spec` | 数据布局描述（同前） |
| `fir.defaultkind` / `fir.kindmap` | flang 默认 kind 与 kind 映射（同前） |
| `llvm.data_layout` / `llvm.ident` / `llvm.target_triple` | LLVM 数据布局、编译器标识、目标三元组（同前） |

---

## 第 2–9 行：私有化配方 `acc.private.recipe`

```mlir
 2| acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
 3| ^bb0(%arg0: !fir.ref<i32>):
 4|   %0 = llvm.mlir.constant(1 : i64) : i64
 5|   %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
 6|   %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
 7|   %3 = llvm.mlir.constant(1 : i64) : i64
 8|   acc.yield %2 : !fir.ref<i32>
 9| }
```

| 行 | 含义 |
|---|---|
| 2 | 声明一个私有化“配方”`@privatization_ref_i32`，产出 `!fir.ref<i32>`，带 `init` 初始化体（等价于 omp 的 `omp.private`） |
| 3 | 配方入口块参数 `%arg0`（原变量引用） |
| 4–5 | 分配一块新栈空间（i32）作为私有变量 |
| 6 | `builtin.unrealized_conversion_cast`：把 `!llvm.ptr` 转成 `!fir.ref<i32>`——**类型混合的标志**：这是 codegen 中间态，LLVM 类型与 FIR 类型并存，靠该 cast 临时桥接 |
| 8 | `acc.yield` 返回私有变量的 FIR 引用 |

---

## 第 10–27 行：主函数 `_QQmain`

### 第 11–16 行：栈分配与常量

| 行 | 含义 |
|---|---|
| 11–12 | `%1 = llvm.alloca ... {bindc_name = "i"}`：给 `i` 分配栈槽 |
| 13 | `unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>`：把栈指针桥接成 FIR 引用（后续 `acc.private` 需要 FIR 类型） |
| 14–15 | `%3=100`、`%4=1`（i32）：循环上界与下界/步长 |
| 16 | `%5=1`（i64）：辅助常量（本文件未用） |

### 第 17–25 行：组合构造 `acc.parallel combined(loop)` + `acc.loop combined(parallel)`

```mlir
17| acc.parallel combined(loop) {
18|   %6 = acc.private varPtr(%2 : !fir.ref<i32>) recipe(@privatization_ref_i32) -> !fir.ref<i32> {implicit = true, name = "i"}
19|   %7 = builtin.unrealized_conversion_cast %6 : !fir.ref<i32> to !llvm.ptr
20|   acc.loop combined(parallel) private(%6 : !fir.ref<i32>) control(%arg0 : i32) = (%4 : i32) to (%3 : i32)  step (%4 : i32) {
21|     llvm.store %arg0, %7 {tbaa = ...} : i32, !llvm.ptr
22|     acc.yield
23|   } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
24|   acc.yield
25| }
```

| 行 | op | 含义 |
|---|---|---|
| 17 | `acc.parallel combined(loop)` | 组合构造 `parallel loop` 的 **parallel 叶**；`combined(loop)` 标记它与内层 loop 是同一个组合构造 |
| 18 | `acc.private varPtr(...) recipe(...)` | 私有变量声明：`i` 是隐式私有（`implicit = true`），用第 2 行的配方做初始化 |
| 19 | `unrealized_conversion_cast` | 把私有变量的 FIR 引用桥接回 `!llvm.ptr`（循环体写值用） |
| 20 | `acc.loop combined(parallel) private(...) control(%arg0) = (1) to (100) step (1)` | 组合构造的 **loop 叶**；`combined(parallel)` 与 parallel 互指；`control` 子句描述规范化循环：iv `%arg0`（i32）、1..100、步长 1；`private(%6)` 引用第 18 行的私有变量 |
| 21 | 循环体：`llvm.store %arg0, %7` | 把 iv 写进私有 `i`（空循环体） |
| 22 | `acc.yield` | 循环体终结 |
| 23 | 属性：`inclusiveUpperbound=[true]`（do 循环含上界）、`independent=[#acc.device_type<none>]`（声明无循环间依赖，允许并行化——OpenACC 的 `loop independent` 语义） |
| 24 | `acc.yield` | parallel 区域终结 |

### 第 26–27 行

`llvm.return` 结束 `_QQmain`。

---

## 第 28–37 行：运行时声明与 `@main`

与 omp 版本一致（`ProgramStart → _QQmain → ProgramEndStatement → return 0`），不再重复。

---

## 与 OpenMP 形态的对照

| 概念 | OpenMP（`parallel_do.f90.mlir`） | OpenACC（`try.f90.mlir`） |
|---|---|---|
| 私有化声明 | `omp.private @_QFEi_private_i32 : i32` | `acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {...}` |
| 组合构造 | `omp.composite` 属性（本文件未用） | `acc.parallel combined(loop)` / `acc.loop combined(parallel)` |
| 循环结构 | `omp.wsloop` + `omp.loop_nest` | `acc.loop control(...)` |
| 类型桥接 | 纯 `!llvm.ptr` | `!fir.ref` 与 `!llvm.ptr` 混用 + `builtin.unrealized_conversion_cast` |
| 降级 | OpenMPToLLVMIRTranslation（`__kmpc_*`） | OpenACCToLLVMIRTranslation / acc 转换 pass（`acc.*` runtime，如 `acc_parallel_` 族） |

> 提示：`builtin.unrealized_conversion_cast` 是 codegen 中间态的“临时桥”，正常 pass
> pipeline 结束前必须被消除；看到它说明这份 final-mlir 处于 FIR 类型与 LLVM 类型
> 混存的中间阶段。
