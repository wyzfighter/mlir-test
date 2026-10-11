# firstprivate 语义验证（OpenACC → OpenMP 桥接）

验证 `!$acc ... firstprivate(v)` 经桥接后是否真的产生"每线程一份、带宿主初值"的私有副本。

## 判据

每个用例都有两个版本：

- `fp_<case>.f90` — OpenACC 源，走桥接管线
- `fp_<case>_omp.f90` — 同源改写成 `!$omp`，**不经过桥接**

`run.sh` 在给定线程数下分别构建并运行两者，把输出**排序后**比较。
判据是「桥接版输出 == 纯 OpenMP 版输出」，而不是任何手工推的期望值 ——
因为 `firstprivate` 的确切行为以 OpenMP 为准（例如它是**每线程初始化一次、
线程内跨迭代保留**，不是每迭代重置）。

## 文件

| 文件 | 说明 |
|---|---|
| `fp_scalar.f90` / `_omp.f90` | 标量 firstprivate：`x=7`，`x=x+i`，i=1..4 |
| `fp_array.f90` / `_omp.f90` | 数组 firstprivate：`b=[1..5]`，`b(i)=b(i)+i` |
| `fp_derived.f90` / `_omp.f90` | 派生类型 firstprivate：`p%v=5`，`p%v=p%v+i`，i=1..5 |
| `run.sh` | 构建 + 比对 |

**关键设计：打印放在循环体内。** 对数组和派生类型，`firstprivate` 只改私有副本，
region 结束后副本丢弃，因此数组的**最终值无论有没有拷贝都一样** —— 只有把循环体内的
`b(i)` 打出来才能区分。若拷贝丢失，元素读作 0，输出变成 `1 1 2 1 3 1 ...`。

## 运行

```bash
cd test/check
./run.sh                    # T=1,2,4
./run.sh 1 4                # 指定线程数
WORK=/tmp/fp ./run.sh       # 指定可写工作目录
TOOLDIR=$HOME/.llvm/install/bin ./run.sh   # 强制用某套工具链
```

### 工具链（重要）

脚本的命令行仍然用裸工具名 `bbc` / `fir-opt` / `tco` / `clang`（见 `AGENTS.md` 6.3），
但**不盲信 `PATH` 的先后顺序**，因为本机上 `PATH` 首选的那套工具链经常不是最新的。

已实测到两类互相独立的坏工具链，脚本对两者都做**功能性探测**，而不是比时间戳：

| 症状 | 探测方式 | 真实报错 |
|---|---|---|
| `fir-opt` 早于 firstprivate 桥接 | 桥接 `fp_scalar.f90` 后要求输出里有 `omp.private`、且不再有 `acc.*.recipe` | 桥接静默失效，两个阶段之后才在 `tco` 炸：`failed to legalize operation 'builtin.unrealized_conversion_cast'` |
| `clang` 来自别的 LLVM 版本 | `clang -x ir -c` 编译一小段含 `memory(argmem: readwrite, inaccessiblemem: readwrite)` 的 IR | DTK 23.04 的 clang 15.0.0：`error: unterminated attribute group` |

候选目录按序为：`$TOOLDIR` → `PATH` 的每个目录 → `~/.llvm/build-dcc/bin` →
`~/.llvm/install/bin`。**第一个同时通过两项探测的目录胜出**，其路径被前置到 `PATH`，
并在首行打印；被否掉的候选会在 stderr 上给出原因和补救命令。覆盖方式：

```bash
TOOLDIR=$HOME/.llvm/install/bin ./run.sh
```

首行会明确告诉你用了哪套：

```
toolchain: /home/wangyz/.llvm/build-dcc/bin
```

`~/.llvm/install` 是指向 `~/dtk-dcc-staging/llvm-release-aomp` 的软链。`bbc` / `tco`
两边内容一致，但 `install/bin/fir-opt` 可能落后好几天（本机实测：`install` 是 10-06，
`build-dcc` 是 10-08，md5 不同），此时脚本会退到 `build-dcc` 并警告。要让**整个环境**
（包括 `test/openacc/acc_loop/run.sh`）都好起来，得刷新安装树：

```bash
ninja -C ~/.llvm/build-dcc install
```

`ninja -C ~/.llvm/build-dcc -n install` 当前是 30 步（含 runtimes 的 configure/build），
请自行执行。临时替代是 `export PATH=$HOME/.llvm/build-dcc/bin:$PATH`。

若一个可用目录都没有，脚本列出所有找过的目录后退出，而不是让每个用例各自失败：

```
$ ./run.sh
run.sh: no usable toolchain found; looked in:
           /usr/bin
           /bin
         set TOOLDIR=<dir with bbc/fir-opt/tco/clang> to override
```

Fortran intrinsic module 目录（`bbc -J`）从 `~/.llvm/build-dcc`、`~/.llvm/install`
或 `~/dtk-dcc-staging/llvm-release-aomp` 自动解析，可用 `MODDIR=` 覆盖。
`libomp.so` 与 `libflang_rt.runtime.a` 也从 `build-dcc` 自动定位。

注意 `run.sh` 只**写**、不改动检出目录：它要求一份可写的工作目录。

### 工作目录

所有中间产物（含 `bbc` 生成的 `<module>.mod`）都落在 `WORK` 下，默认 `./work`。
判定可写的方式是**真的试写一个文件**，而不是 `mkdir -p` —— 只读文件系统上
`mkdir -p` 也会返回 0，早先的版本因此误判并静默落到只读路径，报出
`cp: cannot create regular file ... Read-only file system`。
现在若默认位置不可写会自动退到 `${TMPDIR:-/tmp}/fp-firstprivate-check`，
并打印一行说明；两处都不可写才报错退出。
脚本把 `*.f90` 复制进 `WORK` 再编译，所以在只读检出目录里也能运行。

预期末行是 `ALL OK`。当前实测（桥接版与纯 OpenMP 版逐项一致）：

```
fp_scalar   T=1 [8 10 13 17]   T=2 [8 10 10 14]   T=4 [8 9 10 11]
fp_array    所有线程数 [2 4 6 8 10]
fp_derived  T=1 [6 8 11 15 20] T=2 [6 8 9 11 14]  T=4 [6 8 8 9 10]
```

线程间打印顺序不定，所以比较用排序后的集合。
`fp_scalar T=1` 的 `8 10 13 17` 是 firstprivate 语义的指纹：`x` 只在进入 region 时
拷一次（`7`），随后线程内跨迭代累加（`7+1=8`，`8+2=10`，`10+3=13`，`13+4=17`）；
若误按"每迭代重置"实现，会得到 `8 9 10 11`。

## 依赖

`bbc` / `fir-opt` / `tco` / `clang` 四件套由上面的探测逻辑选定；
Fortran intrinsic module 目录自动解析（可用 `MODDIR=` 覆盖）。
需要 `libomp.so` 与 `libflang_rt.runtime.a`，脚本自动定位。

## 覆盖范围与已知限制

已验证：`!$acc parallel loop firstprivate(v)` 上的**标量**、**定长数组**、**派生类型标量**，
在 T=1/2/4 下与纯 OpenMP 行为一致。

未覆盖：

- `!$acc parallel`（非 combined）上的显式 firstprivate
- `acc.serial` / `acc.kernels` 上的 firstprivate
- 可分配/指针/多态等需要 recipe bounds 与描述符的类型
- 无 recipe 的 clause（走老的降级路径，取宿主变量）
- 显式 `private`（非 firstprivate）子句
- DCU 实机：以上全部是 x86 host
