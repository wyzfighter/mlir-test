module attributes {llvm.data_layout = "e-i64:64"} {
  llvm.func @f(%arg0: i64, %arg1: i64) {
    omp.parallel num_threads(%arg0 : i64) {
      omp.wsloop {
        omp.loop_nest (%arg2) : i64 = (%arg0) to (%arg1) step (%arg0) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

