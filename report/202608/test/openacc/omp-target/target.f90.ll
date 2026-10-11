; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$_QQclX6c4e491515946f206b29d1590cf80e42 = comdat any

@_QFEa = internal global [100 x i32] zeroinitializer
@_QQclX6c4e491515946f206b29d1590cf80e42 = linkonce constant [48 x i8] c"/home/wangyz/test/openacc/omp-target/target.f90\00", comdat
@0 = private unnamed_addr constant [58 x i8] c";/home/wangyz/test/openacc/omp-target/target.f90;n;3;17;;\00", align 1
@1 = private unnamed_addr constant [58 x i8] c";/home/wangyz/test/openacc/omp-target/target.f90;a;3;20;;\00", align 1
@2 = private unnamed_addr constant [63 x i8] c";/home/wangyz/test/openacc/omp-target/target.f90;unknown;4;3;;\00", align 1

define void @_QQmain() {
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  store i32 100, ptr %1, align 4
  br label %entry

entry:                                            ; preds = %0
  call void @__omp_offloading_802_bc369d__QQmain_l6(ptr %1, ptr @_QFEa, ptr %2)
  %3 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclX6c4e491515946f206b29d1590cf80e42, i32 12)
  %4 = load i32, ptr @_QFEa, align 4
  %5 = call i1 @_FortranAioOutputInteger32(ptr %3, i32 %4)
  %6 = call i32 @_FortranAioEndIoStatement(ptr %3)
  ret void
}

declare ptr @_FortranAioBeginExternalListOutput(i32, ptr, i32)

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

define internal void @__omp_offloading_802_bc369d__QQmain_l6(ptr %0, ptr %1, ptr %2) {
entry:
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %entry
  br label %outlined.body

outlined.body:                                    ; preds = %omp.region.after_alloca
  br label %omp.target

omp.target3:                                      ; preds = %omp.target1
  store i32 %13, ptr %2, align 4
  br label %omp.region.cont

omp.target2:                                      ; preds = %omp.target1
  store i32 %13, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = sext i32 %3 to i64
  %5 = sub nsw i64 %4, 1
  %6 = mul nsw i64 %5, 1
  %7 = mul nsw i64 %6, 1
  %8 = add nsw i64 %7, 0
  %9 = getelementptr i32, ptr %1, i64 %8
  store i32 %3, ptr %9, align 4
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  %12 = sub i64 %14, 1
  br label %omp.target1

omp.target1:                                      ; preds = %omp.target2, %omp.target
  %13 = phi i32 [ %11, %omp.target2 ], [ 1, %omp.target ]
  %14 = phi i64 [ %12, %omp.target2 ], [ %17, %omp.target ]
  %15 = icmp sgt i64 %14, 0
  br i1 %15, label %omp.target2, label %omp.target3

omp.target:                                       ; preds = %outlined.body
  %16 = load i32, ptr %0, align 4
  %17 = sext i32 %16 to i64
  br label %omp.target1

omp.region.cont:                                  ; preds = %omp.target3
  ret void
}

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 7, !"openmp", i32 31}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!"flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)"}
