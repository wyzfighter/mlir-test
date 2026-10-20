#!/bin/bash
# ---------------------------------------------------------------------------
# compare/ 目录的 DCU(gfx906) offload 验证脚本
#
# 为什么单独补这个脚本：
#   test/openacc/run.sh 与 0_acc_loop/run.sh 都只走到 FIR/MLIR 阶段
#   (bbc / fir-opt / tco)，不含 device 编译与运行，所以 DCU 验证无处可依。
#   本脚本把 compare/ 三条链推到「能在 DCU 上跑」所需的最后一步。
#
# 用法:
#   ./run_dcu.sh              # 默认: 编译 acc.f90 / target.f90 并各跑两次
#   ARCH=gfx906 ./run_dcu.sh  # 指定 DCU 架构
# ---------------------------------------------------------------------------
set -u
SDIR="$(cd "$(dirname "$0")" && pwd)"
OUT="${OUT:-$SDIR/dcu-out}"
mkdir -p "$OUT"

ARCH="${ARCH:-gfx906}"
TRIPLE="amdgcn-amd-amdhsa"
COV="${COV:-5}"                          # code object version
ROCM_PATH="${ROCM_PATH:-/opt/dtk-23.04.1}"
INSTALL="${INSTALL:-/home/wangyz/.llvm/install}"
FLANG="${FLANG:-$INSTALL/bin/flang-new}"

# 1) ROCm 版本兼容（关键）:
#    flang/clang 默认 -mcode-object-version=6，要求 ROCm device library ABI 600
#    (即 ROCm >= 6.3)。本机 DTK 23.04.1 只提供 oclc_abi_version_400/500.bc，
#    所以必须显式降到 5，否则报:
#      cannot find ROCm device library for ABI version 6, which requires
#      ROCm 6.3 or higher
#    -mcode-object-version= 在 Options.td 里的 Visibility 含 FlangOption，
#    可直接传给 flang。取值: none | 4 | 5 | 6
OFFLOAD_FLAGS=(
  -fopenmp-targets="$TRIPLE"
  --offload-arch="$ARCH"
  -mcode-object-version="$COV"
  --rocm-path="$ROCM_PATH"
)

# 2) libomptarget.so 在 install/lib/<host-triple>/ 下，而该目录不在默认 LD_LIBRARY_PATH 里
export LD_LIBRARY_PATH="$INSTALL/lib/x86_64-unknown-linux-gnu:${LD_LIBRARY_PATH:-}"

echo "=== 设备可用性预检 ==="
if [ -e /dev/kfd ]; then
  echo "  /dev/kfd 存在"
else
  echo "  !! /dev/kfd 不存在 -> 无法真正在 DCU 上执行"
  echo "     下面只能验证到「编译出 gfx906 device image」+「运行时报无设备」"
fi
command -v hy-smi >/dev/null && { echo "  hy-smi:"; hy-smi 2>&1 | head -5 | sed 's/^/    /'; }

build_and_run () {
  local src="$1"; shift
  local tag="$1"; shift
  local bin="$OUT/$tag"
  echo
  echo "=== 编译 $src (额外参数: $*) ==="
  "$FLANG" -fopenacc -fopenmp "$@" "${OFFLOAD_FLAGS[@]}" "$SDIR/$src" -o "$bin" \
    && echo "  -> $bin" || { echo "  编译失败"; return 1; }

  echo "--- device image 架构 / kernel 符号"
  strings "$bin" | grep -oE 'gfx[0-9]+' | sort -u | sed 's/^/    /'
  strings "$bin" | grep -oE '__omp_offloading_[A-Za-z0-9_]+' | sort -u | sed 's/^/    /'

  echo "--- 运行 (默认 policy; 无设备时会静默回退到 host, 结果正确不代表跑在 DCU 上)"
  timeout 300 "$bin"; echo "    exit=$?"

  echo "--- 运行 (OMP_TARGET_OFFLOAD=MANDATORY; 无设备时必须报 fatal error)"
  OMP_TARGET_OFFLOAD=MANDATORY timeout 300 "$bin" 2>&1 | grep -vE '^OMP: Warning'
  echo "    exit=${PIPESTATUS[0]}"
}

# acc.f90: !$acc parallel loop, 经桥接变成 omp.target kernel_type(spmd_no_loop)
build_and_run acc.f90 acc_dev

# target.f90: !$omp target teams distribute parallel do
# 注意: 桥接硬编码 spmd_no_loop；flang 只在带下面两个 assume 假设时才选 spmd_no_loop，
#       否则选 spmd。要对照桥接，必须补上这两个 flag。
build_and_run target.f90 target_dev \
  -fopenmp-assume-teams-oversubscription -fopenmp-assume-threads-oversubscription

echo
echo "done. 产物在 $OUT/"
