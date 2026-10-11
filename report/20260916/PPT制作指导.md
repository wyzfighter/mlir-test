# 幻灯片文字稿（14 页 · 双人线上技术评审）

> 场景：线上会议，听众 2 人，均为 LLVM/MLIR 方向同行
> 节奏：正文 18 分钟 + 讨论 15 分钟
> 用法：每页给出**逐字幻灯片文字**，可直接抄进 PPT
> 源码一律用 `路径:行号` 的文字标注，**不放源码截图**

---

## 使用说明

**这份汇报的性质变了**

完成度指标（`AGENTS.md` 第 4 节）明确要求「并行部分在 DCU 上并行运行，串行部分在 CPU 上」。因此本汇报不是进度罗列，而是**以该指标为唯一评估轴的路线可行性评估**：做了什么、距离指标还差多少、接下来走哪条。

**本文件给什么**

- `标题` / `正文`：直接写进 PPT 的文字，逐字可用。
- `【截图位】`：需要你自己补的截图，标了位置、内容和来源命令。不补也不影响这一页成立。
- `讲述要点`：写在备注里，不放进幻灯片。

**页序**

| 块 | 页 | 内容 |
|---|---|---|
| A 目标与缺口 | 1-3 | 指标是什么、缺口在哪 |
| B 已做的工作 | 4-7 | A+B 是什么、做了什么 |
| C 验证 | 8-9 | 拿到的是什么并行 |
| D 与硬性指标的差距 | 10-12 | 差在哪、以及一个语义矛盾 |
| E 路线评估与下一步 | 13-14 | 三条路线、怎么走 |

第 10、11 页是全篇重点：它们决定了 A+B 的定位。

---

# 块 A · 目标与缺口

## 第 1 页 · 完成度指标

**标题**

```text
完成度指标：并行在 DCU，串行在 CPU
```

**正文**

```text
绝对硬性指标
  · 并行部分：必须最终在 DCU 上并行运行
  · 串行部分：必须运行在 CPU 上

中期指标
  · test/openacc/acc_loop/try.f90 的 Fortran-ACC 源码
    能在 DCU 上并行化运行

本报告以这两条为唯一评估轴
```

**【截图位】**（无）

**讲述要点**

- 开场就把评估轴立起来：后面所有内容都要对着"并行在 DCU"这一条回答。
- 明确说：本文不会把"能跑通"当成达标，跑通不等于跑在 DCU 上。

---

## 第 2 页 · 缺口定位

**标题**

```text
缺口：OpenACC compute 构造无降级通路
```

**正文**

```text
data 类
  acc.data / enter_data / exit_data / update
  → 有直译实现，产出 __tgt_* 运行时调用

compute 类
  acc.parallel / acc.loop / acc.private / acc.*.recipe
  → 无任何分支命中，全部落到 unsupported

源码坐标
  OpenACCToLLVMIRTranslation.cpp:496-527   convertOperation 的 TypeSwitch
  同文件 :497-511                          四类 data 算子
  同文件 :512-518                          terminator / yield 直接省略
  同文件 :519-523                          六个算子记为 NOP
  同文件 :524-527                          .Default，报 unsupported
```

**【截图位】**（可选）

- 位置：正文右侧或下方。
- 内容：`OpenACCToLLVMIRTranslation.cpp:496-527` 的 TypeSwitch，行号打开。
- 来源：`sed -n '496,527p' mlir/lib/Target/LLVMIR/Dialect/OpenACC/OpenACCToLLVMIRTranslation.cpp`

**讲述要点**

- `.Default` 是 compute 构造唯一的出口，不存在任何 `.Case` 命中。

---

## 第 3 页 · 缺陷的实际后果

**标题**

```text
9 行 Fortran 卡在 MLIR
```

**正文**

```text
输入  /home/wangyz/test/openacc/acc_loop/try.f90

  program main
    implicit none
    integer :: ThisIsIterater
    !$acc parallel loop
    do ThisIsIterater = 3, 98
    end do
    !$acc end parallel loop
  end program

转换前的关键结构（try.fir.mlir）

  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init { ... }

  func.func @_QQmain() {
    acc.parallel combined(loop) {
      %3 = acc.private varPtr(%2#0 : !fir.ref<i32>)
           recipe(@privatization_ref_i32) -> !fir.ref<i32>
           {implicit = true, name = "thisisiterater"}

      acc.loop combined(parallel) private(%3 : !fir.ref<i32>)
          control(%arg0 : i32) = (%c3_i32 : i32) to (%c98_i32 : i32)
          step (%c1_i32 : i32) {
        %4:2 = hlfir.declare %3 {uniq_name = "_QFEthisisiterater"}
        fir.store %arg0 to %4#0 : !fir.ref<i32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>,
                    independent = [#acc.device_type<none>]}
      acc.yield
    }
  }
```

**【截图位】**（可选）

- 位置：右下角，小图。
- 内容：`try.fir.mlir` 中 `acc.parallel` 那 10 行。
- 来源：`sed -n '15,24p' /home/wangyz/test/openacc/acc_loop/try.fir.mlir`

**讲述要点**

- 两点：`acc.private` 是 region **内部**的独立算子，不是 clause 属性；`recipe` 是符号引用而非 SSA 值。
- 这就是中期指标指向的那个文件。

---

# 块 B · 已做的工作

## 第 4 页 · 路线与数据流

**标题**

```text
A+B 混合：compute 走 OpenMP，data 保持原状
```

**正文**

```text
两条桥接路线（引自 /home/wangyz/.llvm/codex_sandbox/两种桥接处理逻辑流报告.md §0）

  桥接 A  MLIR pass        acc.* 改写成 omp.*，复用整条 OpenMP 后端
  桥接 B  LLVM IR 翻译层   保留 acc.*，直接生成 OpenMP runtime 调用

A+B 混合 = compute 走 A，data 走 B，同一 module 内共存

选定方案的数据流

  try.fir.mlir
     │  fir-opt --convert-openacc-to-openmp
     ▼
  omp.parallel + omp.wsloop + omp.loop_nest     （acc data 残留不动）
     │
     ├── omp.*    → OpenMPToLLVMIRTranslation  → __kmpc_*
     └── acc data → OpenACCToLLVMIRTranslation → __tgt_*

源码坐标
  OpenACCToLLVMIRTranslation.cpp:496-527   acc 侧直译入口
  OpenMPToLLVMIRTranslation.cpp:3101       convertOmpParallel
```

**【截图位】**（可选）

- 位置：正文中部，替换 ASCII 数据流。
- 内容：一张数据流图，建议用 PPT 形状画，或直接保留 ASCII 排版。

**讲述要点**

- 一句话取舍：A 解决「能不能降下去」，B 解决「降下去是不是并行」。
- 先埋一句：这个方案的下限是主机并行，第 10 页会展开。

---

## 第 5 页 · P0：骨架与注册

**标题**

```text
P0：pass 骨架与注册
```

**正文**

```text
pass 名  convert-openacc-to-openmp
锚点     ModuleOp
验收     fir-opt --help / mlir-opt --help 均可见

源码坐标
  Passes.td:1047-1050            pass 定义 Pass<"convert-openacc-to-openmp", "ModuleOp">
  Passes.h:60-64                 include
  Conversion/CMakeLists.txt:52   add_subdirectory(OpenACCToOpenMP)
  fir-opt.cpp:15 / :46           include / registerConvertOpenACCToOpenMPPass()
  fir-opt/CMakeLists.txt:52      链接 MLIROpenACCToOpenMP
  InitFIR.h:107                  fir-opt 的 pass 注册入口

注册路径
  add_mlir_conversion_library → 全局属性 MLIR_CONVERSION_LIBS
                              → MLIRRegisterAllPasses → mlir-opt 自动带上
  fir-opt 不走 registerAllPasses()，需单独注册一行

改动量
  新增 3 个文件 254 行（头 28 / 实现 208 / CMake 18）
  修改 5 个既有文件，净增 16 行
```

**【截图位】**（可选）

- 位置：右下角。
- 内容：两个 `--help` 的 grep 结果并排。
- 来源：

```bash
/home/wangyz/.llvm/build-dcc/bin/fir-opt  --help | grep convert-openacc-to-openmp
/home/wangyz/.llvm/build-dcc/bin/mlir-opt --help | grep convert-openacc-to-openmp
```

**讲述要点**

- `createConvertOpenACCToOpenMPPass()` 定义在本库的 TU 里，所以 fir-opt **必须**链接 `MLIROpenACCToOpenMP`，不能省。

---

## 第 6 页 · P1：转换算法【重点】

**标题**

```text
acc.parallel + acc.loop → omp.parallel / omp.wsloop / omp.loop_nest
```

**正文**

```text
匹配条件
  目标 acc.parallel，要求其 region 内最后一个非终结算子为 acc.loop
  且该 acc.loop 有 lowerbound
  暂不支持 acc.loop 带 results（reduction）、collapse

算法八步（编号即执行顺序）
  ① 归一化 region 内 acc.private / firstprivate / reduction → host 变量
  ② 提升：把 acc.loop 之前的算子搬进 omp.parallel 的 region
  ③ 建 omp.parallel，建 region 与 entry block
  ④ 建 omp.wsloop，补 omp.terminator
  ⑤ 建 omp.loop_nest，取 acc.loop 的 lowerbound / upperbound / step
  ⑥ 搬运 acc.loop 的 region 进 loop_nest
  ⑦ acc.yield → omp.yield
  ⑧ 擦除 acc.loop 与 acc.parallel

源码坐标
  OpenACCToOpenMP.cpp:47-76     normalizeDataClauses（步骤①）
  同文件 :78-163                ConvertParallelWithLoop（步骤②-⑧）
  同文件 :100                   归一化调用点
  同文件 :166-170               populateOpenACCToOpenMPConversionPatterns
  同文件 :172-207               pass 主体（转换 + recipe 清理）
  SCFToOpenMP.cpp:490-575       抄写的模板，LoopNestOp::create 在 :544
```

**【截图位】**（可选）

- 位置：右侧，竖条。
- 内容：转换前后的 IR 对照（左 acc 块，右 omp 块）。
- 来源：`try.fir.mlir` 与 `bbc-firopt-tco/try.omp.mlir`

**讲述要点**

- 步骤② 的理由：`acc.loop` 之前的算子会被循环体引用，必须保证搬运后仍支配使用。
- 关键点：产物是 `omp.parallel`，**没有 `omp.target`**。第 10 页会说明这意味着什么。

---

## 第 7 页 · 关键设计决策

**标题**

```text
四个决策及其理由
```

**正文**

```text
一、闭区间不做 ub+1
  acc.loop 的 inclusiveUpperbound → omp.loop_nest 的 loop_inclusive
  理由：加法在边界上会整数溢出
  参照：OpenACCUtilsLoop.cpp:55-56 也是直取 inclusive 标志

二、用 omp.wsloop 而非 omp.loop
  理由：SCFToOpenMP.cpp:490-575 是已验证的写法，构造顺序与插入点直接对齐
  定义：OpenMPOps.td:719（WsloopOp）/ :601（LoopNestOp）/ :191（ParallelOp）

三、terminator 逐个处理
  omp.wsloop 是 NoTerminator，region 内只能有一个 omp.loop_nest
  omp.parallel 的 region 必须以 omp.terminator 结尾
  acc.yield → omp.yield

四、recipe 按符号引用判断存活
  不能用 Operation::use_empty()：recipe 没有 SSA 结果，该判断恒为真
  必须用 SymbolTable::symbolKnownUseEmpty(op, module)
```

**【截图位】**（无）

**讲述要点**

- 决策四是第 12 页那个缺陷的直接产物，先埋一句。

---

# 块 C · 验证

## 第 8 页 · 端到端证据

**标题**

```text
端到端证据：拿到的是主机并行
```

**正文**

```text
命令
  fir-opt --convert-openacc-to-openmp try.fir.mlir | tco -o try.ll
  grep -E "__kmpc_fork_call|__kmpc_for_static_init" try.ll

输出（四行命中）
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1,
       ptr @_QQmain..omp_par, ptr %structArg)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 ..., i32 34,
       ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride,
       i32 1, i32 0)
  declare void @__kmpc_for_static_init_4u(...)
  declare !callback !9 void @__kmpc_fork_call(...)

解读
  __kmpc_* 是 libomp（主机线程运行时）的调用
  outline 出的 _QQmain..omp_par 是一个普通 host 函数
  → 并行区已经生成，但运行位置是 CPU

中间态（bbc-firopt-tco/try.omp.mlir）
  omp.parallel {
    omp.wsloop {
      omp.loop_nest (%arg0) : i32 = (%c3_i32) to (%c98_i32)
          inclusive step (%c1_i32) {
        fir.store %arg0 to %3#0 : !fir.ref<i32>
        omp.yield
      }
    }
    omp.terminator
  }
```

**【截图位】**（建议补）

- 位置：正文右侧。
- 内容：终端里跑上面两条命令的结果。
- 来源：

```bash
/home/wangyz/.llvm/build-dcc/bin/fir-opt --convert-openacc-to-openmp \
    /home/wangyz/test/openacc/acc_loop/try.fir.mlir \
  | /home/wangyz/.llvm/build-dcc/bin/tco -o /tmp/try.ll
grep -E "__kmpc_fork_call|__kmpc_for_static_init" /tmp/try.ll
```

**讲述要点**

- 这一页要讲得克制：它证明的是"compute 降级通路打通了"，**不证明**满足硬性指标。
- 提醒：`tco --emit-final-mlir` 产出的是 MLIR，不含 `__kmpc_*`；要验证运行时符号必须走 LLVM IR 输出。

---

## 第 9 页 · 辅助验证

**标题**

```text
五项检查与两条插入位置
```

**正文**

```text
五项检查
  LLVM IR 合法性   llvm-as try.ll -o /dev/null            → OK
  循环语义         归一化后 lb=0, ub=95, step=1           → 96 次迭代
                   与源 3..98 闭区间一致；IV 反归一化为 iv+3
  闭区间传递       比对 inclusiveUpperbound               → 输出带 inclusive，未做 ub+1
  非 FIR 输入      纯 func.func + acc ops                 → 转换正确，不依赖 flang 扩展
  幂等             连跑两次 pass                          → exit=0，stderr 空

两条插入位置都通过
  bbc → fir-opt → tco           输入是高层 FIR          → 通过
  bbc → tco → fir-opt → tco     输入已降到 LLVM 层       → 通过

含义
  pass 锚 ModuleOp 的选择得到验证：两种 IR 形态都能插
```

**【截图位】**（无）

**讲述要点**

- 循环语义那一项最容易漏：管道跑通 ≠ 迭代次数对。
- 但这些检查都只覆盖 host 路径，**没有一项验证 DCU 运行**。主动说出来。

---

# 块 D · 与硬性指标的差距

## 第 10 页 · A+B 给出的是主机并行【重点】

**标题**

```text
距离硬性指标：三层证据说明当前不满足
```

**正文**

```text
第一层  产物里没有设备执行
  omp.target 出现次数：0
  __kmpc_              ：12      主机运行时
  outline 出的是 host 函数 _QQmain..omp_par

第二层  设备入口是 omp.target，而 pass 不生成
  OpenMPOps.td:1451                    omp.target 定义
  OpenMPToLLVMIRTranslation.cpp:6344   convertOmpTarget
  同文件 :6644                         createTarget
  → 由 isTargetDevice() / TargetTriples 驱动，是设备代码生成的入口

第三层  A 路线本身没有 kernel 启动（最关键）
  OpenACCToLLVMIRTranslation.cpp 的全部 runtime 调用点：
    :65   __tgt_target_data_begin_mapper
    :69   __tgt_target_data_end_mapper
    :73   __tgt_target_data_update_mapper
    :273  __tgt_target_data_begin_mapper
    :276  __tgt_target_data_end_mapper
  五处全是 data mapper，没有一处 __tgt_target_kernel
  → A 路线只做数据搬运，没有任何把计算发射到设备的代码路径

结论
  A+B 满足「串行部分在 CPU」，不满足「并行部分在 DCU」
  它不是「少做了一步」，而是从设计上就没有设备计算的出口
```

**【截图位】**（建议补）

- 位置：右侧或底部。
- 内容：`__tgt_target_kernel` 在 OpenACC 直译文件中的搜索结果（空），与 OpenMP 侧有结果的对照。
- 来源：

```bash
grep -n "OMPRTL_\|__tgt_\|target_kernel" \
    mlir/lib/Target/LLVMIR/Dialect/OpenACC/OpenACCToLLVMIRTranslation.cpp
grep -rln "__tgt_target_kernel" mlir/test/Target/LLVMIR/ | head
```

**讲述要点**

- 第三层是最有说服力的一条：不是我们没做，是这条路线上根本没有这个出口。
- 讲清楚推理链：产物无 omp.target → 设备分支不触发 → 且 A 路线连 kernel 启动 ABI 都没用。

---

## 第 11 页 · 数据通路的语义矛盾【重点】

**标题**

```text
比「没做 device」更严重：数据在设备，计算在主机
```

**正文**

```text
数据路径传的 device id 是「默认设备」
  OpenACCToLLVMIRTranslation.cpp:45
      static constexpr int64_t kDefaultDevice = -1;
  同文件 :371 / :414 / :467
      emitMapperCall(..., kDefaultDevice, totalNbOperand);
  emitMapperCall 内部把 DeviceID 直接作为实参传给 __tgt_target_data_*_mapper

-1 在 OpenMP offload ABI 里表示默认设备（omp_get_default_device()）
  这一点的运行时语义未在 DCU 上验证

后果
  数据  → 提交给默认设备（本构建下即 DCU）
  计算  → 跑在主机 CPU 线程
  → 对含真实 data clause 的程序（!$acc data copyin(a) 一类），
    这是语义错误，而不只是「没做 device」

为什么现在没暴露
  当前测试用例只有 acc.parallel loop，没有 data clause
  （acc.private 已在归一化阶段消掉）
  → 又一次「验证集缺少负例」
```

**【截图位】**（可选）

- 位置：右侧。
- 内容：`OpenACCToLLVMIRTranslation.cpp:45` 与 `:371` 两处。
- 来源：`sed -n '45,46p;369,372p' mlir/lib/Target/LLVMIR/Dialect/OpenACC/OpenACCToLLVMIRTranslation.cpp`

**讲述要点**

- 这是本次评审最需要同行帮着判断的一点：data 通路是否必须与 compute 一起改。
- 明确标注：`-1` 的运行时语义未在 DCU 上验证，属于源码推断。
- 建议立刻补负例测试（带 `!$acc data copyin/copyout` 的程序）来暴露它。

---

## 第 12 页 · 过程中的两个缺陷

**标题**

```text
过程中发现并修复的两个缺陷
```

**正文**

```text
缺陷一  全局归一化作用域外溢
  现象  按上游文档写的「模块级」归一化，在含 acc.serial + acc.loop 的
        输入上 Segmentation fault，exit=139
        主用例上是通的，换输入才暴露
  根因  归一化全局生效，但被替换者所在的构造不一定都会被转换；
        存活的 acc.loop 其 private 操作数不再由 acc.private 定义
  修复  ① 归一化限定在即将被消费的 region 内
        ② recipe 清理挪到转换之后，并按符号引用判断
  坐标  ACCSpecializePatterns.h:44-59（:56 是 replaceOp）
        OpenACCToOpenMP.cpp:47-76 / :190-205
  结果  exit=139 崩溃 → exit=0 安全 no-op

缺陷二  acc verifier 缺空指针检查（上游潜在缺陷）
  坐标  OpenACC.cpp:1699
        if (!mlir::isa<OpT>(operand.getDefiningOp()))
  根因  操作数是 block argument 时 getDefiningOp() 返回 nullptr，
        isa 不做空指针保护
  影响  不需要任何 pass，光 fir-opt 解析 + 验证就段错误；
        Release 下诊断信息丢失
  复现  repro_verifier_crash.mlir
  建议  向上游提 issue
```

**【截图位】**（可选）

- 位置：右下角。
- 内容：崩溃栈帧前几帧（含 `checkPrivateOperands` / `acc::LoopOp::verify()`）。
- 来源：

```bash
/home/wangyz/.llvm/build-dcc/bin/fir-opt -split-input-file \
    /home/wangyz/test/report/20260916/repro_verifier_crash.mlir
```

**讲述要点**

- 两个缺陷都体现同一件事：验证集必须有「应该保持不动」的负例。
- 缺陷二适合现场问同行要不要提上游 issue。

---

# 块 E · 路线评估与下一步

## 第 13 页 · 三条路线评估

**标题**

```text
满足 DCU 硬性指标的三条路线
```

**正文**

```text
路线 1  在 A+B 上加 omp.target（增量）
  已具备
    OpenMPToLLVMIRTranslation.cpp:6344   convertOmpTarget
    同文件 :6644                         createTarget
    offload 运行时已构建（见下）
    AMDGPU 插件存在：offload/plugins-nextgen/amdgpu/
  必须同步改
    data 通路从 acc 的 __tgt_* 切到 omp.target map，
    否则两条设备数据通路会打架（见第 11 页）
  还缺
    host/device 两阶段编译、offload image 打包、设备侧 lowering

路线 2  全面转向 OpenMP offload
  data 与 compute 都转成 omp.target，不再是 A+B 混合
  代价：放弃 A+B 已完成的 host 路径复用

路线 3  社区 OpenACC 原生路线（ACCToLLVM + libacctarget + GPU dialect）
  本树现状
    mlir/lib/Conversion/OpenACCToLLVM   不存在
    libacctarget                        不存在
  → 从零开始，量级最大，与现有 A+B 不共用代码

DCU 相关配置（本构建 build-dcc）
  LLVM_TARGETS_TO_BUILD  = X86;AMDGPU
  LLVM_ENABLE_RUNTIMES   = compiler-rt;flang-rt;openmp;offload
  install prefix         = /home/wangyz/dtk-dcc-staging/llvm-release-aomp
```

**【截图位】**（无）

**讲述要点**

- 基础设施不缺，缺的是「把计算发射到设备」这一层——这点对路线 1 有利。
- 路线 3 在本树是从零，这是它的真实代价，不是"换个库"。

---

## 第 14 页 · 下一步与待决项

**标题**

```text
当前定位、下一步、待决项
```

**正文**

```text
当前定位
  A+B 是「拿到主机并行」的中间态，不构成交付
  满足「串行部分在 CPU」，不满足「并行部分在 DCU」

下一步
  S0  补负例测试：带 !$acc data copyin/copyout 的程序，
      暴露第 11 页的数据通路矛盾
  S1  评估 omp.target 增量路线：pass 产出 omp.target 包裹的并行区
  S2  打通 host/device 两阶段编译与 offload image
  S3  data 通路切换评估（与 S1 同步）

待决项（现场讨论）
  ① 走 omp.target 增量路线，还是全面转 OpenMP
  ② data 通路切换的时机与代价
  ③ verifier 的 null 检查是否提上游 issue，由谁提
  ④ try.f90 在 DCU 上运行验证需要哪些前置条件

一句话
  compute 降级通路已打通，但落在主机；
  满足硬性指标还需要设备路径与数据通路同步改造
```

**【截图位】**（无）

**讲述要点**

- 收尾不要粉饰：明确说当前不达标，给出下一步最小动作（S0 补负例）。
- 把待决项抛给两位同行，转成讨论。

---

# 附录 A · 源码坐标速查

## A.1 缺口与直译

| 坐标 | 内容 |
|---|---|
| `mlir/lib/Target/LLVMIR/Dialect/OpenACC/OpenACCToLLVMIRTranslation.cpp:496-527` | `convertOperation` TypeSwitch |
| 同文件 `:497-511` | 四类 data 算子 |
| 同文件 `:512-518` | terminator / yield 省略 |
| 同文件 `:519-523` | 六个 NOP 算子 |
| 同文件 `:524-527` | unsupported 出口 |
| 同文件 `:45` | `kDefaultDevice = -1` |
| 同文件 `:371` / `:414` / `:467` | 三处 `emitMapperCall(..., kDefaultDevice, ...)` |
| 同文件 `:65` / `:69` / `:73` / `:273` / `:276` | 全部 runtime 调用点（只有 data mapper） |

## A.2 设备路径（硬性指标相关）

| 坐标 | 内容 |
|---|---|
| `mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td:1451` | `omp.target` 定义 |
| `mlir/lib/Target/LLVMIR/Dialect/OpenMP/OpenMPToLLVMIRTranslation.cpp:6344` | `convertOmpTarget` |
| 同文件 `:6644` | `createTarget` |
| `offload/libomptarget/interface.cpp:195` | `__tgt_target_data_begin_mapper` 实现 |
| `offload/plugins-nextgen/amdgpu/` | AMDGPU 设备插件（DCU 对应后端） |
| `mlir/lib/Conversion/OpenACCToLLVM` | **不存在**（路线 3 需要从零建） |

## A.3 ACC / OMP ODS 定义

| 坐标 | 算子 |
|---|---|
| `mlir/include/mlir/Dialect/OpenACC/OpenACCOps.td:834` | `acc.private` |
| 同文件 `:1337` | `acc.private.recipe` |
| 同文件 `:1682` | `acc.parallel` |
| 同文件 `:2580` | `acc.loop` |
| `mlir/include/mlir/Dialect/OpenMP/OpenMPOps.td:191` | `omp.parallel` |
| 同文件 `:601` | `omp.loop_nest` |
| 同文件 `:719` | `omp.wsloop` |

## A.4 类型接口与锚点

| 坐标 | 内容 |
|---|---|
| `mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:384-389` | ACC 侧挂 PointerLikeType |
| `mlir/lib/Dialect/OpenMP/IR/OpenMPDialect.cpp:322-324` | OMP 侧挂同一套模型 |
| `mlir/lib/Dialect/OpenACC/Transforms/ACCSpecializeForHost.cpp:334` | 现有 acc pass 锚 `func::FuncOp` |
| `flang/include/flang/Optimizer/Support/InitFIR.h:107` | fir-opt 的 pass 注册入口 |

## A.5 本 pass 的实现与接线

| 坐标 | 内容 |
|---|---|
| `mlir/lib/Conversion/OpenACCToOpenMP/OpenACCToOpenMP.cpp:47-76` | `normalizeDataClauses` |
| 同文件 `:78-163` | `ConvertParallelWithLoop` |
| 同文件 `:166-170` | `populateOpenACCToOpenMPConversionPatterns` |
| 同文件 `:172-207` | pass 主体 |
| `mlir/include/mlir/Conversion/Passes.td:1047-1050` | pass 定义 |
| `mlir/include/mlir/Conversion/Passes.h:60-64` | include |
| `mlir/lib/Conversion/CMakeLists.txt:52` | `add_subdirectory` |
| `flang/tools/fir-opt/fir-opt.cpp:15` / `:46` | include / 注册 |
| `flang/tools/fir-opt/CMakeLists.txt:52` | 链接 |

## A.6 缺陷与参照

| 坐标 | 内容 |
|---|---|
| `mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:1693-1705` | `checkPrivateOperands`，缺陷点 `:1699` |
| 同文件 `:1761` / `:2571` / `:2759` / `:3138` | 四个 `verify()` 调用方 |
| `mlir/include/mlir/Dialect/OpenACC/Transforms/ACCSpecializePatterns.h:44-59` | 归一化 pattern 模板，`:56` 是 `replaceOp` |
| `mlir/lib/Dialect/OpenACC/Utils/OpenACCUtilsLoop.cpp:55-56` | inclusive upper bound 读取参照 |
| `mlir/lib/Conversion/SCFToOpenMP/SCFToOpenMP.cpp:490-575` | omp 三件套构造模板 |

---

# 附录 B · 复现命令

```bash
# 构建
cmake -S /home/wangyz/.llvm/llvm-project/llvm -B /home/wangyz/.llvm/build-dcc
cmake --build /home/wangyz/.llvm/build-dcc --target fir-opt mlir-opt -j

# 注册验收
/home/wangyz/.llvm/build-dcc/bin/fir-opt  --help | grep convert-openacc-to-openmp
/home/wangyz/.llvm/build-dcc/bin/mlir-opt --help | grep convert-openacc-to-openmp

# 端到端（拿到的是主机并行）
/home/wangyz/.llvm/build-dcc/bin/fir-opt --convert-openacc-to-openmp \
    /home/wangyz/test/openacc/acc_loop/try.fir.mlir \
  | /home/wangyz/.llvm/build-dcc/bin/tco -o try.ll
grep -E "__kmpc_fork_call|__kmpc_for_static_init" try.ll

# 设备路径检查（在 MLIR 上查，不是在 .ll 上查）
/home/wangyz/.llvm/build-dcc/bin/fir-opt --convert-openacc-to-openmp \
    /home/wangyz/test/openacc/acc_loop/try.fir.mlir | grep -c "omp.target"   # 应为 0

# 注意：tco --emit-final-mlir 产出的是 MLIR（仍含 omp.* / llvm.func），
#       其中不含 __kmpc_*。要验证运行时符号必须走上面的 LLVM IR 输出。

# 缺陷复现（预期 exit=139）
/home/wangyz/.llvm/build-dcc/bin/fir-opt -split-input-file \
    /home/wangyz/test/report/20260916/repro_verifier_crash.mlir
```

---

# 附录 C · 会前自查

**与指标的关系（这次汇报的核心）**

- [ ] 明确说了当前**不满足**绝对硬性指标（并行未落在 DCU）
- [ ] 第 10 页的三层证据都能当场用坐标复核
- [ ] 第 11 页标注了 `-1 = 默认设备` 是源码推断、未做 DCU 运行时验证
- [ ] 下一步的最小动作（S0 补负例测试）已经说清

**事实准确性**

- [ ] 所有行号可在本地源码复核（附录 A 已逐条列出）
- [ ] 改动量（新增 254 行 / 净增 16 行）与其他材料一致
- [ ] `exit=139` 与 `exit=0` 来自实际运行
- [ ] 循环语义（96 次迭代，源 3..98 闭区间）与实际输出一致
- [ ] `ACCToLLVM` / `libacctarget` 在本树不存在，已核对

**三条禁语**

- [ ] 没说"OpenACC 并行已支持"——private 语义是简化，存在数据竞争
- [ ] 没说"性能提升"——从未做过性能测量
- [ ] **没说"已经能在 DCU 上跑"**——当前产出的是主机并行，这是本次最重要的一条

**会上可能被追问的点**

| 问题 | 回答要点 |
|---|---|
| 为什么产物里没有 `omp.target`？ | pass 只产出 `omp.parallel`/`omp.wsloop`/`omp.loop_nest`；设备入口 `omp.target`（`OpenMPOps.td:1451`）未被生成 |
| 加个 `omp.target` 就能上 DCU 吗？ | 不够。还需要 host/device 两阶段编译、offload image 打包、设备侧 lowering；且 data 通路必须同步从 `__tgt_*` 切到 `omp.target map` |
| 为什么说数据通路必须一起改？ | `OpenACCToLLVMIRTranslation.cpp:45/371/414/467` 传的是 `kDefaultDevice = -1`，数据会提交给默认设备；计算却在本机 → 语义错误 |
| 为什么不用 `omp.loop` 而用 `omp.wsloop`？ | 两者都是合法 wrapper；`SCFToOpenMP.cpp:490-575` 是已验证能产出 `__kmpc_for_static_init_*` 的写法 |
| 为什么锚 `ModuleOp`？ | 输入是 `llvm.func`；现有 acc pass 锚 `func::FuncOp`（`ACCSpecializeForHost.cpp:334`）覆盖不到 |
| 为什么不直接走社区路线？ | 本树 `mlir/lib/Conversion/OpenACCToLLVM` 与 `libacctarget` 都不存在，是从零开始，量级最大 |
