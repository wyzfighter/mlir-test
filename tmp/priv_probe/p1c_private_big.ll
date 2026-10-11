; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclX7031635F707269766174655F6269672E66393000 = comdat any

$_QQclX703163206578706563742C676F742C6D61746368203D = comdat any

@_QFEa = internal global [2000000 x i32] zeroinitializer, align 64
@_QQclX7031635F707269766174655F6269672E66393000 = linkonce constant [20 x i8] c"p1c_private_big.f90\00", comdat
@_QQclX703163206578706563742C676F742C6D61746368203D = linkonce constant [22 x i8] c"p1c expect,got,match =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %1 = alloca i64, i64 1, align 8
  %2 = alloca i64, i64 1, align 8
  br label %entry

entry:                                            ; preds = %0
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  br label %3

3:                                                ; preds = %8, %omp.par.exit
  %4 = phi i64 [ %17, %8 ], [ 1, %omp.par.exit ]
  %5 = phi i64 [ %16, %8 ], [ 0, %omp.par.exit ]
  %6 = phi i64 [ %18, %8 ], [ 2000000, %omp.par.exit ]
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %19

8:                                                ; preds = %3
  %9 = sub nuw nsw i64 %4, 1
  %10 = mul nuw nsw i64 %9, 1
  %11 = mul nuw nsw i64 %10, 1
  %12 = add nuw nsw i64 %11, 0
  %13 = getelementptr nusw nuw i32, ptr @_QFEa, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !2
  %15 = sext i32 %14 to i64
  %16 = add i64 %5, %15
  %17 = add nsw i64 %4, 1
  %18 = sub i64 %6, 1
  br label %3

19:                                               ; preds = %3
  store i64 %5, ptr %1, align 8, !tbaa !8
  store i64 2002001000000, ptr %2, align 8, !tbaa !11
  %20 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX7031635F707269766174655F6269672E66393000, i32 20) #2
  %21 = call i1 @_FortranAioOutputAscii(ptr %20, ptr @_QQclX703163206578706563742C676F742C6D61746368203D, i64 22) #2
  %22 = load i64, ptr %2, align 8, !tbaa !11
  %23 = call i1 @_FortranAioOutputInteger64(ptr %20, i64 %22) #2
  %24 = load i64, ptr %1, align 8, !tbaa !8
  %25 = call i1 @_FortranAioOutputInteger64(ptr %20, i64 %24) #2
  %26 = load i64, ptr %1, align 8, !tbaa !8
  %27 = load i64, ptr %2, align 8, !tbaa !11
  %28 = icmp eq i64 %26, %27
  %29 = call i1 @_FortranAioOutputLogical(ptr %20, i1 %28) #2
  %30 = call i32 @_FortranAioEndIoStatement(ptr %20) #2
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
  %2 = alloca i32, i64 1, align 4
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
  store i32 1999999, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @2, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
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
  %7 = add i32 %omp_loop.iv, %3
  %8 = mul i32 %7, 1
  %9 = add i32 %8, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %9, ptr %1, align 4, !tbaa !13
  store i32 0, ptr %2, align 4, !tbaa !13
  %10 = load i32, ptr %2, align 4, !tbaa !13
  %11 = load i32, ptr %1, align 4, !tbaa !13
  %12 = add i32 %10, %11
  store i32 %12, ptr %2, align 4, !tbaa !13
  %13 = load i32, ptr %2, align 4, !tbaa !13
  %14 = add i32 %13, 1000
  store i32 %14, ptr %2, align 4, !tbaa !13
  %15 = load i32, ptr %2, align 4, !tbaa !13
  %16 = load i32, ptr %1, align 4, !tbaa !13
  %17 = sext i32 %16 to i64
  %18 = sub nuw nsw i64 %17, 1
  %19 = mul nuw nsw i64 %18, 1
  %20 = mul nuw nsw i64 %19, 1
  %21 = add nuw nsw i64 %20, 0
  %22 = getelementptr nusw nuw i32, ptr @_QFEa, i64 %21
  store i32 %15, ptr %22, align 4, !tbaa !2
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

declare zeroext i1 @_FortranAioOutputInteger64(ptr, i64)

declare zeroext i1 @_FortranAioOutputLogical(ptr, i1 zeroext)

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
declare !callback !14 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }
attributes #2 = { memory(argmem: readwrite, inaccessiblemem: readwrite) }

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
!9 = !{!"allocated data/_QFEs", !10, i64 0}
!10 = !{!"allocated data", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"allocated data/_QFEexpect", !10, i64 0}
!13 = !{!10, !10, i64 0}
!14 = !{!15}
!15 = !{i64 2, i64 -1, i64 -1, i1 true}
