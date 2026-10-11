module {
  llvm.func @foo() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(100 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    omp.parallel {
      omp.wsloop {
        omp.loop_nest (%arg0) : i64 = (%0) to (%1) inclusive step (%2) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

