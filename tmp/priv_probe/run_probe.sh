#!/bin/bash
# Run one probe through the three stages and capture MLIR + LLVM IR.
set -u
src=$1
base=$(basename "$src" .f90)
outdir=${2:-.}

bbc -fopenacc "$src" -o "$outdir/$base.acc.mlir" || exit 1
fir-opt --convert-openacc-to-openmp "$outdir/$base.acc.mlir" -o "$outdir/$base.omp.mlir" || exit 2
tco --emit-final-mlir "$outdir/$base.omp.mlir" -o "$outdir/$base.final.mlir" || exit 3
tco --code-gen-llvm "$outdir/$base.final.mlir" -o "$outdir/$base.ll" || exit 4
echo "OK $base"
