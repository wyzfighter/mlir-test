# `OpenMPOps.td` 中 `def ParallelOp` 逐行解析

> 文件：`llvm-project/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td`
> 范围：第 191–223 行（`def ParallelOp` 完整定义）
> 生成物对照：`build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.{h,cpp}.inc`
> 说明：ODS（TableGen）是 op 的“声明源头”。这段代码不直接变成可执行逻辑，而是被
> TableGen 展开成 C++ 类 `mlir::omp::ParallelOp`、parse/print 函数和 builder。

---

## 1. 完整原文（带行号）

```tablegen
191: def ParallelOp : OpenMP_Op<"parallel", traits = [
192:     AttrSizedOperandSegments, AutomaticAllocationScope,
193:     DeclareOpInterfaceMethods<ComposableOpInterface>,
194:     DeclareOpInterfaceMethods<OutlineableOpenMPOpInterface>,
195:     RecursiveMemoryEffects
196:   ], clauses = [
197:     OpenMP_AllocateClause, OpenMP_IfClause, OpenMP_NumThreadsClause,
198:     OpenMP_PrivateClause, OpenMP_ProcBindClause, OpenMP_ReductionClause
199:   ], singleRegion = true> {
200:   let summary = "parallel construct";
201:   let description = [{
202:     The parallel construct includes a region of code which is to be executed
203:     by a team of threads.
204:
205:     The optional `if_expr` parameter specifies a boolean result of a conditional
206:     check. If this value is 1 or is not provided then the parallel region runs
207:     as normal, if it is 0 then the parallel region is executed with one thread.
208:   }] # clausesDescription;
209:
210:   let builders = [
211:     OpBuilder<(ins CArg<"ArrayRef<NamedAttribute>", "{}">:$attributes)>,
212:     OpBuilder<(ins CArg<"const ParallelOperands &">:$clauses)>
213:   ];
214:
215:   let assemblyFormat = clausesAssemblyFormat # [{
216:     custom<PrivateReductionRegion>($region, $private_vars, type($private_vars),
217:         $private_syms, $private_needs_barrier, $reduction_mod, $reduction_vars,
218:         type($reduction_vars), $reduction_byref, $reduction_syms) attr-dict
219:   }];
220:
221:   let hasVerifier = 1;
222:   let hasRegionVerifier = 1;
223: }
```

---

## 2. 逐行解析

### 第 191 行：`def ParallelOp : OpenMP_Op<"parallel", traits = [ ...`

- `def ParallelOp`：TableGen 定义一个生成实体，C++ 类名取 `ParallelOp`，即
  `mlir::omp::ParallelOp`（`cppNamespace` 由 OpenMP dialect 指定）。
- `OpenMP_Op<...>`：继承 OpenMP dialect 的 op 基类
  （[OpenMPOpBase.td:158](mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:158)）。该基类
  负责把 `traits`、`clauses`、`singleRegion` 三个模板参数聚合成 op 的最终形态（详见第 3 节）。
- `"parallel"`：**mnemonic（助记名）**。最终 op 全名 =
  dialect 前缀 + `.` + mnemonic = `omp.parallel`。生成代码里
  `getOperationName()` 返回 `"omp.parallel"`
  （[OpenMPOps.h.inc:8714](build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.h.inc:8714)）。
- `traits = [`：开始声明 trait 列表（编译期能力标签，共 5 项，见 192–195 行）。

### 第 192 行：`AttrSizedOperandSegments, AutomaticAllocationScope,`

**`AttrSizedOperandSegments`**（[OpBase.td:171](mlir/include/mlir/IR/OpBase.td:171)，
`NativeOpTrait<"AttrSizedOperandSegments">` + `StructuralOpTrait`）：

- 含义：operands 是**变长分段**的。因为 clauses 展开出的 operand 段（private_vars、
  reduction_vars 等）长度不固定，必须能区分“这一段的边界在哪”。
- 效果：自动引入一个隐藏属性 `operandSegmentSizes`（`DenseI32ArrayAttr`），记录每段长度；
  生成 `getODSOperandIndexAndLength()` 供 `getAllocateVars()`、`getPrivateVars()` 等
  getter 按段切分。
- 翻译时：`convertOmpParallel` 依赖它把 operand 数组拆回各 clause 的变量。

**`AutomaticAllocationScope`**（[OpBase.td:67](mlir/include/mlir/IR/OpBase.td:67)，
`NativeOpTrait<"AutomaticAllocationScope">`）：

- 含义：该 op 的 region 构成一个“自动分配作用域”——里面的 alloca（栈分配）应集中在
  region 入口统一分配，region 结束时统一释放。
- 用途：优化/代码生成辅助。OpenMPIRBuilder 在生成私有变量时找
  `findAllocaInsertPoint`，翻译器用该 trait 决定 alloca 的插入点
  （`convertOmpWsloop` 里 `findAllocaInsertPoint(builder, moduleTranslation)` 即依赖此）。

### 第 193 行：`DeclareOpInterfaceMethods<ComposableOpInterface>,`

- `ComposableOpInterface`（[OpenMPOpsInterfaces.td:282](mlir/include/mlir/Dialect/OpenMP/OpenMPOpsInterfaces.td:282)）：
  “可以表示组合构造（composite construct）的一个叶（leaf）”。组合构造如
  `parallel do`、`target teams distribute parallel do`，在 IR 里被拆成嵌套的若干 op，
  通过 `omp.composite` 属性标记组合关系。
- `DeclareOpInterfaceMethods<...>`：要求 op 实现该接口，并让 ODS **只生成方法声明**，
  方法体由手写代码实现。`ParallelOp` 手写实现
  `isComposite()`（检查 `omp.composite` 属性，[OpenMPDialect.cpp:299](mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:299)）。
- 用途：组合识别/折叠（优化方向），以及 `verifyRegions` 里对 composite 场景的检查。

### 第 194 行：`DeclareOpInterfaceMethods<OutlineableOpenMPOpInterface>,`

- `OutlineableOpenMPOpInterface`（[OpenMPOpsInterfaces.td:174](mlir/include/mlir/Dialect/OpenMP/OpenMPOpsInterfaces.td:174)）：
  “region 可以被 outline（提取成独立函数）的 op”。接口方法如 `getAllocaBlock`。
- `ParallelOp` 实现它意味着：其 region 可以整体提出为 `llvm::Function`
  （你的 `.ll` 里 `_QQmain..omp_par` 就是这么来的），外部通过
  `__kmpc_fork_call` 调用。
- 用途：outline 是并行代码生成和 GPU offload 的核心机制（优化/代码生成双重服务）。

### 第 195 行：`RecursiveMemoryEffects`

- 定义：[SideEffectInterfaces.td:98](mlir/include/mlir/Interfaces/SideEffectInterfaces.td:98)
  `def RecursiveMemoryEffects : NativeOpTrait<"HasRecursiveMemoryEffects">`。
- 含义：op 自身的副作用是“递归”的——**不是固定声明的读/写集合，而是由 region 内部
  内容决定**。分析器（alias analysis、DCE、指令重排）必须递归进 region 才能知道它
  到底读写什么。
- 用途：纯优化服务。让 `omp.parallel` 的 body 里任意计算都能被正确地做副作用分析，
  同时不会被误当成“无副作用”而被删掉。

### 第 196 行：`], clauses = [`

结束 traits 列表，开始 clauses 列表。clauses 是 OpenMP 子句的 ODS 封装，每个 clause
贡献一部分 operands、attributes、trait、assembly 格式和描述（基类自动聚合）。

### 第 197–198 行：六个 clause

全部定义在 [OpenMPClauses.td](mlir/include/mlir/Dialect/OpenMP/OpenMPClauses.td)：

| clause | 定义行 | 贡献的 operands/attributes | 语义 |
|---|---|---|---|
| `OpenMP_AllocateClause` | :111 | `allocate_vars`（Variadic）、`allocator_vars`（Variadic） | `allocate(...)`：指定分配器与要分配的变量 |
| `OpenMP_IfClause` | :666 | `if_expr`（`Optional<I1>`） | `if(cond)`：条件执行 |
| `OpenMP_NumThreadsClause` | :1050 | `num_threads`（`Optional<IntLikeType>`） | `num_threads(n)`：线程数 |
| `OpenMP_PrivateClause` | :1214 | `private_vars`（Variadic）、`private_syms`（`OptionalAttr<SymbolRefArrayAttr>`）、`private_needs_barrier`（`UnitAttr`）；**贡献 trait `BlockArgOpenMPOpInterface`** | `private(x)`：私有化，region 入口块参数 |
| `OpenMP_ProcBindClause` | :1239 | `proc_bind_kind`（`OptionalAttr<ProcBindKindAttr>`） | `proc_bind(master/close/spread)` |
| `OpenMP_ReductionClause` | :1287 | `reduction_mod`、`reduction_vars`（Variadic）、`reduction_byref`（`DenseBoolArrayAttr`）、`reduction_syms`；**贡献 trait `BlockArgOpenMPOpInterface`** | `reduction(+:x)`：归约 |

注意：`private`/`reduction` 两个 clause 都带 `BlockArgOpenMPOpInterface` trait，聚合时
去重后只保留一个（见第 3 节）。

### 第 199 行：`], singleRegion = true> {`

- `singleRegion = true`：让 op 恰好有 **1 个 region**，命名 `$region`。基类生成
  `regions = (region AnyRegion:$region)`；生成代码 `getRegion()` 返回 `getRegion(0)`
  （[OpenMPOps.h.inc:8766](build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.h.inc:8766)）。
- `{`：开始 op 定义的 `let` 块。

### 第 200 行：`let summary = "parallel construct";`

单行摘要。用于 `--help`、诊断信息、文档生成。不参与语义。

### 第 201–208 行：`let description = [{ ... }] # clausesDescription;`

- `[{ ... }]`：多行描述（Markdown 风格），说明 `if_expr` 的语义：为 1 或缺省时并行区
  正常执行，为 0 时以单线程执行。
- `# clausesDescription`：TableGen 字符串拼接。`clausesDescription` 是基类自动生成的
  变量——把 6 个 clause 各自的 `description` 拼接起来（[OpenMPOpBase.td:215](mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:215)）。
- 用途：文档生成与诊断，不参与语义。

### 第 210–213 行：`let builders = [...];`

自定义 `build` 函数（构造 op 的便捷入口），ODS 按此生成 C++ 静态函数：

- **第 211 行**：`OpBuilder<(ins CArg<"ArrayRef<NamedAttribute>", "{}">:$attributes)>`
  - 参数：`ArrayRef<NamedAttribute>`，默认值 `{}`（空数组）。
  - 生成：`build(OpBuilder &, OperationState &, ArrayRef<NamedAttribute> = {})`——
    只传属性字典的 builder，用于通用构造。
- **第 212 行**：`OpBuilder<(ins CArg<"const ParallelOperands &">:$clauses)>`
  - 参数：`const ParallelOperands &`。`ParallelOperands` 是 clause 聚合生成的结构体
    （含 `allocateVars`、`ifExpr`、`privateVars`、`reductionVars` 等字段）。
  - 生成：`build(..., const ParallelOperands &)`，完整实现见
    [OpenMPOps.cpp.inc:13471](build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.cpp.inc:13471)。
  - 对接点：flang 的 `genParallelClauses(...)` 填充 `ParallelOperands`，然后
    `genOpWithBody<mlir::omp::ParallelOp>(..., clauseOps)` 用这个 builder 创建 op
    （[OpenMP.cpp:2354](flang/lib/Lower/OpenMP/OpenMP.cpp:2354)）。

### 第 215–219 行：`let assemblyFormat = clausesAssemblyFormat # [{ ... }];`

定义 op 的**文本语法**（parse/print 格式），分两部分：

- `clausesAssemblyFormat`：基类生成的“子句部分”格式——各 clause 的
  `reqAssemblyFormat` 拼接 + `oilist(...)` 包裹的可选子句格式（
  [OpenMPOpBase.td:158](mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:158) 的生成逻辑）。
  效果：`omp.parallel` 后面按声明顺序接受可选子句，如 `omp.parallel if(%c) num_threads(%n)`。
- `custom<PrivateReductionRegion>(...)`：**自定义 directive**——调用手写的
  parse/print 函数（见第 4 节），参数按顺序传入：
  `$region`、`$private_vars`、`type($private_vars)`、`$private_syms`、
  `$private_needs_barrier`、`$reduction_mod`、`$reduction_vars`、
  `type($reduction_vars)`、`$reduction_byref`、`$reduction_syms`。
  - 为什么必须 custom：private/reduction 需要把 region 入口块参数和子句变量**绑定**
    在一起解析（`parseBlockArgRegion`），纯 `assemblyFormat` 表达不了这种耦合。
- `attr-dict`：解析剩余的属性字典（如 `omp.composite` 等非子句属性）。
- 语法效果：`omp.parallel [子句] { region } attr-dict`。你的实例
  `omp.parallel { ... }` 就是“无子句 + region + 无属性字典”的形态。

### 第 221 行：`let hasVerifier = 1;`

- 生成 `LogicalResult verify()` 的**声明**，实现在
  [OpenMPDialect.cpp:2570](mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:2570)：
  1. `getAllocateVars().size() != getAllocatorVars().size()` → 报错（allocate/allocator
     必须成对）；
  2. `verifyPrivateVarList(*this)`：private 变量与符号列表一致性；
  3. `verifyReductionVarList(...)`：reduction 变量/符号/byref 一致性。

### 第 222 行：`let hasRegionVerifier = 1;`

- 生成 `LogicalResult verifyRegions()` 的**声明**，实现在
  [OpenMPDialect.cpp:2582](mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:2582)：
  - region 内最多 1 个 `omp.distribute`；
  - 若有 1 个 `omp.distribute`，必须带 `omp.composite` 且不能有其它非 terminator 的
    OpenMP op；
  - 非 composite 场景对 region 内容**不加限制**（所以 `omp.wsloop` 可以随便嵌套）。
- 与 `verify()` 的区别：`verify()` 检查 operands/attributes，`verifyRegions()` 检查
  region 内部结构，二者在不同时机被调用。

### 第 223 行：`}`

关闭 `def ParallelOp` 定义块。

---

## 3. 基类 `OpenMP_Op` 如何聚合这三个参数

`OpenMP_Op<string mnemonic, list<Trait> traits, list<OpenMP_Clause> clauses,
bit singleRegion>`（[OpenMPOpBase.td:158](mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:158)）
在定义时做了四件事（[OpenMPOpBase.td:215-249](mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:215)）：

1. **traits 合并**：显式 5 项 + 所有 clause 的 traits（`BlockArgOpenMPOpInterface`），
   去重后作为最终 trait 列表。
2. **arguments 聚合**：把 6 个 clause 的 `arguments` 拼接成 op 的 operands/attributes：
   - operands 6 段：`allocate_vars`、`allocator_vars`、`if_expr`、`num_threads`、
     `private_vars`、`reduction_vars`（全部 Optional/Variadic）；
   - attributes 6 个：`private_syms`、`private_needs_barrier`、`proc_bind_kind`、
     `reduction_mod`、`reduction_byref`、`reduction_syms`；
   - 加上 `AttrSizedOperandSegments` 带来的隐藏属性 `operandSegmentSizes`。
3. **assemblyFormat 默认值**：`clausesAssemblyFormat # " $region attr-dict"`，但
   `ParallelOp` 用自己的 `assemblyFormat` **覆盖**了默认值。
4. **regions**：`singleRegion = true` → `(region AnyRegion:$region)`。

`ParallelOp` 最终展开后的形状（生成代码 [OpenMPOps.h.inc:8725](build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.h.inc:8725) 起）：

```cpp
class ParallelOp : public Op<ParallelOp, OpTrait::AttrSizedOperandSegments,
                             OpTrait::AutomaticAllocationScope,
                             OpTrait::HasRecursiveMemoryEffects, ...> {
  operand_range getAllocateVars();  // 段 0
  operand_range getAllocatorVars(); // 段 1
  TypedValue<IntegerType> getIfExpr(); // 段 2
  TypedValue<Type> getNumThreads();    // 段 3
  operand_range getPrivateVars();   // 段 4
  operand_range getReductionVars(); // 段 5
  Region &getRegion();              // 唯一 region
  // properties: private_syms, private_needs_barrier, proc_bind_kind,
  //             reduction_mod, reduction_byref, reduction_syms,
  //             operandSegmentSizes
};
```

---

## 4. `custom<PrivateReductionRegion>` 的手写实现

parse：[OpenMPDialect.cpp:1135](mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:1135)
`parsePrivateReductionRegion`——把 region 与 private/reduction 变量打包成
`AllRegionParseArgs`，交给 `parseBlockArgRegion`：解析 `private(vars : types)`、
`reduction(...)` 子句并生成对应的 region 入口块参数。

print：[OpenMPDialect.cpp:1395](mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:1395)
`printPrivateReductionRegion`——反向打印，`printBlockArgRegion` 输出
`private(@sym %arg -> %blockArg : type)` 这类形态（你的 `omp.wsloop` 行就是这种格式；
`omp.parallel` 无子句时该 custom 部分输出为空，只剩 `{ ... }`）。

---

## 5. 与上下游的关联

- **生成侧（flang）**：`genParallelClauses` 填充 `ParallelOperands` →
  `genOpWithBody<ParallelOp>` 创建 op 并 `createBodyOfOp` 递归生成 region 内容
  （[OpenMP.cpp:1154](flang/lib/Lower/OpenMP/OpenMP.cpp:1154)）。
- **翻译侧（OpenMP → LLVM IR）**：`convertOmpParallel`
  （[OpenMPToLLVMIRTranslation.cpp:3101](mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp:3101)）
  读取 operands/attributes/traits：`getReductionByref()` 决定 byref、
  `getNumReductionVars()`、`getPrivateNeedsBarrier()` 决定 barrier、region 交给
  `convertOmpOpRegions` 递归翻译，最后 `createParallel` outline 出
  `llvm::Function` 并生成 `__kmpc_fork_call`。
- **运行时节点**：`__kmpc_fork_call`、`__kmpc_for_static_init_4u`、
  `__kmpc_for_static_fini`、`__kmpc_barrier`（对应 `parallel_do.f90.ll` 中的产物）。

---

## 6. 符号索引（全部为本仓库已验证路径）

| 符号 | 位置 |
|---|---|
| `OpenMP_Op` 基类 | `mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:158` |
| `OpenMP_Clause` 基类 | `mlir/include/mlir/Dialect/OpenMP/OpenMPOpBase.td:106` |
| 六个 clause | `mlir/include/mlir/Dialect/OpenMP/OpenMPClauses.td:111/666/1050/1214/1239/1287` |
| `AttrSizedOperandSegments` | `mlir/include/mlir/IR/OpBase.td:171` |
| `AutomaticAllocationScope` | `mlir/include/mlir/IR/OpBase.td:67` |
| `RecursiveMemoryEffects` | `mlir/include/mlir/Interfaces/SideEffectInterfaces.td:98` |
| `ComposableOpInterface` | `mlir/include/mlir/Dialect/OpenMP/OpenMPOpsInterfaces.td:282` |
| `OutlineableOpenMPOpInterface` | `mlir/include/mlir/Dialect/OpenMP/OpenMPOpsInterfaces.td:174` |
| `parsePrivateReductionRegion` / `printPrivateReductionRegion` | `mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:1135 / 1395` |
| `ParallelOp::verify` / `verifyRegions` | `mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:2570 / 2582` |
| 生成类声明 | `build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.h.inc:8714` 起 |
| 生成 build/parse | `build-dcc/tools/mlir/include/mlir/Dialect/OpenMP/OpenMPOps.cpp.inc:13471 / 13790` |
