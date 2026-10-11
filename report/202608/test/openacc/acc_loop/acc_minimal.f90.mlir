module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
    %3 = llvm.mlir.constant(1 : i64) : i64
    acc.yield %2 : !fir.ref<i32>
  }
  llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %4 = builtin.unrealized_conversion_cast %3 : !llvm.ptr to !fir.ref<i32>
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(9 : i32) : i32
    %7 = llvm.mlir.constant(6 : i32) : i32
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.mlir.constant(100 : i32) : i32
    %10 = llvm.mlir.constant(100 : index) : i64
    %11 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %12 = llvm.mlir.constant(1 : i64) : i64
    %13 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %9, %1 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : i32, !llvm.ptr
    acc.serial combined(loop) {
      %27 = acc.private varPtr(%4 : !fir.ref<i32>) recipe(@privatization_ref_i32) -> !fir.ref<i32> {implicit = true, name = "i"}
      %28 = builtin.unrealized_conversion_cast %27 : !fir.ref<i32> to !llvm.ptr
      acc.loop combined(serial) private(%27 : !fir.ref<i32>) control(%arg0 : i32) = (%8 : i32) to (%9 : i32)  step (%8 : i32) {
        llvm.store %arg0, %28 {tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]} : i32, !llvm.ptr
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
      acc.yield
    }
    %14 = llvm.mlir.addressof @_QQclXccba7749a48410d0e7a58a2207c580d3 : !llvm.ptr
    %15 = llvm.call @_FortranAioBeginExternalListOutput(%7, %14, %6) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %16 = llvm.mlir.constant(1 : i64) : i64
    %17 = llvm.mlir.constant(0 : i64) : i64
    %18 = llvm.sub %5, %16 overflow<nsw> : i64
    %19 = llvm.mul %18, %16 overflow<nsw> : i64
    %20 = llvm.mul %19, %16 overflow<nsw> : i64
    %21 = llvm.add %20, %17 overflow<nsw> : i64
    %22 = llvm.mul %16, %10 overflow<nsw> : i64
    %23 = llvm.getelementptr %11[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : !llvm.ptr -> i32
    %25 = llvm.call @_FortranAioOutputInteger32(%15, %24) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %26 = llvm.call @_FortranAioEndIoStatement(%15) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32} : !llvm.array<100 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<100 x i32>
    llvm.return %0 : !llvm.array<100 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclXccba7749a48410d0e7a58a2207c580d3() comdat(@__llvm_comdat::@_QQclXccba7749a48410d0e7a58a2207c580d3) {addr_space = 0 : i32} : !llvm.array<51 x i8> {
    %0 = llvm.mlir.constant("/home/wangyz/test/openacc/acc_loop/acc_minimal.f90\00") : !llvm.array<51 x i8>
    llvm.return %0 : !llvm.array<51 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclXccba7749a48410d0e7a58a2207c580d3 any
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
