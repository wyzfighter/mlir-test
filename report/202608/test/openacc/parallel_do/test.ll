#tbaa_root = #llvm.tbaa_root<id = "Flang function root _QQmain">
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "any access", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "any data access", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "allocated data", members = {<#tbaa_type_desc1, 0>}>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "global data", members = {<#tbaa_type_desc1, 0>}>
#tbaa_type_desc4 = #llvm.tbaa_type_desc<id = "allocated data/_QFEn", members = {<#tbaa_type_desc2, 0>}>
#tbaa_type_desc5 = #llvm.tbaa_type_desc<id = "global data/_QFEa", members = {<#tbaa_type_desc3, 0>}>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc4, access_type = #tbaa_type_desc4, offset = 0>
#tbaa_tag2 = #llvm.tbaa_tag<base_type = #tbaa_type_desc5, access_type = #tbaa_type_desc5, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.mlir.constant(12 : i32) : i32
    %6 = llvm.mlir.constant(6 : i32) : i32
    %7 = llvm.mlir.constant(1 : i32) : i32
    %8 = llvm.mlir.constant(100 : i32) : i32
    %9 = llvm.mlir.constant(100 : index) : i64
    %10 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %11 = llvm.mlir.constant(1 : i64) : i64
    %12 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %8, %1 {tbaa = [#tbaa_tag1]} : i32, !llvm.ptr
    omp.parallel {
      %26 = llvm.load %1 {tbaa = [#tbaa_tag1]} : !llvm.ptr -> i32
      omp.wsloop private(@_QFEi_private_i32 %3 -> %arg0 : !llvm.ptr) {
        omp.loop_nest (%arg1) : i32 = (%7) to (%26) inclusive step (%7) {
          llvm.store %arg1, %arg0 {tbaa = [#tbaa_tag]} : i32, !llvm.ptr
          %27 = llvm.load %arg0 {tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
          %28 = llvm.sext %27 : i32 to i64
          %29 = llvm.mlir.constant(1 : i64) : i64
          %30 = llvm.mlir.constant(0 : i64) : i64
          %31 = llvm.sub %28, %29 overflow<nsw> : i64
          %32 = llvm.mul %31, %29 overflow<nsw> : i64
          %33 = llvm.mul %32, %29 overflow<nsw> : i64
          %34 = llvm.add %33, %30 overflow<nsw> : i64
          %35 = llvm.mul %29, %9 overflow<nsw> : i64
          %36 = llvm.getelementptr %10[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %27, %36 {tbaa = [#tbaa_tag2]} : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    %13 = llvm.mlir.addressof @_QQclX740d57741b6b88731974c02bd1ffee1f : !llvm.ptr
    %14 = llvm.call @_FortranAioBeginExternalListOutput(%6, %13, %5) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %15 = llvm.mlir.constant(1 : i64) : i64
    %16 = llvm.mlir.constant(0 : i64) : i64
    %17 = llvm.sub %4, %15 overflow<nsw> : i64
    %18 = llvm.mul %17, %15 overflow<nsw> : i64
    %19 = llvm.mul %18, %15 overflow<nsw> : i64
    %20 = llvm.add %19, %16 overflow<nsw> : i64
    %21 = llvm.mul %15, %9 overflow<nsw> : i64
    %22 = llvm.getelementptr %10[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {tbaa = [#tbaa_tag2]} : !llvm.ptr -> i32
    %24 = llvm.call @_FortranAioOutputInteger32(%14, %23) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %25 = llvm.call @_FortranAioEndIoStatement(%14) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32} : !llvm.array<100 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<100 x i32>
    llvm.return %0 : !llvm.array<100 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX740d57741b6b88731974c02bd1ffee1f() comdat(@__llvm_comdat::@_QQclX740d57741b6b88731974c02bd1ffee1f) {addr_space = 0 : i32} : !llvm.array<54 x i8> {
    %0 = llvm.mlir.constant("/home/wangyz/test/openacc/parallel_do/parallel_do.f90\00") : !llvm.array<54 x i8>
    llvm.return %0 : !llvm.array<54 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX740d57741b6b88731974c02bd1ffee1f any
  }
  llvm.func @_FortranAioOutputInteger32(!llvm.ptr, i32) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.func @_FortranAioEndIoStatement(!llvm.ptr) -> i32 attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @_FortranAProgramEndStatement() attributes {sym_visibility = "private"}
  llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.zero : !llvm.ptr
    llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %1) {fastmathFlags = #llvm.fastmath<contract>} : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @_QQmain() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
    llvm.call @_FortranAProgramEndStatement() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
    llvm.return %0 : i32
  }
}

