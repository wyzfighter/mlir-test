module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "P3"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(19 : i64) : i64
    %4 = llvm.mlir.constant(17 : i32) : i32
    %5 = llvm.mlir.constant(6 : i32) : i32
    %6 = llvm.mlir.constant(10 : i32) : i32
    %7 = llvm.mlir.constant(150 : i32) : i32
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.mlir.constant(10 : i64) : i64
    %10 = llvm.mlir.constant(150 : i64) : i64
    %11 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    omp.parallel {
      %54 = llvm.mlir.constant(1 : i64) : i64
      %55 = llvm.alloca %54 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %56 = llvm.mlir.constant(1 : i64) : i64
      %57 = llvm.alloca %56 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %58 = llvm.mlir.constant(1 : i64) : i64
      %59 = llvm.alloca %58 x !llvm.array<10 x i32> {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %60 = llvm.mlir.constant(1 : i64) : i64
      %61 = llvm.mlir.constant(1 : i64) : i64
      %62 = llvm.mlir.constant(1 : i64) : i64
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%8) to (%7) inclusive step (%8) {
          llvm.store %arg0, %57 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          acc.loop control(%arg1 : i32) = (%8 : i32) to (%6 : i32)  step (%8 : i32) {
            llvm.store %arg1, %55 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
            %82 = llvm.load %55 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
            %83 = llvm.sext %82 : i32 to i64
            %84 = llvm.mlir.constant(1 : i64) : i64
            %85 = llvm.mlir.constant(0 : i64) : i64
            %86 = llvm.sub %83, %84 overflow<nsw, nuw> : i64
            %87 = llvm.mul %86, %84 overflow<nsw, nuw> : i64
            %88 = llvm.mul %87, %84 overflow<nsw, nuw> : i64
            %89 = llvm.add %88, %85 overflow<nsw, nuw> : i64
            %90 = llvm.mul %84, %9 overflow<nsw, nuw> : i64
            %91 = llvm.getelementptr nusw|nuw %59[%89] : (!llvm.ptr, i64) -> !llvm.ptr, i32
            llvm.store %82, %91 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
            acc.yield
          } inclusiveUpperbound(array<i1: true>) auto_ 
          %63 = llvm.mlir.constant(1 : i64) : i64
          %64 = llvm.mlir.constant(0 : i64) : i64
          %65 = llvm.sub %9, %63 overflow<nsw, nuw> : i64
          %66 = llvm.mul %65, %63 overflow<nsw, nuw> : i64
          %67 = llvm.mul %66, %63 overflow<nsw, nuw> : i64
          %68 = llvm.add %67, %64 overflow<nsw, nuw> : i64
          %69 = llvm.mul %63, %9 overflow<nsw, nuw> : i64
          %70 = llvm.getelementptr nusw|nuw %59[%68] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          %71 = llvm.load %70 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %72 = llvm.load %57 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %73 = llvm.sext %72 : i32 to i64
          %74 = llvm.mlir.constant(1 : i64) : i64
          %75 = llvm.mlir.constant(0 : i64) : i64
          %76 = llvm.sub %73, %74 overflow<nsw, nuw> : i64
          %77 = llvm.mul %76, %74 overflow<nsw, nuw> : i64
          %78 = llvm.mul %77, %74 overflow<nsw, nuw> : i64
          %79 = llvm.add %78, %75 overflow<nsw, nuw> : i64
          %80 = llvm.mul %74, %10 overflow<nsw, nuw> : i64
          %81 = llvm.getelementptr nusw|nuw %11[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %71, %81 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    %12 = llvm.mlir.addressof @_QQclX70335F707269766174655F61727261792E66393000 : !llvm.ptr
    %13 = llvm.call @_FortranAioBeginExternalListOutput(%5, %12, %4) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %14 = llvm.mlir.addressof @_QQclX70332066697273742C6C6173742C73756D203D : !llvm.ptr
    %15 = llvm.call @_FortranAioOutputAscii(%13, %14, %3) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    %16 = llvm.mlir.constant(1 : i64) : i64
    %17 = llvm.mlir.constant(0 : i64) : i64
    %18 = llvm.sub %2, %16 overflow<nsw, nuw> : i64
    %19 = llvm.mul %18, %16 overflow<nsw, nuw> : i64
    %20 = llvm.mul %19, %16 overflow<nsw, nuw> : i64
    %21 = llvm.add %20, %17 overflow<nsw, nuw> : i64
    %22 = llvm.mul %16, %10 overflow<nsw, nuw> : i64
    %23 = llvm.getelementptr nusw|nuw %11[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %25 = llvm.call @_FortranAioOutputInteger32(%13, %24) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %26 = llvm.mlir.constant(1 : i64) : i64
    %27 = llvm.mlir.constant(0 : i64) : i64
    %28 = llvm.sub %10, %26 overflow<nsw, nuw> : i64
    %29 = llvm.mul %28, %26 overflow<nsw, nuw> : i64
    %30 = llvm.mul %29, %26 overflow<nsw, nuw> : i64
    %31 = llvm.add %30, %27 overflow<nsw, nuw> : i64
    %32 = llvm.mul %26, %10 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr nusw|nuw %11[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %35 = llvm.call @_FortranAioOutputInteger32(%13, %34) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    llvm.br ^bb1(%2, %1, %10 : i64, i32, i64)
  ^bb1(%36: i64, %37: i32, %38: i64):  // 2 preds: ^bb0, ^bb2
    %39 = llvm.icmp "sgt" %38, %0 : i64
    llvm.cond_br %39, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %40 = llvm.mlir.constant(1 : i64) : i64
    %41 = llvm.mlir.constant(0 : i64) : i64
    %42 = llvm.sub %36, %40 overflow<nsw, nuw> : i64
    %43 = llvm.mul %42, %40 overflow<nsw, nuw> : i64
    %44 = llvm.mul %43, %40 overflow<nsw, nuw> : i64
    %45 = llvm.add %44, %41 overflow<nsw, nuw> : i64
    %46 = llvm.mul %40, %10 overflow<nsw, nuw> : i64
    %47 = llvm.getelementptr nusw|nuw %11[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %48 = llvm.load %47 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %49 = llvm.add %37, %48 : i32
    %50 = llvm.add %36, %2 overflow<nsw> : i64
    %51 = llvm.sub %38, %2 : i64
    llvm.br ^bb1(%50, %49, %51 : i64, i32, i64)
  ^bb3:  // pred: ^bb1
    %52 = llvm.call @_FortranAioOutputInteger32(%13, %37) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %53 = llvm.call @_FortranAioEndIoStatement(%13) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<150 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<150 x i32>
    llvm.return %0 : !llvm.array<150 x i32>
  }
  llvm.mlir.global internal @_QFEb() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<10 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<10 x i32>
    llvm.return %0 : !llvm.array<10 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70335F707269766174655F61727261792E66393000() comdat(@__llvm_comdat::@_QQclX70335F707269766174655F61727261792E66393000) {addr_space = 0 : i32} : !llvm.array<21 x i8> {
    %0 = llvm.mlir.constant("p3_private_array.f90\00") : !llvm.array<21 x i8>
    llvm.return %0 : !llvm.array<21 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX70335F707269766174655F61727261792E66393000 any
    llvm.comdat_selector @_QQclX70332066697273742C6C6173742C73756D203D any
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70332066697273742C6C6173742C73756D203D() comdat(@__llvm_comdat::@_QQclX70332066697273742C6C6173742C73756D203D) {addr_space = 0 : i32} : !llvm.array<19 x i8> {
    %0 = llvm.mlir.constant("p3 first,last,sum =") : !llvm.array<19 x i8>
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
