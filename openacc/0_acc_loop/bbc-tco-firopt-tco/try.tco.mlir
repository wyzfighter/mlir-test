module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "acc.private.init"} : (i64) -> !llvm.ptr
    %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
    %3 = llvm.mlir.constant(1 : i64) : i64
    acc.yield %2 : !fir.ref<i32>
  }
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
  llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = builtin.unrealized_conversion_cast %1 : !llvm.ptr to !fir.ref<i32>
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %5 = builtin.unrealized_conversion_cast %4 : !llvm.ptr to !fir.ref<i32>
    %6 = llvm.mlir.constant(1 : i32) : i32
    %7 = llvm.mlir.constant(1234 : i32) : i32
    %8 = llvm.mlir.constant(100000 : i64) : i64
    %9 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %10 = llvm.mlir.constant(1 : i64) : i64
    %11 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %7, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %12 = acc.firstprivate varPtr(%2 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) name("n") -> !fir.ref<i32>
    %13 = builtin.unrealized_conversion_cast %12 : !fir.ref<i32> to !llvm.ptr
    acc.parallel combined(loop) firstprivate(%12 : !fir.ref<i32>) {
      %14 = acc.firstprivate varPtr(%12 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) implicit(true) name("n") -> !fir.ref<i32>
      %15 = llvm.load %13 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
      %16 = acc.private varPtr(%5 : !fir.ref<i32>) recipe(@privatization_ref_i32) implicit(true) name("i") -> !fir.ref<i32>
      %17 = builtin.unrealized_conversion_cast %16 : !fir.ref<i32> to !llvm.ptr
      acc.loop combined(parallel) private(%16 : !fir.ref<i32>) firstprivate(%14 : !fir.ref<i32>) control(%arg0 : i32) = (%6 : i32) to (%15 : i32)  step (%6 : i32) {
        llvm.store %arg0, %17 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
        %18 = llvm.load %17 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
        %19 = llvm.mul %18, %18 : i32
        %20 = llvm.add %18, %18 overflow<nsw> : i32
        %21 = llvm.sext %20 : i32 to i64
        %22 = llvm.mlir.constant(1 : i64) : i64
        %23 = llvm.mlir.constant(0 : i64) : i64
        %24 = llvm.sub %21, %22 overflow<nsw, nuw> : i64
        %25 = llvm.mul %24, %22 overflow<nsw, nuw> : i64
        %26 = llvm.mul %25, %22 overflow<nsw, nuw> : i64
        %27 = llvm.add %26, %23 overflow<nsw, nuw> : i64
        %28 = llvm.mul %22, %8 overflow<nsw, nuw> : i64
        %29 = llvm.getelementptr nusw|nuw %9[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
        llvm.store %19, %29 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      acc.yield
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32, alignment = 64 : i64} : !llvm.array<100000 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<100000 x i32>
    llvm.return %0 : !llvm.array<100000 x i32>
  }
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
