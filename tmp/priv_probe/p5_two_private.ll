; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclX70355F74776F5F707269766174652E66393000 = comdat any

$_QQclX70352066697273742C6C6173742C73756D203D = comdat any

@_QFEa = internal global [100 x i32] zeroinitializer, align 64
@_QQclX70355F74776F5F707269766174652E66393000 = linkonce constant [19 x i8] c"p5_two_private.f90\00", comdat
@_QQclX70352066697273742C6C6173742C73756D203D = linkonce constant [19 x i8] c"p5 first,last,sum =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  br label %entry

entry:                                            ; preds = %0
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %1 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX70355F74776F5F707269766174652E66393000, i32 17) #3
  %2 = call i1 @_FortranAioOutputAscii(ptr %1, ptr @_QQclX70352066697273742C6C6173742C73756D203D, i64 19) #3
  %3 = load i32, ptr @_QFEa, align 4, !tbaa !2
  %4 = call i1 @_FortranAioOutputInteger32(ptr %1, i32 %3) #3
  %5 = load i32, ptr getelementptr inbounds nuw (i8, ptr @_QFEa, i64 396), align 4, !tbaa !2
  %6 = call i1 @_FortranAioOutputInteger32(ptr %1, i32 %5) #3
  br label %7

7:                                                ; preds = %12, %omp.par.exit
  %8 = phi i64 [ %20, %12 ], [ 1, %omp.par.exit ]
  %9 = phi i32 [ %19, %12 ], [ 0, %omp.par.exit ]
  %10 = phi i64 [ %21, %12 ], [ 100, %omp.par.exit ]
  %11 = icmp sgt i64 %10, 0
  br i1 %11, label %12, label %22

12:                                               ; preds = %7
  %13 = sub nuw nsw i64 %8, 1
  %14 = mul nuw nsw i64 %13, 1
  %15 = mul nuw nsw i64 %14, 1
  %16 = add nuw nsw i64 %15, 0
  %17 = getelementptr nusw nuw i32, ptr @_QFEa, i64 %16
  %18 = load i32, ptr %17, align 4, !tbaa !2
  %19 = add i32 %9, %18
  %20 = add nsw i64 %8, 1
  %21 = sub i64 %10, 1
  br label %7

22:                                               ; preds = %7
  %23 = call i1 @_FortranAioOutputInteger32(ptr %1, i32 %9) #3
  %24 = call i32 @_FortranAioEndIoStatement(ptr %1) #3
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
  %1 = alloca i32, i64 1, align 4
  %2 = alloca float, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  br label %omp.region.after_alloca2

omp.region.after_alloca2:                         ; preds = %omp.par.entry
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %omp.region.after_alloca2
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.par.region1
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  store i32 99, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @2, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
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
  call void @__kmpc_for_static_fini(ptr @2, i32 %omp_global_thread_num)
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @3, i32 %omp_global_thread_num5)
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
  %8 = add i32 %omp_loop.iv, %4
  %9 = mul i32 %8, 1
  %10 = add i32 %9, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %10, ptr %1, align 4, !tbaa !8
  %11 = load i32, ptr %1, align 4, !tbaa !8
  %12 = add i32 %11, 5
  store i32 %12, ptr %3, align 4, !tbaa !8
  %13 = load i32, ptr %3, align 4, !tbaa !8
  %14 = sitofp i32 %13 to float
  store float %14, ptr %2, align 4, !tbaa !8
  %15 = load i32, ptr %3, align 4, !tbaa !8
  %16 = load float, ptr %2, align 4, !tbaa !8
  %17 = call i32 @llvm.lround.i32.f32(float %16)
  %18 = add i32 %15, %17
  %19 = load i32, ptr %3, align 4, !tbaa !8
  %20 = sub i32 %18, %19
  %21 = load i32, ptr %1, align 4, !tbaa !8
  %22 = sext i32 %21 to i64
  %23 = sub nuw nsw i64 %22, 1
  %24 = mul nuw nsw i64 %23, 1
  %25 = mul nuw nsw i64 %24, 1
  %26 = add nuw nsw i64 %25, 0
  %27 = getelementptr nusw nuw i32, ptr @_QFEa, i64 %26
  store i32 %20, ptr %27, align 4, !tbaa !2
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont4
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lround.i32.f32(float) #1

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
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #2

; Function Attrs: nounwind
declare !callback !10 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nounwind }
attributes #3 = { memory(argmem: readwrite, inaccessiblemem: readwrite) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)"}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!3, !3, i64 0}
!3 = !{!"global data/_QFEa", !4, i64 0}
!4 = !{!"global data", !5, i64 0}
!5 = !{!"any data access", !6, i64 0}
!6 = !{!"any access", !7, i64 0}
!7 = !{!"Flang function root _QQmain"}
!8 = !{!9, !9, i64 0}
!9 = !{!"allocated data", !5, i64 0}
!10 = !{!11}
!11 = !{i64 2, i64 -1, i64 -1, i1 true}
