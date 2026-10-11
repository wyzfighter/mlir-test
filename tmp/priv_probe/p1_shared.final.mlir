module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "P1"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(19 : i64) : i64
    %5 = llvm.mlir.constant(17 : i32) : i32
    %6 = llvm.mlir.constant(6 : i32) : i32
    %7 = llvm.mlir.constant(1000 : i32) : i32
    %8 = llvm.mlir.constant(0 : i32) : i32
    %9 = llvm.mlir.constant(400 : i32) : i32
    %10 = llvm.mlir.constant(1 : i32) : i32
    %11 = llvm.mlir.constant(400 : i64) : i64
    %12 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %13 = llvm.mlir.constant(1 : i64) : i64
    omp.parallel {
      %56 = llvm.mlir.constant(1 : i64) : i64
      %57 = llvm.alloca %56 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %58 = llvm.mlir.constant(1 : i64) : i64
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%10) to (%9) inclusive step (%10) {
          llvm.store %arg0, %57 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          llvm.store %8, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %59 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %60 = llvm.load %57 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %61 = llvm.add %59, %60 : i32
          llvm.store %61, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %62 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %63 = llvm.add %62, %7 : i32
          llvm.store %63, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %64 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %65 = llvm.load %57 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %66 = llvm.sext %65 : i32 to i64
          %67 = llvm.mlir.constant(1 : i64) : i64
          %68 = llvm.mlir.constant(0 : i64) : i64
          %69 = llvm.sub %66, %67 overflow<nsw, nuw> : i64
          %70 = llvm.mul %69, %67 overflow<nsw, nuw> : i64
          %71 = llvm.mul %70, %67 overflow<nsw, nuw> : i64
          %72 = llvm.add %71, %68 overflow<nsw, nuw> : i64
          %73 = llvm.mul %67, %11 overflow<nsw, nuw> : i64
          %74 = llvm.getelementptr nusw|nuw %12[%72] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %64, %74 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    %14 = llvm.mlir.addressof @_QQclX70315F707269766174655F7363616C61722E66393000 : !llvm.ptr
    %15 = llvm.call @_FortranAioBeginExternalListOutput(%6, %14, %5) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %16 = llvm.mlir.addressof @_QQclX70312066697273742C6C6173742C73756D203D : !llvm.ptr
    %17 = llvm.call @_FortranAioOutputAscii(%15, %16, %4) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    %18 = llvm.mlir.constant(1 : i64) : i64
    %19 = llvm.mlir.constant(0 : i64) : i64
    %20 = llvm.sub %3, %18 overflow<nsw, nuw> : i64
    %21 = llvm.mul %20, %18 overflow<nsw, nuw> : i64
    %22 = llvm.mul %21, %18 overflow<nsw, nuw> : i64
    %23 = llvm.add %22, %19 overflow<nsw, nuw> : i64
    %24 = llvm.mul %18, %11 overflow<nsw, nuw> : i64
    %25 = llvm.getelementptr nusw|nuw %12[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %26 = llvm.load %25 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %27 = llvm.call @_FortranAioOutputInteger32(%15, %26) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %28 = llvm.mlir.constant(1 : i64) : i64
    %29 = llvm.mlir.constant(0 : i64) : i64
    %30 = llvm.sub %11, %28 overflow<nsw, nuw> : i64
    %31 = llvm.mul %30, %28 overflow<nsw, nuw> : i64
    %32 = llvm.mul %31, %28 overflow<nsw, nuw> : i64
    %33 = llvm.add %32, %29 overflow<nsw, nuw> : i64
    %34 = llvm.mul %28, %11 overflow<nsw, nuw> : i64
    %35 = llvm.getelementptr nusw|nuw %12[%33] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %37 = llvm.call @_FortranAioOutputInteger32(%15, %36) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    llvm.br ^bb1(%3, %8, %11 : i64, i32, i64)
  ^bb1(%38: i64, %39: i32, %40: i64):  // 2 preds: ^bb0, ^bb2
    %41 = llvm.icmp "sgt" %40, %2 : i64
    llvm.cond_br %41, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %42 = llvm.mlir.constant(1 : i64) : i64
    %43 = llvm.mlir.constant(0 : i64) : i64
    %44 = llvm.sub %38, %42 overflow<nsw, nuw> : i64
    %45 = llvm.mul %44, %42 overflow<nsw, nuw> : i64
    %46 = llvm.mul %45, %42 overflow<nsw, nuw> : i64
    %47 = llvm.add %46, %43 overflow<nsw, nuw> : i64
    %48 = llvm.mul %42, %11 overflow<nsw, nuw> : i64
    %49 = llvm.getelementptr nusw|nuw %12[%47] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %50 = llvm.load %49 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %51 = llvm.add %39, %50 : i32
    %52 = llvm.add %38, %3 overflow<nsw> : i64
    %53 = llvm.sub %40, %3 : i64
    llvm.br ^bb1(%52, %51, %53 : i64, i32, i64)
  ^bb3:  // pred: ^bb1
    %54 = llvm.call @_FortranAioOutputInteger32(%15, %39) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %55 = llvm.call @_FortranAioEndIoStatement(%15) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<400 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<400 x i32>
    llvm.return %0 : !llvm.array<400 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70315F707269766174655F7363616C61722E66393000() comdat(@__llvm_comdat::@_QQclX70315F707269766174655F7363616C61722E66393000) {addr_space = 0 : i32} : !llvm.array<22 x i8> {
    %0 = llvm.mlir.constant("p1_private_scalar.f90\00") : !llvm.array<22 x i8>
    llvm.return %0 : !llvm.array<22 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX70315F707269766174655F7363616C61722E66393000 any
    llvm.comdat_selector @_QQclX70312066697273742C6C6173742C73756D203D any
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70312066697273742C6C6173742C73756D203D() comdat(@__llvm_comdat::@_QQclX70312066697273742C6C6173742C73756D203D) {addr_space = 0 : i32} : !llvm.array<19 x i8> {
    %0 = llvm.mlir.constant("p1 first,last,sum =") : !llvm.array<19 x i8>
    llvm.return %0 : !llvm.array<19 x i8>
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
