module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.flags = #omp.flags<openmp_device_version = 31>, omp.integer_wrap_around = #omp.integer_wrap_around<integer_wrap_around = false>, omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = private} @_QFEx_private_i32 : i32
  llvm.func @_QQmain() attributes {fir.bindc_name = "FP_SCALAR"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(10 : i64) : i64
    %5 = llvm.mlir.constant(12 : i32) : i32
    %6 = llvm.mlir.constant(6 : i32) : i32
    %7 = llvm.mlir.constant(6 : i64) : i64
    %8 = llvm.mlir.constant(4 : i32) : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.mlir.constant(7 : i32) : i32
    %11 = llvm.mlir.constant(1 : i64) : i64
    %12 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %10, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    omp.parallel {
      omp.wsloop private(@_QFEx_private_i32 %1 -> %arg0, @_QFEi_private_i32 %3 -> %arg1 : !llvm.ptr, !llvm.ptr) {
        omp.loop_nest (%arg2) : i32 = (%9) to (%8) inclusive step (%9) {
          llvm.store %arg2, %arg1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %13 = llvm.load %arg0 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %14 = llvm.load %arg1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %15 = llvm.add %13, %14 : i32
          llvm.store %15, %arg0 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %16 = llvm.mlir.addressof @_QQclX28412C493029 : !llvm.ptr
          %17 = llvm.mlir.zero : !llvm.ptr
          %18 = llvm.mlir.addressof @_QQclX66705F7363616C61725F6F6D702E66393000 : !llvm.ptr
          %19 = llvm.call @_FortranAioBeginExternalFormattedOutput(%16, %7, %17, %6, %18, %5) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i64, !llvm.ptr, i32, !llvm.ptr, i32) -> !llvm.ptr
          %20 = llvm.mlir.addressof @_QQclX66705F7363616C617220 : !llvm.ptr
          %21 = llvm.call @_FortranAioOutputAscii(%19, %20, %4) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
          %22 = llvm.load %arg0 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %23 = llvm.call @_FortranAioOutputInteger32(%19, %22) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
          %24 = llvm.call @_FortranAioEndIoStatement(%19) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
  llvm.func @_FortranAioBeginExternalFormattedOutput(!llvm.ptr, i64, !llvm.ptr, i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX28412C493029() comdat(@__llvm_comdat::@_QQclX28412C493029) {addr_space = 0 : i32} : !llvm.array<6 x i8> {
    %0 = llvm.mlir.constant("(A,I0)") : !llvm.array<6 x i8>
    llvm.return %0 : !llvm.array<6 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX28412C493029 any
    llvm.comdat_selector @_QQclX66705F7363616C61725F6F6D702E66393000 any
    llvm.comdat_selector @_QQclX66705F7363616C617220 any
  }
  llvm.mlir.global linkonce constant @_QQclX66705F7363616C61725F6F6D702E66393000() comdat(@__llvm_comdat::@_QQclX66705F7363616C61725F6F6D702E66393000) {addr_space = 0 : i32} : !llvm.array<18 x i8> {
    %0 = llvm.mlir.constant("fp_scalar_omp.f90\00") : !llvm.array<18 x i8>
    llvm.return %0 : !llvm.array<18 x i8>
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX66705F7363616C617220() comdat(@__llvm_comdat::@_QQclX66705F7363616C617220) {addr_space = 0 : i32} : !llvm.array<10 x i8> {
    %0 = llvm.mlir.constant("fp_scalar ") : !llvm.array<10 x i8>
    llvm.return %0 : !llvm.array<10 x i8>
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
