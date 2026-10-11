#!/bin/bash
bbc  -fopenmp parallel_do.f90 -o parallel_do.fir.mlir
tco --emit-final-mlir parallel_do.fir.mlir -o parallel_do.mlir