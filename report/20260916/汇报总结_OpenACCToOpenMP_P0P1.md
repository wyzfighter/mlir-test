# 汇报总结：OpenACC compute 构造桥接到 OpenMP（A+B 混合路线）

> 汇报日期：2026-09-15
> 汇报范围：P0（pass 骨架与注册）、P1（`acc.parallel combined(loop)` + `acc.loop` 桥接）
> 事实基线：所有结论均经本地源码与构建产物核对；未验证项已标注。
> 上游文档：`/home/wangyz/.llvm/codex_sandbox/A+B混合路线实施指导.md`、`/home/wangyz/.llvm/codex_sandbox/AB混合路径/P0.md`

---

## 0. 一页话结论

LLVM 在 OpenACC 上有明确缺陷：**compute 构造（`acc.parallel` / `acc.loop` / `acc.private` / recipe）没有任何降级通路**，`OpenACCToLLVMIRTranslation` 只实现了 data 类算子，compute 全部落入 `unsupported` 分支。

本阶段选择 **A+B 混合路线**：不改上游既有数据路径，新增一个 fork 内的 conversion pass `convert-openacc-to-openmp`，把 compute 构造桥接到 OpenMP，复用 libomp 的 host 并行；数据构造继续走原有的 `__tgt_*` 直译。

P0、P1 已完成并通过验收：**`!$acc parallel loop` 的 7 行 Fortran 已能端到端产出 `__kmpc_fork_call` + `__kmpc_for_static_init_4u`，且生成的 LLVM IR 通过 `llvm-as` 校验。**

---

## 1. 建议的 PPT 页序

### 第 1 页 · 背景：缺陷在哪

要点：

- OpenACC 在 LLVM 的现状：**data 通路齐全，compute 通路缺失**。
- 证据（源码定位，已核对）：
  - `mlir/lib/Target/LLVMIR/Dialect/OpenACC/OpenACCToLLVMIRTranslation.cpp:496-527` 的 `convertOperation` 是 `llvm::TypeSwitch`，只显式覆盖 data 类算子：`acc.data`（499）、`acc.enter_data`（502）、`acc.exit_data`（507）、`acc.update`（512）；外加 `acc.terminator`/`acc.yield` 直接省略（517）、`acc.create`/`copyin`/`copyout`/`delete`/`update_device`/`get_device_ptr` 记为 NOP（518-522）。
  - 其余全部落入 `.Default`，在 `:525` 报 `"unsupported OpenACC operation: "`。
  - 因此 `acc.parallel` / `acc.loop` / `acc.private` / `acc.private.recipe` 均无降级通路。
- 后果：含 `!$acc parallel loop` 的程序无法从 MLIR 降到 LLVM IR。

建议配图：一条断掉的降级链（Frontend → acc dialect → ??? → LLVM IR）。

### 第 2 页 · 路线选择：为什么是 A+B 混合

要点：

- **A（直译补全）**：在 `OpenACCToLLVMIRTranslation.cpp` 里补齐 compute 构造的串行降级。工程量大、可上游化，但产出的不是并行代码。
- **B（Conversion 桥接）**：新增 `convert-openacc-to-openmp`，把 compute 构造转成 OpenMP 构造，直接复用已验证的 `omp.* → __kmpc_*` 通路。
- **本阶段选 A+B 混合**：compute 走 B（拿到真正的 host 并行），data 保持 A 的现状（继续产出 `__tgt_*`）。
- 明确非目标：**不做 device offload**。产出的是 host 并行（libomp），不是设备执行。

建议配图：双通路框图（omp.* → libomp；acc data → libomptarget）。

### 第 3 页 · 目标产物

输入（`try.f90`，7 行）：

```fortran
program main
  implicit none
  integer :: i
  !$acc parallel loop
  do i = 1, 100
  end do
  !$acc end parallel loop
end program
```

目标 IR 形态：

```mlir
omp.parallel {
  omp.wsloop {
    omp.loop_nest (%iv) : i32 = (%lb) to (%ub) inclusive step (%st) {
      ...body...
      omp.yield
    }
  }
  omp.terminator
}
```

### 第 4 页 · P0：pass 骨架与注册（已完成）

要点：

- 新建 3 个文件、改 5 个既有文件，新增代码 254 行，既有文件净增 16 行。
- pass 锚在 **`ModuleOp`**（不是 `func::FuncOp`），因此能覆盖 `llvm.func`——这是后面两条管道都能跑通的关键。
- 注册路径：`add_mlir_conversion_library` → 全局属性 `MLIR_CONVERSION_LIBS` → `MLIRRegisterAllPasses`，`mlir-opt` 自动带上；`fir-opt` 不走 `registerAllPasses()`，需单独注册。
- 关键定位：pass 定义在 `mlir/include/mlir/Conversion/Passes.td:1047`；`fir-opt` 的 include 与注册分别在 `flang/tools/fir-opt/fir-opt.cpp:15` 和 `:46`。

验收证据：

```text
fir-opt  --help | grep convert-openacc-to-openmp   → 命中
mlir-opt --help | grep convert-openacc-to-openmp   → 命中
```

### 第 5 页 · P1：桥接实现（已完成）

要点：

- 匹配 `acc.parallel`（region 内最后一个非终结算子须为 `acc.loop`）。
- 先把 loop 之前的算子提升进 `omp.parallel` region（保证值支配关系），再依次构造：
  `omp.parallel` → `omp.wsloop` → `omp.loop_nest`。
- `acc.yield` → `omp.yield`，补 `omp.terminator`，最后擦除源算子。
- **闭区间不走 `ub+1`**：`acc.loop` 的 `inclusiveUpperbound` 直接映射到 `omp.loop_nest` 的 `loop_inclusive`，避免整数溢出。
- clause 归一化限定在**即将被消费的 region 内**（见第 7 页的坑）。

### 第 6 页 · 验收证据（核心页）

命令：

```bash
fir-opt --convert-openacc-to-openmp try.fir.mlir | tco -o try.ll
grep -E "__kmpc_fork_call|__kmpc_for_static_init" try.ll
```

结果：

```text
call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
call void @__kmpc_for_static_init_4u(ptr @1, i32 ..., i32 34, ptr %p.lastiter, ...)
declare void @__kmpc_for_static_init_4u(...)
declare !callback !9 void @__kmpc_fork_call(...)
```

- `llvm-as` 校验生成的 LLVM IR：**通过**。
- 循环语义核对：归一化后 `lb=0, ub=99, step=1` → **100 次迭代**，与源码 `i = 1, 100` 闭区间一致。
- 两条管道均通过（见第 8 页）。

### 第 7 页 · 关键设计决策与踩坑（建议单列，这是最有价值的一页）

**坑 1：头文件名**

- `mlir/Dialect/OpenACC/OpenACCDialect.h` **不存在**；全树通行写法是 `mlir/Dialect/OpenACC/OpenACC.h`。
- 教训：ODS 的 `def` 名（`OpenACC_ParallelOp`）与实际头文件名不成规律，必须查证。

**坑 2：全局归一化会破坏未被转换的 IR**

- 按上游文档写的模块级 `ACCOpReplaceWithVarConversion<acc::PrivateOp>` 替换，会让**未被转换**的 `acc.loop`（例如 `combined(serial)`）留下一个 `private` 操作数，而它已不再由 `acc.private` 定义，acc verifier 直接报错：

  ```text
  error: 'acc.loop' op expected private as defining op
  ```

- 现象：`try.f90.mlir` 因为构造被完整转换而掩盖了该问题；换成含 `combined(serial)` 的输入即暴露。
- 修法：把归一化**限定在被消费的 region 内**，并把 recipe 清理挪到转换**之后**（按符号引用判断是否还有用户，而不是按 SSA use 判断——recipe 无 SSA 结果，`use_empty()` 恒为真，会误删仍在被引用的 recipe）。

**坑 3：空 body 会被 DCE**

- 空循环体转换后 `omp.parallel` 变成 memory-effect-free，被 greedy driver 当作死代码消除。这是合法优化，不是 pattern 缺陷；验证时需要给 body 放一个有副作用的算子。

**设计决策：`omp.wsloop` 而非 `omp.loop`**

- 采用 `omp.wsloop`，与 `SCFToOpenMP.cpp` 的已验证写法保持一致（该路径能稳定产出 `__kmpc_for_static_init_*`），不自行发明构造顺序。

### 第 8 页 · 两条管道的验证（体现 pass 的鲁棒性）

| 管道 | 路径 | 结果 |
|---|---|---|
| `bbc-firopt-tco` | bbc → `fir-opt --convert-openacc-to-openmp` → tco | 通过，产出 `__kmpc_*` |
| `bbc-tco-firopt-tco` | bbc → tco → `fir-opt --convert-openacc-to-openmp` → tco | 通过，产出 `__kmpc_*` |

含义：pass 锚在 `ModuleOp`，在**高层 FIR**（`func.func` + `fir.alloca` + `hlfir.declare`）和**已降到 LLVM 层**（`llvm.func` + `unrealized_conversion_cast`）两种 IR 上都能工作，插入点灵活。

### 第 9 页 · 局限与风险（必须讲，避免过度承诺）

1. **没有运行时验证**。没有链接 libomp 编成可执行文件真跑一遍；"100 次迭代" 是静态推断，不是实测。
2. **private 语义是简化**。归一化把 per-thread 私有副本替换成 host 变量，本用例中对 `i` 的存储实际落在共享位置，**存在数据竞争**。这是 MVP 的已知取舍，P3 补真正的 recipe 展开。
3. **覆盖范围有限**。仅覆盖 `acc.parallel` + `acc.loop` 组合；`acc.serial` / `acc.kernels` / reduction 未覆盖。
4. **非上游方案**。目标是 fork 内可用，不追求上游可接受；上游走的是 ACCToLLVM + libacctarget 路线。
5. **尚无 lit 测试**。当前验证均为手工命令，P2 固化为可重复资产。

### 第 10 页 · 下一步

| 阶段 | 内容 | 验收 |
|---|---|---|
| P2 | lit 测试（`mlir/test/Conversion/OpenACCToOpenMP/basic.mlir`） | `llvm-lit -sv` 通过 |
| P3 | `acc.serial` / `acc.kernels`；reduction 语义；真正的 recipe 展开（alloca + init region + 每迭代独立存储） | 新增测试通过，消除数据竞争 |
| 可选 | 运行时验证：链接 libomp 编成可执行并实际执行，核对结果与线程数 | 端到端可执行 |

---

## 2. 数据与命令速查（可作 backup 页）

### 改动清单

新增（254 行）：

- `mlir/include/mlir/Conversion/OpenACCToOpenMP/ConvertOpenACCToOpenMP.h`（28 行）
- `mlir/lib/Conversion/OpenACCToOpenMP/OpenACCToOpenMP.cpp`（208 行，核心实现）
- `mlir/lib/Conversion/OpenACCToOpenMP/CMakeLists.txt`（18 行）

修改（净增 16 行）：

- `mlir/include/mlir/Conversion/Passes.td`（+7，pass 定义）
- `mlir/include/mlir/Conversion/Passes.h`（+5，include）
- `mlir/lib/Conversion/CMakeLists.txt`（+1，`add_subdirectory`）
- `flang/tools/fir-opt/fir-opt.cpp`（+2，include + 注册）
- `flang/tools/fir-opt/CMakeLists.txt`（+1，链接 `MLIROpenACCToOpenMP`）

### 复现命令

```bash
# 构建
cmake -S /home/wangyz/.llvm/llvm-project/llvm -B /home/wangyz/.llvm/build-dcc
cmake --build /home/wangyz/.llvm/build-dcc --target fir-opt mlir-opt -j

# 注册验收
/home/wangyz/.llvm/build-dcc/bin/fir-opt  --help | grep convert-openacc-to-openmp
/home/wangyz/.llvm/build-dcc/bin/mlir-opt --help | grep convert-openacc-to-openmp

# 端到端验收
/home/wangyz/.llvm/build-dcc/bin/fir-opt --convert-openacc-to-openmp \
    /home/wangyz/test/openacc/acc_loop/bbc-firopt-tco/try.fir.mlir \
  | /home/wangyz/.llvm/build-dcc/bin/tco -o try.ll
grep -E "__kmpc_fork_call|__kmpc_for_static_init" try.ll
/home/wangyz/.llvm/build-dcc/bin/llvm-as try.ll -o /dev/null   # 应为 OK
```

### IR 形态对照

转换前：

```mlir
acc.parallel combined(loop) {
  %3 = acc.private varPtr(%2#0) recipe(@privatization_ref_i32) -> !fir.ref<i32>
  acc.loop combined(parallel) private(%3) control(%iv: i32) = (%c1_i32) to (%c100_i32) step (%c1_i32) {
    ...store %iv...
    acc.yield
  } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
  acc.yield
}
```

转换后：

```mlir
omp.parallel {
  omp.wsloop {
    omp.loop_nest (%arg0) : i32 = (%c1_i32) to (%c100_i32) inclusive step (%c1_i32) {
      ...declare + store...
      omp.yield
    }
  }
  omp.terminator
}
```

---

## 3. 汇报口径提醒

**可以说的**：

- P0/P1 完成，pass 已注册且端到端可用，产出可校验的 LLVM IR 并包含 `__kmpc_fork_call` / `__kmpc_for_static_init_4u`。
- 两条管道验证通过，说明插入点灵活。
- 发现并修复了一个会破坏未转换 IR 的真实缺陷（第 7 页坑 2）。

**不建议说的**：

- 不要说"OpenACC 并行已支持"——当前 private 语义是简化，存在数据竞争。
- 不要说"性能提升"——从未做过任何性能测量。
- 不要说"已完成 OpenACC 降级"——`acc.serial` / `acc.kernels` / reduction 都还没做。

**如果被问到"这算不算解决了 llvm 在 openacc 的缺陷"**：

准确回答是：解决了 compute 构造**在 host 并行路径上的**缺失，范围限定为 `acc.parallel` + `acc.loop`；device offload、`acc.serial` / `acc.kernels`、reduction 语义与真正的私有化仍未覆盖。
