module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_NUM_THREADS"} {
    %c33 = arith.constant 33 : index
    %c15_i32 = arith.constant 15 : i32
    %c6_i32 = arith.constant 6 : i32
    %cst = arith.constant 0.00999999977 : f32
    %c500_i32 = arith.constant 500 : i32
    %c1_i32 = arith.constant 1 : i32
    %c4_i32 = arith.constant 4 : i32
    %c500 = arith.constant 500 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEarr) : !fir.ref<!fir.array<500xf32>>
    %2 = fir.shape %c500 : (index) -> !fir.shape<1>
    %3 = fir.declare %1(%2) {uniq_name = "_QFEarr"} : (!fir.ref<!fir.array<500xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<500xf32>>
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5 = fir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %6 = fir.address_of(@_QMomp_lib_kindsECkmp_affinity_mask_kind) : !fir.ref<i32>
    %7 = fir.declare %6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_affinity_mask_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %8 = fir.address_of(@_QMomp_lib_kindsECkmp_cancel_kind) : !fir.ref<i32>
    %9 = fir.declare %8 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_cancel_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %10 = fir.address_of(@_QMomp_libECkmp_cancel_loop) : !fir.ref<i32>
    %11 = fir.declare %10 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_loop"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %12 = fir.address_of(@_QMomp_libECkmp_cancel_parallel) : !fir.ref<i32>
    %13 = fir.declare %12 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_parallel"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %14 = fir.address_of(@_QMomp_libECkmp_cancel_sections) : !fir.ref<i32>
    %15 = fir.declare %14 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_sections"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %16 = fir.address_of(@_QMomp_libECkmp_cancel_taskgroup) : !fir.ref<i32>
    %17 = fir.declare %16 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_taskgroup"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %18 = fir.address_of(@_QMomp_lib_kindsECkmp_double_kind) : !fir.ref<i32>
    %19 = fir.declare %18 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_double_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %20 = fir.address_of(@_QMomp_libECkmp_lock_hint_adaptive) : !fir.ref<i32>
    %21 = fir.declare %20 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_adaptive"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %22 = fir.address_of(@_QMomp_libECkmp_lock_hint_hle) : !fir.ref<i32>
    %23 = fir.declare %22 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_hle"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %24 = fir.address_of(@_QMomp_libECkmp_lock_hint_rtm) : !fir.ref<i32>
    %25 = fir.declare %24 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_rtm"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %26 = fir.address_of(@_QMomp_lib_kindsECkmp_pointer_kind) : !fir.ref<i32>
    %27 = fir.declare %26 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_pointer_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %28 = fir.address_of(@_QMomp_lib_kindsECkmp_size_t_kind) : !fir.ref<i32>
    %29 = fir.declare %28 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_size_t_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %30 = fir.address_of(@_QMomp_libECkmp_version_build) : !fir.ref<i32>
    %31 = fir.declare %30 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_build"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %32 = fir.address_of(@_QMomp_libECkmp_version_major) : !fir.ref<i32>
    %33 = fir.declare %32 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_major"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %34 = fir.address_of(@_QMomp_libECkmp_version_minor) : !fir.ref<i32>
    %35 = fir.declare %34 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_minor"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %36 = fir.address_of(@_QMomp_libECllvm_omp_target_device_mem_alloc) : !fir.ref<i64>
    %37 = fir.declare %36 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_device_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %38 = fir.address_of(@_QMomp_libECllvm_omp_target_device_mem_space) : !fir.ref<i64>
    %39 = fir.declare %38 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_device_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %40 = fir.address_of(@_QMomp_libECllvm_omp_target_host_mem_alloc) : !fir.ref<i64>
    %41 = fir.declare %40 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_host_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %42 = fir.address_of(@_QMomp_libECllvm_omp_target_host_mem_space) : !fir.ref<i64>
    %43 = fir.declare %42 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_host_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %44 = fir.address_of(@_QMomp_libECllvm_omp_target_shared_mem_alloc) : !fir.ref<i64>
    %45 = fir.declare %44 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_shared_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %46 = fir.address_of(@_QMomp_libECllvm_omp_target_shared_mem_space) : !fir.ref<i64>
    %47 = fir.declare %46 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_shared_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %48 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %49 = fir.declare %48 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %50 = fir.address_of(@_QMomp_lib_kindsEComp_allocator_handle_kind) : !fir.ref<i32>
    %51 = fir.declare %50 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_allocator_handle_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %52 = fir.address_of(@_QMomp_lib_kindsEComp_alloctrait_key_kind) : !fir.ref<i32>
    %53 = fir.declare %52 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_alloctrait_key_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %54 = fir.address_of(@_QMomp_lib_kindsEComp_alloctrait_val_kind) : !fir.ref<i32>
    %55 = fir.declare %54 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_alloctrait_val_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %56 = fir.address_of(@_QMomp_libEComp_atk_access) : !fir.ref<i32>
    %57 = fir.declare %56 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_access"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %58 = fir.address_of(@_QMomp_libEComp_atk_alignment) : !fir.ref<i32>
    %59 = fir.declare %58 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_alignment"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %60 = fir.address_of(@_QMomp_libEComp_atk_atomic_scope) : !fir.ref<i32>
    %61 = fir.declare %60 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_atomic_scope"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %62 = fir.address_of(@_QMomp_libEComp_atk_device_access) : !fir.ref<i32>
    %63 = fir.declare %62 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_device_access"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %64 = fir.address_of(@_QMomp_libEComp_atk_fallback) : !fir.ref<i32>
    %65 = fir.declare %64 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_fallback"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %66 = fir.address_of(@_QMomp_libEComp_atk_fb_data) : !fir.ref<i32>
    %67 = fir.declare %66 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_fb_data"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %68 = fir.address_of(@_QMomp_libEComp_atk_part_size) : !fir.ref<i32>
    %69 = fir.declare %68 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_part_size"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %70 = fir.address_of(@_QMomp_libEComp_atk_partition) : !fir.ref<i32>
    %71 = fir.declare %70 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_partition"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %72 = fir.address_of(@_QMomp_libEComp_atk_pin_device) : !fir.ref<i32>
    %73 = fir.declare %72 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pin_device"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %74 = fir.address_of(@_QMomp_libEComp_atk_pinned) : !fir.ref<i32>
    %75 = fir.declare %74 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pinned"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %76 = fir.address_of(@_QMomp_libEComp_atk_pool_size) : !fir.ref<i32>
    %77 = fir.declare %76 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pool_size"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %78 = fir.address_of(@_QMomp_libEComp_atk_preferred_device) : !fir.ref<i32>
    %79 = fir.declare %78 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_preferred_device"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %80 = fir.address_of(@_QMomp_libEComp_atk_sync_hint) : !fir.ref<i32>
    %81 = fir.declare %80 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_sync_hint"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %82 = fir.address_of(@_QMomp_libEComp_atk_target_access) : !fir.ref<i32>
    %83 = fir.declare %82 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_target_access"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %84 = fir.address_of(@_QMomp_libEComp_atv_abort_fb) : !fir.ref<i64>
    %85 = fir.declare %84 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_abort_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %86 = fir.address_of(@_QMomp_libEComp_atv_all) : !fir.ref<i64>
    %87 = fir.declare %86 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_all"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %88 = fir.address_of(@_QMomp_libEComp_atv_allocator_fb) : !fir.ref<i64>
    %89 = fir.declare %88 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_allocator_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %90 = fir.address_of(@_QMomp_libEComp_atv_blocked) : !fir.ref<i64>
    %91 = fir.declare %90 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_blocked"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %92 = fir.address_of(@_QMomp_libEComp_atv_cgroup) : !fir.ref<i64>
    %93 = fir.declare %92 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_cgroup"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %94 = fir.address_of(@_QMomp_libEComp_atv_contended) : !fir.ref<i64>
    %95 = fir.declare %94 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_contended"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %96 = fir.address_of(@_QMomp_libEComp_atv_default) : !fir.ref<i64>
    %97 = fir.declare %96 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_default"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %98 = fir.address_of(@_QMomp_libEComp_atv_default_mem_fb) : !fir.ref<i64>
    %99 = fir.declare %98 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_default_mem_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %100 = fir.address_of(@_QMomp_libEComp_atv_device) : !fir.ref<i64>
    %101 = fir.declare %100 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_device"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %102 = fir.address_of(@_QMomp_libEComp_atv_environment) : !fir.ref<i64>
    %103 = fir.declare %102 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_environment"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %104 = fir.address_of(@_QMomp_libEComp_atv_false) : !fir.ref<i64>
    %105 = fir.declare %104 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_false"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %106 = fir.address_of(@_QMomp_libEComp_atv_interleaved) : !fir.ref<i64>
    %107 = fir.declare %106 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_interleaved"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %108 = fir.address_of(@_QMomp_libEComp_atv_memspace) : !fir.ref<i64>
    %109 = fir.declare %108 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_memspace"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %110 = fir.address_of(@_QMomp_libEComp_atv_multiple) : !fir.ref<i64>
    %111 = fir.declare %110 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_multiple"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %112 = fir.address_of(@_QMomp_libEComp_atv_nearest) : !fir.ref<i64>
    %113 = fir.declare %112 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_nearest"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %114 = fir.address_of(@_QMomp_libEComp_atv_null_fb) : !fir.ref<i64>
    %115 = fir.declare %114 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_null_fb"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %116 = fir.address_of(@_QMomp_libEComp_atv_private) : !fir.ref<i64>
    %117 = fir.declare %116 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_private"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %118 = fir.address_of(@_QMomp_libEComp_atv_pteam) : !fir.ref<i64>
    %119 = fir.declare %118 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_pteam"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %120 = fir.address_of(@_QMomp_libEComp_atv_sequential) : !fir.ref<i64>
    %121 = fir.declare %120 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_sequential"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %122 = fir.address_of(@_QMomp_libEComp_atv_serialized) : !fir.ref<i64>
    %123 = fir.declare %122 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_serialized"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %124 = fir.address_of(@_QMomp_libEComp_atv_single) : !fir.ref<i64>
    %125 = fir.declare %124 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_single"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %126 = fir.address_of(@_QMomp_libEComp_atv_thread) : !fir.ref<i64>
    %127 = fir.declare %126 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_thread"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %128 = fir.address_of(@_QMomp_libEComp_atv_true) : !fir.ref<i64>
    %129 = fir.declare %128 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_true"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %130 = fir.address_of(@_QMomp_libEComp_atv_uncontended) : !fir.ref<i64>
    %131 = fir.declare %130 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_uncontended"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %132 = fir.address_of(@_QMomp_libEComp_cgroup_mem_alloc) : !fir.ref<i64>
    %133 = fir.declare %132 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_cgroup_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %134 = fir.address_of(@_QMomp_libEComp_const_mem_alloc) : !fir.ref<i64>
    %135 = fir.declare %134 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_const_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %136 = fir.address_of(@_QMomp_libEComp_const_mem_space) : !fir.ref<i64>
    %137 = fir.declare %136 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_const_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %138 = fir.address_of(@_QMomp_libEComp_control_tool_end) : !fir.ref<i32>
    %139 = fir.declare %138 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_end"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %140 = fir.address_of(@_QMomp_libEComp_control_tool_flush) : !fir.ref<i32>
    %141 = fir.declare %140 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_flush"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %142 = fir.address_of(@_QMomp_libEComp_control_tool_ignored) : !fir.ref<i32>
    %143 = fir.declare %142 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_ignored"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %144 = fir.address_of(@_QMomp_lib_kindsEComp_control_tool_kind) : !fir.ref<i32>
    %145 = fir.declare %144 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_control_tool_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %146 = fir.address_of(@_QMomp_libEComp_control_tool_nocallback) : !fir.ref<i32>
    %147 = fir.declare %146 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_nocallback"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %148 = fir.address_of(@_QMomp_libEComp_control_tool_notool) : !fir.ref<i32>
    %149 = fir.declare %148 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_notool"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %150 = fir.address_of(@_QMomp_libEComp_control_tool_pause) : !fir.ref<i32>
    %151 = fir.declare %150 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_pause"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %152 = fir.address_of(@_QMomp_lib_kindsEComp_control_tool_result_kind) : !fir.ref<i32>
    %153 = fir.declare %152 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_control_tool_result_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %154 = fir.address_of(@_QMomp_libEComp_control_tool_start) : !fir.ref<i32>
    %155 = fir.declare %154 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_start"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %156 = fir.address_of(@_QMomp_libEComp_control_tool_success) : !fir.ref<i32>
    %157 = fir.declare %156 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_success"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %158 = fir.address_of(@_QMomp_libEComp_default_mem_alloc) : !fir.ref<i64>
    %159 = fir.declare %158 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_default_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %160 = fir.address_of(@_QMomp_libEComp_default_mem_space) : !fir.ref<i64>
    %161 = fir.declare %160 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_default_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %162 = fir.address_of(@_QMomp_lib_kindsEComp_depend_kind) : !fir.ref<i32>
    %163 = fir.declare %162 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_depend_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %164 = fir.address_of(@_QMomp_lib_kindsEComp_event_handle_kind) : !fir.ref<i32>
    %165 = fir.declare %164 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_event_handle_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %166 = fir.address_of(@_QMomp_libEComp_high_bw_mem_alloc) : !fir.ref<i64>
    %167 = fir.declare %166 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_high_bw_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %168 = fir.address_of(@_QMomp_libEComp_high_bw_mem_space) : !fir.ref<i64>
    %169 = fir.declare %168 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_high_bw_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %170 = fir.address_of(@_QMomp_libEComp_ifr_cuda) : !fir.ref<i32>
    %171 = fir.declare %170 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_cuda"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %172 = fir.address_of(@_QMomp_libEComp_ifr_cuda_driver) : !fir.ref<i32>
    %173 = fir.declare %172 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_cuda_driver"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %174 = fir.address_of(@_QMomp_libEComp_ifr_hip) : !fir.ref<i32>
    %175 = fir.declare %174 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_hip"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %176 = fir.address_of(@_QMomp_libEComp_ifr_last) : !fir.ref<i32>
    %177 = fir.declare %176 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_last"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %178 = fir.address_of(@_QMomp_libEComp_ifr_level_zero) : !fir.ref<i32>
    %179 = fir.declare %178 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_level_zero"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %180 = fir.address_of(@_QMomp_libEComp_ifr_opencl) : !fir.ref<i32>
    %181 = fir.declare %180 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_opencl"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %182 = fir.address_of(@_QMomp_libEComp_ifr_sycl) : !fir.ref<i32>
    %183 = fir.declare %182 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_sycl"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %184 = fir.address_of(@_QMomp_lib_kindsEComp_integer_kind) : !fir.ref<i32>
    %185 = fir.declare %184 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_integer_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %186 = fir.address_of(@_QMomp_lib_kindsEComp_interop_fr_kind) : !fir.ref<i32>
    %187 = fir.declare %186 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_interop_fr_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %188 = fir.address_of(@_QMomp_lib_kindsEComp_interop_kind) : !fir.ref<i32>
    %189 = fir.declare %188 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_interop_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %190 = fir.address_of(@_QMomp_libEComp_interop_none) : !fir.ref<i64>
    %191 = fir.declare %190 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_interop_none"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %192 = fir.address_of(@_QMomp_libEComp_large_cap_mem_alloc) : !fir.ref<i64>
    %193 = fir.declare %192 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_large_cap_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %194 = fir.address_of(@_QMomp_libEComp_large_cap_mem_space) : !fir.ref<i64>
    %195 = fir.declare %194 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_large_cap_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %196 = fir.address_of(@_QMomp_libEComp_lock_hint_contended) : !fir.ref<i32>
    %197 = fir.declare %196 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_contended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %198 = fir.address_of(@_QMomp_lib_kindsEComp_lock_hint_kind) : !fir.ref<i32>
    %199 = fir.declare %198 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_lock_hint_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %200 = fir.address_of(@_QMomp_libEComp_lock_hint_none) : !fir.ref<i32>
    %201 = fir.declare %200 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_none"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %202 = fir.address_of(@_QMomp_libEComp_lock_hint_nonspeculative) : !fir.ref<i32>
    %203 = fir.declare %202 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_nonspeculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %204 = fir.address_of(@_QMomp_libEComp_lock_hint_speculative) : !fir.ref<i32>
    %205 = fir.declare %204 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_speculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %206 = fir.address_of(@_QMomp_libEComp_lock_hint_uncontended) : !fir.ref<i32>
    %207 = fir.declare %206 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_uncontended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %208 = fir.address_of(@_QMomp_lib_kindsEComp_lock_kind) : !fir.ref<i32>
    %209 = fir.declare %208 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_lock_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %210 = fir.address_of(@_QMomp_lib_kindsEComp_logical_kind) : !fir.ref<i32>
    %211 = fir.declare %210 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_logical_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %212 = fir.address_of(@_QMomp_libEComp_low_lat_mem_alloc) : !fir.ref<i64>
    %213 = fir.declare %212 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_low_lat_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %214 = fir.address_of(@_QMomp_libEComp_low_lat_mem_space) : !fir.ref<i64>
    %215 = fir.declare %214 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_low_lat_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %216 = fir.address_of(@_QMomp_lib_kindsEComp_memspace_handle_kind) : !fir.ref<i32>
    %217 = fir.declare %216 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_memspace_handle_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %218 = fir.address_of(@_QMomp_lib_kindsEComp_nest_lock_kind) : !fir.ref<i32>
    %219 = fir.declare %218 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_nest_lock_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %220 = fir.address_of(@_QMomp_libEComp_null_allocator) : !fir.ref<i64>
    %221 = fir.declare %220 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_null_allocator"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %222 = fir.address_of(@_QMomp_libEComp_null_mem_space) : !fir.ref<i64>
    %223 = fir.declare %222 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_null_mem_space"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %224 = fir.address_of(@_QMomp_libEComp_pause_hard) : !fir.ref<i32>
    %225 = fir.declare %224 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_hard"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %226 = fir.address_of(@_QMomp_lib_kindsEComp_pause_resource_kind) : !fir.ref<i32>
    %227 = fir.declare %226 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_pause_resource_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %228 = fir.address_of(@_QMomp_libEComp_pause_resume) : !fir.ref<i32>
    %229 = fir.declare %228 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_resume"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %230 = fir.address_of(@_QMomp_libEComp_pause_soft) : !fir.ref<i32>
    %231 = fir.declare %230 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_soft"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %232 = fir.address_of(@_QMomp_libEComp_pause_stop_tool) : !fir.ref<i32>
    %233 = fir.declare %232 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_stop_tool"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %234 = fir.address_of(@_QMomp_libEComp_proc_bind_close) : !fir.ref<i32>
    %235 = fir.declare %234 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_close"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %236 = fir.address_of(@_QMomp_libEComp_proc_bind_false) : !fir.ref<i32>
    %237 = fir.declare %236 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_false"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %238 = fir.address_of(@_QMomp_lib_kindsEComp_proc_bind_kind) : !fir.ref<i32>
    %239 = fir.declare %238 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_proc_bind_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %240 = fir.address_of(@_QMomp_libEComp_proc_bind_master) : !fir.ref<i32>
    %241 = fir.declare %240 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_master"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %242 = fir.address_of(@_QMomp_libEComp_proc_bind_spread) : !fir.ref<i32>
    %243 = fir.declare %242 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_spread"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %244 = fir.address_of(@_QMomp_libEComp_proc_bind_true) : !fir.ref<i32>
    %245 = fir.declare %244 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_true"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %246 = fir.address_of(@_QMomp_libEComp_pteam_mem_alloc) : !fir.ref<i64>
    %247 = fir.declare %246 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pteam_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %248 = fir.address_of(@_QMomp_lib_kindsEComp_real_kind) : !fir.ref<i32>
    %249 = fir.declare %248 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_real_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %250 = fir.address_of(@_QMomp_libEComp_sched_auto) : !fir.ref<i32>
    %251 = fir.declare %250 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_auto"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %252 = fir.address_of(@_QMomp_libEComp_sched_dynamic) : !fir.ref<i32>
    %253 = fir.declare %252 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_dynamic"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %254 = fir.address_of(@_QMomp_libEComp_sched_guided) : !fir.ref<i32>
    %255 = fir.declare %254 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_guided"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %256 = fir.address_of(@_QMomp_lib_kindsEComp_sched_kind) : !fir.ref<i32>
    %257 = fir.declare %256 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_sched_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %258 = fir.address_of(@_QMomp_libEComp_sched_monotonic) : !fir.ref<i32>
    %259 = fir.declare %258 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_monotonic"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %260 = fir.address_of(@_QMomp_libEComp_sched_static) : !fir.ref<i32>
    %261 = fir.declare %260 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_static"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %262 = fir.address_of(@_QMomp_libEComp_sync_hint_contended) : !fir.ref<i32>
    %263 = fir.declare %262 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_contended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %264 = fir.address_of(@_QMomp_lib_kindsEComp_sync_hint_kind) : !fir.ref<i32>
    %265 = fir.declare %264 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_sync_hint_kind"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %266 = fir.address_of(@_QMomp_libEComp_sync_hint_none) : !fir.ref<i32>
    %267 = fir.declare %266 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_none"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %268 = fir.address_of(@_QMomp_libEComp_sync_hint_nonspeculative) : !fir.ref<i32>
    %269 = fir.declare %268 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_nonspeculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %270 = fir.address_of(@_QMomp_libEComp_sync_hint_speculative) : !fir.ref<i32>
    %271 = fir.declare %270 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_speculative"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %272 = fir.address_of(@_QMomp_libEComp_sync_hint_uncontended) : !fir.ref<i32>
    %273 = fir.declare %272 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_uncontended"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %274 = fir.address_of(@_QMomp_libEComp_thread_mem_alloc) : !fir.ref<i64>
    %275 = fir.declare %274 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_thread_mem_alloc"} : (!fir.ref<i64>) -> !fir.ref<i64>
    %276 = fir.address_of(@_QMomp_libECopenmp_version) : !fir.ref<i32>
    %277 = fir.declare %276 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECopenmp_version"} : (!fir.ref<i32>) -> !fir.ref<i32>
    omp.parallel num_threads(%c4_i32 : i32) {
      omp.wsloop private(@_QFEi_private_i32 %5 -> %arg0 : !fir.ref<i32>) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%c500_i32) inclusive step (%c1_i32) {
          %289 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg1 to %289 : !fir.ref<i32>
          %290 = fir.load %289 : !fir.ref<i32>
          %291 = fir.convert %290 : (i32) -> f32
          %292 = arith.mulf %291, %cst fastmath<contract> : f32
          %293 = math.sin %292 fastmath<contract> : f32
          %294 = fir.load %289 : !fir.ref<i32>
          %295 = fir.convert %294 : (i32) -> i64
          %296 = fir.array_coor %3(%2) %295 : (!fir.ref<!fir.array<500xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %293 to %296 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %278 = fir.address_of(@_QQclXe0aab4394c34913d3642129c3519e2e2) : !fir.ref<!fir.char<1,61>>
    %279 = fir.convert %278 : (!fir.ref<!fir.char<1,61>>) -> !fir.ref<i8>
    %280 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %279, %c15_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %281 = fir.address_of(@_QQclXe1dcc3bc64273b855e7ec1b5d12f3f97) : !fir.ref<!fir.char<1,33>>
    %282 = fir.declare %281 typeparams %c33 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXe1dcc3bc64273b855e7ec1b5d12f3f97"} : (!fir.ref<!fir.char<1,33>>, index) -> !fir.ref<!fir.char<1,33>>
    %283 = fir.convert %282 : (!fir.ref<!fir.char<1,33>>) -> !fir.ref<i8>
    %284 = fir.convert %c33 : (index) -> i64
    %285 = fir.call @_FortranAioOutputAscii(%280, %283, %284) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %286 = fir.call @omp_get_max_threads() proc_attrs<bind_c> fastmath<contract> : () -> i32
    %287 = fir.call @_FortranAioOutputInteger32(%280, %286) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
    %288 = fir.call @_FortranAioEndIoStatement(%280) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEarr : !fir.array<500xf32> {
    %0 = fir.zero_bits !fir.array<500xf32>
    fir.has_value %0 : !fir.array<500xf32>
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
    %c500_i32 = arith.constant 500 : i32
    fir.has_value %c500_i32 : i32
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
  fir.global linkonce @_QQclXe0aab4394c34913d3642129c3519e2e2 constant : !fir.char<1,61> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/num_threads/num_threads.f90\00"(61) : !fir.char<1,61>
    fir.has_value %0 : !fir.char<1,61>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXe1dcc3bc64273b855e7ec1b5d12f3f97 constant : !fir.char<1,33> {
    %0 = fir.string_lit "\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8C\E6\9C\80\E5\A4\A7\E7\BA\BF\E7\A8\8B\E6\95\B0\EF\BC\9A"(33) : !fir.char<1,33>
    fir.has_value %0 : !fir.char<1,33>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
  func.func private @omp_get_max_threads() -> i32 attributes {fir.bindc_name = "omp_get_max_threads", fir.proc_attrs = #fir.proc_attrs<bind_c>}
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
