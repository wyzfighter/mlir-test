module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.flags = #omp.flags<openmp_device_version = 31>, omp.integer_wrap_around = #omp.integer_wrap_around<integer_wrap_around = false>, omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp.clause_requires<none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(99999 : i64) : i64        //a数组的尾地址
    %5 = llvm.mlir.constant(0 : i64) : i64            //a的首地址
    %6 = llvm.mlir.constant(1 : i64) : i64            
    %7 = llvm.mlir.constant(1234 : i32) : i32         // n
    %8 = llvm.mlir.constant(100000 : i64) : i64       // 
    %9 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %10 = llvm.mlir.constant(1 : i64) : i64
    %11 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %7, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %12 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) name("n") -> !llvm.ptr
    %13 = omp.map.bounds lower_bound(%5 : i64) upper_bound(%4 : i64) extent(%8 : i64) stride(%6 : i64) start_idx(%6 : i64)
    %14 = omp.map.info var_ptr(%9 : !llvm.ptr, !llvm.array<100000 x i32>) map_clauses(from) capture(ByRef) bounds(%13) name("a") -> !llvm.ptr
    %15 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) name("i") -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%12 -> %arg0, %14 -> %arg1, %15 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %16 = llvm.mlir.constant(1 : i64) : i64
      %17 = llvm.mlir.constant(0 : i64) : i64
      %18 = llvm.mlir.constant(1 : i32) : i32
      %19 = llvm.mlir.constant(100000 : i64) : i64
      %20 = llvm.load %arg0 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
      %21 = llvm.sext %20 : i32 to i64
      llvm.br ^bb1(%18, %21 : i32, i64)
    ^bb1(%22: i32, %23: i64):  // 2 preds: ^bb0, ^bb2
      %24 = llvm.icmp "sgt" %23, %17 : i64
      llvm.cond_br %24, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      llvm.store %22, %arg2 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
      %25 = llvm.load %arg2 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
      %26 = llvm.mul %25, %25 : i32
      %27 = llvm.add %25, %25 overflow<nsw> : i32
      %28 = llvm.sext %27 : i32 to i64
      %29 = llvm.mlir.constant(1 : i64) : i64
      %30 = llvm.mlir.constant(0 : i64) : i64
      %31 = llvm.sub %28, %29 overflow<nsw, nuw> : i64
      %32 = llvm.mul %31, %29 overflow<nsw, nuw> : i64
      %33 = llvm.mul %32, %29 overflow<nsw, nuw> : i64
      %34 = llvm.add %33, %30 overflow<nsw, nuw> : i64
      %35 = llvm.mul %29, %19 overflow<nsw, nuw> : i64
      %36 = llvm.getelementptr nusw|nuw %arg1[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
      llvm.store %26, %36 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
      %37 = llvm.add %22, %18 overflow<nsw> : i32
      %38 = llvm.sub %23, %16 : i64
      llvm.br ^bb1(%37, %38 : i32, i64)
    ^bb3:  // pred: ^bb1
      %39 = llvm.intr.smax(%21, %17) : (i64, i64) -> i64
      %40 = llvm.add %39, %16 : i64
      %41 = llvm.trunc %40 : i64 to i32
      llvm.store %41, %arg2 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
      omp.terminator
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
