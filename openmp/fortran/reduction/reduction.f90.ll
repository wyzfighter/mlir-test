; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclX5a5f96ac7e6e290e36c5a84d2907c771 = comdat any

$_QQclXE695B0E7BB84E680BBE5928CEFBC9A = comdat any

$_QQclXE695B0E7BB84E69C80E5A4A7E580BCEFBC9A = comdat any

@_QFEdata = internal global [1000 x float] zeroinitializer
@_QFECn = internal constant i32 1000
@_QQclX5a5f96ac7e6e290e36c5a84d2907c771 = linkonce constant [57 x i8] c"/home/wangyz/test/openmp/fortran/reduction/reduction.f90\00", comdat
@_QQclXE695B0E7BB84E680BBE5928CEFBC9A = linkonce constant [15 x i8] c"\E6\95\B0\E7\BB\84\E6\80\BB\E5\92\8C\EF\BC\9A", comdat
@_QQclXE695B0E7BB84E69C80E5A4A7E580BCEFBC9A = linkonce constant [18 x i8] c"\E6\95\B0\E7\BB\84\E6\9C\80\E5\A4\A7\E5\80\BC\EF\BC\9A", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8

define void @_QQmain() {
  %structArg = alloca { ptr, ptr }, align 8
  %1 = alloca float, i64 1, align 4
  %2 = alloca float, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  br label %4

4:                                                ; preds = %8, %0
  %5 = phi i32 [ %19, %8 ], [ 1, %0 ]
  %6 = phi i64 [ %20, %8 ], [ 1000, %0 ]
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %21

8:                                                ; preds = %4
  store i32 %5, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = sitofp i32 %9 to float
  %11 = fmul contract float %10, 1.500000e+00
  %12 = sext i32 %9 to i64
  %13 = sub nsw i64 %12, 1
  %14 = mul nsw i64 %13, 1
  %15 = mul nsw i64 %14, 1
  %16 = add nsw i64 %15, 0
  %17 = getelementptr float, ptr @_QFEdata, i64 %16
  store float %11, ptr %17, align 4
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  %20 = sub i64 %6, 1
  br label %4

21:                                               ; preds = %4
  store i32 %5, ptr %3, align 4
  store float 0.000000e+00, ptr %1, align 4
  store float 0.000000e+00, ptr %2, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %21
  %gep_ = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %1, ptr %gep_, align 8
  %gep_10 = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %2, ptr %gep_10, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %22 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX5a5f96ac7e6e290e36c5a84d2907c771, i32 24)
  %23 = call i1 @_FortranAioOutputAscii(ptr %22, ptr @_QQclXE695B0E7BB84E680BBE5928CEFBC9A, i64 15)
  %24 = load float, ptr %1, align 4
  %25 = call i1 @_FortranAioOutputReal32(ptr %22, float %24)
  %26 = call i32 @_FortranAioEndIoStatement(ptr %22)
  %27 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX5a5f96ac7e6e290e36c5a84d2907c771, i32 25)
  %28 = call i1 @_FortranAioOutputAscii(ptr %27, ptr @_QQclXE695B0E7BB84E69C80E5A4A7E580BCEFBC9A, i64 18)
  %29 = load float, ptr %2, align 4
  %30 = call i1 @_FortranAioOutputReal32(ptr %27, float %29)
  %31 = call i32 @_FortranAioEndIoStatement(ptr %27)
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8, !align !3
  %gep_1 = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8, !align !3
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %omp.private.alloc = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %red.array = alloca [2 x ptr], align 8
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
  br label %omp.reduction.init

omp.reduction.init:                               ; preds = %omp.private.init
  %omp_orig = load float, ptr %loadgep_, align 4
  store float 0.000000e+00, ptr %2, align 4
  %omp_orig3 = load float, ptr %loadgep_2, align 4
  store float 0xC7EFFFFFE0000000, ptr %3, align 4
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.reduction.init
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  store i32 999, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num6, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %4 = load i32, ptr %p.lowerbound, align 4
  %5 = load i32, ptr %p.upperbound, align 4
  %6 = sub i32 %5, %4
  %7 = add i32 %6, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %7
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num6)
  %omp_global_thread_num7 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num7)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp_loop.after
  %red.array.elem.0 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 0
  store ptr %2, ptr %red.array.elem.0, align 8
  %red.array.elem.1 = getelementptr inbounds [2 x ptr], ptr %red.array, i64 0, i64 1
  store ptr %3, ptr %red.array.elem.1, align 8
  %omp_global_thread_num8 = call i32 @__kmpc_global_thread_num(ptr @1)
  %reduce = call i32 @__kmpc_reduce(ptr @1, i32 %omp_global_thread_num8, i32 2, i64 16, ptr %red.array, ptr @.omp.reduction.func, ptr @.gomp_critical_user_.reduction.var)
  switch i32 %reduce, label %reduce.finalize [
    i32 1, label %reduce.switch.nonatomic
    i32 2, label %reduce.switch.atomic
  ]

reduce.switch.atomic:                             ; preds = %omp.region.cont4
  unreachable

reduce.switch.nonatomic:                          ; preds = %omp.region.cont4
  %red.value.0 = load float, ptr %loadgep_, align 4
  %red.private.value.0 = load float, ptr %2, align 4
  %8 = fadd contract float %red.value.0, %red.private.value.0
  store float %8, ptr %loadgep_, align 4
  %red.value.1 = load float, ptr %loadgep_2, align 4
  %red.private.value.1 = load float, ptr %3, align 4
  %9 = call contract float @llvm.maxnum.f32(float %red.value.1, float %red.private.value.1)
  store float %9, ptr %loadgep_2, align 4
  call void @__kmpc_end_reduce(ptr @1, i32 %omp_global_thread_num8, ptr @.gomp_critical_user_.reduction.var)
  br label %reduce.finalize

reduce.finalize:                                  ; preds = %reduce.switch.nonatomic, %omp.region.cont4
  %omp_global_thread_num9 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num9)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %reduce.finalize
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %10 = add i32 %omp_loop.iv, %4
  %11 = mul i32 %10, 1
  %12 = add i32 %11, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %12, ptr %omp.private.alloc, align 4
  %13 = load float, ptr %2, align 4
  %14 = load i32, ptr %omp.private.alloc, align 4
  %15 = sext i32 %14 to i64
  %16 = sub nsw i64 %15, 1
  %17 = mul nsw i64 %16, 1
  %18 = mul nsw i64 %17, 1
  %19 = add nsw i64 %18, 0
  %20 = getelementptr float, ptr @_QFEdata, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = fadd contract float %13, %21
  store float %22, ptr %2, align 4
  %23 = load float, ptr %3, align 4
  %24 = load i32, ptr %omp.private.alloc, align 4
  %25 = sext i32 %24 to i64
  %26 = sub nsw i64 %25, 1
  %27 = mul nsw i64 %26, 1
  %28 = mul nsw i64 %27, 1
  %29 = add nsw i64 %28, 0
  %30 = getelementptr float, ptr @_QFEdata, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = fcmp contract ogt float %23, %31
  %33 = select i1 %32, float %23, float %31
  store float %33, ptr %3, align 4
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont5
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

define internal void @.omp.reduction.func(ptr %0, ptr %1) {
  %3 = getelementptr inbounds [2 x ptr], ptr %0, i64 0, i64 0
  %4 = load ptr, ptr %3, align 8
  %5 = load float, ptr %4, align 4
  %6 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load float, ptr %7, align 4
  %9 = fadd contract float %5, %8
  store float %9, ptr %4, align 4
  %10 = getelementptr inbounds [2 x ptr], ptr %0, i64 0, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = load float, ptr %11, align 4
  %13 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 1
  %14 = load ptr, ptr %13, align 8
  %15 = load float, ptr %14, align 4
  %16 = call contract float @llvm.maxnum.f32(float %12, float %15)
  store float %16, ptr %11, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(ptr, i32, i32, i64, ptr, ptr, ptr) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(ptr, i32, ptr) #1

; Function Attrs: nounwind
declare !callback !4 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 7, !"openmp", i32 31}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!"flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)"}
!3 = !{i64 4}
!4 = !{!5}
!5 = !{i64 2, i64 -1, i64 -1, i1 true}
