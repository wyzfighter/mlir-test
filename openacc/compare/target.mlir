module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.flags = #omp.flags<openmp_device_version = 31>, omp.integer_wrap_around = #omp.integer_wrap_around<integer_wrap_around = false>, omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp.clause_requires<none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr // 分配空间给n
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr // 分配空间给i
    %4 = llvm.mlir.constant(99999 : i64) : i64                        // a的尾偏移量
    %5 = llvm.mlir.constant(0 : i64) : i64                            // a的首偏移量
    %6 = llvm.mlir.constant(1 : i64) : i64                            // a的长度单位：1个i32
    %7 = llvm.mlir.constant(1234 : i32) : i32                         // n的值
    %8 = llvm.mlir.constant(100000 : i64) : i64                       // a的长度
    %9 = llvm.mlir.addressof @_QFEa : !llvm.ptr                       // 函数指针
    %10 = llvm.mlir.constant(1 : i64) : i64                           // 作用未知，仅出现过一次
    %11 = llvm.mlir.constant(1 : i64) : i64                           // 作用未知，仅出现过一次
    llvm.store %7, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %12 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) name("n") -> !llvm.ptr
    %13 = omp.map.bounds lower_bound(%5 : i64) upper_bound(%4 : i64) extent(%8 : i64) stride(%6 : i64) start_idx(%6 : i64)
    %14 = omp.map.info var_ptr(%9 : !llvm.ptr, !llvm.array<100000 x i32>) map_clauses(from) capture(ByRef) bounds(%13) name("a") -> !llvm.ptr
    %15 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) name("i") -> !llvm.ptr // 映射a数组
    omp.target kernel_type(generic) map_entries(%12 -> %arg0, %14 -> %arg1, %15 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %16 = llvm.mlir.constant(1 : i64) : i64
      %17 = llvm.mlir.constant(-2 : i64) : i64
      %18 = llvm.mlir.constant(3 : i64) : i64
      %19 = llvm.mlir.constant(0 : i64) : i64
      %20 = llvm.mlir.constant(1 : i32) : i32
      %21 = llvm.mlir.constant(3 : i32) : i32
      %22 = llvm.mlir.constant(100000 : i64) : i64
      %23 = llvm.load %arg0 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
      %24 = llvm.sext %23 : i32 to i64
      %25 = llvm.add %24, %17 : i64
      llvm.br ^bb1(%21, %25 : i32, i64)
    ^bb1(%26: i32, %27: i64):  // 2 preds: ^bb0, ^bb2
      %28 = llvm.icmp "sgt" %27, %19 : i64
      llvm.cond_br %28, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      llvm.store %26, %arg2 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
      %29 = llvm.load %arg2 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
      %30 = llvm.mul %29, %29 : i32
      %31 = llvm.add %29, %29 overflow<nsw> : i32
      %32 = llvm.sext %31 : i32 to i64
      %33 = llvm.mlir.constant(1 : i64) : i64
      %34 = llvm.mlir.constant(0 : i64) : i64
      %35 = llvm.sub %32, %33 overflow<nsw, nuw> : i64
      %36 = llvm.mul %35, %33 overflow<nsw, nuw> : i64
      %37 = llvm.mul %36, %33 overflow<nsw, nuw> : i64
      %38 = llvm.add %37, %34 overflow<nsw, nuw> : i64
      %39 = llvm.mul %33, %22 overflow<nsw, nuw> : i64
      %40 = llvm.getelementptr nusw|nuw %arg1[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i32
      llvm.store %30, %40 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
      %41 = llvm.add %26, %20 overflow<nsw> : i32
      %42 = llvm.sub %27, %16 : i64
      llvm.br ^bb1(%41, %42 : i32, i64)
    ^bb3:  // pred: ^bb1
      %43 = llvm.intr.smax(%25, %19) : (i64, i64) -> i64
      %44 = llvm.add %43, %18 : i64
      %45 = llvm.trunc %44 : i64 to i32
      llvm.store %45, %arg2 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEi", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
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
