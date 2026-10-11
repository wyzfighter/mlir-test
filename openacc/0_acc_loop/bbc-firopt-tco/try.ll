; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QFEa = internal global [100000 x i32] zeroinitializer, align 64
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %structArg = alloca { ptr, ptr }, align 8
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  store i32 1234, ptr %1, align 4, !tbaa !2
  br label %entry

entry:                                            ; preds = %0
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %2, ptr %gep_, align 8
  %gep_7 = getelementptr { ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %1, ptr %gep_7, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8, !align !8
  %gep_1 = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8, !align !8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %omp.private.alloc = alloca i32, align 4
  %omp.private.alloc1 = alloca i32, align 4
  br label %omp.region.after_alloca3

omp.region.after_alloca3:                         ; preds = %omp.par.entry
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %omp.region.after_alloca3
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca
  br label %omp.private.init

omp.private.init:                                 ; preds = %omp.par.region
  br label %omp.private.copy

omp.private.copy:                                 ; preds = %omp.private.init
  %2 = load i32, ptr %loadgep_, align 4
  store i32 %2, ptr %omp.private.alloc, align 4
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.private.copy
  %3 = load i32, ptr %loadgep_2, align 4, !tbaa !2
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.par.region2
  %4 = select i1 false, i32 %3, i32 1
  %5 = select i1 false, i32 1, i32 %3
  %6 = sub nsw i32 %5, %4
  %7 = icmp slt i32 %5, %4
  %8 = udiv i32 %6, 1
  %9 = add i32 %8, 1
  %omp_loop.tripcount = select i1 %7, i32 0, i32 %9
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  %10 = sub i32 %omp_loop.tripcount, 1
  store i32 %10, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @2, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %11 = load i32, ptr %p.lowerbound, align 4
  %12 = load i32, ptr %p.upperbound, align 4
  %13 = sub i32 %12, %11
  %14 = add i32 %13, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %14
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
  %15 = add i32 %omp_loop.iv, %11
  %16 = mul i32 %15, 1
  %17 = add i32 %16, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %17, ptr %omp.private.alloc, align 4, !tbaa !9
  %18 = load i32, ptr %omp.private.alloc, align 4, !tbaa !9
  %19 = mul i32 %18, %18
  %20 = add nsw i32 %18, %18
  %21 = sext i32 %20 to i64
  %22 = sub nuw nsw i64 %21, 1
  %23 = mul nuw nsw i64 %22, 1
  %24 = mul nuw nsw i64 %23, 1
  %25 = add nuw nsw i64 %24, 0
  %26 = getelementptr nusw nuw i32, ptr @_QFEa, i64 %25
  store i32 %19, ptr %26, align 4, !tbaa !10
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont5
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

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
declare !callback !13 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)"}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!3, !3, i64 0}
!3 = !{!"allocated data/_QFEn", !4, i64 0}
!4 = !{!"allocated data", !5, i64 0}
!5 = !{!"any data access", !6, i64 0}
!6 = !{!"any access", !7, i64 0}
!7 = !{!"Flang function root _QQmain"}
!8 = !{i64 4}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"global data/_QFEa", !12, i64 0}
!12 = !{!"global data", !5, i64 0}
!13 = !{!14}
!14 = !{i64 2, i64 -1, i64 -1, i1 true}
