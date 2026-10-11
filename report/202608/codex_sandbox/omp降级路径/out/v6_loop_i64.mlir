module attributes {omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  llvm.func @foo() {
    %lb = llvm.mlir.constant(1 : i64) : i64
    %ub = llvm.mlir.constant(100 : i64) : i64
    %st = llvm.mlir.constant(1 : i64) : i64
    omp.parallel {
      omp.wsloop {
        omp.loop_nest (%iv) : i64 = (%lb) to (%ub) inclusive step (%st) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}
