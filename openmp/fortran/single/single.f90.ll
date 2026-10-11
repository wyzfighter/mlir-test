; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@_QMomp_lib_kindsECkmp_affinity_mask_kind = external constant i32
@_QMomp_lib_kindsECkmp_cancel_kind = external constant i32
@_QMomp_libECkmp_cancel_loop = external constant i32
@_QMomp_libECkmp_cancel_parallel = external constant i32
@_QMomp_libECkmp_cancel_sections = external constant i32
@_QMomp_libECkmp_cancel_taskgroup = external constant i32
@_QMomp_lib_kindsECkmp_double_kind = external constant i32
@_QMomp_libECkmp_lock_hint_adaptive = external constant i32
@_QMomp_libECkmp_lock_hint_hle = external constant i32
@_QMomp_libECkmp_lock_hint_rtm = external constant i32
@_QMomp_lib_kindsECkmp_pointer_kind = external constant i32
@_QMomp_lib_kindsECkmp_size_t_kind = external constant i32
@_QMomp_libECkmp_version_build = external constant i32
@_QMomp_libECkmp_version_major = external constant i32
@_QMomp_libECkmp_version_minor = external constant i32
@_QMomp_libECllvm_omp_target_device_mem_alloc = external constant i64
@_QMomp_libECllvm_omp_target_device_mem_space = external constant i64
@_QMomp_libECllvm_omp_target_host_mem_alloc = external constant i64
@_QMomp_libECllvm_omp_target_host_mem_space = external constant i64
@_QMomp_libECllvm_omp_target_shared_mem_alloc = external constant i64
@_QMomp_libECllvm_omp_target_shared_mem_space = external constant i64
@_QMomp_lib_kindsEComp_allocator_handle_kind = external constant i32
@_QMomp_lib_kindsEComp_alloctrait_key_kind = external constant i32
@_QMomp_lib_kindsEComp_alloctrait_val_kind = external constant i32
@_QMomp_libEComp_atk_access = external constant i32
@_QMomp_libEComp_atk_alignment = external constant i32
@_QMomp_libEComp_atk_atomic_scope = external constant i32
@_QMomp_libEComp_atk_device_access = external constant i32
@_QMomp_libEComp_atk_fallback = external constant i32
@_QMomp_libEComp_atk_fb_data = external constant i32
@_QMomp_libEComp_atk_part_size = external constant i32
@_QMomp_libEComp_atk_partition = external constant i32
@_QMomp_libEComp_atk_pin_device = external constant i32
@_QMomp_libEComp_atk_pinned = external constant i32
@_QMomp_libEComp_atk_pool_size = external constant i32
@_QMomp_libEComp_atk_preferred_device = external constant i32
@_QMomp_libEComp_atk_sync_hint = external constant i32
@_QMomp_libEComp_atk_target_access = external constant i32
@_QMomp_libEComp_atv_abort_fb = external constant i64
@_QMomp_libEComp_atv_all = external constant i64
@_QMomp_libEComp_atv_allocator_fb = external constant i64
@_QMomp_libEComp_atv_blocked = external constant i64
@_QMomp_libEComp_atv_cgroup = external constant i64
@_QMomp_libEComp_atv_contended = external constant i64
@_QMomp_libEComp_atv_default = external constant i64
@_QMomp_libEComp_atv_default_mem_fb = external constant i64
@_QMomp_libEComp_atv_device = external constant i64
@_QMomp_libEComp_atv_environment = external constant i64
@_QMomp_libEComp_atv_false = external constant i64
@_QMomp_libEComp_atv_interleaved = external constant i64
@_QMomp_libEComp_atv_memspace = external constant i64
@_QMomp_libEComp_atv_multiple = external constant i64
@_QMomp_libEComp_atv_nearest = external constant i64
@_QMomp_libEComp_atv_null_fb = external constant i64
@_QMomp_libEComp_atv_private = external constant i64
@_QMomp_libEComp_atv_pteam = external constant i64
@_QMomp_libEComp_atv_sequential = external constant i64
@_QMomp_libEComp_atv_serialized = external constant i64
@_QMomp_libEComp_atv_single = external constant i64
@_QMomp_libEComp_atv_thread = external constant i64
@_QMomp_libEComp_atv_true = external constant i64
@_QMomp_libEComp_atv_uncontended = external constant i64
@_QMomp_libEComp_cgroup_mem_alloc = external constant i64
@_QMomp_libEComp_const_mem_alloc = external constant i64
@_QMomp_libEComp_const_mem_space = external constant i64
@_QMomp_libEComp_control_tool_end = external constant i32
@_QMomp_libEComp_control_tool_flush = external constant i32
@_QMomp_libEComp_control_tool_ignored = external constant i32
@_QMomp_lib_kindsEComp_control_tool_kind = external constant i32
@_QMomp_libEComp_control_tool_nocallback = external constant i32
@_QMomp_libEComp_control_tool_notool = external constant i32
@_QMomp_libEComp_control_tool_pause = external constant i32
@_QMomp_lib_kindsEComp_control_tool_result_kind = external constant i32
@_QMomp_libEComp_control_tool_start = external constant i32
@_QMomp_libEComp_control_tool_success = external constant i32
@_QMomp_libEComp_default_mem_alloc = external constant i64
@_QMomp_libEComp_default_mem_space = external constant i64
@_QMomp_lib_kindsEComp_depend_kind = external constant i32
@_QMomp_lib_kindsEComp_event_handle_kind = external constant i32
@_QMomp_libEComp_high_bw_mem_alloc = external constant i64
@_QMomp_libEComp_high_bw_mem_space = external constant i64
@_QMomp_libEComp_ifr_cuda = external constant i32
@_QMomp_libEComp_ifr_cuda_driver = external constant i32
@_QMomp_libEComp_ifr_hip = external constant i32
@_QMomp_libEComp_ifr_last = external constant i32
@_QMomp_libEComp_ifr_level_zero = external constant i32
@_QMomp_libEComp_ifr_opencl = external constant i32
@_QMomp_libEComp_ifr_sycl = external constant i32
@_QMomp_lib_kindsEComp_integer_kind = external constant i32
@_QMomp_lib_kindsEComp_interop_fr_kind = external constant i32
@_QMomp_lib_kindsEComp_interop_kind = external constant i32
@_QMomp_libEComp_interop_none = external constant i64
@_QMomp_libEComp_large_cap_mem_alloc = external constant i64
@_QMomp_libEComp_large_cap_mem_space = external constant i64
@_QMomp_libEComp_lock_hint_contended = external constant i32
@_QMomp_lib_kindsEComp_lock_hint_kind = external constant i32
@_QMomp_libEComp_lock_hint_none = external constant i32
@_QMomp_libEComp_lock_hint_nonspeculative = external constant i32
@_QMomp_libEComp_lock_hint_speculative = external constant i32
@_QMomp_libEComp_lock_hint_uncontended = external constant i32
@_QMomp_lib_kindsEComp_lock_kind = external constant i32
@_QMomp_lib_kindsEComp_logical_kind = external constant i32
@_QMomp_libEComp_low_lat_mem_alloc = external constant i64
@_QMomp_libEComp_low_lat_mem_space = external constant i64
@_QMomp_lib_kindsEComp_memspace_handle_kind = external constant i32
@_QMomp_lib_kindsEComp_nest_lock_kind = external constant i32
@_QMomp_libEComp_null_allocator = external constant i64
@_QMomp_libEComp_null_mem_space = external constant i64
@_QMomp_libEComp_pause_hard = external constant i32
@_QMomp_lib_kindsEComp_pause_resource_kind = external constant i32
@_QMomp_libEComp_pause_resume = external constant i32
@_QMomp_libEComp_pause_soft = external constant i32
@_QMomp_libEComp_pause_stop_tool = external constant i32
@_QMomp_libEComp_proc_bind_close = external constant i32
@_QMomp_libEComp_proc_bind_false = external constant i32
@_QMomp_lib_kindsEComp_proc_bind_kind = external constant i32
@_QMomp_libEComp_proc_bind_master = external constant i32
@_QMomp_libEComp_proc_bind_spread = external constant i32
@_QMomp_libEComp_proc_bind_true = external constant i32
@_QMomp_libEComp_pteam_mem_alloc = external constant i64
@_QMomp_lib_kindsEComp_real_kind = external constant i32
@_QMomp_libEComp_sched_auto = external constant i32
@_QMomp_libEComp_sched_dynamic = external constant i32
@_QMomp_libEComp_sched_guided = external constant i32
@_QMomp_lib_kindsEComp_sched_kind = external constant i32
@_QMomp_libEComp_sched_monotonic = external constant i32
@_QMomp_libEComp_sched_static = external constant i32
@_QMomp_libEComp_sync_hint_contended = external constant i32
@_QMomp_lib_kindsEComp_sync_hint_kind = external constant i32
@_QMomp_libEComp_sync_hint_none = external constant i32
@_QMomp_libEComp_sync_hint_nonspeculative = external constant i32
@_QMomp_libEComp_sync_hint_speculative = external constant i32
@_QMomp_libEComp_sync_hint_uncontended = external constant i32
@_QMomp_libEComp_thread_mem_alloc = external constant i64
@_QMomp_libECopenmp_version = external constant i32
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %structArg = alloca { ptr, ptr, ptr }, align 8
  %1 = alloca i32, i64 1, align 4
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  store i32 1, ptr %3, align 4
  store i32 2, ptr %2, align 4
  store i32 0, ptr %1, align 4
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_push_num_threads(ptr @1, i32 %omp_global_thread_num, i32 1)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_ = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %3, ptr %gep_, align 8
  %gep_5 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %2, ptr %gep_5, align 8
  %gep_6 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %1, ptr %gep_6, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @_QQmain..omp_par, ptr %structArg)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  ret void
}

; Function Attrs: nounwind
define internal void @_QQmain..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8, !align !3
  %gep_1 = getelementptr { ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8, !align !3
  %gep_3 = getelementptr { ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8, !align !3
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.region.after_alloca

omp.region.after_alloca:                          ; preds = %omp.par.entry
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.region.after_alloca
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %omp_global_thread_num2 = call i32 @__kmpc_global_thread_num(ptr @1)
  %2 = call i32 @__kmpc_single(ptr @1, i32 %omp_global_thread_num2)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %omp_region.body, label %omp_region.end

omp_region.end:                                   ; preds = %omp.par.region1, %omp_region.finalize
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num4)
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_region.end
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %.fini

.fini:                                            ; preds = %omp.par.pre_finalize
  br label %omp.par.exit.exitStub

omp_region.body:                                  ; preds = %omp.par.region1
  br label %omp.single.region

omp.single.region:                                ; preds = %omp_region.body
  %4 = load i32, ptr %loadgep_, align 4
  %5 = load i32, ptr %loadgep_2, align 4
  %6 = add i32 %4, %5
  store i32 %6, ptr %loadgep_4, align 4
  br label %omp.region.cont3

omp.region.cont3:                                 ; preds = %omp.single.region
  br label %omp_region.finalize

omp_region.finalize:                              ; preds = %omp.region.cont3
  call void @__kmpc_end_single(ptr @1, i32 %omp_global_thread_num2)
  br label %omp_region.end

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
declare i32 @__kmpc_global_thread_num(ptr) #0

; Function Attrs: nounwind
declare void @__kmpc_push_num_threads(ptr, i32, i32) #0

; Function Attrs: convergent nounwind
declare i32 @__kmpc_single(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_end_single(ptr, i32) #1

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
!2 = !{!"flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)"}
!3 = !{i64 4}
!4 = !{!5}
!5 = !{i64 2, i64 -1, i64 -1, i1 true}
