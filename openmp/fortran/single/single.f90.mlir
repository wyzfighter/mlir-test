module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "OMP_SINGLE"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "c"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "b"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.alloca %4 x i32 {bindc_name = "a"} : (i64) -> !llvm.ptr
    %6 = llvm.mlir.constant(0 : i32) : i32
    %7 = llvm.mlir.constant(2 : i32) : i32
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.constant(1 : i64) : i64
    %11 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %8, %5 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : i32, !llvm.ptr
    llvm.store %7, %3 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEb", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEb", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : i32, !llvm.ptr
    llvm.store %6, %1 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEc", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEc", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : i32, !llvm.ptr
    omp.single {
      %12 = llvm.load %5 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEa", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : !llvm.ptr -> i32
      %13 = llvm.load %3 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEb", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEb", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : !llvm.ptr -> i32
      %14 = llvm.add %12, %13 : i32
      llvm.store %14, %1 {tbaa = [#llvm.tbaa_tag<base_type = <id = "allocated data/_QFEc", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, access_type = <id = "allocated data/_QFEc", members = {<#llvm.tbaa_type_desc<id = "allocated data", members = {<#llvm.tbaa_type_desc<id = "any data access", members = {<#llvm.tbaa_type_desc<id = "any access", members = {<#llvm.tbaa_root<id = "Flang function root _QQmain">, 0>}>, 0>}>, 0>}>, 0>}>, offset = 0>]} : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global external constant @_QMomp_lib_kindsECkmp_affinity_mask_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsECkmp_cancel_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_cancel_loop() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_cancel_parallel() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_cancel_sections() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_cancel_taskgroup() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsECkmp_double_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_lock_hint_adaptive() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_lock_hint_hle() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_lock_hint_rtm() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsECkmp_pointer_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsECkmp_size_t_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_version_build() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_version_major() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECkmp_version_minor() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libECllvm_omp_target_device_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libECllvm_omp_target_device_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libECllvm_omp_target_host_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libECllvm_omp_target_host_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libECllvm_omp_target_shared_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libECllvm_omp_target_shared_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_allocator_handle_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_alloctrait_key_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_alloctrait_val_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_access() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_alignment() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_atomic_scope() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_device_access() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_fallback() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_fb_data() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_part_size() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_partition() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_pin_device() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_pinned() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_pool_size() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_preferred_device() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_sync_hint() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atk_target_access() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_atv_abort_fb() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_all() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_allocator_fb() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_blocked() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_cgroup() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_contended() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_default() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_default_mem_fb() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_device() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_environment() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_false() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_interleaved() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_memspace() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_multiple() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_nearest() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_null_fb() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_private() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_pteam() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_sequential() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_serialized() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_single() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_thread() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_true() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_atv_uncontended() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_cgroup_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_const_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_const_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_end() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_flush() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_ignored() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_control_tool_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_nocallback() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_notool() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_pause() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_control_tool_result_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_start() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_control_tool_success() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_default_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_default_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_depend_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_event_handle_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_high_bw_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_high_bw_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_cuda() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_cuda_driver() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_hip() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_last() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_level_zero() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_opencl() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_ifr_sycl() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_integer_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_interop_fr_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_interop_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_interop_none() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_large_cap_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_large_cap_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_lock_hint_contended() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_lock_hint_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_lock_hint_none() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_lock_hint_nonspeculative() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_lock_hint_speculative() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_lock_hint_uncontended() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_lock_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_logical_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_low_lat_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_low_lat_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_memspace_handle_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_nest_lock_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_null_allocator() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_null_mem_space() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libEComp_pause_hard() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_pause_resource_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_pause_resume() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_pause_soft() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_pause_stop_tool() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_proc_bind_close() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_proc_bind_false() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_proc_bind_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_proc_bind_master() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_proc_bind_spread() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_proc_bind_true() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_pteam_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_real_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sched_auto() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sched_dynamic() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sched_guided() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_sched_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sched_monotonic() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sched_static() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sync_hint_contended() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_lib_kindsEComp_sync_hint_kind() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sync_hint_none() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sync_hint_nonspeculative() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sync_hint_speculative() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_sync_hint_uncontended() {addr_space = 0 : i32} : i32
  llvm.mlir.global external constant @_QMomp_libEComp_thread_mem_alloc() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @_QMomp_libECopenmp_version() {addr_space = 0 : i32} : i32
  llvm.func @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @_FortranAProgramEndStatement() attributes {sym_visibility = "private"}
  llvm.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.zero : !llvm.ptr
    llvm.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %1) {fastmathFlags = #llvm.fastmath<contract>} : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @_QQmain() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
    llvm.call @_FortranAProgramEndStatement() {fastmathFlags = #llvm.fastmath<contract>} : () -> ()
    llvm.return %0 : i32
  }
}
