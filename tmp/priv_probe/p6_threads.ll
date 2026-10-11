; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclX70365F746872656164732E66393000 = comdat any

$_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D = comdat any

@_QFEtid = internal global [1000 x i32] zeroinitializer, align 64
@_QQclX70365F746872656164732E66393000 = linkonce constant [15 x i8] c"p6_threads.f90\00", comdat
@_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D = linkonce constant [25 x i8] c"p6 min,max,sum,count>=0 =", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  br label %1

1:                                                ; preds = %5, %0
  %2 = phi i64 [ %11, %5 ], [ 1, %0 ]
  %3 = phi i64 [ %12, %5 ], [ 1000, %0 ]
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %5, label %13

5:                                                ; preds = %1
  %6 = sub nuw nsw i64 %2, 1
  %7 = mul nuw nsw i64 %6, 1
  %8 = mul nuw nsw i64 %7, 1
  %9 = add nuw nsw i64 %8, 0
  %10 = getelementptr nusw nuw i32, ptr @_QFEtid, i64 %9
  store i32 -1, ptr %10, align 4, !tbaa !2
  %11 = add nsw i64 %2, 1
  %12 = sub i64 %3, 1
  br label %1

13:                                               ; preds = %1
  br label %omp_parallel

omp_parallel:                                     ; preds = %13
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %14 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX70365F746872656164732E66393000, i32 17) #3
  %15 = call i1 @_FortranAioOutputAscii(ptr %14, ptr @_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D, i64 25) #3
  br label %16

16:                                               ; preds = %21, %omp.par.exit
  %17 = phi i64 [ %29, %21 ], [ 1, %omp.par.exit ]
  %18 = phi i32 [ %28, %21 ], [ 2147483647, %omp.par.exit ]
  %19 = phi i64 [ %30, %21 ], [ 1000, %omp.par.exit ]
  %20 = icmp sgt i64 %19, 0
  br i1 %20, label %21, label %31

21:                                               ; preds = %16
  %22 = sub nuw nsw i64 %17, 1
  %23 = mul nuw nsw i64 %22, 1
  %24 = mul nuw nsw i64 %23, 1
  %25 = add nuw nsw i64 %24, 0
  %26 = getelementptr nusw nuw i32, ptr @_QFEtid, i64 %25
  %27 = load i32, ptr %26, align 4, !tbaa !2
  %28 = call i32 @llvm.smin.i32(i32 %27, i32 %18)
  %29 = add nsw i64 %17, 1
  %30 = sub i64 %19, 1
  br label %16

31:                                               ; preds = %16
  %32 = call i1 @_FortranAioOutputInteger32(ptr %14, i32 %18) #3
  br label %33

33:                                               ; preds = %38, %31
  %34 = phi i64 [ %46, %38 ], [ 1, %31 ]
  %35 = phi i32 [ %45, %38 ], [ -2147483648, %31 ]
  %36 = phi i64 [ %47, %38 ], [ 1000, %31 ]
  %37 = icmp sgt i64 %36, 0
  br i1 %37, label %38, label %48

38:                                               ; preds = %33
  %39 = sub nuw nsw i64 %34, 1
  %40 = mul nuw nsw i64 %39, 1
  %41 = mul nuw nsw i64 %40, 1
  %42 = add nuw nsw i64 %41, 0
  %43 = getelementptr nusw nuw i32, ptr @_QFEtid, i64 %42
  %44 = load i32, ptr %43, align 4, !tbaa !2
  %45 = call i32 @llvm.smax.i32(i32 %44, i32 %35)
  %46 = add nsw i64 %34, 1
  %47 = sub i64 %36, 1
  br label %33

48:                                               ; preds = %33
  %49 = call i1 @_FortranAioOutputInteger32(ptr %14, i32 %35) #3
  br label %50

50:                                               ; preds = %55, %48
  %51 = phi i64 [ %63, %55 ], [ 1, %48 ]
  %52 = phi i32 [ %62, %55 ], [ 0, %48 ]
  %53 = phi i64 [ %64, %55 ], [ 1000, %48 ]
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %55, label %65

55:                                               ; preds = %50
  %56 = sub nuw nsw i64 %51, 1
  %57 = mul nuw nsw i64 %56, 1
  %58 = mul nuw nsw i64 %57, 1
  %59 = add nuw nsw i64 %58, 0
  %60 = getelementptr nusw nuw i32, ptr @_QFEtid, i64 %59
  %61 = load i32, ptr %60, align 4, !tbaa !2
  %62 = add i32 %52, %61
  %63 = add nsw i64 %51, 1
  %64 = sub i64 %53, 1
  br label %50

65:                                               ; preds = %50
  %66 = call i1 @_FortranAioOutputInteger32(ptr %14, i32 %52) #3
  br label %67

67:                                               ; preds = %72, %65
  %68 = phi i64 [ %82, %72 ], [ 1, %65 ]
  %69 = phi i32 [ %81, %72 ], [ 0, %65 ]
  %70 = phi i64 [ %83, %72 ], [ 1000, %65 ]
  %71 = icmp sgt i64 %70, 0
  br i1 %71, label %72, label %84

72:                                               ; preds = %67
  %73 = sub nuw nsw i64 %68, 1
  %74 = mul nuw nsw i64 %73, 1
  %75 = mul nuw nsw i64 %74, 1
  %76 = add nuw nsw i64 %75, 0
  %77 = getelementptr nusw nuw i32, ptr @_QFEtid, i64 %76
  %78 = load i32, ptr %77, align 4, !tbaa !2
  %79 = icmp sge i32 %78, 0
  %80 = zext i1 %79 to i32
  %81 = add i32 %69, %80
  %82 = add nsw i64 %68, 1
  %83 = sub i64 %70, 1
  br label %67

84:                                               ; preds = %67
  %85 = call i1 @_FortranAioOutputInteger32(ptr %14, i32 %69) #3
  %86 = call i32 @_FortranAioEndIoStatement(ptr %14) #3
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
  store i32 999, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @2, i32 %omp_global_thread_num, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
  %2 = load i32, ptr %p.lowerbound, align 4
  %3 = load i32, ptr %p.upperbound, align 4
  %4 = sub i32 %3, %2
  %5 = add i32 %4, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i32 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i32 %omp_loop.iv, %5
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
  %6 = add i32 %omp_loop.iv, %2
  %7 = mul i32 %6, 1
  %8 = add i32 %7, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %8, ptr %1, align 4, !tbaa !8
  %9 = call i32 @omp_get_thread_num()
  %10 = load i32, ptr %1, align 4, !tbaa !8
  %11 = sext i32 %10 to i64
  %12 = sub nuw nsw i64 %11, 1
  %13 = mul nuw nsw i64 %12, 1
  %14 = mul nuw nsw i64 %13, 1
  %15 = add nuw nsw i64 %14, 0
  %16 = getelementptr nusw nuw i32, ptr @_QFEtid, i64 %15
  store i32 %9, ptr %16, align 4, !tbaa !2
  br label %omp.region.cont4

omp.region.cont4:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont4
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

declare i32 @omp_get_thread_num()

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
declare void @__kmpc_barrier(ptr, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nounwind
declare !callback !10 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { memory(argmem: readwrite, inaccessiblemem: readwrite) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)"}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!3, !3, i64 0}
!3 = !{!"global data/_QFEtid", !4, i64 0}
!4 = !{!"global data", !5, i64 0}
!5 = !{!"any data access", !6, i64 0}
!6 = !{!"any access", !7, i64 0}
!7 = !{!"Flang function root _QQmain"}
!8 = !{!9, !9, i64 0}
!9 = !{!"allocated data", !5, i64 0}
!10 = !{!11}
!11 = !{i64 2, i64 -1, i64 -1, i1 true}
