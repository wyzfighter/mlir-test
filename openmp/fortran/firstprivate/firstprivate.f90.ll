; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclXec43bae8df2f3aa38a9e6441f25a20ac = comdat any

$_QQclXE7BB93E69E9CE695B0E7BB84E7ACACE4B880E4B8AAE58583E7B4A0EFBC9A = comdat any

@_QFECn = internal constant i32 10
@_QFEresult = internal global [10 x float] zeroinitializer
@_QQclXec43bae8df2f3aa38a9e6441f25a20ac = linkonce constant [63 x i8] c"/home/wangyz/test/openmp/fortran/firstprivate/firstprivate.f90\00", comdat
@_QQclXE7BB93E69E9CE695B0E7BB84E7ACACE4B880E4B8AAE58583E7B4A0EFBC9A = linkonce constant [30 x i8] c"\E7\BB\93\E6\9E\9C\E6\95\B0\E7\BB\84\E7\AC\AC\E4\B8\80\E4\B8\AA\E5\85\83\E7\B4\A0\EF\BC\9A", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %structArg = alloca { ptr }, align 8
  %1 = alloca i32, i64 1, align 4
  %2 = alloca float, i64 1, align 4
  store float 1.000000e+02, ptr %2, align 4
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr }, ptr %structArg, i32 0, i32 0
  store ptr %2, ptr %gep_, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %3 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclXec43bae8df2f3aa38a9e6441f25a20ac, i32 17)
  %4 = call i1 @_FortranAioOutputAscii(ptr %3, ptr @_QQclXE7BB93E69E9CE695B0E7BB84E7ACACE4B880E4B8AAE58583E7B4A0EFBC9A, i64 30)
  %5 = load float, ptr @_QFEresult, align 4
  %6 = call i1 @_FortranAioOutputReal32(ptr %3, float %5)
  %7 = call i32 @_FortranAioEndIoStatement(ptr %3)
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
  %omp.private.alloc = alloca float, align 4
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
  br label %omp.private.copy

omp.private.copy:                                 ; preds = %omp.private.init
  %2 = load float, ptr %loadgep_, align 4
  store float %2, ptr %omp.private.alloc, align 4
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.private.copy
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  store i32 9, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num6, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %3 = load i32, ptr %p.lowerbound, align 4
  %4 = load i32, ptr %p.upperbound, align 4
  %5 = sub i32 %4, %3
  %6 = add i32 %5, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %6
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num6)
  %omp_global_thread_num7 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num7)
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
  %7 = add i32 %omp_loop.iv, %3
  %8 = mul i32 %7, 1
  %9 = add i32 %8, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %9, ptr %omp.private.alloc3, align 4
  %10 = load float, ptr %omp.private.alloc, align 4
  %11 = load i32, ptr %omp.private.alloc3, align 4
  %12 = sitofp i32 %11 to float
  %13 = fadd contract float %10, %12
  %14 = sext i32 %11 to i64
  %15 = sub nsw i64 %14, 1
  %16 = mul nsw i64 %15, 1
  %17 = mul nsw i64 %16, 1
  %18 = add nsw i64 %17, 0
  %19 = getelementptr float, ptr @_QFEresult, i64 %18
  store float %13, ptr %19, align 4
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
