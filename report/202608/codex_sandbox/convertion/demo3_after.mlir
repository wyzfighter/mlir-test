module attributes {llvm.data_layout = "e-i64:64"} {
  llvm.func @f(%arg0: i64, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64) {
    omp.parallel num_threads(%arg0 : i64) {
      omp.terminator
    }
    llvm.return
  }
}

