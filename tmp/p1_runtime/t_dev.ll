; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }
%struct.DynamicEnvironmentTy = type { i16 }
%struct.KernelEnvironmentTy = type { %struct.ConfigurationEnvironmentTy, ptr, ptr }
%struct.ConfigurationEnvironmentTy = type { i8, i8, i8, i32, i32, i32, i32, i32, i32 }

@__omp_offloading_deadf17e_1818da40_f_l7_exec_mode = weak protected constant i8 2
@llvm.compiler.used = appending global [1 x ptr] [ptr @__omp_offloading_deadf17e_1818da40_f_l7_exec_mode], section "llvm.metadata"
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@__omp_offloading_deadf17e_1818da40_f_l7_dynamic_environment = weak_odr protected global %struct.DynamicEnvironmentTy zeroinitializer
@__omp_offloading_deadf17e_1818da40_f_l7_kernel_environment = weak_odr protected constant %struct.KernelEnvironmentTy { %struct.ConfigurationEnvironmentTy { i8 0, i8 1, i8 2, i32 1, i32 256, i32 -1, i32 -1, i32 0, i32 0 }, ptr @1, ptr @__omp_offloading_deadf17e_1818da40_f_l7_dynamic_environment }

declare void @report(i32)

define void @f() {
  br label %entry

entry:                                            ; preds = %0
  ret void
}

define i32 @main() {
  call void @f()
  ret i32 0
}

define weak_odr protected void @__omp_offloading_deadf17e_1818da40_f_l7(ptr %0) #0 {
entry:
  %1 = alloca [0 x ptr], align 8
  %2 = call i32 @__kmpc_target_init(ptr @__omp_offloading_deadf17e_1818da40_f_l7_kernel_environment, ptr %0)
  %exec_user_code = icmp eq i32 %2, -1
  br i1 %exec_user_code, label %user_code.entry, label %worker.exit

user_code.entry:                                  ; preds = %entry
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %user_code.entry
  br label %outlined.body

outlined.body:                                    ; preds = %omp.region.after_alloca
  br label %omp.target

omp.target:                                       ; preds = %outlined.body
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %omp.target
  call void @__kmpc_parallel_60(ptr @1, i32 %omp_global_thread_num, i32 1, i32 -1, i32 -1, ptr @__omp_offloading_deadf17e_1818da40_f_l7..omp_par.1, ptr null, ptr %1, i64 0, i32 0)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp.par.exit
  call void @__kmpc_target_deinit()
  ret void

worker.exit:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind
define internal void @__omp_offloading_deadf17e_1818da40_f_l7..omp_par.1(ptr noalias noundef %tid.addr, ptr noalias noundef %zero.addr) #1 {
omp.par.entry:
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
  %1 = call i32 @omp_get_num_threads()
  call void @__kmpc_for_static_loop_4u(ptr @1, ptr @__omp_offloading_deadf17e_1818da40_f_l7..omp_par, ptr null, i32 100, i32 %1, i32 0, i8 0)
  br label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.preheader
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

omp.par.exit.exitStub:                            ; preds = %.fini
  ret void
}

define internal void @__omp_offloading_deadf17e_1818da40_f_l7..omp_par(i32 %0) #0 {
omp_loop.body:
  %1 = mul i32 %0, 1
  %2 = add i32 %1, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  call void @report(i32 %2)
  br label %omp.region.cont6

omp.region.cont6:                                 ; preds = %omp.loop_nest.region
  br label %omp.prelatch.exitStub

omp.prelatch.exitStub:                            ; preds = %omp.region.cont6
  ret void
}

declare i32 @__kmpc_target_init(ptr, ptr)

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #2

declare void @__kmpc_target_deinit()

; Function Attrs: alwaysinline
declare void @__kmpc_for_static_loop_4u(ptr, ptr, ptr, i32, i32, i32, i8) #3

; Function Attrs: nounwind
declare i32 @omp_get_num_threads() #2

; Function Attrs: alwaysinline
declare void @__kmpc_parallel_60(ptr, i32, i32, i32, i32, ptr, ptr, ptr, i64, i32) #3

attributes #0 = { "nvvm.maxntid"="256" "omp_target_thread_limit"="256" }
attributes #1 = { nounwind "nvvm.maxntid"="256" "omp_target_thread_limit"="256" }
attributes #2 = { nounwind }
attributes #3 = { alwaysinline }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
