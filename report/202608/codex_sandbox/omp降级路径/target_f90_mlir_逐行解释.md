# `target.f90.mlir` 逐行解释

> 输入文件：`/home/wangyz/.llvm/test/openacc/omp-target/target.f90.mlir`
> 快照：2026-08-22，共 **56 行**。生成方式：`tco -emit-final-mlir`。
> 源码（`target.f90`）：
>
> ```fortran
> program main
>   implicit none
>   integer :: i, n, a(100)
>   n = 100
>   !$omp target map(to:n) map(from:a)
>   do i = 1, n
>   end do
>   !$omp end target
> end program
> ```
>
> 与 `parallel_do.f90.mlir` 的关键差异：本文件是 **`omp.target` + map**（offload 场景），
> target 区域内的 `do` 是普通循环（**没有** `omp.loop_nest`，因为无 worksharing 指令）。

---

## 全文（带行号）

```mlir
  1| module attributes {dlti.dl_spec = ...(10 个模块属性)...} {
  2|   llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
  3|     %0 = llvm.mlir.constant(1 : i64) : i64
  4|     %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
  5|     %2 = llvm.mlir.constant(1 : i64) : i64
  6|     %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
  7|     %4 = llvm.mlir.constant(99 : index) : i64
  8|     %5 = llvm.mlir.constant(0 : index) : i64
  9|     %6 = llvm.mlir.constant(1 : index) : i64
 10|     %7 = llvm.mlir.constant(100 : i32) : i32
 11|     %8 = llvm.mlir.constant(100 : index) : i64
 12|     %9 = llvm.mlir.addressof @_QFEa : !llvm.ptr
 13|     %10 = llvm.mlir.constant(1 : i64) : i64
 14|     %11 = llvm.mlir.constant(1 : i64) : i64
 15|     llvm.store %7, %1 {tbaa = ...allocated data/_QFEn...} : i32, !llvm.ptr
 16|     %12 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "n"}
 17|     %13 = omp.map.bounds lower_bound(%5 : i64) upper_bound(%4 : i64) extent(%8 : i64) stride(%6 : i64) start_idx(%6 : i64)
 18|     %14 = omp.map.info var_ptr(%9 : !llvm.ptr, !llvm.array<100 x i32>) map_clauses(from) capture(ByRef) bounds(%13) -> !llvm.ptr {name = "a"}
 19|     %15 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
 20|     omp.target map_entries(%12 -> %arg0, %14 -> %arg1, %15 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
 21|       %16 = llvm.mlir.constant(0 : index) : i64
 22|       %17 = llvm.mlir.constant(1 : index) : i64
 23|       %18 = llvm.load %arg0 {tbaa = ...allocated data/_QFEn...} : !llvm.ptr -> i32
 24|       %19 = llvm.sext %18 : i32 to i64
 25|       %20 = llvm.trunc %17 : i64 to i32
 26|       llvm.br ^bb1(%20, %19 : i32, i64)
 27|     ^bb1(%21: i32, %22: i64):  // 2 preds: ^bb0, ^bb2
 28|       %23 = llvm.icmp "sgt" %22, %16 : i64
 29|       llvm.cond_br %23, ^bb2, ^bb3
 30|     ^bb2:  // pred: ^bb1
 31|       llvm.store %21, %arg2 {tbaa = ...allocated data/_QFEi...} : i32, !llvm.ptr
 32|       %24 = llvm.load %arg2 {tbaa = ...allocated data/_QFEi...} : !llvm.ptr -> i32
 33|       %25 = llvm.add %24, %20 overflow<nsw> : i32
 34|       %26 = llvm.sub %22, %17 : i64
 35|       llvm.br ^bb1(%25, %26 : i32, i64)
 36|     ^bb3:  // pred: ^bb1
 37|       llvm.store %21, %arg2 {tbaa = ...allocated data/_QFEi...} : i32, !llvm.ptr
 38|       omp.terminator
 39|     }
 40|     llvm.return
 41|   }
 42|   llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32} : !llvm.array<100 x i32> {
 43|     %0 = llvm.mlir.zero : !llvm.array<100 x i32>
 44|     llvm.return %0 : !llvm.array<100 x i32>
 45|   }
 46|   llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
 47|   llvm.func @_FortranAProgramEndStatement() attributes {sym_visibility = "private"}
 48|   llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
 49|     %0 = llvm.mlir.constant(0 : i32) : i32
 50|     %1 = llvm.mlir.zero : !llvm.ptr
 51|     llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %1) {fastmathFlags = #llvm.fastmath<contract>} : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
 52|     llvm.call @_QQmain() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
 53|     llvm.call @_FortranAProgramEndStatement() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
 54|     llvm.return %0 : i32
 55|   }
 56| }
```

---

## 第 1 行：模块头

与 `parallel_do.f90.mlir` 相同的 9 个属性之外，多了一个 **`omp.requires = #omp<clause_requires none>`**：

| 属性 | 说明 |
|---|---|
| `dlti.dl_spec` / `fir.defaultkind` / `fir.kindmap` / `llvm.data_layout` / `llvm.ident` / `llvm.target_triple` | 同 parallel_do，见 [parallel_do_f90_mlir_逐行解释.md](parallel_do_f90_mlir_逐行解释.md) |
| `omp.is_gpu = false` / `omp.is_target_device = false` / `omp.target_triples = []` / `omp.version = 31` | 同 parallel_do |
| **`omp.requires = #omp<clause_requires none>`** | target 相关的 requires 子句（此处为 none）；翻译时由 `amendOperation` 解析（`OpenMPToLLVMIRTranslation.cpp:7228`），逐个写进 `OpenMPIRBuilderConfig`（如 reverse_offload / unified_address / unified_shared_memory / dynamic_allocators） |

---

## 第 2–41 行：主函数 `_QQmain`

### 第 3–15 行：常量、栈分配、`n = 100`

| 行 | 内容 | 含义 |
|---|---|---|
| 3–4 | `%1 = llvm.alloca ... x i32 {bindc_name = "n"}` | 给 `n` 分配栈槽 |
| 5–6 | `%3 = llvm.alloca ... x i32 {bindc_name = "i"}` | 给 `i` 分配栈槽 |
| 7 | `%4 = constant(99 : index)` | **数组上界偏移 99**（a 的下标 1..100 → 0..99） |
| 8–9 | `%5 = 0`、`%6 = 1`（index） | bounds 的 lower_bound 与 stride/start_idx |
| 10 | `%7 = 100 : i32` | `n` 的初值（对应 `n = 100`） |
| 11 | `%8 = 100 : index` | 数组 extent（100 个元素） |
| 12 | `%9 = addressof @_QFEa` | 数组 `a` 的基址 |
| 13–14 | `%10/%11 = 1 : i64` | 地址计算辅助（与 a(1) 下标计算相关） |
| 15 | `llvm.store %7, %1 {tbaa="allocated data/_QFEn"}` | `n = 100` 写入栈变量 |

### 第 16–19 行：map 三件套（offload 的核心）

```mlir
16| %12 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "n"}
17| %13 = omp.map.bounds lower_bound(%5 : i64) upper_bound(%4 : i64) extent(%8 : i64) stride(%6 : i64) start_idx(%6 : i64)
18| %14 = omp.map.info var_ptr(%9 : !llvm.ptr, !llvm.array<100 x i32>) map_clauses(from) capture(ByRef) bounds(%13) -> !llvm.ptr {name = "a"}
19| %15 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
```

| 行 | op | 含义 |
|---|---|---|
| 16 | `omp.map.info`：`n` | 对应 `map(to:n)`；`var_ptr(%1, i32)` 是原变量指针与类型，`capture(ByRef)` 按引用捕获，产出 target 内使用的指针 |
| 17 | `omp.map.bounds`：`a` 的边界 | `lower_bound=0`、`upper_bound=99`、`extent=100`、`stride=1`、`start_idx=1`——1-based Fortran 数组的线性化信息 |
| 18 | `omp.map.info`：`a` | 对应 `map(from:a)`；带 `bounds(%13)` 引用第 17 行的边界，`capture(ByRef)` |
| 19 | `omp.map.info`：`i` | **隐式映射**（`map_clauses(implicit)`）：循环变量自动进 target，`capture(ByCopy)` 按值捕获（对应 firstprivate 语义） |

### 第 20–39 行：`omp.target` 区域

```mlir
20| omp.target map_entries(%12 -> %arg0, %14 -> %arg1, %15 -> %arg2 : !llvm.ptr, ...) {
```

- `map_entries(%12 -> %arg0, ...)`：三个 map.info 的结果按顺序绑定为 target region 的
  入口块参数 `%arg0`（n 的设备端指针）、`%arg1`（a）、`%arg2`（i 的副本）。
- 21–22：`%16=0`、`%17=1`（index）——循环条件与步进的辅助常量。
- 23–26：循环初始化：`%18 = load %arg0`（读设备端 n）→ `%19 = sext n : i32 to i64`
  （计数初值）；`%20 = trunc 1 : i64 to i32`（i 初值 1）；`llvm.br ^bb1(%20, %19)` 带两个
  PHI 值进入循环头。
- 27–29：`^bb1(%21: i32=i, %22: i64=剩余次数)`：`icmp "sgt" %22, 0` → `cond_br` 决定
  进 `^bb2`（还有迭代）还是 `^bb3`（结束）。
- 30–35：`^bb2` 循环体：`store %21, %arg2`（i 写进设备端副本）→ load → `i+1`、
  `剩余次数-1` → 跳回 `^bb1`。**循环体为空**（源码 `do` 里没有语句），所以这里只推进 i。
- 36–38：`^bb3` 退出：`store %21, %arg2`（把最终 i 写回设备副本）→ `omp.terminator`
  结束 target region。

> 注意：这里 target 内的 `do` 循环被降级成**普通 CFG 循环**（`llvm.br/cond_br`），
> 没有 `omp.loop_nest`——因为没有 worksharing，flang 把它当普通循环生成。

### 第 40–41 行

`llvm.return` 结束 `_QQmain`。

---

## 第 42–45 行：全局数组 `@_QFEa`

```mlir
42| llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32} : !llvm.array<100 x i32> {
43|   %0 = llvm.mlir.zero : !llvm.array<100 x i32>
44|   llvm.return %0 : !llvm.array<100 x i32>
45| }
```

- `internal` 全局数组（`a(100)`），`addr_space = 0`（默认地址空间）；
- 初始化体返回零值（`zeroinitializer`）。

---

## 第 46–55 行：运行时声明与 `@main`

与 `parallel_do.f90.mlir` 完全一致：`_FortranAProgramStart`/`_FortranAProgramEndStatement`
声明 + `@main`（`ProgramStart → _QQmain → ProgramEndStatement → return 0`），不再重复。

---

## 降级要点

- `omp.target` 在直译路径由 `convertOmpTarget` 处理（`OpenMPToLLVMIRTranslation.cpp`），
  生成 offload 代码；`omp.map.info` / `omp.map.bounds` 由 target 翻译时消费
  （`convertOmpTargetData` 族），`map_entries` 决定 `__tgt_target_*` 参数表。
- `omp.requires` 经 `amendOperation` 写入 `OpenMPIRBuilderConfig`（:7228）。
- 与 `parallel_do` 对照：parallel 场景的核心是“outline + worksharing 分发”，target
  场景的核心是“map 数据搬移 + 设备执行”。
