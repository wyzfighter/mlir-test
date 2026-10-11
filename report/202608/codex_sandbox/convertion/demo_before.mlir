module attributes {llvm.data_layout = "e-i64:64"} {
  func.func @f(%lb: index, %ub: index) {
    omp.parallel num_threads(%lb : index) {
      omp.wsloop {
        omp.loop_nest (%iv) : index = (%lb) to (%ub) step (%lb) {
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
}
