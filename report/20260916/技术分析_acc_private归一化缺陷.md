# 技术分析：`acc.private` 归一化的作用域缺陷

> 日期：2026-09-15
> 关联：`A+B混合路线实施指导.md` §5.4 块 1「第一步：归一化 acc.private / firstprivate / reduction」
> 结论一句话：**按上游文档写的"模块级"归一化会让 pass 在合法输入上崩溃（段错误），必须改为 region 作用域。**

---

## 1. 背景：被打破的不变量

`acc.private` 产出的值不是自由值，它必须由 `acc.private` 算子定义。这个约束由 acc dialect 的 verifier 强制：

| 位置 | 内容 |
|---|---|
| `mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:1694` | `checkPrivateOperands<OpT, RecipeOpT>(...)` 定义 |
| `mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:1699` | `if (!mlir::isa<OpT>(operand.getDefiningOp()))` |

调用方（每个 compute 构造的 `verify()` 都会检查）：

| 构造 | `verify()` | 调用点 |
|---|---|---|
| `acc::ParallelOp` | `:1761` | `:1762` / `:1766` / `:1770` |
| `acc::SerialOp` | `:2571` | `:2572` / `:2576` / `:2580` |
| `acc::KernelsOp` | `:2759` | 三处 |
| `acc::LoopOp` | `:3138` | `:3279` / `:3284` / `:3289` |

也就是说：`acc.loop private(%v)` 里的 `%v` **必须**是 `acc.private` 的结果。

---

## 2. 缺陷机制

上游文档给出的归一化写法是模块级的：

```cpp
// 缺陷版本
RewritePatternSet patterns(&getContext());
patterns.add<acc::ACCOpReplaceWithVarConversion<acc::PrivateOp>,
             acc::ACCOpReplaceWithVarConversion<acc::FirstprivateOp>,
             acc::ACCOpReplaceWithVarConversion<acc::ReductionOp>>(
    &getContext());
applyPatternsGreedily(module, std::move(patterns));   // 作用域 = 整个 module
```

`ACCOpReplaceWithVarConversion` 的语义是 `rewriter.replaceOp(op, op.getVar())`——把 `acc.private` 的结果**全局**替换成 host 变量。于是：

1. `acc.parallel combined(loop)` 里的 `acc.private` 被替换，该构造随后被 pass 转换掉，没问题。
2. 但 `acc.serial` / `acc.kernels` 或 `combined(serial)` 这类 **pass 不转换**的构造里，`acc.loop private(%v)` 的 `%v` 也被一起替换了，该 `acc.loop` 存活下来，其 private 操作数不再由 `acc.private` 定义，**不变量被打破**。

关键点：替换是全局的，而被替换者所在的构造**不一定都会被转换**；只要有一个存活，IR 就非法。

---

## 3. 最小复现

### 3.1 复现输入

`repro_global_normalization.mlir`（本文件本身是**合法**的 acc IR）：

```mlir
func.func @repro(%lb: i32, %ub: i32, %st: i32, %p: !fir.ref<i32>) {
  acc.serial {
    %0 = acc.private varPtr(%p : !fir.ref<i32>) -> !fir.ref<i32> {implicit = true, name = "i"}
    acc.loop combined(serial) private(%0 : !fir.ref<i32>) control(%iv: i32) = (%lb : i32) to (%ub : i32) step (%st : i32) {
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    acc.yield
  }
  return
}
```

要点：用的是 `acc.serial`，不是 `acc.parallel`。pass 不转换 `acc.serial`，所以它会存活，缺陷才会暴露。

### 3.2 复现步骤

```bash
# 1. 确认输入本身合法（应为 exit=0）
fir-opt repro_global_normalization.mlir

# 2. 用「全局归一化」版本的 pass 处理
fir-opt --convert-openacc-to-openmp repro_global_normalization.mlir
```

第 2 步结果：**Segmentation fault (core dumped)，exit=139**。

---

## 4. 报错原文

### 4.1 形态 A：段错误（操作数是 block argument）

```text
$ fir-opt --convert-openacc-to-openmp repro_global_normalization.mlir
Segmentation fault (core dumped)          # exit=139

PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: ./bin/fir-opt --convert-openacc-to-openmp ...
 #3 llvm::LogicalResult checkPrivateOperands<mlir::acc::PrivateOp, mlir::acc::PrivateRecipeOp>(
        mlir::Operation*, mlir::ValueRange const&, llvm::StringRef) (.constprop.0) OpenACC.cpp:0:0
 #4 mlir::acc::LoopOp::verify() (./bin/fir-opt+0xf64abd)
 #5 mlir::Op<mlir::acc::LoopOp, mlir::OpTrait::OneRegion, ...>::verifyInvariants(mlir::Operation*)
 #6 mlir::RegisteredOperationName::Model<mlir::acc::LoopOp>::verifyInvariants(mlir::Operation*)
 #7 (anonymous namespace)::OperationVerifier::verifyOperation(mlir::Operation&) Verifier.cpp:0:0
 #9 mlir::verify(mlir::Operation*, bool)
#10 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, ...)
#12 mlir::PassManager::run(mlir::Operation*)
```

注意 `#9 mlir::verify` 由 `#12 PassManager::run` 触发，说明崩溃发生在 **pass 结束后的验证阶段**：pass 产出了非法 IR，验证时才炸。

### 4.2 形态 B：干净诊断（操作数是普通算子结果）

同一缺陷，若 host 变量是某个非 `acc.private` 算子的结果，则得到正常诊断而非崩溃：

```text
$ fir-opt <用 cast 定义 private 操作数的输入>
<stdin>:4:5: error: 'acc.loop' op expected private as defining op
    acc.loop combined(serial) private(%c : !fir.ref<i32>) control(%iv: i32) = ...
    ^
<stdin>:4:5: note: see current operation:
"acc.loop"(%arg1, %arg2, %arg3, %0) <{combined = #acc.combined_constructs<serial_loop>, ...
```

两种形态的差别只在 `getDefiningOp()` 是否为 null，见下一节。

---

## 5. 根因：verifier 缺少空指针检查

`mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:1694` 起的实现：

```cpp
template <typename OpT, typename RecipeOpT>
static LogicalResult checkPrivateOperands(mlir::Operation *accConstructOp,
                                          const mlir::ValueRange &operands,
                                          llvm::StringRef operandName) {
  llvm::DenseSet<Value> set;
  for (mlir::Value operand : operands) {
    if (!mlir::isa<OpT>(operand.getDefiningOp()))   // 缺陷点：:1699
      return accConstructOp->emitOpError()
             << "expected " << operandName << " as defining op";
    ...
```

`Value::getDefiningOp()` 在操作数是 **block argument**（函数参数、region 参数）时返回 `nullptr`，而 `mlir::isa<T>(nullptr)` 不做空指针判断，会直接解引用，导致崩溃。

| host 变量来源 | `getDefiningOp()` | `isa<OpT>` | 结果 |
|---|---|---|---|
| `acc.private` 结果 | 非空、类型匹配 | true | 通过验证 |
| 其他算子的结果 | 非空、类型不匹配 | false | 干净诊断 |
| **block argument** | **nullptr** | **UB** | **段错误** |

### 这同时是一个上游潜在缺陷

`repro_verifier_crash.mlir` 证明：**完全不需要任何 pass**，只要输入里 `acc.loop` 的 private 操作数指向一个 block argument，`fir-opt` 仅做解析加验证就会段错误。

```bash
$ fir-opt -split-input-file repro_verifier_crash.mlir
Segmentation fault (core dumped)          # exit=139
 #3 checkPrivateOperands<mlir::acc::PrivateOp, mlir::acc::PrivateRecipeOp>
 #4 mlir::acc::LoopOp::verify()
```

启用断言的构建里这会变成 assert 失败；Release 构建下就是段错误，诊断信息完全丢失。建议向 llvm-project 上游报此问题。修复形态：

```cpp
Operation *defOp = operand.getDefiningOp();
if (!defOp || !mlir::isa<OpT>(defOp))
  return accConstructOp->emitOpError()
         << "expected " << operandName << " as defining op";
```

---

## 6. 本 fork 的修复方案

不依赖上游修 verifier，pass 自己保证不产出非法 IR。两处改动。

### 改动 1：归一化限定在被消费的 region 内

从模块级改为在 `ConvertParallelWithLoop` 内部、只对**即将转换掉的 region** 做替换：

```cpp
// 修复版本（节选）
static void normalizeDataClauses(Operation *root, PatternRewriter &rewriter) {
  SmallVector<Operation *> clauses;
  root->walk([&](Operation *op) {
    if (isa<acc::PrivateOp, acc::FirstprivateOp, acc::ReductionOp>(op))
      clauses.push_back(op);
  });
  for (Operation *op : clauses) {
    if (op->use_empty()) { rewriter.eraseOp(op); continue; }
    /* 取 getVar()；result 与 var 类型不一致则跳过 */
    if (op->getResult(0).getType() != var.getType())
      continue;
    rewriter.replaceOp(op, var);
  }
}

// 在 pattern 内调用，作用域 = 本 pattern 要消掉的 acc.parallel
normalizeDataClauses(parOp.getOperation(), rewriter);
```

不转换的 `acc.serial` / `acc.kernels` 完全不被碰触，不变量得以保持。

### 改动 2：recipe 清理挪到转换之后，并按符号引用判断

原顺序是「归一化 → 删 recipe → 转换」，改为「转换 → 删 recipe」。且不能用 `use_empty()` 判断：recipe 没有 SSA 结果，`use_empty()` **恒为真**，会误删仍被 `recipe(@sym)` 引用的 recipe。正确写法：

```cpp
if (SymbolTable::symbolKnownUseEmpty(op, module))
  op->erase();          // 只有真的没有任何符号引用时才删
```

---

## 7. 修复后验证

| 用例 | 修复前 | 修复后 |
|---|---|---|
| `repro_global_normalization.mlir`（`acc.serial` + private） | **exit=139 段错误** | exit=0，安全 no-op |
| `acc_minimal.f90.mlir`（含 `combined(serial)`） | **exit=1 报错** | exit=0，安全 no-op |
| `try.f90` 端到端（`acc.parallel combined(loop)`） | exit=0，达标 | exit=0，达标（未回退） |

说明：第二行是 2026-09-12 的观测记录，该输入文件当时位于 `/home/wangyz/test/openacc/acc_loop/acc_minimal.f90.mlir`，现已被移走，因此以 `repro_global_normalization.mlir` 作为可长期复现的替代。两次观测的失败机制相同（`acc.loop` 的 private 操作数失去 `acc.private` 定义），差别只是当时 host 变量是算子结果所以报诊断，现在是 block argument 所以段错误。

端到端复核：

```bash
fir-opt --convert-openacc-to-openmp bbc-firopt-tco/try.fir.mlir | tco -o try.ll
grep -cE "__kmpc_fork_call|__kmpc_for_static_init" try.ll   # → 4
llvm-as try.ll -o /dev/null                                  # → OK
```

---

## 8. 一般性教训

1. **pass 的作用域要和它消费的范围一致。** 归一化、类型转换这类破坏不变量的改写，作用域必须严格等于随后会被消掉的范围；一旦外溢，就依赖"其他改写恰好也成功"这个脆弱假设。
2. **不要用 SSA use 判断符号存活。** `Operation::use_empty()` 只看 SSA 结果，符号引用（`FlatSymbolRefAttr`）不在其中。符号类算子必须用 `SymbolTable::symbolKnownUseEmpty`。
3. **单点验证会掩盖作用域缺陷。** `try.f90.mlir` 恰好把所有 acc 构造都转换了，缺陷不暴露；换成含 `combined(serial)` 的输入立刻失败。验证集必须包含"应该保持不动"的负例，而不只是"应该被转换"的正例。
4. **verifier 里的 `isa` / `dyn_cast` 要检查 `getDefiningOp()` 是否为 null。** block argument 是合法操作数来源，漏掉这一点会把诊断退化成段错误。

---

## 附录：源码定位速查

| 用途 | 位置 |
|---|---|
| private 操作数验证（缺陷点） | `mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:1693-1705`，判断在 `:1699` |
| `acc::LoopOp::verify()` | 同文件 `:3138`，调用 `checkPrivateOperands` 于 `:3279` / `:3284` / `:3289` |
| `acc::ParallelOp::verify()` | 同文件 `:1761` |
| `acc::SerialOp::verify()` | 同文件 `:2571` |
| `acc::KernelsOp::verify()` | 同文件 `:2759` |
| 归一化 pattern 模板 | `mlir/include/mlir/Dialect/OpenACC/Transforms/ACCSpecializePatterns.h:45` |
| 本 fork 的 pass 实现 | `mlir/lib/Conversion/OpenACCToOpenMP/OpenACCToOpenMP.cpp:47`（`normalizeDataClauses`）、`:100`（调用点） |
| 复现输入 | `repro_global_normalization.mlir`、`repro_verifier_crash.mlir` |
