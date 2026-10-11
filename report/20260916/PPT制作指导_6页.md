# PPT 制作指导（6 页版）

> **[已取代]** 本文件写于"常规汇报"设定下，其中关于截屏、动画、配色冲击力的建议与
> 2026-09-16 后的新设定（2 人线上技术评审、纯干货、源码只标坐标不放截图）冲突。
> 请以 `PPT制作指导.md`（12 页版）为准。本文件仅保留页数压缩时的取舍参考。
>
> 用途：OpenACC → OpenMP 桥接（A+B 混合路线）阶段汇报
> 建议时长：12 分钟正文 + 3 分钟问答
> 配套详版：`汇报总结_OpenACCToOpenMP_P0P1.md`（10 页版，含数据速查）
> 深度材料：`技术分析_acc_private归一化缺陷.md`（备查，不上正文）

---

## 使用说明

**受众定位**：懂 LLVM/MLIR 但没参与本项目的同事或主管。因此不必解释什么是 pass、什么是 dialect，但必须解释**为什么选这条路**和**现在能干什么、不能干什么**。

**六页的分工**：1 页问题、1 页路线、1 页已完成、1 页证据、1 页亮点（缺陷发现）、1 页边界与计划。**不要平均用力**——第 4 页和第 5 页是重点，共占一半时间。

**统一口径（先读这段再动手）**：

- 可以说：compute 构造在 host 并行路径上的缺失已打通，范围是 `acc.parallel` + `acc.loop`。
- 不能说：OpenACC 并行已支持、性能有提升、OpenACC 降级已完成。
- 三条禁语的原因见文末检查清单。

---

## 第 1 页 · 封面与问题

**目的**：30 秒内让听众知道问题是什么、有多大。

**标题**：`OpenACC compute 构造的降级缺口`

**副标题**：`从 7 行 Fortran 到一个可运行的 host 并行`

**版式**：上下结构。上半页放左侧源码、右侧一行结论；下半页放一张"断链"示意图。

**正文（可直接用）**：

```text
现状：OpenACC 在 LLVM 上是 data 通路齐全、compute 通路缺失
       · data 类算子（acc.data / enter_data / exit_data / update）有直译实现
       · compute 类算子（acc.parallel / acc.loop / acc.private）全部落入 unsupported
后果：含 !$acc parallel loop 的程序无法从 MLIR 降到 LLVM IR
```

**视觉**：一条横向链条 `Frontend → acc dialect → ??? → LLVM IR`，中间画成断开的红色虚线。右下角放 7 行 Fortran 源码缩略图。

**源码缩略**（放小字，仅作背景，不必逐行讲）：

```fortran
!$acc parallel loop
do i = 1, 100
end do
!$acc end parallel loop
```

**口播（约 60 秒）**：

> OpenACC 在 LLVM 上的问题很具体：data 那条路是通的，compute 那条路是断的。我们把 `OpenACCToLLVMIRTranslation` 的 `convertOperation` 完整看了一遍，它只显式处理了 data 类算子，其余全部落到 unsupported 分支。也就是说这样一段 7 行的 Fortran，走到 MLIR 就停了，出不了 LLVM IR。

**制作提示**：本页不要放源码定位行号，留给第 5 页和备份页。封面页信息越少越好。

---

## 第 2 页 · 路线选择

**目的**：说明为什么是"混合"，而不是纯 A 或纯 B。这一页是听众最容易质疑的地方。

**标题**：`为什么选 A+B 混合路线`

**版式**：左右对比 + 底部一条结论带。左侧是两条候选路线，右侧是最终方案的框图。

**正文（可直接用）**：

| 路线 | 做法 | 取舍 |
|---|---|---|
| A 直译补全 | 在 `OpenACCToLLVMIRTranslation` 里补齐 compute 的串行降级 | 工程量大、可上游化，但产出**不是并行代码** |
| B 转换桥接 | 新增 pass 把 compute 转成 OpenMP，复用 `omp.* → __kmpc_*` | 拿到**真正的 host 并行**，但属 fork 内方案 |
| **A+B 混合** | compute 走 B，data 保持 A 的现状 | 两条通路各取所长 |

**结论带（加粗放底部）**：

```text
不修改上游既有数据路径，只新增一个 compute 桥接 pass
```

**视觉**：双通路框图，两条箭头从 IR 分别出发：

```text
omp.parallel / omp.wsloop  ──→  libomp      （__kmpc_*）
acc.data / enter_data      ──→  libomptarget（__tgt_*）
```

**口播（约 90 秒）**：

> 我们考虑过两条路。A 是直接在 OpenACC 的直译里补齐 compute，这条路上游化最干净，但工程量大，而且它产出的是串行代码——compute 构造降下去还是串着跑。B 是新增一个 pass 把 compute 转成 OpenMP，这样能直接复用已经被反复验证过的 `omp.* → __kmpc_*` 通路，拿到真正的并行。我们选的是混合：compute 走 B，data 完全不碰，继续走原来的 `__tgt_*`。好处是改动面小、风险隔离，数据路径的行为一行没变。

**制作提示**：这张表可以用两栏对比图代替。务必突出"数据路径零改动"——这是审阅者最关心的风险点。

---

## 第 3 页 · 已完成工作

**目的**：说清楚 P0、P1 各做了什么，让听众建立"进度可控"的印象。

**标题**：`已完成：pass 骨架（P0）与桥接实现（P1）`

**版式**：左右分栏，左 P0 右 P1，底部一行代码改动量。

**左栏 P0（骨架与注册）**：

```text
· 新建 3 个文件，改 5 个既有文件
· pass 锚在 ModuleOp（不是 func::FuncOp）
  → 因此能覆盖 llvm.func，插入点灵活
· 注册路径：add_mlir_conversion_library
  → MLIR_CONVERSION_LIBS → MLIRRegisterAllPasses
  → mlir-opt 自动带上；fir-opt 需单独注册
```

**右栏 P1（桥接实现）**：

```text
· 匹配 acc.parallel，要求其 region 内最后一个非终结算子为 acc.loop
· 先提升 loop 之前的算子（保证值支配关系）
· 依次构造 omp.parallel → omp.wsloop → omp.loop_nest
· acc.yield → omp.yield，补 omp.terminator
· 闭区间映射到 loop_inclusive，不做 ub+1（避免整数溢出）
```

**底部数据**：

```text
新增 254 行（3 个文件）  ·  既有文件净增 16 行（5 处）
```

**口播（约 75 秒）**：

> P0 是骨架，重点是我们把 pass 锚在了 ModuleOp 而不是 FuncOp，这个选择后面被证明很关键——它让 pass 在高层 FIR 和已经降到 LLVM 层的 IR 上都能插进去。P1 是真正的桥接：匹配 `acc.parallel`，把 loop 之前的算子先提升到 parallel 的 region 里保证支配关系，然后依次构造 parallel、wsloop、loop_nest 三个算子，最后把 `acc.yield` 换成 `omp.yield`。有一个细节值得一提：闭区间我们映射到了 `loop_inclusive` 属性，没有做 `ub+1`，避免整数溢出。

**制作提示**：这页信息密度最高，建议用代码块字体而非项目符号，且字号不小于 16pt。

---

## 第 4 页 · 验收证据（核心页之一）

**目的**：用一条命令和四行输出证明"真的通了"。这页要停留久一点。

**标题**：`端到端验收：从 acc 到 libomp`

**版式**：上方一条命令，中间四行关键输出（等宽字体、加背景色），底部一行结论。

**命令**：

```bash
fir-opt --convert-openacc-to-openmp try.fir.mlir | tco -o try.ll
grep -E "__kmpc_fork_call|__kmpc_for_static_init" try.ll
```

**输出（四条命中，前两条是调用点，后两条是声明）**：

```text
call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
call void @__kmpc_for_static_init_4u(ptr @1, i32 ..., i32 34, ptr %p.lastiter, ...)
declare void @__kmpc_for_static_init_4u(...)
declare !callback !9 void @__kmpc_fork_call(...)
```

**结论行（加粗）**：

```text
fork_call 表示并行区已生成；for_static_init 表示循环已按 static 调度拆给线程
```

**附加证据（小字，右下角）**：

```text
· llvm-as 校验生成的 LLVM IR：通过
· 循环语义：归一化后 lb=0 ub=99 step=1 → 100 次迭代，与 i=1,100 一致
· 两条管道均通过（fir-opt 前置 / tco 前置）
```

**口播（约 90 秒）**：

> 这是最直接的一条证据。左边这条命令把 FIR 转成 LLVM IR，右边是 grep 结果。`__kmpc_fork_call` 的出现说明并行区已经生成，`__kmpc_for_static_init` 说明循环已经按 static 调度拆给各个线程——这两条加起来，就是这段 OpenACC 代码真的跑到了 libomp 上。我们还做了两个额外确认：生成的 IR 能通过 `llvm-as` 校验；循环边界归一化之后是 0 到 99、步长 1，正好 100 次迭代，和源码的闭区间一致。

**制作提示**：**不要**把 `__kmpc_*` 说成"性能证明"。它只证明代码路径通了，不证明跑得快。

---

## 第 5 页 · 过程中发现的缺陷（核心页之一）

**目的**：展示技术深度。汇报里最有说服力的往往不是"做成了什么"，而是"发现了什么别人会踩的坑"。

**标题**：`发现并修复：一个会破坏合法 IR 的作用域缺陷`

**版式**：三栏递进——左"现象"、中"根因"、右"修复"。

**左栏 现象**：

```text
按上游文档写的「模块级」归一化
→ 在含 acc.serial + acc.loop 的输入上
→ Segmentation fault (core dumped), exit=139
```

**中栏 根因**：

```text
归一化是全局的，但被替换者所在的构造不一定都会被转换：
· acc.parallel combined(loop)  → 会被转换，没问题
· acc.serial / combined(serial) → 存活，private 操作数失去定义

进一步定位到 verifier：
OpenACC.cpp:1699  if (!mlir::isa<OpT>(operand.getDefiningOp()))
operand 是 block argument 时 getDefiningOp() 返回 nullptr
→ isa 对空指针不检查 → 崩溃
```

**右栏 修复**：

```text
1. 归一化限定在「即将被消费的 region」内
2. recipe 清理挪到转换之后，并按符号引用判断
   （recipe 无 SSA 结果，use_empty() 恒为真，会误删）
```

**底部结论带**：

```text
修复前 exit=139 崩溃  →  修复后 exit=0 安全 no-op；端到端验收未回退
```

**口播（约 100 秒）**：

> 这一页是我们觉得最有价值的发现。按上游文档写的归一化是模块级的，它在我们的主用例上是通的，换了输入就崩了——不是报错，是段错误。根因是归一化范围外溢：`acc.parallel` 会被转换掉，但 `acc.serial` 会存活，而它里面 `acc.loop` 的 private 操作数已经被替换成了 host 变量，不再由 `acc.private` 定义，不变量被打破。我们继续往下追，发现问题不只是我们的：acc 的 verifier 在检查这个操作数时，没判断 `getDefiningOp()` 是不是空指针，而操作数是 block argument 时它就是空的。所以这个崩溃是 verifier 的潜在缺陷，我们甚至不需要 pass，光解析验证就能触发。修的时候我们把归一化收窄到 region 作用域，另外 recipe 清理的存活判断也从 SSA use 改成了符号引用判断。

**制作提示**：这页如果只讲一页，就讲这页。`exit=139 → exit=0` 这个对比很有冲击力，建议做成大字对照。

---

## 第 6 页 · 边界与下一步

**目的**：主动划清边界，避免过度承诺；同时给出清晰的后续路径。

**标题**：`当前边界与下一步`

**版式**：左"没做什么"、右"下一步"，底部一行如实说明。

**左栏 当前边界（要敢讲）**：

```text
· private 语义是简化：per-thread 私有副本被替换为 host 变量，本用例中
  对 i 的存储落在共享位置，存在数据竞争
· 覆盖范围：仅 acc.parallel + acc.loop
· 未做运行时验证：未链接 libomp 实际执行
· 尚无 lit 测试：验证均为手工命令
· 非上游方案：目标是 fork 内可用
```

**右栏 下一步**：

| 阶段 | 内容 | 验收 |
|---|---|---|
| P2 | lit 测试 | `llvm-lit` 通过 |
| P3 | `acc.serial` / `acc.kernels`；reduction；真正的 recipe 展开 | 消除数据竞争 |
| 可选 | 运行时验证（链接 libomp 实跑） | 端到端可执行 |

**底部一行**：

```text
一句话：打通了 compute 在 host 并行路径上的缺口，范围限定为 acc.parallel + acc.loop
```

**口播（约 75 秒）**：

> 最后说清楚边界。最需要强调的是 private 语义：我们现在是把 per-thread 的私有副本简化成了 host 变量，所以这个用例里对 i 的存储实际上落在共享位置，是有数据竞争的。这是 MVP 阶段明确的取舍，P3 会用真正的 recipe 展开来补。另外我们还没有做过运行时验证，也没有 lit 测试，这些都在计划里。总结一句：我们打通的是 compute 构造在 host 并行路径上的缺口，范围限定在 `acc.parallel` 加 `acc.loop`。

**制作提示**：不要把"局限"讲成道歉。主动划边界是加分项，说明作者清楚自己的工作处在什么位置。

---

## 通用制作规范

**字体与字号**

- 正文不小于 18pt，代码块不小于 16pt。投影环境比显示器暗，字号宁大勿小。
- 代码用等宽字体（如 Consolas / Menlo），中文用无衬线。不要在同一行混排多种字体。
- IR 片段如果一行放不下，宁可截断加省略号，也不要缩字号到 12pt。

**配色**

- 全篇统一：一条主色用于结论带，一条警示色（红/橙）只用于"缺陷/失败"。
- `exit=139` 那组对比用警示色，其他页不要复用，避免冲淡重点。

**版式**

- 一页一个结论。如果一页出现两个并列结论，拆页或删一个。
- 每页底部留一条"结论带"（单行加粗），听众记不住正文，但记得住那一行。
- 表格不超过 4 行 3 列。

**视觉元素**

- 第 1 页必须有一张示意图（断链），纯文字开场效果差。
- 第 2 页的双通路框图建议用现成图形拼，不要手绘箭头。
- 第 4、5 页用真实终端输出截图比手打文字更有说服力（注意去掉路径中的用户名）。

**动画**

- 不建议做逐条飞入。技术汇报中最有效的动画是"高亮下一行"，最多用在第 3 页代码块上。

---

## 上台前检查清单

**事实准确性**

- [ ] `__kmpc_fork_call` 与 `__kmpc_for_static_init_4u` 拼写、参数已核对
- [ ] 代码改动量（新增 254 行 / 净增 16 行）与其他材料一致
- [ ] `exit=139` 与 `exit=0` 来自实际运行，不是推测
- [ ] 所有行号引用可在本地源码复核（`OpenACC.cpp:1699`、`Passes.td:1047` 等）

**三条禁语（说出口会被追问）**

- [ ] 没说"OpenACC 并行已支持"——private 语义是简化，存在数据竞争
- [ ] 没说"性能提升"——从未做过任何性能测量
- [ ] 没说"已完成 OpenACC 降级"——`acc.serial` / `acc.kernels` / reduction 都未覆盖

**被问到时的标准答法**

| 问题 | 回答 |
|---|---|
| 这算解决 llvm 在 OpenACC 的缺陷了吗？ | 解决了 compute 在 host 并行路径上的缺失，范围限定 `acc.parallel` + `acc.loop`；device offload、`acc.serial`/`kernels`、reduction、真正的私有化未覆盖 |
| 为什么不直接做 device offload？ | 那是另一条路线（ACCToLLVM + libacctarget + GPU dialect），需要 host/device 两阶段编译与 offload image 打包，不在本阶段范围 |
| 数据竞争的问题严重吗？ | 严重，是已知取舍；P3 用真正的 recipe 展开消除。当前只适用于私有变量不被并发写的场景 |
| verifier 的缺陷要上游修吗？ | 建议提 issue：`checkPrivateOperands` 应在 `getDefiningOp()` 为 null 时返回诊断而非交给 `isa` |

**时间控制**

- [ ] 第 4、5 页各留足 90 秒
- [ ] 彩排一次，确认总时长在 12 分钟内
- [ ] 准备好第 4 页命令的现场演示（如果要做，提前确认二进制可用）

---

## 备份页（不上正文，被问到再翻）

按需准备 3 到 5 张，建议内容：

1. **源码定位页**：`OpenACCToLLVMIRTranslation.cpp:496-527` 的 TypeSwitch 全文截图，说明哪些算子有实现、哪些落到 `:525` 的 unsupported。
2. **IR 前后对照页**：`acc.parallel combined(loop)` 块的转换前后完整 IR。
3. **缺陷详情页**：`OpenACC.cpp:1694-1700` 源码 + 崩溃栈帧 + 两个最小复现输入。
4. **两条管道页**：`bbc-firopt-tco` 与 `bbc-tco-firopt-tco` 的流程图与各自产物。
5. **命令速查页**：构建、注册验收、端到端验收的完整命令。
