module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/fortran-mlir-acc.git 63b57cf2085b76b9c533461f44798b0b6ec90c9e)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.flags = #omp.flags<openmp_device_version = 31>, omp.integer_wrap_around = #omp.integer_wrap_around<integer_wrap_around = false>, omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp.clause_requires<none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  llvm.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(99999 : i64) : i64
    %5 = llvm.mlir.constant(0 : i64) : i64
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.mlir.constant(1 : i32) : i32
    %8 = llvm.mlir.constant(3 : i32) : i32
    %9 = llvm.mlir.constant(1234 : i32) : i32
    %10 = llvm.mlir.constant(100000 : i64) : i64
    %11 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %12 = llvm.mlir.constant(1 : i64) : i64
    %13 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %9, %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
    %14 = llvm.load %1 <tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEn", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
    %15 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) name("i") -> !llvm.ptr
    %16 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) name("n") -> !llvm.ptr
    %17 = omp.map.bounds lower_bound(%5 : i64) upper_bound(%4 : i64) extent(%10 : i64) stride(%6 : i64) start_idx(%6 : i64)
    %18 = omp.map.info var_ptr(%11 : !llvm.ptr, !llvm.array<100000 x i32>) map_clauses(implicit, tofrom) capture(ByRef) bounds(%17) name("a") -> !llvm.ptr
    omp.target kernel_type(spmd) host_eval(%8 -> %arg0, %14 -> %arg1, %7 -> %arg2 : i32, i32, i32) map_entries(%15 -> %arg3, %16 -> %arg4, %18 -> %arg5 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %19 = llvm.mlir.constant(100000 : i64) : i64
      omp.teams {
        omp.parallel private(@_QFEi_private_i32 %arg3 -> %arg6 : !llvm.ptr) {
          omp.distribute {
            omp.wsloop {
              omp.loop_nest (%arg7) : i32 = (%arg0) to (%arg1) inclusive step (%arg2) {
                llvm.store %arg7, %arg6 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
                %20 = llvm.load %arg6 <tbaa = [#llvm.tbaa_tag<base_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, access_type = <id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, offset = 0>]> : !llvm.ptr -> i32
                %21 = llvm.mul %20, %20 : i32
                %22 = llvm.add %20, %20 overflow<nsw> : i32
                %23 = llvm.sext %22 : i32 to i64
                %24 = llvm.mlir.constant(1 : i64) : i64
                %25 = llvm.mlir.constant(0 : i64) : i64
                %26 = llvm.sub %23, %24 overflow<nsw, nuw> : i64
                %27 = llvm.mul %26, %24 overflow<nsw, nuw> : i64
                %28 = llvm.mul %27, %24 overflow<nsw, nuw> : i64
                %29 = llvm.add %28, %25 overflow<nsw, nuw> : i64
                %30 = llvm.mul %24, %19 overflow<nsw, nuw> : i64
                %31 = llvm.getelementptr nusw|nuw %arg5[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
                llvm.store %21, %31 <tbaa = [#llvm.tbaa_tag<base_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "global data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "global data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]> : i32, !llvm.ptr
                omp.yield
              }
            } {omp.composite}
          } {omp.composite}
          omp.terminator
        } {omp.composite}
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
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
