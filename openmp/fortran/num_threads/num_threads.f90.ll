; ModuleID = 'FIRModule'
source_filename = "FIRModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

$_QQclXe0aab4394c34913d3642129c3519e2e2 = comdat any

$_QQclXe1dcc3bc64273b855e7ec1b5d12f3f97 = comdat any

@_QFEarr = internal global [500 x float] zeroinitializer
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
@_QFECn = internal constant i32 500
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
@_QQclXe0aab4394c34913d3642129c3519e2e2 = linkonce constant [61 x i8] c"/home/wangyz/test/openmp/fortran/num_threads/num_threads.f90\00", comdat
@_QQclXe1dcc3bc64273b855e7ec1b5d12f3f97 = linkonce constant [33 x i8] c"\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8C\E6\9C\80\E5\A4\A7\E7\BA\BF\E7\A8\8B\E6\95\B0\EF\BC\9A", comdat
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

define void @_QQmain() {
  %1 = alloca i32, i64 1, align 4
  br label %entry

entry:                                            ; preds = %0
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_push_num_threads(ptr @1, i32 %omp_global_thread_num, i32 4)
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 0, ptr @_QQmain..omp_par)
  br label %omp.par.exit

omp.par.exit:                                     ; preds = %omp_parallel
  %2 = call ptr @_FortranAioBeginExternalListOutput(i32 6, ptr @_QQclXe0aab4394c34913d3642129c3519e2e2, i32 15)
  %3 = call i1 @_FortranAioOutputAscii(ptr %2, ptr @_QQclXe1dcc3bc64273b855e7ec1b5d12f3f97, i64 33)
  %4 = call i32 @omp_get_max_threads()
  %5 = call i1 @_FortranAioOutputInteger32(ptr %2, i32 %4)
  %6 = call i32 @_FortranAioEndIoStatement(ptr %2)
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
  store i32 0, ptr %p.lowerbound, align 4
  store i32 499, ptr %p.upperbound, align 4
  store i32 1, ptr %p.stride, align 4
  %omp_global_thread_num5 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_4u(ptr @1, i32 %omp_global_thread_num5, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i32 1, i32 0)
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
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num5)
  %omp_global_thread_num6 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num6)
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
  %5 = add i32 %omp_loop.iv, %1
  %6 = mul i32 %5, 1
  %7 = add i32 %6, 1
  br label %omp.loop_nest.region

omp.loop_nest.region:                             ; preds = %omp_loop.body
  store i32 %7, ptr %omp.private.alloc, align 4
  %8 = load i32, ptr %omp.private.alloc, align 4
  %9 = sitofp i32 %8 to float
  %10 = fmul contract float %9, 0x3F847AE140000000
  %11 = call contract float @llvm.sin.f32(float %10)
  %12 = sext i32 %8 to i64
  %13 = sub nsw i64 %12, 1
  %14 = mul nsw i64 %13, 1
  %15 = mul nsw i64 %14, 1
  %16 = add nsw i64 %15, 0
  %17 = getelementptr float, ptr @_QFEarr, i64 %16
  store float %11, ptr %17, align 4
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

declare zeroext i1 @_FortranAioOutputInteger32(ptr, i32)

declare i32 @omp_get_max_threads()

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

; Function Attrs: nounwind
declare void @__kmpc_push_num_threads(ptr, i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sin.f32(float) #1

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4u(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #0

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #0

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #2

; Function Attrs: nounwind
declare !callback !3 void @__kmpc_fork_call(ptr, i32, ptr, ...) #0

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 7, !"openmp", i32 31}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!"flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)"}
!3 = !{!4}
!4 = !{i64 2, i64 -1, i64 -1, i1 true}
