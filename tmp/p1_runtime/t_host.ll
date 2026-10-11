; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.__tgt_offload_entry = type { i64, i16, i16, i32, ptr, ptr, i64, i64, ptr }
%struct.__tgt_kernel_arguments = type { i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, [3 x i32], [3 x i32], i32 }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8
@.__omp_offloading_deadf17e_1818da40_f_l7.region_id = weak constant i8 0
@.offloading.entry_name = internal unnamed_addr constant [40 x i8] c"__omp_offloading_deadf17e_1818da40_f_l7\00", section ".llvm.rodata.offloading", align 1
@.offloading.entry.__omp_offloading_deadf17e_1818da40_f_l7 = weak constant %struct.__tgt_offload_entry { i64 0, i16 1, i16 1, i32 0, ptr @.__omp_offloading_deadf17e_1818da40_f_l7.region_id, ptr @.offloading.entry_name, i64 0, i64 0, ptr null }, section "llvm_offload_entries", align 8

declare void @report(i32)

define void @f() {
  %kernel_args = alloca %struct.__tgt_kernel_arguments, align 8
  br label %entry

entry:                                            ; preds = %0
  %1 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 0
  store i32 3, ptr %1, align 4
  %2 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 1
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 2
  store ptr null, ptr %3, align 8
  %4 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 3
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 4
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 5
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 6
  store ptr null, ptr %7, align 8
  %8 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 7
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 8
  store i64 0, ptr %9, align 8
  %10 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 9
  store i64 0, ptr %10, align 8
  %11 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 10
  store [3 x i32] [i32 -1, i32 0, i32 0], ptr %11, align 4
  %12 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 11
  store [3 x i32] zeroinitializer, ptr %12, align 4
  %13 = getelementptr inbounds nuw %struct.__tgt_kernel_arguments, ptr %kernel_args, i32 0, i32 12
  store i32 0, ptr %13, align 4
  %14 = call i32 @__tgt_target_kernel(ptr @1, i64 -1, i32 -1, i32 0, ptr @.__omp_offloading_deadf17e_1818da40_f_l7.region_id, ptr %kernel_args)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_deadf17e_1818da40_f_l7()
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  ret void
}

define i32 @main() {
  call void @f()
  ret i32 0
}

define internal void @__omp_offloading_deadf17e_1818da40_f_l7() {
entry:
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %entry
  br label %outlined.body

outlined.body:                                    ; preds = %omp.region.after_alloca
  br label %omp.target

omp.target:                                       ; preds = %outlined.body
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @__omp_offloading_deadf17e_1818da40_f_l7..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_deadf17e_1818da40_f_l7..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr) #0 {
omp.par.entry:
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i32, align 4
  %p.upperbound = alloca i32, align 4
  %p.stride = alloca i32, align 4
  %tid.addr.local = alloca i32, align 4
  %0 = load i32, ptr %tid.addr, align 4
  store i32 %0, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.region.after_alloca4

omp.region.after_alloca4:                         ; preds = %omp.par.entry
  br label %omp.region.after_alloca1

omp.region.after_alloca1:                         ; preds = %omp.region.after_alloca4
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca1
  br label %omp.par.region3

omp.par.region3:                                  ; preds = %omp.par.region
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp.par.region3
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.wsloop.region
  store i32 0, ptr %p.lowerbound, align 4
  store i32 99, ptr %p.upperbound, align 4
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
  %omp_global_thread_num8 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num8)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont5

omp.region.cont5:                                 ; preds = %omp_loop.after
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.region.cont5
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont2
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %5 = add i32 %omp_loop.iv, %1
  %6 = mul i32 %5, 1
  %7 = add i32 %6, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  call void @report(i32 %7)
  br label %omp.region.cont6

omp.region.cont6:                                 ; preds = %omp.loop_nest.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont6
  %omp_loop.next = add nuw i32 %omp_loop.iv, 1
  br label %omp_loop.header

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
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
declare i32 @__tgt_target_kernel(ptr, i64, i32, i32, ptr, ptr) #0

; Function Attrs: nounwind
declare !callback !3 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0}
!omp_offload.info = !{!1}
!llvm.offloading.symbols = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 -559025794, i32 404281920, !"f", i32 7, i32 0, i32 0}
!2 = !{ptr @.offloading.entry_name}
!3 = !{!4}
!4 = !{i64 2, i64 -1, i64 -1, i1 true}
