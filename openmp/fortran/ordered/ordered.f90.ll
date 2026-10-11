; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclXe920e69a05a69e343c122eac0e095f65 = comdat any

$_QQclXE8BFADE4BBA3 = comdat any

$_QQclXE8AEA1E7AE97E7BB93E69E9CEFBC9A = comdat any

@_QFECn = internal constant i32 10
@_QFEresult = internal global [10 x i32] zeroinitializer
@_QQclXe920e69a05a69e343c122eac0e095f65 = linkonce constant [53 x i8] c"/home/wangyz/test/openmp/fortran/ordered/ordered.f90\00", comdat
@_QQclXE8BFADE4BBA3 = linkonce constant [6 x i8] c"\E8\BF\AD\E4\BB\A3", comdat
@_QQclXE8AEA1E7AE97E7BB93E69E9CEFBC9A = linkonce constant [15 x i8] c"\E8\AE\A1\E7\AE\97\E7\BB\93\E6\9E\9C\EF\BC\9A", comdat
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
  store i32 1, ptr %p.lowerbound, align 4
  store i32 10, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num7 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_dispatch_init_4u(ptr @1, i32 %omp_global_thread_num7, i32 66, i32 1, i32 10, i32 1, i32 1)
  br label %omp_loop.preheader.outer.cond

omp_loop.preheader.outer.cond:                    ; preds = %omp_loop.cond, %omp_loop.preheader
  %1 = call i32 @__kmpc_dispatch_next_4u(ptr @1, i32 %omp_global_thread_num7, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride)
  %2 = icmp ne i32 %1, 0
  %3 = load i32, ptr %p.lowerbound, align 4
  %lb = sub i32 %3, 1
  br i1 %2, label %omp_loop.header, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.preheader.outer.cond
  %omp_global_thread_num8 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num8)
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

omp_loop.header:                                  ; preds = %omp_loop.preheader.outer.cond, %omp_loop.inc
  %omp_loop.iv = phi i32 [ %lb, %omp_loop.preheader.outer.cond ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %ub = load i32, ptr %p.upperbound, align 4
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %ub
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.preheader.outer.cond

omp_loop.body:                                    ; preds = %omp_loop.cond
  %4 = mul i32 %omp_loop.iv, 1
  %5 = add i32 %4, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %5, ptr %omp.private.alloc, align 4
  %6 = load i32, ptr %omp.private.alloc, align 4
  %7 = mul i32 %6, %6
  %8 = sext i32 %6 to i64
  %9 = sub nsw i64 %8, 1
  %10 = mul nsw i64 %9, 1
  %11 = mul nsw i64 %10, 1
  %12 = add nsw i64 %11, 0
  %13 = getelementptr i32, ptr @_QFEresult, i64 %12
  store i32 %7, ptr %13, align 4
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_ordered(ptr @1, i32 %omp_global_thread_num5)
  br label %omp.ordered.region

omp.ordered.region:                               ; preds = %omp.loop_nest.region
  %14 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclXe920e69a05a69e343c122eac0e095f65, i32 14)
  %15 = call i1 @_FortranAioOutputAscii(ptr %14, ptr @_QQclXE8BFADE4BBA3, i64 6)
  %16 = load i32, ptr %omp.private.alloc, align 4
  %17 = call i1 @_FortranAioOutputInteger32(ptr %14, i32 %16)
  %18 = call i1 @_FortranAioOutputAscii(ptr %14, ptr @_QQclXE8AEA1E7AE97E7BB93E69E9CEFBC9A, i64 15)
  %19 = load i32, ptr %omp.private.alloc, align 4
  %20 = sext i32 %19 to i64
  %21 = sub nsw i64 %20, 1
  %22 = mul nsw i64 %21, 1
  %23 = mul nsw i64 %22, 1
  %24 = add nsw i64 %23, 0
  %25 = getelementptr i32, ptr @_QFEresult, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = call i1 @_FortranAioOutputInteger32(ptr %14, i32 %26)
  %28 = call i32 @_FortranAioEndIoStatement(ptr %14)
  br label %omp.region.cont6

omp.region.cont6:                                 ; preds = %omp.ordered.region
  br label %omp_region.finalize

omp_region.finalize:                              ; preds = %omp.region.cont6
  call void @__kmpc_end_ordered(ptr @1, i32 %omp_global_thread_num5)
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp_region.finalize
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont4
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  call void @__kmpc_dispatch_fini_4u(ptr @1, i32 %omp_global_thread_num7)
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

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
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_ordered(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_ordered(ptr, i32) #1

; Function Attrs: nounwind
declare void @__kmpc_dispatch_init_4u(ptr, i32, i32, i32, i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_dispatch_next_4u(ptr, i32, ptr, ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_dispatch_fini_4u(ptr, i32) #0

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
