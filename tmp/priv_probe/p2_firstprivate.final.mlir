module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.firstprivate.recipe @firstprivatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
    %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
    %3 = llvm.mlir.constant(1 : i64) : i64
    acc.yield %2 : !fir.ref<i32>
  } copy {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    %0 = builtin.unrealized_conversion_cast %arg1 : !fir.ref<i32> to !llvm.ptr
    %1 = builtin.unrealized_conversion_cast %arg0 : !fir.ref<i32> to !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i32
    llvm.store %2, %0 : i32, !llvm.ptr
    acc.terminator
  }
  llvm.func @_QQmain() attributes {fir.bindc_name = "P2"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(0 : i32) : i32
    %6 = llvm.mlir.constant(9 : i64) : i64
    %7 = llvm.mlir.constant(8 : i64) : i64
    %8 = llvm.mlir.constant(17 : i32) : i32
    %9 = llvm.mlir.constant(6 : i32) : i32
    %10 = llvm.mlir.constant(10 : i32) : i32
    %11 = llvm.mlir.constant(1 : i32) : i32
    %12 = llvm.mlir.constant(7 : i32) : i32
    %13 = llvm.mlir.constant(10 : i64) : i64
    %14 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %15 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %12, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %16 = acc.firstprivate varPtr(%2 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) name("x") -> !fir.ref<i32>
    omp.parallel {
      %43 = llvm.mlir.constant(1 : i64) : i64
      %44 = llvm.alloca %43 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %45 = llvm.mlir.constant(1 : i64) : i64
      %46 = llvm.alloca %45 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %47 = llvm.mlir.constant(1 : i64) : i64
      %48 = llvm.mlir.constant(1 : i64) : i64
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%11) to (%10) inclusive step (%11) {
          llvm.store %arg0, %44 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %49 = llvm.load %46 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %50 = llvm.load %44 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %51 = llvm.add %49, %50 : i32
          llvm.store %51, %46 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %52 = llvm.load %46 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %53 = llvm.load %44 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %54 = llvm.sext %53 : i32 to i64
          %55 = llvm.mlir.constant(1 : i64) : i64
          %56 = llvm.mlir.constant(0 : i64) : i64
          %57 = llvm.sub %54, %55 overflow<nsw, nuw> : i64
          %58 = llvm.mul %57, %55 overflow<nsw, nuw> : i64
          %59 = llvm.mul %58, %55 overflow<nsw, nuw> : i64
          %60 = llvm.add %59, %56 overflow<nsw, nuw> : i64
          %61 = llvm.mul %55, %13 overflow<nsw, nuw> : i64
          %62 = llvm.getelementptr nusw|nuw %14[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %52, %62 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    %17 = llvm.mlir.addressof @_QQclX70325F6669727374707269766174652E66393000 : !llvm.ptr
    %18 = llvm.call @_FortranAioBeginExternalListOutput(%9, %17, %8) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %19 = llvm.mlir.addressof @_QQclX70322073756D203D : !llvm.ptr
    %20 = llvm.call @_FortranAioOutputAscii(%18, %19, %7) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    llvm.br ^bb1(%4, %5, %13 : i64, i32, i64)
  ^bb1(%21: i64, %22: i32, %23: i64):  // 2 preds: ^bb0, ^bb2
    %24 = llvm.icmp "sgt" %23, %3 : i64
    llvm.cond_br %24, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %25 = llvm.mlir.constant(1 : i64) : i64
    %26 = llvm.mlir.constant(0 : i64) : i64
    %27 = llvm.sub %21, %25 overflow<nsw, nuw> : i64
    %28 = llvm.mul %27, %25 overflow<nsw, nuw> : i64
    %29 = llvm.mul %28, %25 overflow<nsw, nuw> : i64
    %30 = llvm.add %29, %26 overflow<nsw, nuw> : i64
    %31 = llvm.mul %25, %13 overflow<nsw, nuw> : i64
    %32 = llvm.getelementptr nusw|nuw %14[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %33 = llvm.load %32 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %34 = llvm.add %22, %33 : i32
    %35 = llvm.add %21, %4 overflow<nsw> : i64
    %36 = llvm.sub %23, %4 : i64
    llvm.br ^bb1(%35, %34, %36 : i64, i32, i64)
  ^bb3:  // pred: ^bb1
    %37 = llvm.call @_FortranAioOutputInteger32(%18, %22) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %38 = llvm.mlir.addressof @_QQclX20686F73742078203D : !llvm.ptr
    %39 = llvm.call @_FortranAioOutputAscii(%18, %38, %6) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    %40 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %41 = llvm.call @_FortranAioOutputInteger32(%18, %40) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %42 = llvm.call @_FortranAioEndIoStatement(%18) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<10 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<10 x i32>
    llvm.return %0 : !llvm.array<10 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70325F6669727374707269766174652E66393000() comdat(@__llvm_comdat::@_QQclX70325F6669727374707269766174652E66393000) {addr_space = 0 : i32} : !llvm.array<20 x i8> {
    %0 = llvm.mlir.constant("p2_firstprivate.f90\00") : !llvm.array<20 x i8>
    llvm.return %0 : !llvm.array<20 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX70325F6669727374707269766174652E66393000 any
    llvm.comdat_selector @_QQclX70322073756D203D any
    llvm.comdat_selector @_QQclX20686F73742078203D any
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70322073756D203D() comdat(@__llvm_comdat::@_QQclX70322073756D203D) {addr_space = 0 : i32} : !llvm.array<8 x i8> {
    %0 = llvm.mlir.constant("p2 sum =") : !llvm.array<8 x i8>
    llvm.return %0 : !llvm.array<8 x i8>
  }
  llvm.func @_FortranAioOutputInteger32(!llvm.ptr, i32) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX20686F73742078203D() comdat(@__llvm_comdat::@_QQclX20686F73742078203D) {addr_space = 0 : i32} : !llvm.array<9 x i8> {
    %0 = llvm.mlir.constant(" host x =") : !llvm.array<9 x i8>
    llvm.return %0 : !llvm.array<9 x i8>
  }
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
