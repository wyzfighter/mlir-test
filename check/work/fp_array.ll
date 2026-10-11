; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclX28412C49302C412C493029 = comdat any

$_QQclX66705F61727261792E66393000 = comdat any

$_QQclX66705F617272617920 = comdat any

$_QQclX20 = comdat any

@_QQroX5xi4X0 = internal constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 64
@_QQclX28412C49302C412C493029 = linkonce constant [11 x i8] c"(A,I0,A,I0)", comdat
@_QQclX66705F61727261792E66393000 = linkonce constant [13 x i8] c"fp_array.f90\00", comdat
@_QQclX66705F617272617920 = linkonce constant [9 x i8] c"fp_array ", comdat
@_QQclX20 = linkonce constant [1 x i8] c" ", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %1 = alloca i32, i64 1, align 4
  %2 = alloca [5 x i32], i64 1, align 4
  br label %3

3:                                                ; preds = %7, %0
  %4 = phi i64 [ %19, %7 ], [ 1, %0 ]
  %5 = phi i64 [ %20, %7 ], [ 5, %0 ]
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %21

7:                                                ; preds = %3
  %8 = sub nuw nsw i64 %4, 1
  %9 = mul nuw nsw i64 %8, 1
  %10 = mul nuw nsw i64 %9, 1
  %11 = add nuw nsw i64 %10, 0
  %12 = getelementptr nusw nuw i32, ptr @_QQroX5xi4X0, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !2
  %14 = sub nuw nsw i64 %4, 1
  %15 = mul nuw nsw i64 %14, 1
  %16 = mul nuw nsw i64 %15, 1
  %17 = add nuw nsw i64 %16, 0
  %18 = getelementptr nusw nuw i32, ptr %2, i64 %17
  store i32 %13, ptr %18, align 4, !tbaa !8
  %19 = add nsw i64 %4, 1
  %20 = sub i64 %5, 1
  br label %3

21:                                               ; preds = %3
  br label %omp_parallel

omp_parallel:                                     ; preds = %21
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
  %omp.private.alloc = alloca [5 x i32], align 4
  %omp.private.alloc1 = alloca i32, align 4
  br label %omp.region.after_alloca3

omp.region.after_alloca3:                         ; preds = %omp.par.entry
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %omp.region.after_alloca3
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca
  br label %omp.private.init

omp.private.init:                                 ; preds = %omp.par.region
  br label %omp.par.region2

omp.par.region2:                                  ; preds = %omp.private.init
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.par.region2
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
  %5 = add i32 %omp_loop.iv, %1
  %6 = mul i32 %5, 1
  %7 = add i32 %6, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %7, ptr %omp.private.alloc1, align 4, !tbaa !11
  %8 = load i32, ptr %omp.private.alloc1, align 4, !tbaa !11
  %9 = sext i32 %8 to i64
  %10 = sub nuw nsw i64 %9, 1
  %11 = mul nuw nsw i64 %10, 1
  %12 = mul nuw nsw i64 %11, 1
  %13 = add nuw nsw i64 %12, 0
  %14 = getelementptr nusw nuw i32, ptr %omp.private.alloc, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !11
  %16 = add i32 %15, %8
  store i32 %16, ptr %14, align 4, !tbaa !11
  %17 = call ptr @_FortranAioBeginExternalFormattedOutput(ptr @_QQclX28412C49302C412C493029, i64 11, ptr null, i32 6, ptr @_QQclX66705F61727261792E66393000, i32 20) #2
  %18 = call i1 @_FortranAioOutputAscii(ptr %17, ptr @_QQclX66705F617272617920, i64 9) #2
  %19 = load i32, ptr %omp.private.alloc1, align 4, !tbaa !11
  %20 = call i1 @_FortranAioOutputInteger32(ptr %17, i32 %19) #2
  %21 = call i1 @_FortranAioOutputAscii(ptr %17, ptr @_QQclX20, i64 1) #2
  %22 = load i32, ptr %omp.private.alloc1, align 4, !tbaa !11
  %23 = sext i32 %22 to i64
  %24 = sub nuw nsw i64 %23, 1
  %25 = mul nuw nsw i64 %24, 1
  %26 = mul nuw nsw i64 %25, 1
  %27 = add nuw nsw i64 %26, 0
  %28 = getelementptr nusw nuw i32, ptr %omp.private.alloc, i64 %27
  %29 = load i32, ptr %28, align 4, !tbaa !11
  %30 = call i1 @_FortranAioOutputInteger32(ptr %17, i32 %29) #2
  %31 = call i32 @_FortranAioEndIoStatement(ptr %17) #2
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont5
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
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
declare !callback !12 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }
attributes #2 = { memory(argmem: readwrite, inaccessiblemem: readwrite) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)"}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!3, !3, i64 0}
!3 = !{!"global data/_QQro.5xi4.0", !4, i64 0}
!4 = !{!"global data", !5, i64 0}
!5 = !{!"any data access", !6, i64 0}
!6 = !{!"any access", !7, i64 0}
!7 = !{!"Flang function root _QQmain"}
!8 = !{!9, !9, i64 0}
!9 = !{!"allocated data/_QFEb", !10, i64 0}
!10 = !{!"allocated data", !5, i64 0}
!11 = !{!5, !5, i64 0}
!12 = !{!13}
!13 = !{i64 2, i64 -1, i64 -1, i1 true}
