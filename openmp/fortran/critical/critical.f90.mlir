module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.critical.declare @print_lock
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_CRITICAL"} {
    %c12 = arith.constant 12 : index
    %c6 = arith.constant 6 : index
    %c12_i32 = arith.constant 12 : i32
    %c6_i32 = arith.constant 6 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2 = fir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %3 = fir.address_of(@_QMomp_lib_kindsECkmp_affinity_mask_kind) : !fir.ref<i32>
    %4 = fir.declare %3 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_affinity_mask_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.address_of(@_QMomp_lib_kindsECkmp_cancel_kind) : !fir.ref<i32>
    %6 = fir.declare %5 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_cancel_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %7 = fir.address_of(@_QMomp_libECkmp_cancel_loop) : !fir.ref<i32>
    %8 = fir.declare %7 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_loop"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %9 = fir.address_of(@_QMomp_libECkmp_cancel_parallel) : !fir.ref<i32>
    %10 = fir.declare %9 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_parallel"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %11 = fir.address_of(@_QMomp_libECkmp_cancel_sections) : !fir.ref<i32>
    %12 = fir.declare %11 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_sections"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %13 = fir.address_of(@_QMomp_libECkmp_cancel_taskgroup) : !fir.ref<i32>
    %14 = fir.declare %13 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_taskgroup"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %15 = fir.address_of(@_QMomp_lib_kindsECkmp_double_kind) : !fir.ref<i32>
    %16 = fir.declare %15 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_double_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %17 = fir.address_of(@_QMomp_libECkmp_lock_hint_adaptive) : !fir.ref<i32>
    %18 = fir.declare %17 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_adaptive"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %19 = fir.address_of(@_QMomp_libECkmp_lock_hint_hle) : !fir.ref<i32>
    %20 = fir.declare %19 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_hle"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %21 = fir.address_of(@_QMomp_libECkmp_lock_hint_rtm) : !fir.ref<i32>
    %22 = fir.declare %21 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_rtm"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %23 = fir.address_of(@_QMomp_lib_kindsECkmp_pointer_kind) : !fir.ref<i32>
    %24 = fir.declare %23 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_pointer_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %25 = fir.address_of(@_QMomp_lib_kindsECkmp_size_t_kind) : !fir.ref<i32>
    %26 = fir.declare %25 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_size_t_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %27 = fir.address_of(@_QMomp_libECkmp_version_build) : !fir.ref<i32>
    %28 = fir.declare %27 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_build"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %29 = fir.address_of(@_QMomp_libECkmp_version_major) : !fir.ref<i32>
    %30 = fir.declare %29 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_major"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %31 = fir.address_of(@_QMomp_libECkmp_version_minor) : !fir.ref<i32>
    %32 = fir.declare %31 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_minor"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %33 = fir.address_of(@_QMomp_libECllvm_omp_target_device_mem_alloc) : !fir.ref<i64>
    %34 = fir.declare %33 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_device_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %35 = fir.address_of(@_QMomp_libECllvm_omp_target_device_mem_space) : !fir.ref<i64>
    %36 = fir.declare %35 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_device_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %37 = fir.address_of(@_QMomp_libECllvm_omp_target_host_mem_alloc) : !fir.ref<i64>
    %38 = fir.declare %37 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_host_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %39 = fir.address_of(@_QMomp_libECllvm_omp_target_host_mem_space) : !fir.ref<i64>
    %40 = fir.declare %39 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_host_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %41 = fir.address_of(@_QMomp_libECllvm_omp_target_shared_mem_alloc) : !fir.ref<i64>
    %42 = fir.declare %41 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_shared_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %43 = fir.address_of(@_QMomp_libECllvm_omp_target_shared_mem_space) : !fir.ref<i64>
    %44 = fir.declare %43 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_shared_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %45 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %46 = fir.declare %45 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %47 = fir.address_of(@_QMomp_lib_kindsEComp_allocator_handle_kind) : !fir.ref<i32>
    %48 = fir.declare %47 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_allocator_handle_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %49 = fir.address_of(@_QMomp_lib_kindsEComp_alloctrait_key_kind) : !fir.ref<i32>
    %50 = fir.declare %49 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_alloctrait_key_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %51 = fir.address_of(@_QMomp_lib_kindsEComp_alloctrait_val_kind) : !fir.ref<i32>
    %52 = fir.declare %51 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_alloctrait_val_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %53 = fir.address_of(@_QMomp_libEComp_atk_access) : !fir.ref<i32>
    %54 = fir.declare %53 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_access"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %55 = fir.address_of(@_QMomp_libEComp_atk_alignment) : !fir.ref<i32>
    %56 = fir.declare %55 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_alignment"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %57 = fir.address_of(@_QMomp_libEComp_atk_atomic_scope) : !fir.ref<i32>
    %58 = fir.declare %57 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_atomic_scope"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %59 = fir.address_of(@_QMomp_libEComp_atk_device_access) : !fir.ref<i32>
    %60 = fir.declare %59 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_device_access"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %61 = fir.address_of(@_QMomp_libEComp_atk_fallback) : !fir.ref<i32>
    %62 = fir.declare %61 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_fallback"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %63 = fir.address_of(@_QMomp_libEComp_atk_fb_data) : !fir.ref<i32>
    %64 = fir.declare %63 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_fb_data"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %65 = fir.address_of(@_QMomp_libEComp_atk_part_size) : !fir.ref<i32>
    %66 = fir.declare %65 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_part_size"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %67 = fir.address_of(@_QMomp_libEComp_atk_partition) : !fir.ref<i32>
    %68 = fir.declare %67 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_partition"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %69 = fir.address_of(@_QMomp_libEComp_atk_pin_device) : !fir.ref<i32>
    %70 = fir.declare %69 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pin_device"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %71 = fir.address_of(@_QMomp_libEComp_atk_pinned) : !fir.ref<i32>
    %72 = fir.declare %71 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pinned"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %73 = fir.address_of(@_QMomp_libEComp_atk_pool_size) : !fir.ref<i32>
    %74 = fir.declare %73 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pool_size"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %75 = fir.address_of(@_QMomp_libEComp_atk_preferred_device) : !fir.ref<i32>
    %76 = fir.declare %75 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_preferred_device"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %77 = fir.address_of(@_QMomp_libEComp_atk_sync_hint) : !fir.ref<i32>
    %78 = fir.declare %77 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_sync_hint"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %79 = fir.address_of(@_QMomp_libEComp_atk_target_access) : !fir.ref<i32>
    %80 = fir.declare %79 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_target_access"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %81 = fir.address_of(@_QMomp_libEComp_atv_abort_fb) : !fir.ref<i64>
    %82 = fir.declare %81 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_abort_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %83 = fir.address_of(@_QMomp_libEComp_atv_all) : !fir.ref<i64>
    %84 = fir.declare %83 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_all"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %85 = fir.address_of(@_QMomp_libEComp_atv_allocator_fb) : !fir.ref<i64>
    %86 = fir.declare %85 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_allocator_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %87 = fir.address_of(@_QMomp_libEComp_atv_blocked) : !fir.ref<i64>
    %88 = fir.declare %87 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_blocked"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %89 = fir.address_of(@_QMomp_libEComp_atv_cgroup) : !fir.ref<i64>
    %90 = fir.declare %89 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_cgroup"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %91 = fir.address_of(@_QMomp_libEComp_atv_contended) : !fir.ref<i64>
    %92 = fir.declare %91 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_contended"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %93 = fir.address_of(@_QMomp_libEComp_atv_default) : !fir.ref<i64>
    %94 = fir.declare %93 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_default"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %95 = fir.address_of(@_QMomp_libEComp_atv_default_mem_fb) : !fir.ref<i64>
    %96 = fir.declare %95 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_default_mem_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %97 = fir.address_of(@_QMomp_libEComp_atv_device) : !fir.ref<i64>
    %98 = fir.declare %97 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_device"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %99 = fir.address_of(@_QMomp_libEComp_atv_environment) : !fir.ref<i64>
    %100 = fir.declare %99 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_environment"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %101 = fir.address_of(@_QMomp_libEComp_atv_false) : !fir.ref<i64>
    %102 = fir.declare %101 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_false"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %103 = fir.address_of(@_QMomp_libEComp_atv_interleaved) : !fir.ref<i64>
    %104 = fir.declare %103 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_interleaved"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %105 = fir.address_of(@_QMomp_libEComp_atv_memspace) : !fir.ref<i64>
    %106 = fir.declare %105 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_memspace"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %107 = fir.address_of(@_QMomp_libEComp_atv_multiple) : !fir.ref<i64>
    %108 = fir.declare %107 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_multiple"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %109 = fir.address_of(@_QMomp_libEComp_atv_nearest) : !fir.ref<i64>
    %110 = fir.declare %109 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_nearest"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %111 = fir.address_of(@_QMomp_libEComp_atv_null_fb) : !fir.ref<i64>
    %112 = fir.declare %111 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_null_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %113 = fir.address_of(@_QMomp_libEComp_atv_private) : !fir.ref<i64>
    %114 = fir.declare %113 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_private"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %115 = fir.address_of(@_QMomp_libEComp_atv_pteam) : !fir.ref<i64>
    %116 = fir.declare %115 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_pteam"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %117 = fir.address_of(@_QMomp_libEComp_atv_sequential) : !fir.ref<i64>
    %118 = fir.declare %117 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_sequential"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %119 = fir.address_of(@_QMomp_libEComp_atv_serialized) : !fir.ref<i64>
    %120 = fir.declare %119 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_serialized"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %121 = fir.address_of(@_QMomp_libEComp_atv_single) : !fir.ref<i64>
    %122 = fir.declare %121 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_single"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %123 = fir.address_of(@_QMomp_libEComp_atv_thread) : !fir.ref<i64>
    %124 = fir.declare %123 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_thread"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %125 = fir.address_of(@_QMomp_libEComp_atv_true) : !fir.ref<i64>
    %126 = fir.declare %125 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_true"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %127 = fir.address_of(@_QMomp_libEComp_atv_uncontended) : !fir.ref<i64>
    %128 = fir.declare %127 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_uncontended"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %129 = fir.address_of(@_QMomp_libEComp_cgroup_mem_alloc) : !fir.ref<i64>
    %130 = fir.declare %129 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_cgroup_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %131 = fir.address_of(@_QMomp_libEComp_const_mem_alloc) : !fir.ref<i64>
    %132 = fir.declare %131 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_const_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %133 = fir.address_of(@_QMomp_libEComp_const_mem_space) : !fir.ref<i64>
    %134 = fir.declare %133 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_const_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %135 = fir.address_of(@_QMomp_libEComp_control_tool_end) : !fir.ref<i32>
    %136 = fir.declare %135 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_end"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %137 = fir.address_of(@_QMomp_libEComp_control_tool_flush) : !fir.ref<i32>
    %138 = fir.declare %137 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_flush"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %139 = fir.address_of(@_QMomp_libEComp_control_tool_ignored) : !fir.ref<i32>
    %140 = fir.declare %139 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_ignored"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %141 = fir.address_of(@_QMomp_lib_kindsEComp_control_tool_kind) : !fir.ref<i32>
    %142 = fir.declare %141 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_control_tool_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %143 = fir.address_of(@_QMomp_libEComp_control_tool_nocallback) : !fir.ref<i32>
    %144 = fir.declare %143 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_nocallback"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %145 = fir.address_of(@_QMomp_libEComp_control_tool_notool) : !fir.ref<i32>
    %146 = fir.declare %145 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_notool"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %147 = fir.address_of(@_QMomp_libEComp_control_tool_pause) : !fir.ref<i32>
    %148 = fir.declare %147 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_pause"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %149 = fir.address_of(@_QMomp_lib_kindsEComp_control_tool_result_kind) : !fir.ref<i32>
    %150 = fir.declare %149 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_control_tool_result_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %151 = fir.address_of(@_QMomp_libEComp_control_tool_start) : !fir.ref<i32>
    %152 = fir.declare %151 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_start"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %153 = fir.address_of(@_QMomp_libEComp_control_tool_success) : !fir.ref<i32>
    %154 = fir.declare %153 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_success"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %155 = fir.address_of(@_QMomp_libEComp_default_mem_alloc) : !fir.ref<i64>
    %156 = fir.declare %155 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_default_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %157 = fir.address_of(@_QMomp_libEComp_default_mem_space) : !fir.ref<i64>
    %158 = fir.declare %157 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_default_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %159 = fir.address_of(@_QMomp_lib_kindsEComp_depend_kind) : !fir.ref<i32>
    %160 = fir.declare %159 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_depend_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %161 = fir.address_of(@_QMomp_lib_kindsEComp_event_handle_kind) : !fir.ref<i32>
    %162 = fir.declare %161 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_event_handle_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %163 = fir.address_of(@_QMomp_libEComp_high_bw_mem_alloc) : !fir.ref<i64>
    %164 = fir.declare %163 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_high_bw_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %165 = fir.address_of(@_QMomp_libEComp_high_bw_mem_space) : !fir.ref<i64>
    %166 = fir.declare %165 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_high_bw_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %167 = fir.address_of(@_QMomp_libEComp_ifr_cuda) : !fir.ref<i32>
    %168 = fir.declare %167 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_cuda"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %169 = fir.address_of(@_QMomp_libEComp_ifr_cuda_driver) : !fir.ref<i32>
    %170 = fir.declare %169 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_cuda_driver"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %171 = fir.address_of(@_QMomp_libEComp_ifr_hip) : !fir.ref<i32>
    %172 = fir.declare %171 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_hip"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %173 = fir.address_of(@_QMomp_libEComp_ifr_last) : !fir.ref<i32>
    %174 = fir.declare %173 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_last"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %175 = fir.address_of(@_QMomp_libEComp_ifr_level_zero) : !fir.ref<i32>
    %176 = fir.declare %175 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_level_zero"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %177 = fir.address_of(@_QMomp_libEComp_ifr_opencl) : !fir.ref<i32>
    %178 = fir.declare %177 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_opencl"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %179 = fir.address_of(@_QMomp_libEComp_ifr_sycl) : !fir.ref<i32>
    %180 = fir.declare %179 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_sycl"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %181 = fir.address_of(@_QMomp_lib_kindsEComp_integer_kind) : !fir.ref<i32>
    %182 = fir.declare %181 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_integer_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %183 = fir.address_of(@_QMomp_lib_kindsEComp_interop_fr_kind) : !fir.ref<i32>
    %184 = fir.declare %183 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_interop_fr_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %185 = fir.address_of(@_QMomp_lib_kindsEComp_interop_kind) : !fir.ref<i32>
    %186 = fir.declare %185 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_interop_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %187 = fir.address_of(@_QMomp_libEComp_interop_none) : !fir.ref<i64>
    %188 = fir.declare %187 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_interop_none"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %189 = fir.address_of(@_QMomp_libEComp_large_cap_mem_alloc) : !fir.ref<i64>
    %190 = fir.declare %189 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_large_cap_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %191 = fir.address_of(@_QMomp_libEComp_large_cap_mem_space) : !fir.ref<i64>
    %192 = fir.declare %191 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_large_cap_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %193 = fir.address_of(@_QMomp_libEComp_lock_hint_contended) : !fir.ref<i32>
    %194 = fir.declare %193 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_contended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %195 = fir.address_of(@_QMomp_lib_kindsEComp_lock_hint_kind) : !fir.ref<i32>
    %196 = fir.declare %195 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_lock_hint_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %197 = fir.address_of(@_QMomp_libEComp_lock_hint_none) : !fir.ref<i32>
    %198 = fir.declare %197 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_none"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %199 = fir.address_of(@_QMomp_libEComp_lock_hint_nonspeculative) : !fir.ref<i32>
    %200 = fir.declare %199 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_nonspeculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %201 = fir.address_of(@_QMomp_libEComp_lock_hint_speculative) : !fir.ref<i32>
    %202 = fir.declare %201 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_speculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %203 = fir.address_of(@_QMomp_libEComp_lock_hint_uncontended) : !fir.ref<i32>
    %204 = fir.declare %203 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_uncontended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %205 = fir.address_of(@_QMomp_lib_kindsEComp_lock_kind) : !fir.ref<i32>
    %206 = fir.declare %205 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_lock_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %207 = fir.address_of(@_QMomp_lib_kindsEComp_logical_kind) : !fir.ref<i32>
    %208 = fir.declare %207 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_logical_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %209 = fir.address_of(@_QMomp_libEComp_low_lat_mem_alloc) : !fir.ref<i64>
    %210 = fir.declare %209 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_low_lat_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %211 = fir.address_of(@_QMomp_libEComp_low_lat_mem_space) : !fir.ref<i64>
    %212 = fir.declare %211 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_low_lat_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %213 = fir.address_of(@_QMomp_lib_kindsEComp_memspace_handle_kind) : !fir.ref<i32>
    %214 = fir.declare %213 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_memspace_handle_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %215 = fir.address_of(@_QMomp_lib_kindsEComp_nest_lock_kind) : !fir.ref<i32>
    %216 = fir.declare %215 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_nest_lock_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %217 = fir.address_of(@_QMomp_libEComp_null_allocator) : !fir.ref<i64>
    %218 = fir.declare %217 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_null_allocator"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %219 = fir.address_of(@_QMomp_libEComp_null_mem_space) : !fir.ref<i64>
    %220 = fir.declare %219 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_null_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %221 = fir.address_of(@_QMomp_libEComp_pause_hard) : !fir.ref<i32>
    %222 = fir.declare %221 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_hard"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %223 = fir.address_of(@_QMomp_lib_kindsEComp_pause_resource_kind) : !fir.ref<i32>
    %224 = fir.declare %223 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_pause_resource_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %225 = fir.address_of(@_QMomp_libEComp_pause_resume) : !fir.ref<i32>
    %226 = fir.declare %225 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_resume"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %227 = fir.address_of(@_QMomp_libEComp_pause_soft) : !fir.ref<i32>
    %228 = fir.declare %227 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_soft"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %229 = fir.address_of(@_QMomp_libEComp_pause_stop_tool) : !fir.ref<i32>
    %230 = fir.declare %229 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_stop_tool"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %231 = fir.address_of(@_QMomp_libEComp_proc_bind_close) : !fir.ref<i32>
    %232 = fir.declare %231 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_close"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %233 = fir.address_of(@_QMomp_libEComp_proc_bind_false) : !fir.ref<i32>
    %234 = fir.declare %233 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_false"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %235 = fir.address_of(@_QMomp_lib_kindsEComp_proc_bind_kind) : !fir.ref<i32>
    %236 = fir.declare %235 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_proc_bind_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %237 = fir.address_of(@_QMomp_libEComp_proc_bind_master) : !fir.ref<i32>
    %238 = fir.declare %237 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_master"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %239 = fir.address_of(@_QMomp_libEComp_proc_bind_spread) : !fir.ref<i32>
    %240 = fir.declare %239 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_spread"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %241 = fir.address_of(@_QMomp_libEComp_proc_bind_true) : !fir.ref<i32>
    %242 = fir.declare %241 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_true"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %243 = fir.address_of(@_QMomp_libEComp_pteam_mem_alloc) : !fir.ref<i64>
    %244 = fir.declare %243 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pteam_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %245 = fir.address_of(@_QMomp_lib_kindsEComp_real_kind) : !fir.ref<i32>
    %246 = fir.declare %245 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_real_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %247 = fir.address_of(@_QMomp_libEComp_sched_auto) : !fir.ref<i32>
    %248 = fir.declare %247 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_auto"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %249 = fir.address_of(@_QMomp_libEComp_sched_dynamic) : !fir.ref<i32>
    %250 = fir.declare %249 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_dynamic"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %251 = fir.address_of(@_QMomp_libEComp_sched_guided) : !fir.ref<i32>
    %252 = fir.declare %251 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_guided"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %253 = fir.address_of(@_QMomp_lib_kindsEComp_sched_kind) : !fir.ref<i32>
    %254 = fir.declare %253 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_sched_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %255 = fir.address_of(@_QMomp_libEComp_sched_monotonic) : !fir.ref<i32>
    %256 = fir.declare %255 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_monotonic"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %257 = fir.address_of(@_QMomp_libEComp_sched_static) : !fir.ref<i32>
    %258 = fir.declare %257 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_static"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %259 = fir.address_of(@_QMomp_libEComp_sync_hint_contended) : !fir.ref<i32>
    %260 = fir.declare %259 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_contended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %261 = fir.address_of(@_QMomp_lib_kindsEComp_sync_hint_kind) : !fir.ref<i32>
    %262 = fir.declare %261 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_sync_hint_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %263 = fir.address_of(@_QMomp_libEComp_sync_hint_none) : !fir.ref<i32>
    %264 = fir.declare %263 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_none"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %265 = fir.address_of(@_QMomp_libEComp_sync_hint_nonspeculative) : !fir.ref<i32>
    %266 = fir.declare %265 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_nonspeculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %267 = fir.address_of(@_QMomp_libEComp_sync_hint_speculative) : !fir.ref<i32>
    %268 = fir.declare %267 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_speculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %269 = fir.address_of(@_QMomp_libEComp_sync_hint_uncontended) : !fir.ref<i32>
    %270 = fir.declare %269 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_uncontended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %271 = fir.address_of(@_QMomp_libEComp_thread_mem_alloc) : !fir.ref<i64>
    %272 = fir.declare %271 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_thread_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %273 = fir.address_of(@_QMomp_libECopenmp_version) : !fir.ref<i32>
    %274 = fir.declare %273 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECopenmp_version"} : (!fir.ref<i32>) -> !fir.ref<i32>
    omp.parallel private(@_QFEi_private_i32 %2 -> %arg0 : !fir.ref<i32>) {
      %275 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
      omp.wsloop private(@_QFEi_private_i32 %275 -> %arg1 : !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c10_i32) inclusive step (%c1_i32) {
          %276 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %276 : !fir.ref<i32>
          omp.critical(@print_lock) {
            %277 = fir.address_of(@_QQclX72d7f1df2e21b2225460d8f9d1882875) : !fir.ref<!fir.char<1,55>>
            %278 = fir.convert %277 : (!fir.ref<!fir.char<1,55>>) -> !fir.ref<i8>
            %279 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %278, %c12_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
            %280 = fir.address_of(@_QQclXE7BABFE7A88B) : !fir.ref<!fir.char<1,6>>
            %281 = fir.declare %280 typeparams %c6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE7BABFE7A88B"} : (!fir.ref<!fir.char<1,6>>, index) -> !fir.ref<!fir.char<1,6>>
            %282 = fir.convert %281 : (!fir.ref<!fir.char<1,6>>) -> !fir.ref<i8>
            %283 = fir.convert %c6 : (index) -> i64
            %284 = fir.call @_FortranAioOutputAscii(%279, %282, %283) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
            %285 = fir.call @omp_get_thread_num() proc_attrs<bind_c> fastmath<contract> : () -> i32
            %286 = fir.call @_FortranAioOutputInteger32(%279, %285) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
            %287 = fir.address_of(@_QQclXE5A484E79086E8BFADE4BBA3) : !fir.ref<!fir.char<1,12>>
            %288 = fir.declare %287 typeparams %c12 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE5A484E79086E8BFADE4BBA3"} : (!fir.ref<!fir.char<1,12>>, index) -> !fir.ref<!fir.char<1,12>>
            %289 = fir.convert %288 : (!fir.ref<!fir.char<1,12>>) -> !fir.ref<i8>
            %290 = fir.convert %c12 : (index) -> i64
            %291 = fir.call @_FortranAioOutputAscii(%279, %289, %290) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
            %292 = fir.load %276 : !fir.ref<i32>
            %293 = fir.call @_FortranAioOutputInteger32(%279, %292) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
            %294 = fir.call @_FortranAioEndIoStatement(%279) fastmath<contract> : (!fir.ref<i8>) -> i32
            omp.terminator
          }
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  fir.global @_QMomp_lib_kindsECkmp_affinity_mask_kind constant : i32
  fir.global @_QMomp_lib_kindsECkmp_cancel_kind constant : i32
  fir.global @_QMomp_libECkmp_cancel_loop constant : i32
  fir.global @_QMomp_libECkmp_cancel_parallel constant : i32
  fir.global @_QMomp_libECkmp_cancel_sections constant : i32
  fir.global @_QMomp_libECkmp_cancel_taskgroup constant : i32
  fir.global @_QMomp_lib_kindsECkmp_double_kind constant : i32
  fir.global @_QMomp_libECkmp_lock_hint_adaptive constant : i32
  fir.global @_QMomp_libECkmp_lock_hint_hle constant : i32
  fir.global @_QMomp_libECkmp_lock_hint_rtm constant : i32
  fir.global @_QMomp_lib_kindsECkmp_pointer_kind constant : i32
  fir.global @_QMomp_lib_kindsECkmp_size_t_kind constant : i32
  fir.global @_QMomp_libECkmp_version_build constant : i32
  fir.global @_QMomp_libECkmp_version_major constant : i32
  fir.global @_QMomp_libECkmp_version_minor constant : i32
  fir.global @_QMomp_libECllvm_omp_target_device_mem_alloc constant : i64
  fir.global @_QMomp_libECllvm_omp_target_device_mem_space constant : i64
  fir.global @_QMomp_libECllvm_omp_target_host_mem_alloc constant : i64
  fir.global @_QMomp_libECllvm_omp_target_host_mem_space constant : i64
  fir.global @_QMomp_libECllvm_omp_target_shared_mem_alloc constant : i64
  fir.global @_QMomp_libECllvm_omp_target_shared_mem_space constant : i64
  fir.global internal @_QFECn constant : i32 {
    %c10_i32 = arith.constant 10 : i32
    fir.has_value %c10_i32 : i32
  }
  fir.global @_QMomp_lib_kindsEComp_allocator_handle_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_alloctrait_key_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_alloctrait_val_kind constant : i32
  fir.global @_QMomp_libEComp_atk_access constant : i32
  fir.global @_QMomp_libEComp_atk_alignment constant : i32
  fir.global @_QMomp_libEComp_atk_atomic_scope constant : i32
  fir.global @_QMomp_libEComp_atk_device_access constant : i32
  fir.global @_QMomp_libEComp_atk_fallback constant : i32
  fir.global @_QMomp_libEComp_atk_fb_data constant : i32
  fir.global @_QMomp_libEComp_atk_part_size constant : i32
  fir.global @_QMomp_libEComp_atk_partition constant : i32
  fir.global @_QMomp_libEComp_atk_pin_device constant : i32
  fir.global @_QMomp_libEComp_atk_pinned constant : i32
  fir.global @_QMomp_libEComp_atk_pool_size constant : i32
  fir.global @_QMomp_libEComp_atk_preferred_device constant : i32
  fir.global @_QMomp_libEComp_atk_sync_hint constant : i32
  fir.global @_QMomp_libEComp_atk_target_access constant : i32
  fir.global @_QMomp_libEComp_atv_abort_fb constant : i64
  fir.global @_QMomp_libEComp_atv_all constant : i64
  fir.global @_QMomp_libEComp_atv_allocator_fb constant : i64
  fir.global @_QMomp_libEComp_atv_blocked constant : i64
  fir.global @_QMomp_libEComp_atv_cgroup constant : i64
  fir.global @_QMomp_libEComp_atv_contended constant : i64
  fir.global @_QMomp_libEComp_atv_default constant : i64
  fir.global @_QMomp_libEComp_atv_default_mem_fb constant : i64
  fir.global @_QMomp_libEComp_atv_device constant : i64
  fir.global @_QMomp_libEComp_atv_environment constant : i64
  fir.global @_QMomp_libEComp_atv_false constant : i64
  fir.global @_QMomp_libEComp_atv_interleaved constant : i64
  fir.global @_QMomp_libEComp_atv_memspace constant : i64
  fir.global @_QMomp_libEComp_atv_multiple constant : i64
  fir.global @_QMomp_libEComp_atv_nearest constant : i64
  fir.global @_QMomp_libEComp_atv_null_fb constant : i64
  fir.global @_QMomp_libEComp_atv_private constant : i64
  fir.global @_QMomp_libEComp_atv_pteam constant : i64
  fir.global @_QMomp_libEComp_atv_sequential constant : i64
  fir.global @_QMomp_libEComp_atv_serialized constant : i64
  fir.global @_QMomp_libEComp_atv_single constant : i64
  fir.global @_QMomp_libEComp_atv_thread constant : i64
  fir.global @_QMomp_libEComp_atv_true constant : i64
  fir.global @_QMomp_libEComp_atv_uncontended constant : i64
  fir.global @_QMomp_libEComp_cgroup_mem_alloc constant : i64
  fir.global @_QMomp_libEComp_const_mem_alloc constant : i64
  fir.global @_QMomp_libEComp_const_mem_space constant : i64
  fir.global @_QMomp_libEComp_control_tool_end constant : i32
  fir.global @_QMomp_libEComp_control_tool_flush constant : i32
  fir.global @_QMomp_libEComp_control_tool_ignored constant : i32
  fir.global @_QMomp_lib_kindsEComp_control_tool_kind constant : i32
  fir.global @_QMomp_libEComp_control_tool_nocallback constant : i32
  fir.global @_QMomp_libEComp_control_tool_notool constant : i32
  fir.global @_QMomp_libEComp_control_tool_pause constant : i32
  fir.global @_QMomp_lib_kindsEComp_control_tool_result_kind constant : i32
  fir.global @_QMomp_libEComp_control_tool_start constant : i32
  fir.global @_QMomp_libEComp_control_tool_success constant : i32
  fir.global @_QMomp_libEComp_default_mem_alloc constant : i64
  fir.global @_QMomp_libEComp_default_mem_space constant : i64
  fir.global @_QMomp_lib_kindsEComp_depend_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_event_handle_kind constant : i32
  fir.global @_QMomp_libEComp_high_bw_mem_alloc constant : i64
  fir.global @_QMomp_libEComp_high_bw_mem_space constant : i64
  fir.global @_QMomp_libEComp_ifr_cuda constant : i32
  fir.global @_QMomp_libEComp_ifr_cuda_driver constant : i32
  fir.global @_QMomp_libEComp_ifr_hip constant : i32
  fir.global @_QMomp_libEComp_ifr_last constant : i32
  fir.global @_QMomp_libEComp_ifr_level_zero constant : i32
  fir.global @_QMomp_libEComp_ifr_opencl constant : i32
  fir.global @_QMomp_libEComp_ifr_sycl constant : i32
  fir.global @_QMomp_lib_kindsEComp_integer_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_interop_fr_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_interop_kind constant : i32
  fir.global @_QMomp_libEComp_interop_none constant : i64
  fir.global @_QMomp_libEComp_large_cap_mem_alloc constant : i64
  fir.global @_QMomp_libEComp_large_cap_mem_space constant : i64
  fir.global @_QMomp_libEComp_lock_hint_contended constant : i32
  fir.global @_QMomp_lib_kindsEComp_lock_hint_kind constant : i32
  fir.global @_QMomp_libEComp_lock_hint_none constant : i32
  fir.global @_QMomp_libEComp_lock_hint_nonspeculative constant : i32
  fir.global @_QMomp_libEComp_lock_hint_speculative constant : i32
  fir.global @_QMomp_libEComp_lock_hint_uncontended constant : i32
  fir.global @_QMomp_lib_kindsEComp_lock_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_logical_kind constant : i32
  fir.global @_QMomp_libEComp_low_lat_mem_alloc constant : i64
  fir.global @_QMomp_libEComp_low_lat_mem_space constant : i64
  fir.global @_QMomp_lib_kindsEComp_memspace_handle_kind constant : i32
  fir.global @_QMomp_lib_kindsEComp_nest_lock_kind constant : i32
  fir.global @_QMomp_libEComp_null_allocator constant : i64
  fir.global @_QMomp_libEComp_null_mem_space constant : i64
  fir.global @_QMomp_libEComp_pause_hard constant : i32
  fir.global @_QMomp_lib_kindsEComp_pause_resource_kind constant : i32
  fir.global @_QMomp_libEComp_pause_resume constant : i32
  fir.global @_QMomp_libEComp_pause_soft constant : i32
  fir.global @_QMomp_libEComp_pause_stop_tool constant : i32
  fir.global @_QMomp_libEComp_proc_bind_close constant : i32
  fir.global @_QMomp_libEComp_proc_bind_false constant : i32
  fir.global @_QMomp_lib_kindsEComp_proc_bind_kind constant : i32
  fir.global @_QMomp_libEComp_proc_bind_master constant : i32
  fir.global @_QMomp_libEComp_proc_bind_spread constant : i32
  fir.global @_QMomp_libEComp_proc_bind_true constant : i32
  fir.global @_QMomp_libEComp_pteam_mem_alloc constant : i64
  fir.global @_QMomp_lib_kindsEComp_real_kind constant : i32
  fir.global @_QMomp_libEComp_sched_auto constant : i32
  fir.global @_QMomp_libEComp_sched_dynamic constant : i32
  fir.global @_QMomp_libEComp_sched_guided constant : i32
  fir.global @_QMomp_lib_kindsEComp_sched_kind constant : i32
  fir.global @_QMomp_libEComp_sched_monotonic constant : i32
  fir.global @_QMomp_libEComp_sched_static constant : i32
  fir.global @_QMomp_libEComp_sync_hint_contended constant : i32
  fir.global @_QMomp_lib_kindsEComp_sync_hint_kind constant : i32
  fir.global @_QMomp_libEComp_sync_hint_none constant : i32
  fir.global @_QMomp_libEComp_sync_hint_nonspeculative constant : i32
  fir.global @_QMomp_libEComp_sync_hint_speculative constant : i32
  fir.global @_QMomp_libEComp_sync_hint_uncontended constant : i32
  fir.global @_QMomp_libEComp_thread_mem_alloc constant : i64
  fir.global @_QMomp_libECopenmp_version constant : i32
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX72d7f1df2e21b2225460d8f9d1882875 constant : !fir.char<1,55> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/critical/critical.f90\00"(55) : !fir.char<1,55>
    fir.has_value %0 : !fir.char<1,55>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE7BABFE7A88B constant : !fir.char<1,6> {
    %0 = fir.string_lit "\E7\BA\BF\E7\A8\8B"(6) : !fir.char<1,6>
    fir.has_value %0 : !fir.char<1,6>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
  func.func private @omp_get_thread_num() -> i32 attributes {fir.bindc_name = "omp_get_thread_num", fir.proc_attrs = #fir.proc_attrs<bind_c>}
  fir.global linkonce @_QQclXE5A484E79086E8BFADE4BBA3 constant : !fir.char<1,12> {
    %0 = fir.string_lit "\E5\A4\84\E7\90\86\E8\BF\AD\E4\BB\A3"(12) : !fir.char<1,12>
    fir.has_value %0 : !fir.char<1,12>
  }
  func.func private @_FortranAioEndIoStatement(!fir.ref<i8>) -> i32 attributes {fir.io, fir.runtime}
  func.func private @_FortranAProgramStart(i32, !llvm.ptr, !llvm.ptr, !llvm.ptr)
  func.func private @_FortranAProgramEndStatement()
  func.func @main(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = fir.zero_bits !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>
    fir.call @_FortranAProgramStart(%arg0, %arg1, %arg2, %0) fastmath<contract> : (i32, !llvm.ptr, !llvm.ptr, !fir.ref<tuple<i32, !fir.ref<!fir.array<0xtuple<!fir.ref<i8>, !fir.ref<i8>>>>>>) -> ()
    fir.call @_QQmain() fastmath<contract> : () -> ()
    fir.call @_FortranAProgramEndStatement() fastmath<contract> : () -> ()
    return %c0_i32 : i32
  }
}
