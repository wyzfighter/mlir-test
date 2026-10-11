module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "P6"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(-2147483648 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2147483647 : i32) : i32
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(25 : i64) : i64
    %6 = llvm.mlir.constant(17 : i32) : i32
    %7 = llvm.mlir.constant(6 : i32) : i32
    %8 = llvm.mlir.constant(1000 : i32) : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.mlir.constant(-1 : i32) : i32
    %11 = llvm.mlir.constant(1000 : i64) : i64
    %12 = llvm.mlir.addressof @_QFEtid : !llvm.ptr
    llvm.br ^bb1(%2, %11 : i64, i64)
  ^bb1(%13: i64, %14: i64):  // 2 preds: ^bb0, ^bb2
    %15 = llvm.icmp "sgt" %14, %0 : i64
    llvm.cond_br %15, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %16 = llvm.mlir.constant(1 : i64) : i64
    %17 = llvm.mlir.constant(0 : i64) : i64
    %18 = llvm.sub %13, %16 overflow<nsw, nuw> : i64
    %19 = llvm.mul %18, %16 overflow<nsw, nuw> : i64
    %20 = llvm.mul %19, %16 overflow<nsw, nuw> : i64
    %21 = llvm.add %20, %17 overflow<nsw, nuw> : i64
    %22 = llvm.mul %16, %11 overflow<nsw, nuw> : i64
    %23 = llvm.getelementptr nusw|nuw %12[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %10, %23 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %24 = llvm.add %13, %2 overflow<nsw> : i64
    %25 = llvm.sub %14, %2 : i64
    llvm.br ^bb1(%24, %25 : i64, i64)
  ^bb3:  // pred: ^bb1
    omp.parallel {
      %101 = llvm.mlir.constant(1 : i64) : i64
      %102 = llvm.alloca %101 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %103 = llvm.mlir.constant(1 : i64) : i64
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%9) to (%8) inclusive step (%9) {
          llvm.store %arg0, %102 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %104 = llvm.call @omp_get_thread_num() {fastmathFlags = #llvm.fastmath<contract>} : () -> i32
          %105 = llvm.load %102 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %106 = llvm.sext %105 : i32 to i64
          %107 = llvm.mlir.constant(1 : i64) : i64
          %108 = llvm.mlir.constant(0 : i64) : i64
          %109 = llvm.sub %106, %107 overflow<nsw, nuw> : i64
          %110 = llvm.mul %109, %107 overflow<nsw, nuw> : i64
          %111 = llvm.mul %110, %107 overflow<nsw, nuw> : i64
          %112 = llvm.add %111, %108 overflow<nsw, nuw> : i64
          %113 = llvm.mul %107, %11 overflow<nsw, nuw> : i64
          %114 = llvm.getelementptr nusw|nuw %12[%112] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %104, %114 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    %26 = llvm.mlir.addressof @_QQclX70365F746872656164732E66393000 : !llvm.ptr
    %27 = llvm.call @_FortranAioBeginExternalListOutput(%7, %26, %6) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %28 = llvm.mlir.addressof @_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D : !llvm.ptr
    %29 = llvm.call @_FortranAioOutputAscii(%27, %28, %5) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    llvm.br ^bb4(%2, %3, %11 : i64, i32, i64)
  ^bb4(%30: i64, %31: i32, %32: i64):  // 2 preds: ^bb3, ^bb5
    %33 = llvm.icmp "sgt" %32, %0 : i64
    llvm.cond_br %33, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %34 = llvm.mlir.constant(1 : i64) : i64
    %35 = llvm.mlir.constant(0 : i64) : i64
    %36 = llvm.sub %30, %34 overflow<nsw, nuw> : i64
    %37 = llvm.mul %36, %34 overflow<nsw, nuw> : i64
    %38 = llvm.mul %37, %34 overflow<nsw, nuw> : i64
    %39 = llvm.add %38, %35 overflow<nsw, nuw> : i64
    %40 = llvm.mul %34, %11 overflow<nsw, nuw> : i64
    %41 = llvm.getelementptr nusw|nuw %12[%39] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %42 = llvm.load %41 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %43 = llvm.intr.smin(%42, %31) : (i32, i32) -> i32
    %44 = llvm.add %30, %2 overflow<nsw> : i64
    %45 = llvm.sub %32, %2 : i64
    llvm.br ^bb4(%44, %43, %45 : i64, i32, i64)
  ^bb6:  // pred: ^bb4
    %46 = llvm.call @_FortranAioOutputInteger32(%27, %31) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    llvm.br ^bb7(%2, %1, %11 : i64, i32, i64)
  ^bb7(%47: i64, %48: i32, %49: i64):  // 2 preds: ^bb6, ^bb8
    %50 = llvm.icmp "sgt" %49, %0 : i64
    llvm.cond_br %50, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %51 = llvm.mlir.constant(1 : i64) : i64
    %52 = llvm.mlir.constant(0 : i64) : i64
    %53 = llvm.sub %47, %51 overflow<nsw, nuw> : i64
    %54 = llvm.mul %53, %51 overflow<nsw, nuw> : i64
    %55 = llvm.mul %54, %51 overflow<nsw, nuw> : i64
    %56 = llvm.add %55, %52 overflow<nsw, nuw> : i64
    %57 = llvm.mul %51, %11 overflow<nsw, nuw> : i64
    %58 = llvm.getelementptr nusw|nuw %12[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %59 = llvm.load %58 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %60 = llvm.intr.smax(%59, %48) : (i32, i32) -> i32
    %61 = llvm.add %47, %2 overflow<nsw> : i64
    %62 = llvm.sub %49, %2 : i64
    llvm.br ^bb7(%61, %60, %62 : i64, i32, i64)
  ^bb9:  // pred: ^bb7
    %63 = llvm.call @_FortranAioOutputInteger32(%27, %48) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    llvm.br ^bb10(%2, %4, %11 : i64, i32, i64)
  ^bb10(%64: i64, %65: i32, %66: i64):  // 2 preds: ^bb9, ^bb11
    %67 = llvm.icmp "sgt" %66, %0 : i64
    llvm.cond_br %67, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %68 = llvm.mlir.constant(1 : i64) : i64
    %69 = llvm.mlir.constant(0 : i64) : i64
    %70 = llvm.sub %64, %68 overflow<nsw, nuw> : i64
    %71 = llvm.mul %70, %68 overflow<nsw, nuw> : i64
    %72 = llvm.mul %71, %68 overflow<nsw, nuw> : i64
    %73 = llvm.add %72, %69 overflow<nsw, nuw> : i64
    %74 = llvm.mul %68, %11 overflow<nsw, nuw> : i64
    %75 = llvm.getelementptr nusw|nuw %12[%73] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %76 = llvm.load %75 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %77 = llvm.add %65, %76 : i32
    %78 = llvm.add %64, %2 overflow<nsw> : i64
    %79 = llvm.sub %66, %2 : i64
    llvm.br ^bb10(%78, %77, %79 : i64, i32, i64)
  ^bb12:  // pred: ^bb10
    %80 = llvm.call @_FortranAioOutputInteger32(%27, %65) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    llvm.br ^bb13(%2, %4, %11 : i64, i32, i64)
  ^bb13(%81: i64, %82: i32, %83: i64):  // 2 preds: ^bb12, ^bb14
    %84 = llvm.icmp "sgt" %83, %0 : i64
    llvm.cond_br %84, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %85 = llvm.mlir.constant(1 : i64) : i64
    %86 = llvm.mlir.constant(0 : i64) : i64
    %87 = llvm.sub %81, %85 overflow<nsw, nuw> : i64
    %88 = llvm.mul %87, %85 overflow<nsw, nuw> : i64
    %89 = llvm.mul %88, %85 overflow<nsw, nuw> : i64
    %90 = llvm.add %89, %86 overflow<nsw, nuw> : i64
    %91 = llvm.mul %85, %11 overflow<nsw, nuw> : i64
    %92 = llvm.getelementptr nusw|nuw %12[%90] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %93 = llvm.load %92 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEtid", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %94 = llvm.icmp "sge" %93, %4 : i32
    %95 = llvm.zext %94 : i1 to i32
    %96 = llvm.add %82, %95 : i32
    %97 = llvm.add %81, %2 overflow<nsw> : i64
    %98 = llvm.sub %83, %2 : i64
    llvm.br ^bb13(%97, %96, %98 : i64, i32, i64)
  ^bb15:  // pred: ^bb13
    %99 = llvm.call @_FortranAioOutputInteger32(%27, %82) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
    %100 = llvm.call @_FortranAioEndIoStatement(%27) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEtid() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<1000 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<1000 x i32>
    llvm.return %0 : !llvm.array<1000 x i32>
  }
  llvm.func @omp_get_thread_num() -> i32 attributes {fir.bindc_name = "omp_get_thread_num", fir.proc_attrs = #fir.proc_attrs<bind_c>, sym_visibility = "private"}
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX70365F746872656164732E66393000() comdat(@__llvm_comdat::@_QQclX70365F746872656164732E66393000) {addr_space = 0 : i32} : !llvm.array<15 x i8> {
    %0 = llvm.mlir.constant("p6_threads.f90\00") : !llvm.array<15 x i8>
    llvm.return %0 : !llvm.array<15 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX70365F746872656164732E66393000 any
    llvm.comdat_selector @_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D any
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D() comdat(@__llvm_comdat::@_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D) {addr_space = 0 : i32} : !llvm.array<25 x i8> {
    %0 = llvm.mlir.constant("p6 min,max,sum,count>=0 =") : !llvm.array<25 x i8>
    llvm.return %0 : !llvm.array<25 x i8>
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
