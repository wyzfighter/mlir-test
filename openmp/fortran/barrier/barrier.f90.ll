; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclX367378bf7aa5ea84c27cddf0caa3f3cf = comdat any

$_QQclXc8e13c616d58a704f00d85803fa09440 = comdat any

@_QFEdata = internal global [100 x float] zeroinitializer
@_QFECn = internal constant i32 100
@_QQclX367378bf7aa5ea84c27cddf0caa3f3cf = linkonce constant [53 x i8] c"/home/wangyz/test/openmp/fortran/barrier/barrier.f90\00", comdat
@_QQclXc8e13c616d58a704f00d85803fa09440 = linkonce constant [39 x i8] c"\E5\B1\8F\E9\9A\9C\E5\90\8C\E6\AD\A5\E5\90\8E\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8Cdata(5) =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 34, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %1 = alloca i32, i64 1, align 4
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %2 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX367378bf7aa5ea84c27cddf0caa3f3cf, i32 26)
  %3 = call i1 @_FortranAioOutputAscii(ptr %2, ptr @_QQclXc8e13c616d58a704f00d85803fa09440, i64 39)
  %4 = load float, ptr getelementptr inbounds nuw (i8, ptr @_QFEdata, i64 16), align 4
  %5 = call i1 @_FortranAioOutputReal32(ptr %2, float %4)
  %6 = call i32 @_FortranAioEndIoStatement(ptr %2)
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %p.lastiter27 = alloca i32, align 4
  %p.lowerbound28 = alloca i32, align 4
  %p.upperbound29 = alloca i32, align 4
  %p.stride30 = alloca i32, align 4
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
  %omp.private.alloc11 = alloca i32, align 4
  br label %omp.region.after_alloca10

omp.region.after_alloca10:                        ; preds = %omp.par.entry
  br label %omp.region.after_alloca2

omp.region.after_alloca2:                         ; preds = %omp.region.after_alloca10
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %omp.region.after_alloca2
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca
  br label %omp.private.init

omp.private.init:                                 ; preds = %omp.par.region
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.private.init
  br label %omp.private.init4

omp.private.init4:                                ; preds = %omp.par.region1
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.private.init4
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  store i32 99, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num7 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num7, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
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
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num7)
  %omp_global_thread_num8 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num8)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp_loop.after
  %omp_global_thread_num9 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @3, i32 %omp_global_thread_num9)
  br label %omp.private.init12

omp.private.init12:                               ; preds = %omp.region.cont5
  br label %omp.wsloop.region14

omp.wsloop.region14:                              ; preds = %omp.private.init12
  br label %omp_loop.preheader15

omp_loop.preheader15:                             ; preds = %omp.wsloop.region14
  store i32 0, ptr %p.lowerbound28, align 4
  store i32 99, ptr %p.upperbound29, align 4
  store i32 1, ptr %p.stride30, align 4
  %omp_global_thread_num31 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num31, i32 34, ptr %p.lastiter27, ptr %p.lowerbound28, ptr %p.upperbound29, ptr %p.stride30, i32 1, i32 0)
  %5 = load i32, ptr %p.lowerbound28, align 4
  %6 = load i32, ptr %p.upperbound29, align 4
  %7 = sub i32 %6, %5
  %8 = add i32 %7, 1
  br label %omp_loop.header16

omp_loop.header16:                                ; preds = %omp_loop.inc19, %omp_loop.preheader15
  %omp_loop.iv22 = phi i32 [ 0, %omp_loop.preheader15 ], [ %omp_loop.next24, %omp_loop.inc19 ]
  br label %omp_loop.cond17

omp_loop.cond17:                                  ; preds = %omp_loop.header16
  %omp_loop.cmp23 = icmp ult i32 %omp_loop.iv22, %8
  br i1 %omp_loop.cmp23, label %omp_loop.body18, label %omp_loop.exit20

omp_loop.exit20:                                  ; preds = %omp_loop.cond17
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num31)
  %omp_global_thread_num32 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num32)
  br label %omp_loop.after21

omp_loop.after21:                                 ; preds = %omp_loop.exit20
  br label %omp.region.cont13

omp.region.cont13:                                ; preds = %omp_loop.after21
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.region.cont13
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_loop.body18:                                  ; preds = %omp_loop.cond17
  %9 = add i32 %omp_loop.iv22, %5
  %10 = mul i32 %9, 1
  %11 = add i32 %10, 1
  br label %omp.loop_nest.region26

omp.loop_nest.region26:                           ; preds = %omp_loop.body18
  store i32 %11, ptr %omp.private.alloc11, align 4
  %12 = load i32, ptr %omp.private.alloc11, align 4
  %13 = sext i32 %12 to i64
  %14 = sub nsw i64 %13, 1
  %15 = mul nsw i64 %14, 1
  %16 = mul nsw i64 %15, 1
  %17 = add nsw i64 %16, 0
  %18 = getelementptr float, ptr @_QFEdata, i64 %17
  %19 = load float, ptr %18, align 4
  %20 = fmul contract float %19, %19
  store float %20, ptr %18, align 4
  br label %omp.region.cont25

omp.region.cont25:                                ; preds = %omp.loop_nest.region26
  br label %omp_loop.inc19

omp_loop.inc19:                                   ; preds = %omp.region.cont25
  %omp_loop.next24 = add nuw i32 %omp_loop.iv22, 1
  br label %omp_loop.header16

omp_loop.body:                                    ; preds = %omp_loop.cond
  %21 = add i32 %omp_loop.iv, %1
  %22 = mul i32 %21, 1
  %23 = add i32 %22, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %23, ptr %omp.private.alloc3, align 4
  %24 = load i32, ptr %omp.private.alloc3, align 4
  %25 = sitofp i32 %24 to float
  %26 = sext i32 %24 to i64
  %27 = sub nsw i64 %26, 1
  %28 = mul nsw i64 %27, 1
  %29 = mul nsw i64 %28, 1
  %30 = add nsw i64 %29, 0
  %31 = getelementptr float, ptr @_QFEdata, i64 %30
  store float %25, ptr %31, align 4
  br label %omp.region.cont6

omp.region.cont6:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont6
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
