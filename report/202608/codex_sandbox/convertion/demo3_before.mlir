module attributes {llvm.data_layout = "e-i64:64"} {
  func.func @f(%lb: index, %p: memref<10xi32>) {
    omp.parallel num_threads(%lb : index) {
      omp.terminator
    }
    return
  }
}
