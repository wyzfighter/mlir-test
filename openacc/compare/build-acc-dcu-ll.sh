#!/bin/bash
# ---------------------------------------------------------------------------
# dcu-ll/build-dcu-ll.sh 的「OpenACC 桥接版」
#
# dcu-ll 的手工管线只处理原生 OpenMP 源码，缺了 OpenACC -> OpenMP 的桥接那一步，
# 所以对 acc.f90 会在 tco 阶段报:
#   cannot be converted to LLVM IR: missing LLVMTranslationDialectInterface
#   registration for dialect for op: acc.private.recipe
#
# 本脚本在它基础上补两处:
#   1. 在 bbc 和 tco 之间插入 fir-opt -convert-openacc-to-openmp
#   2. --mlir-print-debuginfo 必须给 bbc **和** fir-opt 都带上。
#      dcu-ll 只在 bbc 上加了这条；桥接那一步若丢掉 debuginfo, omp.target 的 loc
#      会退化成 .mlir 文件的行号, outlined 函数名从 _l6 变成 _l25,
#      host / device 两侧对不上 -> libomptarget 找不到 kernel。
#
#   ./build-acc-dcu-ll.sh <acc-source.f90> <outdir>
#
# 产物:
#   dev.fir.mlir / dev.omp.mlir / dev.ll / dev.o / dev.hsaco
#   host.fir.mlir / host.omp.mlir / host.ll
# ---------------------------------------------------------------------------
set -euo pipefail

SRC=${1:?usage: $0 <source.f90> <outdir>}
OUT=${2:?usage: $0 <source.f90> <outdir>}
BIN=${LLVM_INSTALL_BIN:-/home/wangyz/.llvm/install/bin}
TRIPLE_HOST=${TRIPLE_HOST:-x86_64-unknown-linux-gnu}
TRIPLE_DEV=${TRIPLE_DEV:-amdgcn-amd-amdhsa}
ARCH=${ARCH:-gfx906}
DEVICE_RTL=${DEVICE_RTL:-$BIN/../lib/amdgcn-amd-amdhsa/libomptarget-amdgpu.bc}

mkdir -p "$OUT"
OUT=$(readlink -f "$OUT")
SRC=$(readlink -f "$SRC")

# --- 设备侧 ---
"$BIN/bbc" --fopenacc --fopenmp --fopenmp-is-target-device --fopenmp-is-gpu \
  --target="$TRIPLE_DEV" --mlir-print-debuginfo \
  -o "$OUT/dev.fir.mlir" "$SRC"

# 桥接。设备侧 is_target_device=true => 桥接不填 host_eval,
# 而是把 n 也放进 map, 循环边界由设备侧自己重算。
"$BIN/fir-opt" --mlir-print-debuginfo -convert-openacc-to-openmp \
  "$OUT/dev.fir.mlir" -o "$OUT/dev.omp.mlir"

"$BIN/tco" --target="$TRIPLE_DEV" --target-cpu="$ARCH" \
  "$OUT/dev.omp.mlir" -o "$OUT/dev.ll"

# --- 主机侧 ---
"$BIN/bbc" --fopenacc --fopenmp --fopenmp-targets="$TRIPLE_DEV" --target="$TRIPLE_HOST" \
  --mlir-print-debuginfo -o "$OUT/host.fir.mlir" "$SRC"
"$BIN/fir-opt" --mlir-print-debuginfo -convert-openacc-to-openmp \
  "$OUT/host.fir.mlir" -o "$OUT/host.omp.mlir"
"$BIN/tco" --target="$TRIPLE_HOST" "$OUT/host.omp.mlir" -o "$OUT/host.ll"

# --- outlined 函数名一致性 (dcu-ll 第 4 步, 这里是它真正的坑) ---
dev_name=$(sed -n 's/.*amdgpu_kernel void @\(__omp_offloading_[^(]*\)(.*/\1/p' \
  "$OUT/dev.ll" | head -1)
host_name=$(sed -n 's/.*entry_name = internal.*c"\(__omp_offloading_[^\\]*\).*/\1/p' \
  "$OUT/host.ll" | head -1)
if [ -z "$dev_name" ] || [ "$dev_name" != "$host_name" ]; then
  echo "ERROR: entry name mismatch: dev='$dev_name' host='$host_name'" >&2
  exit 1
fi

# --- 两阶段的 map 项对比: 这是桥接两阶段设计的核心观察点 ---
echo "device map_entries: $(grep -o 'map_entries([^ ]*' "$OUT/dev.omp.mlir" | head -1)"
echo "host   map_entries: $(grep -o 'map_entries([^ ]*' "$OUT/host.omp.mlir" | head -1)"
echo "device host_eval  : $(grep -c 'host_eval' "$OUT/dev.omp.mlir" || true) (期望 0)"
echo "host   host_eval  : $(grep -c 'host_eval' "$OUT/host.omp.mlir" || true) (期望 >0)"

# --- 设备 IR -> DCU code object / hsaco ---
"$BIN/llc" -mtriple="$TRIPLE_DEV" -mcpu="$ARCH" "$OUT/dev.ll" -filetype=obj -o "$OUT/dev.o"
if [ -f "$DEVICE_RTL" ]; then
  "$BIN/llvm-link" "$OUT/dev.ll" "$DEVICE_RTL" -o "$OUT/dev.linked.ll"
  "$BIN/llc" -mtriple="$TRIPLE_DEV" -mcpu="$ARCH" "$OUT/dev.linked.ll" \
    -filetype=obj -o "$OUT/dev.hsaco"
  echo "  device RTL: $DEVICE_RTL"
else
  echo "  WARN: 找不到 device RTL: $DEVICE_RTL (dev.hsaco 未生成)" >&2
fi

echo "OK: $dev_name"
echo "  dev  FIR : $OUT/dev.omp.mlir"
echo "  host FIR : $OUT/host.omp.mlir"
