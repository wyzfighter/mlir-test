; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclXac60221774614d8da92f8bca69c46959 = comdat any

$_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C726573756C74283529203D = comdat any

@_QFEa = internal global [1000 x float] zeroinitializer
@_QFEb = internal global [1000 x float] zeroinitializer
@_QFECn = internal constant i32 1000
@_QFEresult = internal global [1000 x float] zeroinitializer
@_QQclXac60221774614d8da92f8bca69c46959 = linkonce constant [61 x i8] c"/home/wangyz/test/openmp/fortran/parallel-do/parallel-do.f90\00", comdat
@_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C726573756C74283529203D = linkonce constant [26 x i8] c"\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8Cresult(5) =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %structArg = alloca { ptr }, align 8
  %1 = alloca i32, i64 1, align 4
  %2 = alloca float, i64 1, align 4
  store float 3.500000e+00, ptr %2, align 4
  br label %3

3:                                                ; preds = %7, %0
  %4 = phi i32 [ %26, %7 ], [ 1, %0 ]
  %5 = phi i64 [ %27, %7 ], [ 1000, %0 ]
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %28

7:                                                ; preds = %3
  store i32 %4, ptr %1, align 4
  %8 = load i32, ptr %1, align 4
  %9 = sitofp i32 %8 to float
  %10 = sext i32 %8 to i64
  %11 = sub nsw i64 %10, 1
  %12 = mul nsw i64 %11, 1
  %13 = mul nsw i64 %12, 1
  %14 = add nsw i64 %13, 0
  %15 = getelementptr float, ptr @_QFEa, i64 %14
  store float %9, ptr %15, align 4
  %16 = load i32, ptr %1, align 4
  %17 = sitofp i32 %16 to float
  %18 = fmul contract float %17, 5.000000e-01
  %19 = sext i32 %16 to i64
  %20 = sub nsw i64 %19, 1
  %21 = mul nsw i64 %20, 1
  %22 = mul nsw i64 %21, 1
  %23 = add nsw i64 %22, 0
  %24 = getelementptr float, ptr @_QFEb, i64 %23
  store float %18, ptr %24, align 4
  %25 = load i32, ptr %1, align 4
  %26 = add nsw i32 %25, 1
  %27 = sub i64 %5, 1
  br label %3

28:                                               ; preds = %3
  store i32 %4, ptr %1, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %28
  %gep_ = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %2, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %29 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclXac60221774614d8da92f8bca69c46959, i32 23)
  %30 = call i1 @_FortranAioOutputAscii(ptr %29, ptr @_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C726573756C74283529203D, i64 26)
  %31 = load float, ptr getelementptr inbounds nuw (i8, ptr @_QFEresult, i64 16), align 4
  %32 = call i1 @_FortranAioOutputReal32(ptr %29, float %31)
  %33 = call i32 @_FortranAioEndIoStatement(ptr %29)
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8, !align !3
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %omp.private.alloc = alloca i32, align 4
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
  store i32 999, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num5, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %2 = load i32, ptr %p.lowerbound, align 4
  %3 = load i32, ptr %p.upperbound, align 4
  %4 = sub i32 %3, %2
  %5 = add i32 %4, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %5
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num5)
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num6)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont3

omp.region.cont3:                                 ; preds = %omp_loop.after
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.region.cont3
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %6 = add i32 %omp_loop.iv, %2
  %7 = mul i32 %6, 1
  %8 = add i32 %7, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %8, ptr %omp.private.alloc, align 4
  %9 = load i32, ptr %omp.private.alloc, align 4
  %10 = sext i32 %9 to i64
  %11 = sub nsw i64 %10, 1
  %12 = mul nsw i64 %11, 1
  %13 = mul nsw i64 %12, 1
  %14 = add nsw i64 %13, 0
  %15 = getelementptr float, ptr @_QFEa, i64 %14
  %16 = load float, ptr %15, align 4
  %17 = sub nsw i64 %10, 1
  %18 = mul nsw i64 %17, 1
  %19 = mul nsw i64 %18, 1
  %20 = add nsw i64 %19, 0
  %21 = getelementptr float, ptr @_QFEb, i64 %20
  %22 = load float, ptr %21, align 4
  %23 = load float, ptr %loadgep_, align 4
  %24 = fmul contract float %22, %23
  %25 = fadd contract float %16, %24
  %26 = sub nsw i64 %10, 1
  %27 = mul nsw i64 %26, 1
  %28 = mul nsw i64 %27, 1
  %29 = add nsw i64 %28, 0
  %30 = getelementptr float, ptr @_QFEresult, i64 %29
  store float %25, ptr %30, align 4
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont4
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

declare zeroext i1 @_FortranAioOutputAscii(ptr, ptr, i64)

declare zeroext i1 @_FortranAioOutputReal32(ptr, float)

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
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: nounwind
declare !callback !4 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 7, !"openmp", i32 31}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!"flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)"}
!3 = !{i64 4}
!4 = !{!5}
!5 = !{i64 2, i64 -1, i64 -1, i1 true}
