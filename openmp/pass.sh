#!/bin/bash

flang -fc1 -fopenmp -emit-mlir $src_f90 -o "${src_f90}.mlir"
flang -fc1 -fopenmp -emit-llvm "${src_f90}.mlir" -o "${src_f90}.ll"
flang -fopenmp "${src_f90}.ll" -o "${src_f90}.out"