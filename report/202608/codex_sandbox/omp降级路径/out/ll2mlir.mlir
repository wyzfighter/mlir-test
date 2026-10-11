#tbaa_root = #llvm.tbaa_root<id = "Flang function root _QQmain">
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "any access", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "any data access", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, llvm.ident = "flang version 22.1.8 (git@github.com:wyzfighter/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", llvm.module_asm = [], llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_0(";unknown;unknown;0;0;;\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_1() {addr_space = 0 : i32, alignment = 8 : i64, dso_local} : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> {
    %0 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 : !llvm.ptr
    %1 = llvm.mlir.constant(22 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(2 : i32) : i32
    %4 = llvm.mlir.undef : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)>
    %5 = llvm.insertvalue %2, %4[0] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %6 = llvm.insertvalue %3, %5[1] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %7 = llvm.insertvalue %2, %6[2] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %8 = llvm.insertvalue %1, %7[3] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %9 = llvm.insertvalue %0, %8[4] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    llvm.return %9 : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)>
  }
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_2() {addr_space = 0 : i32, alignment = 8 : i64, dso_local} : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> {
    %0 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 : !llvm.ptr
    %1 = llvm.mlir.constant(22 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(66 : i32) : i32
    %4 = llvm.mlir.undef : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)>
    %5 = llvm.insertvalue %2, %4[0] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %6 = llvm.insertvalue %3, %5[1] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %7 = llvm.insertvalue %2, %6[2] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %8 = llvm.insertvalue %1, %7[3] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    %9 = llvm.insertvalue %0, %8[4] : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)> 
    llvm.return %9 : !llvm.struct<"struct.ident_t", (i32, i32, i32, i32, ptr)>
  }
  llvm.module_flags [#llvm.mlir.module_flag<max, "openmp", 31 : i32>, #llvm.mlir.module_flag<warning, "Debug Info Version", 3 : i32>]
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.addressof @mlir.llvm.nameless_global_1 : !llvm.ptr
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.addressof @_QQmain..omp_par : !llvm.ptr
    %4 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i64) -> !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %5 = llvm.call @__kmpc_global_thread_num(%1) : (!llvm.ptr) -> i32
    llvm.br ^bb2
  ^bb2:  // pred: ^bb1
    llvm.call @__kmpc_fork_call(%1, %2, %3) vararg(!llvm.func<void (ptr, i32, ptr, ...)>) : (!llvm.ptr, i32, !llvm.ptr) -> ()
    llvm.br ^bb3
  ^bb3:  // pred: ^bb2
    llvm.return
  }
  llvm.func internal @_QQmain..omp_par(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) attributes {dso_local, no_unwind} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.mlir.constant(99 : i32) : i32
    %3 = llvm.mlir.addressof @mlir.llvm.nameless_global_1 : !llvm.ptr
    %4 = llvm.mlir.constant(34 : i32) : i32
    %5 = llvm.mlir.addressof @mlir.llvm.nameless_global_2 : !llvm.ptr
    %6 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %9 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %10 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %11 = llvm.load %arg0 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.store %11, %10 {alignment = 4 : i64} : i32, !llvm.ptr
    %12 = llvm.load %10 {alignment = 4 : i64} : !llvm.ptr -> i32
    %13 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6
  ^bb6:  // pred: ^bb5
    llvm.br ^bb7
  ^bb7:  // pred: ^bb6
    llvm.store %1, %7 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %2, %8 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %0, %9 {alignment = 4 : i64} : i32, !llvm.ptr
    %14 = llvm.call @__kmpc_global_thread_num(%3) : (!llvm.ptr) -> i32
    llvm.call @__kmpc_for_static_init_4u(%3, %14, %4, %6, %7, %8, %9, %0, %1) : (!llvm.ptr, i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32) -> ()
    %15 = llvm.load %7 {alignment = 4 : i64} : !llvm.ptr -> i32
    %16 = llvm.load %8 {alignment = 4 : i64} : !llvm.ptr -> i32
    %17 = llvm.sub %16, %15 : i32
    %18 = llvm.add %17, %0 : i32
    llvm.br ^bb8(%1 : i32)
  ^bb8(%19: i32):  // 2 preds: ^bb7, ^bb19
    llvm.br ^bb9
  ^bb9:  // pred: ^bb8
    %20 = llvm.icmp "ult" %19, %18 : i32
    llvm.cond_br %20, ^bb16, ^bb10
  ^bb10:  // pred: ^bb9
    llvm.call @__kmpc_for_static_fini(%3, %14) : (!llvm.ptr, i32) -> ()
    %21 = llvm.call @__kmpc_global_thread_num(%3) : (!llvm.ptr) -> i32
    llvm.call @__kmpc_barrier(%5, %21) : (!llvm.ptr, i32) -> ()
    llvm.br ^bb11
  ^bb11:  // pred: ^bb10
    llvm.br ^bb12
  ^bb12:  // pred: ^bb11
    llvm.br ^bb13
  ^bb13:  // pred: ^bb12
    llvm.br ^bb14
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15
  ^bb15:  // pred: ^bb14
    llvm.br ^bb20
  ^bb16:  // pred: ^bb9
    %22 = llvm.add %19, %15 : i32
    %23 = llvm.mul %22, %0 : i32
    %24 = llvm.add %23, %0 : i32
    llvm.br ^bb17
  ^bb17:  // pred: ^bb16
    llvm.store %24, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb18
  ^bb18:  // pred: ^bb17
    llvm.br ^bb19
  ^bb19:  // pred: ^bb18
    %25 = llvm.add %19, %0 overflow<nuw> : i32
    llvm.br ^bb8(%25 : i32)
  ^bb20:  // pred: ^bb15
    llvm.return
  }
  llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr)
  llvm.func @_FortranAProgramEndStatement()
  llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i32) : i32
    llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %0) : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @_QQmain() : () -> ()
    llvm.call @_FortranAProgramEndStatement() : () -> ()
    llvm.return %1 : i32
  }
  llvm.func @__kmpc_global_thread_num(!llvm.ptr) -> i32 attributes {no_unwind}
  llvm.func @__kmpc_for_static_init_4u(!llvm.ptr, i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32) attributes {no_unwind}
  llvm.func @__kmpc_for_static_fini(!llvm.ptr, i32) attributes {no_unwind}
  llvm.func @__kmpc_barrier(!llvm.ptr, i32) attributes {convergent, no_unwind}
  llvm.func @__kmpc_fork_call(!llvm.ptr, i32, !llvm.ptr, ...) attributes {no_unwind}
}
