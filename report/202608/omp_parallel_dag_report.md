# MLIR 源码考古报告：`omp.parallel` 的 DAG 视角（node & edge）

> 主题：以 DAG（node = IR 关键字 / 运行时函数，edge = 翻译逻辑）的心智模型，梳理
> `omp.parallel` 从“文件读取时的文本匹配”到“翻译成 `__kmpc_fork_call` 等运行时调用”的完整链路。
> 所有路径均相对 `/home/wangyz/.llvm/llvm-project`，行号取自 2026-08-19 本地仓库，均已用
> `rg`/`sed` 验证。

---

## 0. 摘要

1. `tco` 与 `mlir-translate --mlir-to-llvmir` 都能把 `tco -emit-final-mlir` 的产物
   （`test/openacc/parallel_do/parallel_do.f90.mlir`）直接降到 LLVM IR，产物逐字节几乎一致。
2. “读取文件时 `omp.parallel` 在哪匹配”：匹配发生在 **MLIR 通用文本解析器**里——
   `OperationParser::parseCustomOperationName()` 用字符串 `"omp.parallel"` 查
   `MLIRContextImpl::registeredOperationsByName` 哈希表；两个工具、三种用法在读取阶段走同一
   个解析器，匹配点完全相同。
3. 用 DAG 语言：**node** 是 `Operation` / `llvm::Value` / `llvm::Function`，**edge** 是
   SSA use-def 与 `LLVMTranslationDialectInterface::convertOperation` 翻译逻辑；node/edge 上
   挂的属性可明确区分“语义正确性必需”与“为优化服务”两类。

---

## 1. 实验背景：三种用法的实测结果

输入：`parallel_do.f90.mlir`（`tco -emit-final-mlir` 产物，含 `omp.parallel` /
`omp.wsloop` / `omp.loop_nest`，循环体已降为 LLVM dialect 指令）。

| 命令 | 输出 | 结果 |
|---|---|---|
| `mlir-translate --mlir-to-llvmir` | `mlir-translate.ll` | 成功 |
| `tco -O0` | `tco-default-O0.ll` | 成功 |
| `tco --code-gen-llvm` | `tco-codegen.ll` | 成功 |

对比结论：

- `tco-default-O0.ll` ≡ `tco-codegen.ll` ≡ 原始 `parallel_do.f90.ll`（diff 为空）。
- `mlir-translate.ll` 与原始 `.ll` 唯一差异是前两行 `ModuleID`：
  `LLVMDialectModule` vs `FIRModule`。

原因：两条路最终汇合到同一个 `mlir::translateModuleToLLVMIR`：

- `mlir-translate`：[ConvertToLLVMIR.cpp](mlir/lib/Target/LLVMIR/ConvertToLLVMIR.cpp:25)
  注册的 `mlir-to-llvmir` 直接调用 `translateModuleToLLVMIR(op, ctx)`，用默认模块名
  `"LLVMDialectModule"`。
- `tco`：[tco.cpp](flang/tools/tco/tco.cpp:139) 解析 MLIR 后跑完 FIR pipeline，最后
  [CodeGen.cpp](flang/lib/Optimizer/CodeGen/CodeGen.cpp:4433) 的
  `LLVMDialectToLLVM::runOnOperation` 调 `translateModuleToLLVMIR(..., "FIRModule")`。

OpenMP 翻译接口两侧都已注册：

- `tco`：[InitFIR.cpp](flang/lib/Optimizer/Support/InitFIR.cpp:15)
  `fir::support::registerLLVMTranslation` 注册 OpenMP / OpenACC / LLVM / Builtin 翻译接口；
  dialect 注册见 [InitFIR.h](flang/include/flang/Optimizer/Support/InitFIR.h:39)
  `FLANG_NONCODEGEN_DIALECT_LIST`（含 `mlir::omp::OpenMPDialect`）。
- `mlir-translate`：`mlir-to-llvmir` 注册回调走
  [All.h](mlir/include/mlir/Target/LLVMIR/Dialect/All.h:44)
  `registerAllToLLVMIRTranslations` → `registerOpenMPDialectTranslation`
  （[OpenMPToLLVMIRTranslation.cpp](mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp:7293)，
  内部 `registry.insert<omp::OpenMPDialect>()`）。

---

## 2. DAG 心智模型修正

MLIR 实际是“三层嵌套图 + 一张翻译图”：

1. **数据流 DAG**：SSA def-use，`OpResult`（出边）→ `OpOperand`（入边）。
2. **控制流图**：block 之间经 `successors` 连边（循环使其不再是严格 DAG）。
3. **region 树**：op → region → block → op 的嵌套，不是边。
4. **翻译图**：MLIR 图上的 node 经转换器变成 LLVM IR 图上的 node；中间的映射保存在
   `ModuleTranslation` 的映射表中。

`omp.parallel` 不是“关键字”，而是 `Operation` 对象：`Operation::create` 的第一个参数就是
`OperationName name`（[Operation.h](mlir/include/mlir/IR/Operation.h:93)），名字由
“dialect 前缀 `omp` + 操作名 `parallel`”构成。

---

## 3. `omp.parallel` 关键字在哪里被匹配（文件读取阶段）

### 3.1 注册链（字符串 ↔ 类绑定，运行期之前建立）

| 层 | 位置 | 作用 |
|---|---|---|
| ODS 源头 | [OpenMPOps.td](mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td:191) `def ParallelOp : OpenMP_Op<"parallel", ...>` | mnemonic 决定全名；`assemblyFormat` 决定语法 |
| 生成代码 | [OpenMPOps.h.inc](build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.h.inc:8714) `getOperationName()` 返回 `"omp.parallel"`；[OpenMPOps.cpp.inc](build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.cpp.inc:13790) `ParallelOp::parse` | TableGen 生成的类与 parse 函数 |
| 注册动作 | [OpenMPDialect.cpp](mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:307) `OpenMPDialect::initialize()` → `addOperations<GET_OP_LIST>` → `RegisteredOperationName::insert`（[MLIRContext.cpp](mlir/lib/IR/MLIRContext.cpp:975)） | 写入 `MLIRContextImpl::registeredOperationsByName` |

### 3.2 读取/解析链（运行期匹配路径）

```
tco:            tco.cpp:139                       parseSourceFile<ModuleOp>
mlir-translate: Translation.cpp:149               parseSourceFileForTool → parseSourceFile
        ↓
mlir/lib/Parser/Parser.cpp:38                     parseSourceFile（非 bytecode）
        ↓
mlir/lib/AsmParser/Parser.cpp:2918                parseAsmSourceFile → OperationParser
        ↓
Parser.cpp:1224                                   OperationParser::parseOperation
        （token "omp.parallel" 是 bare_identifier → parseCustomOperation）
        ↓
Parser.cpp:1268 → 2046                           parseCustomOperation
        ↓
Parser.cpp:2006                                   parseCustomOperationName
        ★ RegisteredOperationName::lookup("omp.parallel", ctx)
        ★ MLIRContext.cpp:953 → 查 registeredOperationsByName 哈希表
        ↓ 命中后取 parseAssemblyFn
OperationSupport.h:294 → 200                     getParseAssemblyFn = &ParallelOp::parse
        ↓
CustomOpAsmParser::parseOperation → ParallelOp::parse（生成的 .cpp.inc:13790）
        → 按 assemblyFormat 的 custom<PrivateReductionRegion>(...) attr-dict 解析
```

兜底分支：若查表未命中（op 未注册），`parseCustomOperation` 会尝试
`dialect->getParseOperationHook(opName)`（[Dialect.cpp](mlir/lib/IR/Dialect.cpp:82)），但
`OpenMPDialect` 未覆写该 hook，故 `omp.parallel` 只会走注册表命中路径。

### 3.3 匹配的实质

“匹配”是 **字符串 → 哈希表 → 函数指针** 的三级过程：

1. `omp.parallel` 是完整的一个 `bare_identifier` token，parser 不拆分，直接用整串查表；
2. `RegisteredOperationName::lookup` 查 `registeredOperationsByName`（StringMap），该表由
   dialect 初始化时 TableGen 生成的 op 列表填充；
3. 命中的 `RegisteredOperationName` 携带 `ParseAssemblyFn`（ODS `assemblyFormat` 生成的
   `ParallelOp::parse`），由 `CustomOpAsmParser` 调用完成 region/子句解析。

两个工具只在“解析前注册了哪些 dialect”上有差异，进入 `parseSourceFile` 后就是同一个
解析器、同一个匹配点。三种用法的差异全部发生在解析完成之后（pass 阶段 vs 直接翻译）。

---

## 4. Node：IR node 上的属性（含优化标注）

### 4.1 通用骨架（所有 `Operation`，[Operation.h](mlir/include/mlir/IR/Operation.h)）

| 字段 | DAG 语义 | 优化相关 |
|---|---|---|
| `operands`（`OpOperand` 数组） | 入边（SSA use） | 否，数据依赖本身 |
| `results`（`OpResult`） | 出边（def） | 部分：前 5 个结果 `InlineOpResult` 内联存储是内存布局优化 |
| `successors` | CFG 出边（分支 op） | 否 |
| `regions` | 子树容器 | 否 |
| `attributes` / `properties` | node 上挂的数据 | 见 4.2/4.3 |
| `location` | 源位置 | 否（供 debug info） |
| `dialect` | node 归属（决定翻译边查哪张表） | 否 |

### 4.2 `omp.parallel` 特有属性（[OpenMPOps.td](mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td:191)）

**clauses（语义数据，非优化）**：`OpenMP_IfClause`、`NumThreadsClause`、
`PrivateClause`、`ReductionClause`、`ProcBindClause`、`AllocateClause` → 展开为 operands
（`if_expr`、`num_threads`、`private_vars`、`reduction_vars`…）+ attributes
（`proc_bind_kind`、`private_syms`、`reduction_byref`…）。

**traits：**

| trait | 作用 | 优化相关 |
|---|---|---|
| `AttrSizedOperandSegments` | 变长 operand 段的分段信息，翻译边靠它拆分 operand | 否（翻译必需） |
| `AutomaticAllocationScope` | 私有变量 alloca 的统一插入点 | ✅ 优化（栈帧/分配点管理） |
| `RecursiveMemoryEffects` | 副作用建模 | ✅ 优化（别名分析、DCE、重排合法性） |
| `ComposableOpInterface` | 组合结构识别（如 parallel+wsloop） | ✅ 优化（组合/折叠） |
| `OutlineableOpenMPOpInterface` | region 可被提成函数 | ✅ 优化（outline、GPU offload） |
| `singleRegion = true` | region 结构约束 | 否 |
| `assemblyFormat` | 文本语法 | 否（只服务 parse/print） |

### 4.3 模块级属性（final-mlir 的 `module attributes`）

| 属性 | 作用 | 优化相关 |
|---|---|---|
| `omp.is_gpu` / `omp.is_target_device` / `omp.target_triples` | 经 `amendOperation` 写入 `OpenMPIRBuilderConfig`，决定降级路径 | 偏目标配置/代码生成策略 |
| `omp.version` | 写 LLVM module flag `"openmp"` | 否（运行时 ABI 版本） |
| `llvm.data_layout` / `dlti.dl_spec` | 对齐、类型大小、指针位宽 | ✅ 优化与合法化 |
| `fir.defaultkind` / `fir.kindmap` | 前端类型语义 | 否 |

### 4.4 翻译后的 node（LLVM IR 侧）

- 值/指令：`llvm::Value` / `llvm::Instruction`；函数：`llvm::Function`
  （outline 出的 `_QQmain..omp_par`）；基本块：`llvm::BasicBlock`；全局：`@_QFEa`、
  `ident_t` 常量。
- 其上挂载：`!tbaa`（✅ 别名分析）、`#llvm.fastmath`（✅ 快速数学）、
  `llvm.nocallback / llvm.nosync / memory_effects`（✅ 属性推断供优化器）、
  `nounwind / convergent`（✅ 调用者优化依据）。

---

## 5. Edge：翻译逻辑涉及的属性（含优化标注）

### 5.1 翻译边本体

```
ModuleTranslation::convertOperation                          (ModuleTranslation.cpp:993)
  → iface.getInterfaceFor(&op)      ← 按 node 的 dialect 查边
  → opIface->convertOperation(op, builder, *this)
OpenMPDialectLLVMIRTranslationInterface::convertOperation    (OpenMPToLLVMIRTranslation.cpp:7279)
  → convertHostOrTargetOperation                             (:6866)
  → TypeSwitch 按 op 类型分派：
      omp.parallel  → convertOmpParallel (:3101) → ompBuilder->createParallel (:3277)
      omp.wsloop    → convertOmpWsloop   (:2891) → __kmpc_for_static_init_4u
      omp.loop_nest → convertOmpLoopNest (:3497)
      omp.yield / omp.terminator → 直接省略（结构已在父 op 翻译时建好）
```

接口定义：[LLVMTranslationInterface.h](mlir/include/mlir/Target/LLVMIR/LLVMTranslationInterface.h:37)
`LLVMTranslationDialectInterface::convertOperation(Operation *, llvm::IRBuilderBase &,
LLVM::ModuleTranslation &)`。

### 5.2 edge 的上下文（`ModuleTranslation`，[ModuleTranslation.h](mlir/include/mlir/Target/LLVMIR/ModuleTranslation.h:64)）

| 成员 | 作用 | 优化相关 |
|---|---|---|
| `valueMapping`（`DenseMap<Value, llvm::Value*>`） | 数据边翻译表：MLIR 值 node → LLVM 值 node | 否（保真） |
| `blockMapping`（`DenseMap<Block*, llvm::BasicBlock*>`） | 控制边翻译表；块参数转 PHI（[ModuleTranslation.cpp](mlir/lib/Target/LLVMIR/ModuleTranslation.cpp:1019) `convertBlockImpl`） | 否 |
| `functionMapping` | 函数名 → `llvm::Function`（outline 产物注册于此） | 否 |
| `loopMapping`（`omp::NewCliOp → llvm::CanonicalLoopInfo`） | 循环 node 句柄，交给 OpenMPIRBuilder | ✅ 优化（循环结构复用/变换） |
| `typeTranslator` | MLIR 类型 → LLVM 类型 | 否 |
| `iface` | 所有 dialect 翻译边的集合 | 否 |
| `OpenMPIRBuilder` + `Config` | OpenMP 专用代码生成器 | Config 是目标配置；Builder 内含调度/取消生成逻辑 |

### 5.3 翻译时消耗的 node 属性

- `AttrSizedOperandSegments` → 拆分 operand 段（`getIsByRef`、`getPrivateNeedsBarrier` 等）。
- 模块 omp 属性 → `amendOperation`（[OpenMPToLLVMIRTranslation.cpp](mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp:7170)）
  写 `OpenMPIRBuilderConfig` / module flag。
- `wsloop.getScheduleKind().value_or(Static)` → 决定生成哪种 `__kmpc_for_static_init_*`。
- `wsloop.getNowait()` → 决定是否生成 barrier（`loopNeedsBarrier = !wsloopOp.getNowait()`，:2987）。

---

## 6. 完整示例：`omp.parallel` → `__kmpc_fork_call`

```
omp.parallel (IR node，name="omp.parallel"，traits=AutomaticAllocationScope /
              ComposableOpInterface / OutlineableOpenMPOpInterface，
              clauses=if / num_threads / private / reduction …)
   │  edge: convertOmpParallel (:3101)
   │  消耗: private_vars、reduction_vars、AttrSizedOperandSegments、loc
   │  bodyGenCB / privCB / finiCB 三回调 → ompBuilder->createParallel (:3277)
   ▼
llvm::Function "_QQmain..omp_par"    ← outline node（注册进 functionMapping）
llvm::call @__kmpc_fork_call(...)    ← 运行时 node（+ 捕获参数结构体 %structArg）
   │  edge: 内层 region 的 block/value 沿 valueMapping/blockMapping 继续
   ▼
omp.wsloop → edge: convertOmpWsloop (:2891)
   ▼
llvm::call @__kmpc_for_static_init_4u / @__kmpc_for_static_fini / @__kmpc_barrier
```

对应产物（`parallel_do.f90.ll`）中的关键结构：

- `_QQmain`：`__kmpc_global_thread_num` → `__kmpc_fork_call(@1, 1, @_QQmain..omp_par,
  %structArg)`；
- `_QQmain..omp_par`：解包 `n`、分配 `%omp.private.alloc`（私有 `i`）、
  `__kmpc_for_static_init_4u(..., 34, ...)`（34 = static 调度）、循环体写 `@_QFEa`、
  `__kmpc_for_static_fini` → `__kmpc_barrier`；
- 模块级 `!llvm.module.flags = {i32 7, !"openmp", i32 31}`（来自 `omp.version`）。

---

## 7. 优化服务属性总表

### ✅ 为优化服务

| 属性 / 机制 | 服务对象 |
|---|---|
| `RecursiveMemoryEffects` | 别名分析、DCE、指令重排 |
| `AutomaticAllocationScope` | 栈帧/分配点管理 |
| `ComposableOpInterface` | 组合结构折叠 |
| `OutlineableOpenMPOpInterface` | outline、GPU offload |
| `loopMapping` / `CanonicalLoopInfo` | 循环结构复用与变换 |
| `llvm.data_layout` / `dlti.dl_spec` | 对齐、合法化 |
| `!tbaa` | 别名分析 |
| `#llvm.fastmath` | 快速数学 |
| `memory_effects` / `nocallback` / `nosync` | 属性推断 |
| `nounwind` / `convergent` | 调用者优化依据 |
| `InlineOpResult` | 结果存储布局 |

### ⚙️ 非优化但翻译/语义必需

| 属性 / 机制 | 用途 |
|---|---|
| `AttrSizedOperandSegments` | operand 分段 |
| `assemblyFormat` | 文本语法 |
| `valueMapping` / `blockMapping` / `functionMapping` | 双图映射 |
| clause 语义属性（if / private / reduction / proc_bind …） | 程序语义 |
| `location` | 调试信息 |
| `omp.version` | 运行时 ABI 版本 |

---

## 8. 源码索引（均为本仓库已验证路径）

### MLIR 解析/注册

- `mlir/lib/Parser/Parser.cpp:38` — `parseSourceFile`（统一解析入口）
- `mlir/lib/AsmParser/Parser.cpp:1224 / 2006 / 2046` — `parseOperation` /
  `parseCustomOperationName` / `parseCustomOperation`
- `mlir/lib/IR/MLIRContext.cpp:953 / 975` — `RegisteredOperationName::lookup` / `insert`
- `mlir/lib/IR/Dialect.cpp:82` — `getParseOperationHook`（兜底分支）
- `mlir/include/mlir/IR/OperationSupport.h:294 / 200` — `getParseAssemblyFn`
- `mlir/include/mlir/IR/Operation.h` — `Operation` 结构（name/operands/results/regions/…）

### OpenMP ODS 与注册

- `mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td:191` — `def ParallelOp`
- `mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:307` — `OpenMPDialect::initialize()`
- `build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.h.inc:8714` —
  `getOperationName()` 返回 `"omp.parallel"`
- `build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.cpp.inc:13790` —
  `ParallelOp::parse`

### 翻译链

- `mlir/include/mlir/Target/LLVMIR/LLVMTranslationInterface.h:37` — 接口定义
- `mlir/include/mlir/Target/LLVMIR/ModuleTranslation.h:64` — 映射表成员
- `mlir/lib/Target/LLVMIR/ModuleTranslation.cpp:993 / 1019` — `convertOperation` /
  `convertBlockImpl`
- `mlir/lib/Target/LLVMIR/ConvertToLLVMIR.cpp:25` — `mlir-to-llvmir` 注册
- `mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp:7279 / 6866 /
  3101 / 2891 / 3497 / 7170 / 7293` — `convertOperation` / 分派 / parallel / wsloop /
  loop_nest / `amendOperation` / 接口注册
- `mlir/include/mlir/Target/LLVMIR/Dialect/All.h:44` — `registerAllToLLVMIRTranslations`

### Flang 工具侧

- `flang/tools/tco/tco.cpp:139` — `parseSourceFile<ModuleOp>`
- `flang/include/flang/Optimizer/Support/InitFIR.h:39` — `FLANG_NONCODEGEN_DIALECT_LIST`
- `flang/lib/Optimizer/Support/InitFIR.cpp:15` — `registerLLVMTranslation`
- `flang/lib/Optimizer/CodeGen/CodeGen.cpp:4433` — `LLVMDialectToLLVM::runOnOperation`
- `mlir/lib/Tools/mlir-translate/Translation.cpp:149` — `parseSourceFileForTool`
- `mlir/lib/Tools/mlir-translate/MlirTranslateMain.cpp` — 翻译工具主入口

### 实验产物

- 输入：`test/openacc/parallel_do/parallel_do.f90.mlir`
- 输出：`test/openacc/parallel_do/tmp/{mlir-translate.ll, tco-default-O0.ll, tco-codegen.ll}`
- 参考：`test/openacc/parallel_do/parallel_do.f90.ll`

---

## 9. 遗留问题与下一步

1. `OpenMPIRBuilder::createParallel` 内部 outline 与捕获参数结构体（`%structArg`）的构造
   细节尚未展开（对应 `flang` 侧 `createDefaultFIRCodeGenPassPipeline` 的
   `OpenMPFunctions` / `OpenMPOutlinedRegion` 生成路径）。
2. `CanonicalLoopInfo`（`loopMapping`）在 `createForStatic` 之外的变换（tile/unroll）中的
   角色可继续深入。
3. 若需对比 generic 格式解析：`mlir-opt --mlir-print-op-generic` 后 op 名变成带引号的
   `"omp.parallel"`，parser 走 `parseGenericOperation` 分支，但查表仍在同一张
   `registeredOperationsByName`。
