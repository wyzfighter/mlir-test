; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclXde3ec603b76cf37a97d8be954f2861f5 = comdat any

$_QQclXb4704274e03105d4beba5fae9890b8a6 = comdat any

@_QFECcol = internal constant i32 200
@_QFEmat_a = internal global [200 x [200 x float]] zeroinitializer
@_QFEmat_b = internal global [200 x [200 x float]] zeroinitializer
@_QFEmat_c = internal global [200 x [200 x float]] zeroinitializer
@_QFECrow = internal constant i32 200
@_QQclXde3ec603b76cf37a97d8be954f2861f5 = linkonce constant [55 x i8] c"/home/wangyz/test/openmp/fortran/collapse/collapse.f90\00", comdat
@_QQclXb4704274e03105d4beba5fae9890b8a6 = linkonce constant [35 x i8] c"\E7\9F\A9\E9\98\B5\E5\8A\A0\E6\B3\95\E5\AE\8C\E6\88\90\EF\BC\8Cmat_c(10,10) =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  br label %3

3:                                                ; preds = %46, %0
  %4 = phi i32 [ %48, %46 ], [ 1, %0 ]
  %5 = phi i64 [ %49, %46 ], [ 200, %0 ]
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %50

7:                                                ; preds = %3
  store i32 %4, ptr %1, align 4
  br label %8

8:                                                ; preds = %12, %7
  %9 = phi i32 [ %44, %12 ], [ 1, %7 ]
  %10 = phi i64 [ %45, %12 ], [ 200, %7 ]
  %11 = icmp sgt i64 %10, 0
  br i1 %11, label %12, label %46

12:                                               ; preds = %8
  store i32 %9, ptr %2, align 4
  %13 = load i32, ptr %2, align 4
  %14 = load i32, ptr %1, align 4
  %15 = add i32 %13, %14
  %16 = sitofp i32 %15 to float
  %17 = sext i32 %13 to i64
  %18 = sext i32 %14 to i64
  %19 = sub nsw i64 %17, 1
  %20 = mul nsw i64 %19, 1
  %21 = mul nsw i64 %20, 1
  %22 = add nsw i64 %21, 0
  %23 = sub nsw i64 %18, 1
  %24 = mul nsw i64 %23, 1
  %25 = mul nsw i64 %24, 200
  %26 = add nsw i64 %25, %22
  %27 = getelementptr float, ptr @_QFEmat_a, i64 %26
  store float %16, ptr %27, align 4
  %28 = load i32, ptr %2, align 4
  %29 = load i32, ptr %1, align 4
  %30 = sub i32 %28, %29
  %31 = sitofp i32 %30 to float
  %32 = sext i32 %28 to i64
  %33 = sext i32 %29 to i64
  %34 = sub nsw i64 %32, 1
  %35 = mul nsw i64 %34, 1
  %36 = mul nsw i64 %35, 1
  %37 = add nsw i64 %36, 0
  %38 = sub nsw i64 %33, 1
  %39 = mul nsw i64 %38, 1
  %40 = mul nsw i64 %39, 200
  %41 = add nsw i64 %40, %37
  %42 = getelementptr float, ptr @_QFEmat_b, i64 %41
  store float %31, ptr %42, align 4
  %43 = load i32, ptr %2, align 4
  %44 = add nsw i32 %43, 1
  %45 = sub i64 %10, 1
  br label %8

46:                                               ; preds = %8
  store i32 %9, ptr %2, align 4
  %47 = load i32, ptr %1, align 4
  %48 = add nsw i32 %47, 1
  %49 = sub i64 %5, 1
  br label %3

50:                                               ; preds = %3
  store i32 %4, ptr %1, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %50
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %51 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclXde3ec603b76cf37a97d8be954f2861f5, i32 24)
  %52 = call i1 @_FortranAioOutputAscii(ptr %51, ptr @_QQclXb4704274e03105d4beba5fae9890b8a6, i64 35)
  %53 = load float, ptr getelementptr inbounds nuw (i8, ptr @_QFEmat_c, i64 7236), align 4
  %54 = call i1 @_FortranAioOutputReal32(ptr %51, float %53)
  %55 = call i32 @_FortranAioEndIoStatement(ptr %51)
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
  %omp.private.alloc = alloca i32, align 4
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
  br label %omp_collapsed.preheader

omp_collapsed.preheader:                          ; preds = %omp_loop.preheader
  store i32 0, ptr %p.lowerbound, align 4
  store i32 39999, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num16 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num16, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %1 = load i32, ptr %p.lowerbound, align 4
  %2 = load i32, ptr %p.upperbound, align 4
  %3 = sub i32 %2, %1
  %4 = add i32 %3, 1
  br label %omp_collapsed.header

omp_collapsed.header:                             ; preds = %omp_collapsed.inc, %omp_collapsed.preheader
  %omp_collapsed.iv = phi i32 [ 0, %omp_collapsed.preheader ], [ %omp_collapsed.next, %omp_collapsed.inc ]
  br label %omp_collapsed.cond

omp_collapsed.cond:                               ; preds = %omp_collapsed.header
  %omp_collapsed.cmp = icmp ult i32 %omp_collapsed.iv, %4
  br i1 %omp_collapsed.cmp, label %omp_collapsed.body, label %omp_collapsed.exit

omp_collapsed.exit:                               ; preds = %omp_collapsed.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num16)
  %omp_global_thread_num17 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num17)
  br label %omp_collapsed.after

omp_collapsed.after:                              ; preds = %omp_collapsed.exit
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_collapsed.after
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp_loop.after
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.region.cont4
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_collapsed.body:                               ; preds = %omp_collapsed.cond
  %5 = add i32 %omp_collapsed.iv, %1
  %6 = urem i32 %5, 200
  %7 = udiv i32 %5, 200
  br label %omp_loop.body

omp_loop.body:                                    ; preds = %omp_collapsed.body
  %8 = mul i32 %7, 1
  %9 = add i32 %8, 1
  br label %omp_loop.preheader5

omp_loop.preheader5:                              ; preds = %omp_loop.body
  br label %omp_loop.body8

omp_loop.body8:                                   ; preds = %omp_loop.preheader5
  %10 = mul i32 %6, 1
  %11 = add i32 %10, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body8
  store i32 %9, ptr %omp.private.alloc3, align 4
  store i32 %11, ptr %omp.private.alloc, align 4
  %12 = load i32, ptr %omp.private.alloc, align 4
  %13 = sext i32 %12 to i64
  %14 = load i32, ptr %omp.private.alloc3, align 4
  %15 = sext i32 %14 to i64
  %16 = sub nsw i64 %13, 1
  %17 = mul nsw i64 %16, 1
  %18 = mul nsw i64 %17, 1
  %19 = add nsw i64 %18, 0
  %20 = sub nsw i64 %15, 1
  %21 = mul nsw i64 %20, 1
  %22 = mul nsw i64 %21, 200
  %23 = add nsw i64 %22, %19
  %24 = getelementptr float, ptr @_QFEmat_a, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = sub nsw i64 %13, 1
  %27 = mul nsw i64 %26, 1
  %28 = mul nsw i64 %27, 1
  %29 = add nsw i64 %28, 0
  %30 = sub nsw i64 %15, 1
  %31 = mul nsw i64 %30, 1
  %32 = mul nsw i64 %31, 200
  %33 = add nsw i64 %32, %29
  %34 = getelementptr float, ptr @_QFEmat_b, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fadd contract float %25, %35
  %37 = sub nsw i64 %13, 1
  %38 = mul nsw i64 %37, 1
  %39 = mul nsw i64 %38, 1
  %40 = add nsw i64 %39, 0
  %41 = sub nsw i64 %15, 1
  %42 = mul nsw i64 %41, 1
  %43 = mul nsw i64 %42, 200
  %44 = add nsw i64 %43, %40
  %45 = getelementptr float, ptr @_QFEmat_c, i64 %44
  store float %36, ptr %45, align 4
  br label %omp.region.cont15

omp.region.cont15:                                ; preds = %omp.loop_nest.region
  br label %omp_loop.after11

omp_loop.after11:                                 ; preds = %omp.region.cont15
  br label %omp_collapsed.inc

omp_collapsed.inc:                                ; preds = %omp_loop.after11
  %omp_collapsed.next = add nuw i32 %omp_collapsed.iv, 1
  br label %omp_collapsed.header

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
declare !callback !3 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 7, !"openmp", i32 31}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!"flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)"}
!3 = !{!4}
!4 = !{i64 2, i64 -1, i64 -1, i1 true}
