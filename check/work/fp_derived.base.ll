; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%_QM__fortran_type_infoTcomponent = type { { ptr, i64, i32, i8, i8, i8, i8 }, i8, i8, i8, i8, i8, [3 x i8], i64, %_QM__fortran_type_infoTvalue, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] }, %_QM__fortran_builtinsT__builtin_c_ptr }
%_QM__fortran_type_infoTvalue = type { i8, [7 x i8], i64 }
%_QM__fortran_builtinsT__builtin_c_ptr = type { i64 }
%_QM__fortran_type_infoTderivedtype = type { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8 }, i64, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] }, i32, i8, i8, i8, i8, i8, [3 x i8] }
%struct.ident_t = type { i32, i32, i32, i32, ptr }
%_QMfp_kindsTpair_t = type { i32 }

$_QMfp_kindsEXnXv = comdat any

$_QMfp_kindsEXnXpair_t = comdat any

$_QMfp_kindsEXcXpair_t = comdat any

$_QMfp_kindsEXdtXpair_t = comdat any

$_QQclX28412C493029 = comdat any

$_QQclX66705F646572697665645F6F6D702E66393000 = comdat any

$_QQclX66705F6465726976656420 = comdat any

$_QM__fortran_builtinsEXdtX__builtin_c_funptr = comdat any

$_QM__fortran_builtinsEXnX__builtin_c_funptr = comdat any

$_QM__fortran_builtinsEXcX__builtin_c_funptr = comdat any

$_QM__fortran_builtinsEXnX__address = comdat any

$_QM__fortran_builtinsEXdtX__builtin_c_ptr = comdat any

$_QM__fortran_builtinsEXnX__builtin_c_ptr = comdat any

$_QM__fortran_builtinsEXcX__builtin_c_ptr = comdat any

@_QMfp_kindsEXnXv = linkonce_odr constant [1 x i8] c"v", comdat
@_QMfp_kindsEXnXpair_t = linkonce_odr constant [6 x i8] c"pair_t", comdat
@_QMfp_kindsEXcXpair_t = linkonce_odr constant [1 x %_QM__fortran_type_infoTcomponent] [%_QM__fortran_type_infoTcomponent { { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QMfp_kindsEXnXv, i64 1, i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i8 1, i8 0, i8 4, i8 0, i8 0, [3 x i8] undef, i64 0, %_QM__fortran_type_infoTvalue { i8 1, [7 x i8] undef, i64 0 }, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 440, i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 2, i8 42, i8 1, i8 1, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16], [3 x i64] [i64 1, i64 0, i64 0]], ptr null, [1 x i64] zeroinitializer }, %_QM__fortran_builtinsT__builtin_c_ptr zeroinitializer }], comdat, align 64
@_QMfp_kindsEXdtXpair_t = linkonce_odr constant %_QM__fortran_type_infoTderivedtype { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 32, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 32]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QMfp_kindsEXnXpair_t, i64 6, i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i64 4, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 440, i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 8, i32 20240719, i8 1, i8 10, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 8]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 1, i32 20240719, i8 1, i8 7, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 1]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr @_QMfp_kindsEXcXpair_t, i64 256, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 0, i64 1, i64 256]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 40, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 40]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16]], ptr null, [1 x i64] zeroinitializer }, i32 0, i8 0, i8 1, i8 1, i8 1, i8 1, [3 x i8] undef }, comdat
@_QQclX28412C493029 = linkonce constant [6 x i8] c"(A,I0)", comdat
@_QQclX66705F646572697665645F6F6D702E66393000 = linkonce constant [19 x i8] c"fp_derived_omp.f90\00", comdat
@_QQclX66705F6465726976656420 = linkonce constant [11 x i8] c"fp_derived ", comdat
@_QM__fortran_builtinsEXdtX__builtin_c_funptr = linkonce_odr constant %_QM__fortran_type_infoTderivedtype { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 32, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 32]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__builtin_c_funptr, i64 18, i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i64 8, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 440, i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 8, i32 20240719, i8 1, i8 10, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 8]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 1, i32 20240719, i8 1, i8 7, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 1]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr @_QM__fortran_builtinsEXcX__builtin_c_funptr, i64 256, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 0, i64 1, i64 256]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 40, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 40]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16]], ptr null, [1 x i64] zeroinitializer }, i32 0, i8 0, i8 1, i8 1, i8 1, i8 1, [3 x i8] undef }, comdat
@_QM__fortran_builtinsEXnX__builtin_c_funptr = linkonce_odr constant [18 x i8] c"__builtin_c_funptr", comdat
@_QM__fortran_builtinsEXcX__builtin_c_funptr = linkonce_odr constant [1 x %_QM__fortran_type_infoTcomponent] [%_QM__fortran_type_infoTcomponent { { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__address, i64 9, i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i8 1, i8 0, i8 8, i8 0, i8 0, [3 x i8] undef, i64 0, %_QM__fortran_type_infoTvalue { i8 1, [7 x i8] undef, i64 0 }, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 440, i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 2, i8 42, i8 1, i8 1, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16], [3 x i64] [i64 1, i64 0, i64 0]], ptr null, [1 x i64] zeroinitializer }, %_QM__fortran_builtinsT__builtin_c_ptr zeroinitializer }], comdat, align 64
@_QM__fortran_builtinsEXnX__address = linkonce_odr constant [9 x i8] c"__address", comdat
@_QM__fortran_builtinsEXdtX__builtin_c_ptr = linkonce_odr constant %_QM__fortran_type_infoTderivedtype { { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 32, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 32]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__builtin_c_ptr, i64 15, i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i64 8, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 440, i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 8, i32 20240719, i8 1, i8 10, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 8]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]] } { ptr null, i64 1, i32 20240719, i8 1, i8 7, i8 1, i8 0, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 1]] }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr @_QM__fortran_builtinsEXcX__builtin_c_ptr, i64 256, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 0, i64 1, i64 256]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 40, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 40]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16]], ptr null, [1 x i64] zeroinitializer }, i32 0, i8 0, i8 1, i8 1, i8 1, i8 1, [3 x i8] undef }, comdat
@_QM__fortran_builtinsEXnX__builtin_c_ptr = linkonce_odr constant [15 x i8] c"__builtin_c_ptr", comdat
@_QM__fortran_builtinsEXcX__builtin_c_ptr = linkonce_odr constant [1 x %_QM__fortran_type_infoTcomponent] [%_QM__fortran_type_infoTcomponent { { ptr, i64, i32, i8, i8, i8, i8 } { ptr @_QM__fortran_builtinsEXnX__address, i64 9, i32 20240719, i8 0, i8 40, i8 1, i8 0 }, i8 1, i8 0, i8 8, i8 0, i8 0, [3 x i8] undef, i64 0, %_QM__fortran_type_infoTvalue { i8 1, [7 x i8] undef, i64 0 }, { ptr, i64, i32, i8, i8, i8, i8, ptr, [1 x i64] } { ptr null, i64 440, i32 20240719, i8 0, i8 42, i8 1, i8 1, ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [1 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 1, i8 42, i8 1, i8 1, [1 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16]], ptr null, [1 x i64] zeroinitializer }, { ptr, i64, i32, i8, i8, i8, i8, [2 x [3 x i64]], ptr, [1 x i64] } { ptr null, i64 16, i32 20240719, i8 2, i8 42, i8 1, i8 1, [2 x [3 x i64]] [[3 x i64] [i64 1, i64 0, i64 16], [3 x i64] [i64 1, i64 0, i64 0]], ptr null, [1 x i64] zeroinitializer }, %_QM__fortran_builtinsT__builtin_c_ptr zeroinitializer }], comdat, align 64
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %1 = alloca %_QMfp_kindsTpair_t, i64 1, align 8
  %2 = alloca i32, i64 1, align 4
  %3 = getelementptr %_QMfp_kindsTpair_t, ptr %1, i32 0, i32 0
  store i32 5, ptr %3, align 4, !tbaa !3
  br label %entry

entry:                                            ; preds = %0
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %tid.addr.local = alloca i32, align 4
  %0 = load i32, ptr %tid.addr, align 4
  store i32 %0, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %omp.private.alloc = alloca %_QMfp_kindsTpair_t, align 8
  %omp.private.alloc3 = alloca i32, align 4
  br label %omp.region.after_alloca2

omp.region.after_alloca2:                         ; preds = %omp.par.entry
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %omp.region.after_alloca2
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  br label %omp.private.init

omp.private.init:                                 ; preds = %omp.par.region1
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.private.init
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  store i32 4, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @2, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %1 = load i32, ptr %p.lowerbound, align 4
  %2 = load i32, ptr %p.upperbound, align 4
  %3 = sub i32 %2, %1
  %4 = add i32 %3, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %4
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @2, i32 %omp_global_thread_num)
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @3, i32 %omp_global_thread_num6)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp_loop.after
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.region.cont4
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %5 = add nsw i32 %omp_loop.iv, %1
  %6 = mul nsw i32 %5, 1
  %7 = add nsw i32 %6, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %7, ptr %omp.private.alloc3, align 4, !tbaa !9
  %8 = getelementptr %_QMfp_kindsTpair_t, ptr %omp.private.alloc, i32 0, i32 0
  %9 = load i32, ptr %8, align 4, !tbaa !9
  %10 = load i32, ptr %omp.private.alloc3, align 4, !tbaa !9
  %11 = add i32 %9, %10
  store i32 %11, ptr %8, align 4, !tbaa !9
  %12 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr @_QQclX28412C493029, i64 6, ptr null, i32 6, ptr @_QQclX66705F646572697665645F6F6D702E66393000, i32 20) #2
  %13 = call i1 @_FortranAioOutputAscii(ptr %12, ptr @_QQclX66705F6465726976656420, i64 11) #2
  %14 = load i32, ptr %8, align 4, !tbaa !9
  %15 = call i1 @_FortranAioOutputInteger32(ptr %12, i32 %14) #2
  %16 = call i32 @_FortranAioEndIoStatement(ptr %12) #2
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont5
  %omp_loop.next = add nuw nsw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

declare ptr @_FortranAioBeginExternalFormattedOutput(ptr, i64, ptr, i32, ptr, i32)

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64)

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32)

declare i32 @_FortranAioEndIoStatement(ptr)

declare void @_FortranAProgramStart(i32, ptr, ptr, ptr)

declare void @_FortranAProgramEndStatement()

define i32 @main(i32 %0, ptr %1, ptr %2) {
  call void @_FortranAProgramStart(i32 %0, ptr %1, ptr %2, ptr null)
  call void @_QQmain()
  call void @_FortranAProgramEndStatement()
  ret i32 0
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: nounwind
declare !callback !10 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }
attributes #2 = { memory(argmem: readwrite, inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 7, !"openmp", i32 31}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!"flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"allocated data/_QFEp", !5, i64 0}
!5 = !{!"allocated data", !6, i64 0}
!6 = !{!"any data access", !7, i64 0}
!7 = !{!"any access", !8, i64 0}
!8 = !{!"Flang function root _QQmain"}
!9 = !{!6, !6, i64 0}
!10 = !{!11}
!11 = !{i64 2, i64 -1, i64 -1, i1 true}
