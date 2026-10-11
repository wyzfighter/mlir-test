module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "P1B"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(20 : i64) : i64
    %3 = llvm.mlir.constant(18 : i32) : i32
    %4 = llvm.mlir.constant(6 : i32) : i32
    %5 = llvm.mlir.constant(50 : i32) : i32
    %6 = llvm.mlir.constant(0 : i32) : i32
    %7 = llvm.mlir.constant(400 : i32) : i32
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.mlir.constant(400 : i64) : i64
    %10 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    omp.parallel {
      %53 = llvm.mlir.constant(1 : i64) : i64
      %54 = llvm.alloca %53 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %55 = llvm.mlir.constant(1 : i64) : i64
      %56 = llvm.alloca %55 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %57 = llvm.mlir.constant(1 : i64) : i64
      %58 = llvm.alloca %57 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %59 = llvm.mlir.constant(1 : i64) : i64
      %60 = llvm.mlir.constant(1 : i64) : i64
      %61 = llvm.mlir.constant(1 : i64) : i64
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%8) to (%7) inclusive step (%8) {
          llvm.store %arg0, %56 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          llvm.store %6, %58 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %62 = llvm.load %56 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          acc.loop control(%arg1 : i32) = (%8 : i32) to (%5 : i32)  step (%8 : i32) {
            llvm.store %arg1, %54 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
            %74 = llvm.load %58 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
            %75 = llvm.add %74, %62 : i32
            llvm.store %75, %58 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
            acc.yield
          } inclusiveUpperbound(array<i1: true>) auto_ 
          %63 = llvm.load %58 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %64 = llvm.load %56 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %65 = llvm.sext %64 : i32 to i64
          %66 = llvm.mlir.constant(1 : i64) : i64
          %67 = llvm.mlir.constant(0 : i64) : i64
          %68 = llvm.sub %65, %66 overflow<nsw, nuw> : i64
          %69 = llvm.mul %68, %66 overflow<nsw, nuw> : i64
          %70 = llvm.mul %69, %66 overflow<nsw, nuw> : i64
          %71 = llvm.add %70, %67 overflow<nsw, nuw> : i64
          %72 = llvm.mul %66, %9 overflow<nsw, nuw> : i64
          %73 = llvm.getelementptr nusw|nuw %10[%71] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %63, %73 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    %11 = llvm.mlir.addressof @_QQclX7031625F707269766174655F776964652E66393000 : !llvm.ptr
    %12 = llvm.call @_FortranAioBeginExternalListOutput(%4, %11, %3) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %13 = llvm.mlir.addressof @_QQclX7031622066697273742C6C6173742C73756D203D : !llvm.ptr
    %14 = llvm.call @_FortranAioOutputAscii(%12, %13, %2) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    %15 = llvm.mlir.constant(1 : i64) : i64
    %16 = llvm.mlir.constant(0 : i64) : i64
    %17 = llvm.sub %1, %15 overflow<nsw, nuw> : i64
    %18 = llvm.mul %17, %15 overflow<nsw, nuw> : i64
    %19 = llvm.mul %18, %15 overflow<nsw, nuw> : i64
    %20 = llvm.add %19, %16 overflow<nsw, nuw> : i64
    %21 = llvm.mul %15, %9 overflow<nsw, nuw> : i64
    %22 = llvm.getelementptr nusw|nuw %10[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %24 = llvm.call @_FortranAioOutputInteger32(%12, %23) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %25 = llvm.mlir.constant(1 : i64) : i64
    %26 = llvm.mlir.constant(0 : i64) : i64
    %27 = llvm.sub %9, %25 overflow<nsw, nuw> : i64
    %28 = llvm.mul %27, %25 overflow<nsw, nuw> : i64
    %29 = llvm.mul %28, %25 overflow<nsw, nuw> : i64
    %30 = llvm.add %29, %26 overflow<nsw, nuw> : i64
    %31 = llvm.mul %25, %9 overflow<nsw, nuw> : i64
    %32 = llvm.getelementptr nusw|nuw %10[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %33 = llvm.load %32 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %34 = llvm.call @_FortranAioOutputInteger32(%12, %33) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    llvm.br ^bb1(%1, %6, %9 : i64, i32, i64)
  ^bb1(%35: i64, %36: i32, %37: i64):  // 2 preds: ^bb0, ^bb2
    %38 = llvm.icmp "sgt" %37, %0 : i64
    llvm.cond_br %38, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %39 = llvm.mlir.constant(1 : i64) : i64
    %40 = llvm.mlir.constant(0 : i64) : i64
    %41 = llvm.sub %35, %39 overflow<nsw, nuw> : i64
    %42 = llvm.mul %41, %39 overflow<nsw, nuw> : i64
    %43 = llvm.mul %42, %39 overflow<nsw, nuw> : i64
    %44 = llvm.add %43, %40 overflow<nsw, nuw> : i64
    %45 = llvm.mul %39, %9 overflow<nsw, nuw> : i64
    %46 = llvm.getelementptr nusw|nuw %10[%44] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %47 = llvm.load %46 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %48 = llvm.add %36, %47 : i32
    %49 = llvm.add %35, %1 overflow<nsw> : i64
    %50 = llvm.sub %37, %1 : i64
    llvm.br ^bb1(%49, %48, %50 : i64, i32, i64)
  ^bb3:  // pred: ^bb1
    %51 = llvm.call @_FortranAioOutputInteger32(%12, %36) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %52 = llvm.call @_FortranAioEndIoStatement(%12) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<400 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<400 x i32>
    llvm.return %0 : !llvm.array<400 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX7031625F707269766174655F776964652E66393000() comdat(@__llvm_comdat::@_QQclX7031625F707269766174655F776964652E66393000) {addr_space = 0 : i32} : !llvm.array<21 x i8> {
    %0 = llvm.mlir.constant("p1b_private_wide.f90\00") : !llvm.array<21 x i8>
    llvm.return %0 : !llvm.array<21 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX7031625F707269766174655F776964652E66393000 any
    llvm.comdat_selector @_QQclX7031622066697273742C6C6173742C73756D203D any
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX7031622066697273742C6C6173742C73756D203D() comdat(@__llvm_comdat::@_QQclX7031622066697273742C6C6173742C73756D203D) {addr_space = 0 : i32} : !llvm.array<20 x i8> {
    %0 = llvm.mlir.constant("p1b first,last,sum =") : !llvm.array<20 x i8>
    llvm.return %0 : !llvm.array<20 x i8>
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
