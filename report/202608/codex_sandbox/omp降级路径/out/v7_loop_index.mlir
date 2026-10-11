module {
  func.func @foo() {
    %lb = arith.constant 1 : index
    %ub = arith.constant 100 : index
    %st = arith.constant 1 : index
    omp.parallel {
      omp.wsloop {
        omp.loop_nest (%iv) : index = (%lb) to (%ub) inclusive step (%st) {
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
}
