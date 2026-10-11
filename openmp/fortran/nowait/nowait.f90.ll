; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclXe9f359e33a146a86a5a2a1b8d39f4a60 = comdat any

$_QQclX6E6F7761697420E6B58BE8AF95E5AE8CE68890EFBC8C622835303029203D = comdat any

@_QFEa = internal global [1000 x float] zeroinitializer
@_QFEb = internal global [1000 x float] zeroinitializer
@_QFECn = internal constant i32 1000
@_QQclXe9f359e33a146a86a5a2a1b8d39f4a60 = linkonce constant [51 x i8] c"/home/wangyz/test/openmp/fortran/nowait/nowait.f90\00", comdat
@_QQclX6E6F7761697420E6B58BE8AF95E5AE8CE68890EFBC8C622835303029203D = linkonce constant [30 x i8] c"nowait \E6\B5\8B\E8\AF\95\E5\AE\8C\E6\88\90\EF\BC\8Cb(500) =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

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
  %2 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclXe9f359e33a146a86a5a2a1b8d39f4a60, i32 23)
  %3 = call i1 @_FortranAioOutputAscii(ptr %2, ptr @_QQclX6E6F7761697420E6B58BE8AF95E5AE8CE68890EFBC8C622835303029203D, i64 30)
  %4 = load float, ptr getelementptr inbounds nuw (i8, ptr @_QFEb, i64 1996), align 4
  %5 = call i1 @_FortranAioOutputReal32(ptr %2, float %4)
  %6 = call i32 @_FortranAioEndIoStatement(ptr %2)
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %p.lastiter25 = alloca i32, align 4
  %p.lowerbound26 = alloca i32, align 4
  %p.upperbound27 = alloca i32, align 4
  %p.stride28 = alloca i32, align 4
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
  %omp.private.alloc9 = alloca i32, align 4
  br label %omp.region.after_alloca8

omp.region.after_alloca8:                         ; preds = %omp.par.entry
  br label %omp.region.after_alloca2

omp.region.after_alloca2:                         ; preds = %omp.region.after_alloca8
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
  store i32 999, ptr %p.upperbound, align 4
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
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp_loop.after
  br label %omp.private.init10

omp.private.init10:                               ; preds = %omp.region.cont5
  br label %omp.wsloop.region12

omp.wsloop.region12:                              ; preds = %omp.private.init10
  br label %omp_loop.preheader13

omp_loop.preheader13:                             ; preds = %omp.wsloop.region12
  store i32 0, ptr %p.lowerbound26, align 4
  store i32 999, ptr %p.upperbound27, align 4
  store i32 1, ptr %p.stride28, align 4
  %omp_global_thread_num29 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num29, i32 34, ptr %p.lastiter25, ptr %p.lowerbound26, ptr %p.upperbound27, ptr %p.stride28, i32 1, i32 0)
  %5 = load i32, ptr %p.lowerbound26, align 4
  %6 = load i32, ptr %p.upperbound27, align 4
  %7 = sub i32 %6, %5
  %8 = add i32 %7, 1
  br label %omp_loop.header14

omp_loop.header14:                                ; preds = %omp_loop.inc17, %omp_loop.preheader13
  %omp_loop.iv20 = phi i32 [ 0, %omp_loop.preheader13 ], [ %omp_loop.next22, %omp_loop.inc17 ]
  br label %omp_loop.cond15

omp_loop.cond15:                                  ; preds = %omp_loop.header14
  %omp_loop.cmp21 = icmp ult i32 %omp_loop.iv20, %8
  br i1 %omp_loop.cmp21, label %omp_loop.body16, label %omp_loop.exit18

omp_loop.exit18:                                  ; preds = %omp_loop.cond15
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num29)
  %omp_global_thread_num30 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num30)
  br label %omp_loop.after19

omp_loop.after19:                                 ; preds = %omp_loop.exit18
  br label %omp.region.cont11

omp.region.cont11:                                ; preds = %omp_loop.after19
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.region.cont11
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_loop.body16:                                  ; preds = %omp_loop.cond15
  %9 = add i32 %omp_loop.iv20, %5
  %10 = mul i32 %9, 1
  %11 = add i32 %10, 1
  br label %omp.loop_nest.region24

omp.loop_nest.region24:                           ; preds = %omp_loop.body16
  store i32 %11, ptr %omp.private.alloc9, align 4
  %12 = load i32, ptr %omp.private.alloc9, align 4
  %13 = sext i32 %12 to i64
  %14 = sub nsw i64 %13, 1
  %15 = mul nsw i64 %14, 1
  %16 = mul nsw i64 %15, 1
  %17 = add nsw i64 %16, 0
  %18 = getelementptr float, ptr @_QFEa, i64 %17
  %19 = load float, ptr %18, align 4
  %20 = fadd contract float %19, 1.000000e+00
  %21 = sub nsw i64 %13, 1
  %22 = mul nsw i64 %21, 1
  %23 = mul nsw i64 %22, 1
  %24 = add nsw i64 %23, 0
  %25 = getelementptr float, ptr @_QFEb, i64 %24
  store float %20, ptr %25, align 4
  br label %omp.region.cont23

omp.region.cont23:                                ; preds = %omp.loop_nest.region24
  br label %omp_loop.inc17

omp_loop.inc17:                                   ; preds = %omp.region.cont23
  %omp_loop.next22 = add nuw i32 %omp_loop.iv20, 1
  br label %omp_loop.header14

omp_loop.body:                                    ; preds = %omp_loop.cond
  %26 = add i32 %omp_loop.iv, %1
  %27 = mul i32 %26, 1
  %28 = add i32 %27, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %28, ptr %omp.private.alloc3, align 4
  %29 = load i32, ptr %omp.private.alloc3, align 4
  %30 = sitofp i32 %29 to float
  %31 = fmul contract float %30, 2.000000e+00
  %32 = sext i32 %29 to i64
  %33 = sub nsw i64 %32, 1
  %34 = mul nsw i64 %33, 1
  %35 = mul nsw i64 %34, 1
  %36 = add nsw i64 %35, 0
  %37 = getelementptr float, ptr @_QFEa, i64 %36
  store float %31, ptr %37, align 4
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
