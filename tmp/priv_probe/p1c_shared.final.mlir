module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "P1C"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i64 {bindc_name = "s"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.alloca %4 x i64 {bindc_name = "expect"} : (i64) -> !llvm.ptr
    %6 = llvm.mlir.constant(0 : i64) : i64
    %7 = llvm.mlir.constant(1 : i64) : i64
    %8 = llvm.mlir.constant(0 : i64) : i64
    %9 = llvm.mlir.constant(22 : i64) : i64
    %10 = llvm.mlir.constant(20 : i32) : i32
    %11 = llvm.mlir.constant(6 : i32) : i32
    %12 = llvm.mlir.constant(2002001000000 : i64) : i64
    %13 = llvm.mlir.constant(1000 : i32) : i32
    %14 = llvm.mlir.constant(0 : i32) : i32
    %15 = llvm.mlir.constant(2000000 : i32) : i32
    %16 = llvm.mlir.constant(1 : i32) : i32
    %17 = llvm.mlir.constant(2000000 : i64) : i64
    %18 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %19 = llvm.mlir.constant(1 : i64) : i64
    %20 = llvm.mlir.constant(1 : i64) : i64
    %21 = llvm.mlir.constant(1 : i64) : i64
    omp.parallel {
      %52 = llvm.mlir.constant(1 : i64) : i64
      %53 = llvm.alloca %52 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
      %54 = llvm.mlir.constant(1 : i64) : i64
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%16) to (%15) inclusive step (%16) {
          llvm.store %arg0, %53 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          llvm.store %14, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %55 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %56 = llvm.load %53 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %57 = llvm.add %55, %56 : i32
          llvm.store %57, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %58 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %59 = llvm.add %58, %13 : i32
          llvm.store %59, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          %60 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEx", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %61 = llvm.load %53 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
          %62 = llvm.sext %61 : i32 to i64
          %63 = llvm.mlir.constant(1 : i64) : i64
          %64 = llvm.mlir.constant(0 : i64) : i64
          %65 = llvm.sub %62, %63 overflow<nsw, nuw> : i64
          %66 = llvm.mul %65, %63 overflow<nsw, nuw> : i64
          %67 = llvm.mul %66, %63 overflow<nsw, nuw> : i64
          %68 = llvm.add %67, %64 overflow<nsw, nuw> : i64
          %69 = llvm.mul %63, %17 overflow<nsw, nuw> : i64
          %70 = llvm.getelementptr nusw|nuw %18[%68] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %60, %70 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.br ^bb1(%7, %8, %17 : i64, i64, i64)
  ^bb1(%22: i64, %23: i64, %24: i64):  // 2 preds: ^bb0, ^bb2
    %25 = llvm.icmp "sgt" %24, %6 : i64
    llvm.cond_br %25, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %26 = llvm.mlir.constant(1 : i64) : i64
    %27 = llvm.mlir.constant(0 : i64) : i64
    %28 = llvm.sub %22, %26 overflow<nsw, nuw> : i64
    %29 = llvm.mul %28, %26 overflow<nsw, nuw> : i64
    %30 = llvm.mul %29, %26 overflow<nsw, nuw> : i64
    %31 = llvm.add %30, %27 overflow<nsw, nuw> : i64
    %32 = llvm.mul %26, %17 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr nusw|nuw %18[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %35 = llvm.sext %34 : i32 to i64
    %36 = llvm.add %23, %35 : i64
    %37 = llvm.add %22, %7 overflow<nsw> : i64
    %38 = llvm.sub %24, %7 : i64
    llvm.br ^bb1(%37, %36, %38 : i64, i64, i64)
  ^bb3:  // pred: ^bb1
    llvm.store %23, %3 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEs", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEs", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i64, !llvm.ptr
    llvm.store %12, %5 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEexpect", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEexpect", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i64, !llvm.ptr
    %39 = llvm.mlir.addressof @_QQclX7031635F707269766174655F6269672E66393000 : !llvm.ptr
    %40 = llvm.call @_FortranAioBeginExternalListOutput(%11, %39, %10) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (i32, !llvm.ptr, i32) -> !llvm.ptr
    %41 = llvm.mlir.addressof @_QQclX703163206578706563742C676F742C6D61746368203D : !llvm.ptr
    %42 = llvm.call @_FortranAioOutputAscii(%40, %41, %9) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, !llvm.ptr, i64) -> i1
    %43 = llvm.load %5 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEexpect", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEexpect", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i64
    %44 = llvm.call @_FortranAioOutputInteger64(%40, %43) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i64) -> i1
    %45 = llvm.load %3 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEs", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEs", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i64
    %46 = llvm.call @_FortranAioOutputInteger64(%40, %45) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i64) -> i1
    %47 = llvm.load %3 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEs", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEs", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i64
    %48 = llvm.load %5 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEexpect", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEexpect", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i64
    %49 = llvm.icmp "eq" %47, %48 : i64
    %50 = llvm.call @_FortranAioOutputLogical(%40, %49) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr, i1) -> i1
    %51 = llvm.call @_FortranAioEndIoStatement(%40) {fastmathFlags = #llvm.fastmath<contract>, llvm.nocallback, llvm.nosync, memory_effects = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<2000000 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<2000000 x i32>
    llvm.return %0 : !llvm.array<2000000 x i32>
  }
  llvm.func @_FortranAioBeginExternalListOutput(i32, !llvm.ptr, i32) -> !llvm.ptr attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX7031635F707269766174655F6269672E66393000() comdat(@__llvm_comdat::@_QQclX7031635F707269766174655F6269672E66393000) {addr_space = 0 : i32} : !llvm.array<20 x i8> {
    %0 = llvm.mlir.constant("p1c_private_big.f90\00") : !llvm.array<20 x i8>
    llvm.return %0 : !llvm.array<20 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX7031635F707269766174655F6269672E66393000 any
    llvm.comdat_selector @_QQclX703163206578706563742C676F742C6D61746368203D any
  }
  llvm.func @_FortranAioOutputAscii(!llvm.ptr, !llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.mlir.global linkonce constant @_QQclX703163206578706563742C676F742C6D61746368203D() comdat(@__llvm_comdat::@_QQclX703163206578706563742C676F742C6D61746368203D) {addr_space = 0 : i32} : !llvm.array<22 x i8> {
    %0 = llvm.mlir.constant("p1c expect,got,match =") : !llvm.array<22 x i8>
    llvm.return %0 : !llvm.array<22 x i8>
  }
  llvm.func @_FortranAioOutputInteger64(!llvm.ptr, i64) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
  llvm.func @_FortranAioOutputLogical(!llvm.ptr, i1 {llvm.zeroext}) -> (i1 {llvm.zeroext}) attributes {fir.io, fir.runtime, sym_visibility = "private"}
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
