module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  omp.private {type = private} @acc_private_1 : i32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg1 : !llvm.ptr)
  }
  omp.private {type = private} @acc_private_0 : !llvm.array<5 x i32> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @_QQmain() attributes {fir.bindc_name = "FP_ARRAY"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x !llvm.array<5 x i32> {bindc_name = "b"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) : i64
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(9 : i64) : i64
    %7 = llvm.mlir.constant(20 : i32) : i32
    %8 = llvm.mlir.constant(6 : i32) : i32
    %9 = llvm.mlir.constant(11 : i64) : i64
    %10 = llvm.mlir.constant(5 : i32) : i32
    %11 = llvm.mlir.constant(1 : i32) : i32
    %12 = llvm.mlir.constant(5 : i64) : i64
    %13 = llvm.mlir.constant(1 : i64) : i64
    %14 = llvm.mlir.constant(1 : i64) : i64
    %15 = llvm.mlir.addressof @_QQroX5xi4X0 : !llvm.ptr
    llvm.br ^bb1(%5, %12 : i64, i64)
  ^bb1(%16: i64, %17: i64):  // 2 preds: ^bb0, ^bb2
    %18 = llvm.icmp "sgt" %17, %4 : i64
    llvm.cond_br %18, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %19 = llvm.mlir.constant(1 : i64) : i64
    %20 = llvm.mlir.constant(0 : i64) : i64
    %21 = llvm.sub %16, %19 overflow<nsw, nuw> : i64
    %22 = llvm.mul %21, %19 overflow<nsw, nuw> : i64
    %23 = llvm.mul %22, %19 overflow<nsw, nuw> : i64
    %24 = llvm.add %23, %20 overflow<nsw, nuw> : i64
    %25 = llvm.mul %19, %12 overflow<nsw, nuw> : i64
    %26 = llvm.getelementptr nusw|nuw %15[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %27 = llvm.load %26 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QQro.5xi4.0", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QQro.5xi4.0", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %28 = llvm.mlir.constant(1 : i64) : i64
    %29 = llvm.mlir.constant(0 : i64) : i64
    %30 = llvm.sub %16, %28 overflow<nsw, nuw> : i64
    %31 = llvm.mul %30, %28 overflow<nsw, nuw> : i64
    %32 = llvm.mul %31, %28 overflow<nsw, nuw> : i64
    %33 = llvm.add %32, %29 overflow<nsw, nuw> : i64
    %34 = llvm.mul %28, %12 overflow<nsw, nuw> : i64
    %35 = llvm.getelementptr nusw|nuw %3[%33] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %27, %35 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEb", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEb", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %36 = llvm.add %16, %5 overflow<nsw> : i64
    %37 = llvm.sub %17, %5 : i64
    llvm.br ^bb1(%36, %37 : i64, i64)
  ^bb3:  // pred: ^bb1
    omp.parallel private(@acc_private_0 %3 -> %arg0, @acc_private_1 %1 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      %38 = llvm.mlir.addressof @_QQclX28412C49302C412C493029 : !llvm.ptr
      %39 = llvm.mlir.zero : !llvm.ptr
      %40 = llvm.mlir.addressof @_QQclX66705F61727261792E66393000 : !llvm.ptr
      %41 = llvm.mlir.addressof @_QQclX66705F617272617920 : !llvm.ptr
      %42 = llvm.mlir.addressof @_QQclX20 : !llvm.ptr
      omp.wsloop {
        omp.loop_nest (%arg2) : i32 = (%11) to (%10) inclusive step (%11) {
          llvm.store %arg2, %arg1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %43 = llvm.load %arg1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %44 = llvm.sext %43 : i32 to i64
          %45 = llvm.mlir.constant(1 : i64) : i64
          %46 = llvm.mlir.constant(0 : i64) : i64
          %47 = llvm.sub %44, %45 overflow<nsw, nuw> : i64
          %48 = llvm.mul %47, %45 overflow<nsw, nuw> : i64
          %49 = llvm.mul %48, %45 overflow<nsw, nuw> : i64
          %50 = llvm.add %49, %46 overflow<nsw, nuw> : i64
          %51 = llvm.mul %45, %12 overflow<nsw, nuw> : i64
          %52 = llvm.getelementptr nusw|nuw %arg0[%50] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          %53 = llvm.load %52 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %54 = llvm.add %53, %43 : i32
          llvm.store %54, %52 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %55 = llvm.call @_FortranAioBeginExternalFormattedOutput(%38, %9, %39, %8, %40, %7) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i64, !llvm.ptr, i32, !llvm.ptr, i32) -> !llvm.ptr
          %56 = llvm.call @_FortranAioOutputAscii(%55, %41, %6) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
          %57 = llvm.load %arg1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %58 = llvm.call @_FortranAioOutputInteger32(%55, %57) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
          %59 = llvm.call @_FortranAioOutputAscii(%55, %42, %5) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
          %60 = llvm.load %arg1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %61 = llvm.sext %60 : i32 to i64
          %62 = llvm.mlir.constant(1 : i64) : i64
          %63 = llvm.mlir.constant(0 : i64) : i64
          %64 = llvm.sub %61, %62 overflow<nsw, nuw> : i64
          %65 = llvm.mul %64, %62 overflow<nsw, nuw> : i64
          %66 = llvm.mul %65, %62 overflow<nsw, nuw> : i64
          %67 = llvm.add %66, %63 overflow<nsw, nuw> : i64
          %68 = llvm.mul %62, %12 overflow<nsw, nuw> : i64
          %69 = llvm.getelementptr nusw|nuw %arg0[%67] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          %70 = llvm.load %69 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %71 = llvm.call @_FortranAioOutputInteger32(%55, %70) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i32) -> i1
          %72 = llvm.call @_FortranAioEndIoStatement(%55) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal constant @_QQroX5xi4X0(dense<[1, 2, 3, 4, 5]> : tensor<5xi32>) {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<5 x i32>
  llvm.func @_FortranAioBeginExternalFormattedOutput(!llvm.ptr, i64, !llvm.ptr, i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX28412C49302C412C493029() comdat(@__llvm_comdat::@_QQclX28412C49302C412C493029) {addr_space = 0 : i32} : !llvm.array<11 x i8> {
    %0 = llvm.mlir.constant("(A,I0,A,I0)") : !llvm.array<11 x i8>
    llvm.return %0 : !llvm.array<11 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX28412C49302C412C493029 any
    llvm.comdat_selector @_QQclX66705F61727261792E66393000 any
    llvm.comdat_selector @_QQclX66705F617272617920 any
    llvm.comdat_selector @_QQclX20 any
  }
  llvm.mlir.global linkonce constant @_QQclX66705F61727261792E66393000() comdat(@__llvm_comdat::@_QQclX66705F61727261792E66393000) {addr_space = 0 : i32} : !llvm.array<13 x i8> {
    %0 = llvm.mlir.constant("fp_array.f90\00") : !llvm.array<13 x i8>
    llvm.return %0 : !llvm.array<13 x i8>
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX66705F617272617920() comdat(@__llvm_comdat::@_QQclX66705F617272617920) {addr_space = 0 : i32} : !llvm.array<9 x i8> {
    %0 = llvm.mlir.constant("fp_array ") : !llvm.array<9 x i8>
    llvm.return %0 : !llvm.array<9 x i8>
  }
  llvm.func @_FortranAioOutputInteger32(!llvm.ptr, i32) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX20() comdat(@__llvm_comdat::@_QQclX20) {addr_space = 0 : i32} : !llvm.array<1 x i8> {
    %0 = llvm.mlir.constant(" ") : !llvm.array<1 x i8>
    llvm.return %0 : !llvm.array<1 x i8>
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
