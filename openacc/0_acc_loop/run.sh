#!/bin/bash
cd /home/wangyz/test/openacc/acc_loop
mkdir -p bbc-firopt-tco
mkdir -p bbc-tco-firopt-tco

bbc -fopenacc try.f90 -o try.acc.mlir
fir-opt -convert-openacc-to-openmp try.acc.mlir -o try.omp.mlir
# mlir-opt 
tco --emit-final-mlir try.omp.mlir -o try.final.mlir
tco try.final.mlir -o try.ll

mv try.final.mlir bbc-firopt-tco/
mv try.omp.mlir bbc-firopt-tco/
mv try.ll bbc-firopt-tco/

tco --emit-final-mlir try.fir.mlir -o try.tco.mlir
fir-opt -convert-openacc-to-openmp try.tco.mlir -o try.omp.mlir
tco --emit-final-mlir try.omp.mlir -o try.final.mlir
tco try.final.mlir -o try.ll
mv try.ll bbc-firopt-tco/

mv try.final.mlir bbc-tco-firopt-tco/
mv try.omp.mlir bbc-tco-firopt-tco/
mv try.tco.mlir bbc-tco-firopt-tco/