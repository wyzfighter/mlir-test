# 月度报告可验证性清单（2026-08）

> 对照文件：monthly_report_2026-08.md
> 可验证的定义：可以通过微量修改源码并重新编译，将改变直接体现在最终工具上。
> 判定标准：在目标函数内部用 LLVM 自己的输出（llvm::errs() / LLVM_DEBUG 的 dbgs()）
> 打印注释，重新编译后运行对应工具，工具输出中出现该注释，即证明执行路径确实经过了该函数。

## 验证手段约定

| 手段 | 说明 |
|---|---|
| 打印 | 在目标函数入口加 llvm::errs() << "标记" ；运行工具时输出到 stderr |
| 重编译 | build-dcc 增量构建：改 mlir 源码后重链 mlir-translate / tco；改 flang 源码后重链 tco / flang |
| 触发命令 | 见各行；核心输入为 test/openacc/parallel_do/parallel_do.f90.mlir、test/openacc/acc_loop/try.f90.mlir、try.f90.fir.mlir |
| 产物证据 | 无需打印即可从工具产物（.ll 文件）核对运行时调用，如 @__kmpc_fork_call |

## 总览

| 类别 | 数量 |
|---|---|
| 可验证（已复现或可复现） | 12 |
| 部分可验证（一部分断言可打印验证，另一部分是静态/推断） | 3 |
| 不可验证（决策项，非事实断言） | 1 |
| 计划项（实施后才能验证，当前未验证） | 4 |

## 主表

| 编号 | 报告条目 | 断言内容 | 可验证性 | 验证方法（改哪里 / 怎么体现） | 当前状态 |
|---|---|---|---|---|---|
| R1 | 一.1 注册链 | ODS(OpenMPOps.td:191) → TableGen 生成文件 → OpenMPDialect 初始化 addOperations(OpenMPDialect.cpp:307) → MLIRContext 注册表 | 可验证 | 在 OpenMPDialect.cpp:307 addOperations 后加 llvm::errs() 打印 op 名；重编译 tco / mlir-translate，跑任意含 omp.parallel 的输入，出现该打印即证明注册动作执行。ODS 到生成文件环节可改 .td 后重生成观察 .h.inc/.cpp.inc 变化，但改动面大，不建议作首选 | 源码+生成文件已核对；打印实验未做 |
| R2 | 一.1 解析链 | parseSourceFile → parseCustomOperationName(Parser.cpp:2006) → RegisteredOperationName::lookup(MLIRContext.cpp:953) 哈希命中 | 可验证 | 在 parseCustomOperationName 加 llvm::errs() << opName，重编译后 mlir-opt / tco 解析含 omp.parallel 的文件，出现 parsing omp.parallel；在 lookup 加打印可进一步证明查表命中 | 源码已核对；打印实验未做 |
| R3 | 一.1 翻译链 | translateModuleToLLVMIR(ModuleTranslation.cpp:2383) → convertOperation(:993) → OpenMP 接口 convertOperation(OpenMPToLLVMIRTranslation.cpp:7279) → convertHostOrTargetOperation(:6866) → convertOmpParallel(:3101) → OpenMPIRBuilder::createParallel(OMPIRBuilder.cpp:1574) → __kmpc_fork_call | 可验证 | 各函数入口加 llvm::errs() 打印，重编译后跑 tco --code-gen-llvm 或 mlir-translate --mlir-to-llvmir 降级 parallel_do.f90.mlir，按序出现各打印；产物 .ll 中含 @__kmpc_fork_call（产物即证据，无需打印） | 已验证（2026-08-30 插桩实测，见附录 A） |
| R4 | 一.1 路线职责 | OpenMPToLLVM.cpp 只做类型合法化（五步重建同名 op），不生成 LLVM 指令与运行时调用；语义降级只在直译路径 | 可验证 | OpenMPToLLVM.cpp 的 OpenMPOpConversion 模板 matchAndRewrite 加打印；OpenMPToLLVMIRTranslation.cpp 的 convertOmpParallel 加打印。跑 mlir-opt --convert-to-llvm demo_before.mlir：只出现前者打印，输出 op 仍是 omp.parallel；跑 tco 降级：只出现后者打印且产物有 __kmpc_fork_call | demo 实验已验证类型变化（index 到 i64、memref 到 5 参数）；打印未做 |
| R5 | 一.1 结构对照 | 三份文件（parallel_do / target / try）的私有化机制、循环结构、模块属性、降级出口差异 | 部分可验证 | 降级出口差异可验证：分别降级三份文件，parallel_do 产物含 __kmpc_*、target 含 __tgt_*、try 报错（即无降级出口的直接证据）。私有化写法与循环结构属于静态文本比对，可用 mlir-opt -mlir-print-op-generic roundtrip 工具化核对，不依赖改源码重编译 | 三文件逐行解析文档已产出（静态核对） |
| R6 | 一.2 OpenACC 直译覆盖 | OpenACCToLLVMIRTranslation.cpp:492 的 TypeSwitch 仅覆盖 data 类 op，compute 构造落入 :524 的 unsupported 分支；YieldOp 在 :512 断言操作数必须为 0 | 可验证 | 构造全 LLVM 类型的 acc 最小文件（把 try.f90.mlir 的 !fir.ref 换成 !llvm.ptr），mlir-translate --mlir-to-llvmir 报 unsupported OpenACC operation: acc.private.recipe / acc.parallel；或在 :524 Default 分支加 llvm::errs() 打印后重编译，出现打印。YieldOp 断言可在 :512 case 加打印验证 | 源码已核对 + 失败矩阵已复现；打印实验未做 |
| R7 | 一.2 类型适配缺口 | CodeGen.cpp:4373 对 OpenACC 仅 addLegalDialect、无转换 patterns，导致 acc op 接口残留 FIR 类型与 live unrealized_conversion_cast | 可验证 | 直接证据已存在：tco --code-gen-llvm try.f90.mlir 报 failed to legalize operation builtin.unrealized_conversion_cast（工具报错即证据）。也可在 CodeGen.cpp 的 FIRToLLVM target 配置处加打印 acc 合法性状态，或在转换驱动加打印观察 acc op 未被重写 | 失败已复现；源码已核对 |
| R8 | 一.2 改造方案 | 新增 OpenACCToLLVM 类型适配库 + CodeGen.cpp 接线 + 直译实现串行降级后，try.f90.mlir 可完整降级 | 计划项（实施后可验证） | 实施后重编译 tco，跑 tco --code-gen-llvm try.f90.mlir 成功产出含循环结构（icmp / br / phi / store）的 .ll；各新函数入口可加打印逐步确认 | 未实施，未验证 |
| R9 | 二.1 路线职责定论 | 同 R4 | 可验证 | 同 R4 | 同 R4 |
| R10 | 二.2 匹配机制拆解 | 同 R2 | 可验证 | 同 R2 | 同 R2 |
| R11 | 二.3 DAG 模型 | node/edge 心智模型；valueMapping / blockMapping / functionMapping 是翻译必需；RecursiveMemoryEffects、AutomaticAllocationScope 等属性为优化服务 | 部分可验证 | 映射表机制可验证：在 ModuleTranslation 的 mapValue / mapBlock / functionMapping 操作处加打印或命中统计，降级时出现即证明翻译必需。属性分类（哪些服务优化）是设计意图推断，无法用打印直接证明，只能间接实验（如移除某 trait 观察优化结果变化），改动面大 | 映射表机制源码已核对；属性分类为推断性结论，未做实验 |
| R12 | 二.4 OpenACC 现状盘点 | 同 R6 / R7 | 可验证 | 同 R6 / R7 | 同 R6 / R7 |
| R13 | 三.1 无法完整降级 | 直译缺失、类型适配缺失、mlir-translate 未注册 FIR dialect | 可验证 | 直译缺失与类型适配缺失同 R6 / R7。mlir-translate 未注册 FIR：直接跑 mlir-translate --mlir-to-llvmir try.f90.mlir，报 !fir.ref type created with unregistered dialect（工具报错即证据，已复现） | 三个子项均已复现 |
| R14 | 三.2 AddAliasTags 缺陷 | AddAliasTags.cpp:684 对 instantiation point 做 dyn_cast<fir::DeclareOp> 失败后，:686 在空指针上调用 getDummyScope，触发 ODS 访问越界崩溃 | 可验证 | 在 :684 前后加 llvm::errs() 打印 declOp 的 op 名与是否为 fir.declare，重编译 tco 后跑 tco --code-gen-llvm try.f90.fir.mlir：打印显示 instantiation point 是 hlfir.declare（非 fir.declare），随后复现崩溃；修复后不再崩 | 崩溃已复现（stack trace 为证据）；根因定位基于源码阅读，打印实验未做 |
| R15 | 三.3 语义方案未拍板 | 串行 host 降级 vs 完整并行运行时语义 | 不可验证 | 这是待决策项，不是事实断言；必须先选定方案并实施，才谈得上验证 | 待拍板 |
| R16 | 三.4 OpenMP 深度项 | createParallel outline 细节、__kmpc_for_static_init_4u 参数编码、Flang 前端 lowering、GPU 分叉均未展开 | 部分可验证 | 各子项均可设计验证：a) createParallel(OMPIRBuilder.cpp:1574) 入口加打印，并在产物中核对 outline 函数名与 %structArg；b) 在 :5328 生成 __kmpc_for_static_init_4u 调用处加打印参数，与产物中的 schedule 34 对照；c) flang/lib/Lower/OpenMP.cpp 与 OpenACC.cpp 加打印，flang -emit-fir 观察 omp/acc 结构生成；d) 在 OpenMPToLLVMIRTranslation.cpp:7279 分叉处加打印，用带 omp.is_target_device 的模块跑 tco 观察分支。当前均未做，故现状为未验证 | 未验证（计划内） |
| R17 | 四.1 OpenACC 落地 | 同 R8 | 计划项（实施后可验证） | 同 R8 | 未实施 |
| R18 | 四.2 OpenMP 深度项 | 同 R16 | 计划项（实施后可验证） | 同 R16 | 未实施 |
| R19 | 四.3 修复 AddAliasTags | 修复后含 acc 构造的完整编译链路不再崩溃 | 计划项（实施后可验证） | 修复后重编译 tco，跑 tco --code-gen-llvm try.f90.fir.mlir 不再崩溃并产出结果 | 未实施 |
| R20 | 四.4 并行运行时语义 | 在串行降级稳定后评估 OpenACC 并行运行时与 GPU 分叉 | 计划项（依赖外部资源） | 需要 OpenACC runtime 或实机（gfx906 / /dev/kfd）支持；可验证性取决于外部资源到位情况 | 未实施 |

## 说明

1. R1 不建议通过改 OpenMPOps.td 验证：会触发 TableGen 重生成并影响大量测试，不符合微量修改原则；用 addOperations 处打印即可覆盖注册动作。
2. R5 / R11 中标记为静态或推断的结论，不适用打印验证，但均可通过阅读源码或工具 roundtrip 再次核对。
3. R15 是决策项，R17-R20 是计划项：这些在报告中本就标注为待定或未实施，不构成已验证结论。
4. 所有可验证项的验证都建立在 build-dcc 增量构建可行这一前提上（改单个文件后重链对应工具）。

## 附录 A：翻译链 TRACE 验证记录（2026-08-30）

方法：在 OpenMPToLLVMIRTranslation.cpp 四个函数入口各加一行 llvm::errs() 打印
（TRACE: OpenMP interface convertOperation 位于 :7286、TRACE: convertHostOrTargetOperation
位于 :6870、TRACE: convertOmpParallel 位于 :3103、TRACE: convertOmpLoopNest 位于 :3500），
增量重编译后实测。

| 命令 | TRACE 输出 | 结论 |
|---|---|---|
| tco --emit-final-mlir parallel_do.f90.fir.mlir | 0 条 | --emit-final-mlir 不调用 translate |
| tco --emit-final-mlir try.f90.fir.mlir | 0 条 | 同上（acc 输入同样不调用） |
| tco --code-gen-llvm parallel_do.f90.mlir | 按序出现 interface convertOperation → convertHostOrTargetOperation → convertOmpParallel → convertOmpLoopNest | 翻译链逐层触达 |
| tco parallel_do.f90.mlir（默认 O2） | 同上 | 无选项时同样走 translate |
| mlir-translate --mlir-to-llvmir parallel_do.f90.mlir | 同上 | 不同入口，同一汇合点 |

实测输出（code-gen-llvm / 默认 O2 / mlir-translate 三者一致）：

TRACE: OpenMP interface convertOperation
TRACE: convertHostOrTargetOperation
TRACE: OpenMP interface convertOperation
TRACE: convertHostOrTargetOperation
TRACE: convertOmpParallel
TRACE: OpenMP interface convertOperation
TRACE: convertHostOrTargetOperation
TRACE: OpenMP interface convertOperation
TRACE: convertHostOrTargetOperation
TRACE: convertOmpLoopNest
TRACE: OpenMP interface convertOperation
TRACE: convertHostOrTargetOperation
TRACE: OpenMP interface convertOperation
TRACE: convertHostOrTargetOperation

解释：ModuleTranslation::convertOperation 对模块内每个 omp op 都调用一次接口
（omp.private / omp.parallel / omp.wsloop / omp.loop_nest / omp.yield / omp.terminator），
所以 interface 与 convertHostOrTargetOperation 成对出现多次；convertOmpParallel 与
convertOmpLoopNest 各出现一次，对应实际存在的构造。
