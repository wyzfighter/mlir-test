# OpenMPToLLVMIRTranslation.cpp 交接总结

> 入口：本工作区新会话请先读 `init.md`（启动初始化文档）；本文件是当前话题的详细
> 交接总结，由 `init.md` 引用，两者互相指向。
>
> 写给下一个 Codex 会话。目标：只读本文件即可直接理解
> `llvm-project/mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp`
> 是干什么的、怎么被调用、关键机制和行号在哪。
>
> 所有行号均为本地源码核对结果（核对日期 2026-08-29）。仓库根：`/home/wangyz/.llvm`。
> 本总结承接 `HANDOFF.md`（上一轮交接，DAG 视角报告见 `omp_parallel_dag_report.md`）。

---

## 0. 一句话结论

这个文件是 **OpenMP dialect → LLVM IR 的语义降级器（直译 / Translation 路径）**：它把
MLIR 里的 `omp.parallel`、`omp.wsloop`、`omp.loop_nest` 等操作逐条翻译成 LLVM IR，
经由 `llvm::OpenMPIRBuilder` 生成 outline 函数、captured args 结构体、barrier 以及
`__kmpc_*` 运行时调用。它**不做类型合法化**——那是 Conversion 路径
`mlir/lib/Conversion/OpenMPToLLVM/OpenMPToLLVM.cpp` 的事（见 §3）。

## 1. 调用链（从工具到叶子）

```text
mlir-translate --mlir-to-llvmir / tco
  → mlir::translateModuleToLLVMIR
      （mlir/lib/Target/LLVMIR/ModuleTranslation.cpp:2383）
  → ModuleTranslation::convertOperation（ModuleTranslation.cpp:993）
      → iface.getInterfaceFor(&op)：按 op 所属 dialect 找 LLVMTranslationDialectInterface
  → OpenMPDialectLLVMIRTranslationInterface::convertOperation（本文件 :7279）
      ├─ 分叉：ompBuilder->Config.isTargetDevice() ?
      │    ├─ 是 → convertTargetDeviceOp / convertTargetOpsInNest（target/GPU kernel 路径）
      │    └─ 否 → convertHostOrTargetOperation（:6866，主机路径）
      └─ convertHostOrTargetOperation 内一个大 TypeSwitch，按 op 类型分派：
           ├─ convertOmpParallel  (:3100) → OpenMPIRBuilder::createParallel
           │     （OMPIRBuilder.cpp:1574）→ __kmpc_fork_call
           ├─ convertOmpLoopNest  (:3496) → OpenMPIRBuilder::createCanonicalLoop
           │     （OMPIRBuilder.cpp:5275）→ CanonicalLoopInfo
           ├─ convertOmpWsloop   (:2890) → OpenMPIRBuilder::applyWorkshareLoop
           │     → __kmpc_for_static_init_4u（OMPIRBuilder.cpp:5328 / :8052）
           └─ 其余：barrier / critical / sections / single / task / taskloop /
               atomic / target(:6342) / threadprivate / distribute / tile 等
```

注册点（`registerOpenMPDialectTranslation`，本文件 :7293）：
- `mlir/include/mlir/Target/LLVMIR/Dialect/All.h:48`
- `flang/lib/Optimizer/Support/InitFIR.cpp:20`（Flang / tco 用）
- `mlir/lib/CAPI/ExecutionEngine/ExecutionEngine.cpp:37`

## 2. 关键机制

1. **分派器**（:6866 `convertHostOrTargetOperation`）：巨型 `TypeSwitch`，每个 omp op
   匹配到自己的 `convertOmpXxx`。外层先对 `LoopWrapperInterface` 推入/弹出
   `OpenMPLoopInfoStackFrame`（环信息栈帧），供嵌套 loop wrapper 共享。
2. **region 翻译**（:535 `convertOmpOpRegions`）：region 里的 MLIR block 逐个映射成
   LLVM basic block（`moduleTranslation.mapBlock`）；`omp.yield` 转成 continuation
   block 上的 PHI。parallel 等构造的 bodyGenCB 会把 region 翻译延迟到
   OpenMPIRBuilder 需要的插入点。
3. **模块级属性**（:7170 `amendOperation`）：把 `omp.is_target_device`、
   `omp.is_gpu`、`omp.host_ir_filepath`、`omp.requires`、`omp.target_triples`、
   `omp.version`、`omp.flags`、`omp.declare_target` 翻译成
   `OpenMPIRBuilderConfig` / module flags。
4. **前置检查**（:317 `checkImplementationStatus`）：逐 op 检查尚未实现的 clause
   （allocate / collapse / nowait / reduction 修饰符等），未实现则报
   “not yet implemented” 拒绝降级。
5. **错误处理**（:448 / :462 `handleError`）：把 `llvm::Error` / `llvm::Expected`
   转成 MLIR 诊断。
6. **设备/主机分叉**（:7279 内）：`isTargetDevice` 为真时走
   `convertTargetDeviceOp` / `convertTargetOpsInNest`（kernel 生成）；
   否则走主机路径。`OpenMPIRBuilder` 在 `ModuleTranslation::getOpenMPBuilder`
   （ModuleTranslation.cpp:2269）惰性创建并设置默认 config。

## 3. 与 Conversion 路径的区别（最容易混淆）

| 维度 | Translation（本文件） | Conversion（OpenMPToLLVM.cpp） |
|---|---|---|
| 文件 | 本文件 | `mlir/lib/Conversion/OpenMPToLLVM/OpenMPToLLVM.cpp` |
| 触发工具 | mlir-translate / tco（经 translateModuleToLLVMIR） | mlir-opt --convert-to-llvm |
| 做什么 | 生成 LLVM IR + `__kmpc_*` 运行时调用 | 只换类型（index→i64、memref→descriptor），重建同名 op |
| op 结构 | 被拆成基本块 / outline 函数 / 运行时调用 | 原样保留，语义不变 |

实验证据（`codex_sandbox/convertion/demo*.mlir`，来自 HANDOFF.md）：
`omp.loop_nest (%iv) : index → (%arg) : i64`、memref 一个参数展开成 5 个 LLVM 参数，
但 op 结构不动。

## 4. 已验证源码索引

### 本文件（`mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp`，7304 行）

- :317 `checkImplementationStatus`（未实现 clause 检查）
- :448 / :462 `handleError`（llvm::Error / Expected → MLIR 诊断）
- :535 `convertOmpOpRegions`（region → basic block + PHI）
- :2890 `convertOmpWsloop`（worksharing 循环 → applyWorkshareLoop）
- :3100 `convertOmpParallel`（parallel → createParallel → `__kmpc_fork_call`）
- :3496 `convertOmpLoopNest`（→ createCanonicalLoop → CanonicalLoopInfo）
- :6342 `convertOmpTarget`（target 构造）
- :6866 `convertHostOrTargetOperation`（主机路径大 TypeSwitch 分派器）
- :7170 `OpenMPDialectLLVMIRTranslationInterface::amendOperation`（模块属性）
- :7279 `OpenMPDialectLLVMIRTranslationInterface::convertOperation`（接口入口，设备/主机分叉）
- :7293 `registerOpenMPDialectTranslation`（注册）

### 其他文件

- `mlir/lib/Target/LLVMIR/ModuleTranslation.cpp`：:993 `convertOperation`（接口钩子）、
  :2269 `getOpenMPBuilder`（惰性创建）、:2383 `translateModuleToLLVMIR`（工具入口汇合点）
- `llvm/lib/Frontend/OpenMP/OMPIRBuilder.cpp`：:1574 `createParallel`、
  :5275 `createCanonicalLoop`、:5328 / :8052 `__kmpc_for_static_init_4u`
- `mlir/include/mlir/Target/LLVMIR/ModuleTranslation.h`：:273 `getOpenMPBuilder`、
  :420 `ompBuilder` 成员（valueMapping / blockMapping 等映射表见同头文件）

## 5. 快速验证命令

```bash
# 本文件的关键函数与行号
rg -n 'convertHostOrTargetOperation|convertOmpParallel|convertOmpWsloop|convertOmpLoopNest' \
  llvm-project/mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp

# OpenMPIRBuilder 侧的运行时调用生成
rg -n 'createParallel|kmpc_for_static_init' \
  llvm-project/llvm/lib/Frontend/OpenMP/OMPIRBuilder.cpp

# 降级实验复现（来自 HANDOFF.md）
install/bin/mlir-translate --mlir-to-llvmir \
  test/openacc/parallel_do/parallel_do.f90.mlir -o /tmp/mlir-translate.ll
install/bin/tco --code-gen-llvm \
  test/openacc/parallel_do/parallel_do.f90.mlir -o /tmp/tco-codegen.ll
```

## 6. 相关产物

- 本总结：`OpenMPToLLVMIRTranslation_summary.md`
- 流程图：`omp_translation_flow.svg`（同目录，与 §1 调用链一一对应）
- 上一轮交接：`HANDOFF.md`（含 §2 已确立结论与 §7 文件索引）
- DAG 视角报告：`omp_parallel_dag_report.md`
- Conversion 路径实验：`codex_sandbox/convertion/demo_{before,after}.mlir`、
  `demo3_{before,after}.mlir`

## 7. 下一步候选（按优先级）

1. `OpenMPIRBuilder::createParallel` 内部展开：outline 函数怎么构造、captured args
   结构体（`%structArg`）怎么生成、`__kmpc_fork_call` 参数怎么拼
   （OMPIRBuilder.cpp:1574 附近）。
2. `__kmpc_for_static_init_4u` 参数编码：schedule 编码、tripcount 计算
   （OMPIRBuilder.cpp:5328 / :8051 附近）。
3. Flang 前端生成 omp 结构：`!$omp parallel do` → `omp.parallel + omp.wsloop +
   omp.loop_nest` 的 lowering（`flang/lib/Lower/OpenMP.cpp`，未在本会话验证，来自
   HANDOFF.md）。
4. GPU 降级路径：`isTargetDevice` 分支与直译路线的分叉点（本文件 :7279 / :7283 附近）。

## 8. 交接守则（沿用 AGENTS.md）

1. 先验证再回答：用 `rg` / `sed` / `find` 核对符号、路径、行号；未验证的内容标注“未验证”。
2. 禁止编造；不确定就明确说“这部分我无法确定”。
3. 回答结构：问题类型 → 源码定位 → 机制解释 → 深入建议。
4. 区分：生成代码 vs 手写代码；直译（Translation）vs Conversion；语义降级 vs 类型合法化。
