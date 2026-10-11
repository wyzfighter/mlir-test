module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_SINGLE"} {
    %c0_i32 = arith.constant 0 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "a", uniq_name = "_QFEa"}
    %2:2 = hlfir.declare %1 {uniq_name = "_QFEa"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %3 = fir.alloca i32 {bindc_name = "b", uniq_name = "_QFEb"}
    %4:2 = hlfir.declare %3 {uniq_name = "_QFEb"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %5 = fir.alloca i32 {bindc_name = "c", uniq_name = "_QFEc"}
    %6:2 = hlfir.declare %5 {uniq_name = "_QFEc"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %7 = fir.address_of(@_QMomp_lib_kindsECkmp_affinity_mask_kind) : !fir.ref<i32>
    %8:2 = hlfir.declare %7 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_affinity_mask_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %9 = fir.address_of(@_QMomp_lib_kindsECkmp_cancel_kind) : !fir.ref<i32>
    %10:2 = hlfir.declare %9 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_cancel_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %11 = fir.address_of(@_QMomp_libECkmp_cancel_loop) : !fir.ref<i32>
    %12:2 = hlfir.declare %11 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_loop"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %13 = fir.address_of(@_QMomp_libECkmp_cancel_parallel) : !fir.ref<i32>
    %14:2 = hlfir.declare %13 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_parallel"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %15 = fir.address_of(@_QMomp_libECkmp_cancel_sections) : !fir.ref<i32>
    %16:2 = hlfir.declare %15 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_sections"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %17 = fir.address_of(@_QMomp_libECkmp_cancel_taskgroup) : !fir.ref<i32>
    %18:2 = hlfir.declare %17 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_cancel_taskgroup"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %19 = fir.address_of(@_QMomp_lib_kindsECkmp_double_kind) : !fir.ref<i32>
    %20:2 = hlfir.declare %19 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_double_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %21 = fir.address_of(@_QMomp_libECkmp_lock_hint_adaptive) : !fir.ref<i32>
    %22:2 = hlfir.declare %21 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_adaptive"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %23 = fir.address_of(@_QMomp_libECkmp_lock_hint_hle) : !fir.ref<i32>
    %24:2 = hlfir.declare %23 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_hle"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %25 = fir.address_of(@_QMomp_libECkmp_lock_hint_rtm) : !fir.ref<i32>
    %26:2 = hlfir.declare %25 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_lock_hint_rtm"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %27 = fir.address_of(@_QMomp_lib_kindsECkmp_pointer_kind) : !fir.ref<i32>
    %28:2 = hlfir.declare %27 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_pointer_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %29 = fir.address_of(@_QMomp_lib_kindsECkmp_size_t_kind) : !fir.ref<i32>
    %30:2 = hlfir.declare %29 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsECkmp_size_t_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %31 = fir.address_of(@_QMomp_libECkmp_version_build) : !fir.ref<i32>
    %32:2 = hlfir.declare %31 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_build"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %33 = fir.address_of(@_QMomp_libECkmp_version_major) : !fir.ref<i32>
    %34:2 = hlfir.declare %33 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_major"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %35 = fir.address_of(@_QMomp_libECkmp_version_minor) : !fir.ref<i32>
    %36:2 = hlfir.declare %35 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECkmp_version_minor"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %37 = fir.address_of(@_QMomp_libECllvm_omp_target_device_mem_alloc) : !fir.ref<i64>
    %38:2 = hlfir.declare %37 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_device_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %39 = fir.address_of(@_QMomp_libECllvm_omp_target_device_mem_space) : !fir.ref<i64>
    %40:2 = hlfir.declare %39 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_device_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %41 = fir.address_of(@_QMomp_libECllvm_omp_target_host_mem_alloc) : !fir.ref<i64>
    %42:2 = hlfir.declare %41 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_host_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %43 = fir.address_of(@_QMomp_libECllvm_omp_target_host_mem_space) : !fir.ref<i64>
    %44:2 = hlfir.declare %43 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_host_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %45 = fir.address_of(@_QMomp_libECllvm_omp_target_shared_mem_alloc) : !fir.ref<i64>
    %46:2 = hlfir.declare %45 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_shared_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %47 = fir.address_of(@_QMomp_libECllvm_omp_target_shared_mem_space) : !fir.ref<i64>
    %48:2 = hlfir.declare %47 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECllvm_omp_target_shared_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %49 = fir.address_of(@_QMomp_lib_kindsEComp_allocator_handle_kind) : !fir.ref<i32>
    %50:2 = hlfir.declare %49 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_allocator_handle_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %51 = fir.address_of(@_QMomp_lib_kindsEComp_alloctrait_key_kind) : !fir.ref<i32>
    %52:2 = hlfir.declare %51 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_alloctrait_key_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %53 = fir.address_of(@_QMomp_lib_kindsEComp_alloctrait_val_kind) : !fir.ref<i32>
    %54:2 = hlfir.declare %53 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_alloctrait_val_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %55 = fir.address_of(@_QMomp_libEComp_atk_access) : !fir.ref<i32>
    %56:2 = hlfir.declare %55 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_access"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %57 = fir.address_of(@_QMomp_libEComp_atk_alignment) : !fir.ref<i32>
    %58:2 = hlfir.declare %57 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_alignment"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %59 = fir.address_of(@_QMomp_libEComp_atk_atomic_scope) : !fir.ref<i32>
    %60:2 = hlfir.declare %59 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_atomic_scope"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %61 = fir.address_of(@_QMomp_libEComp_atk_device_access) : !fir.ref<i32>
    %62:2 = hlfir.declare %61 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_device_access"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %63 = fir.address_of(@_QMomp_libEComp_atk_fallback) : !fir.ref<i32>
    %64:2 = hlfir.declare %63 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_fallback"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %65 = fir.address_of(@_QMomp_libEComp_atk_fb_data) : !fir.ref<i32>
    %66:2 = hlfir.declare %65 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_fb_data"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %67 = fir.address_of(@_QMomp_libEComp_atk_part_size) : !fir.ref<i32>
    %68:2 = hlfir.declare %67 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_part_size"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %69 = fir.address_of(@_QMomp_libEComp_atk_partition) : !fir.ref<i32>
    %70:2 = hlfir.declare %69 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_partition"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %71 = fir.address_of(@_QMomp_libEComp_atk_pin_device) : !fir.ref<i32>
    %72:2 = hlfir.declare %71 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pin_device"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %73 = fir.address_of(@_QMomp_libEComp_atk_pinned) : !fir.ref<i32>
    %74:2 = hlfir.declare %73 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pinned"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %75 = fir.address_of(@_QMomp_libEComp_atk_pool_size) : !fir.ref<i32>
    %76:2 = hlfir.declare %75 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_pool_size"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %77 = fir.address_of(@_QMomp_libEComp_atk_preferred_device) : !fir.ref<i32>
    %78:2 = hlfir.declare %77 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_preferred_device"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %79 = fir.address_of(@_QMomp_libEComp_atk_sync_hint) : !fir.ref<i32>
    %80:2 = hlfir.declare %79 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_sync_hint"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %81 = fir.address_of(@_QMomp_libEComp_atk_target_access) : !fir.ref<i32>
    %82:2 = hlfir.declare %81 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atk_target_access"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %83 = fir.address_of(@_QMomp_libEComp_atv_abort_fb) : !fir.ref<i64>
    %84:2 = hlfir.declare %83 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_abort_fb"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %85 = fir.address_of(@_QMomp_libEComp_atv_all) : !fir.ref<i64>
    %86:2 = hlfir.declare %85 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_all"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %87 = fir.address_of(@_QMomp_libEComp_atv_allocator_fb) : !fir.ref<i64>
    %88:2 = hlfir.declare %87 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_allocator_fb"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %89 = fir.address_of(@_QMomp_libEComp_atv_blocked) : !fir.ref<i64>
    %90:2 = hlfir.declare %89 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_blocked"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %91 = fir.address_of(@_QMomp_libEComp_atv_cgroup) : !fir.ref<i64>
    %92:2 = hlfir.declare %91 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_cgroup"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %93 = fir.address_of(@_QMomp_libEComp_atv_contended) : !fir.ref<i64>
    %94:2 = hlfir.declare %93 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_contended"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %95 = fir.address_of(@_QMomp_libEComp_atv_default) : !fir.ref<i64>
    %96:2 = hlfir.declare %95 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_default"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %97 = fir.address_of(@_QMomp_libEComp_atv_default_mem_fb) : !fir.ref<i64>
    %98:2 = hlfir.declare %97 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_default_mem_fb"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %99 = fir.address_of(@_QMomp_libEComp_atv_device) : !fir.ref<i64>
    %100:2 = hlfir.declare %99 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_device"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %101 = fir.address_of(@_QMomp_libEComp_atv_environment) : !fir.ref<i64>
    %102:2 = hlfir.declare %101 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_environment"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %103 = fir.address_of(@_QMomp_libEComp_atv_false) : !fir.ref<i64>
    %104:2 = hlfir.declare %103 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_false"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %105 = fir.address_of(@_QMomp_libEComp_atv_interleaved) : !fir.ref<i64>
    %106:2 = hlfir.declare %105 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_interleaved"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %107 = fir.address_of(@_QMomp_libEComp_atv_memspace) : !fir.ref<i64>
    %108:2 = hlfir.declare %107 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_memspace"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %109 = fir.address_of(@_QMomp_libEComp_atv_multiple) : !fir.ref<i64>
    %110:2 = hlfir.declare %109 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_multiple"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %111 = fir.address_of(@_QMomp_libEComp_atv_nearest) : !fir.ref<i64>
    %112:2 = hlfir.declare %111 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_nearest"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %113 = fir.address_of(@_QMomp_libEComp_atv_null_fb) : !fir.ref<i64>
    %114:2 = hlfir.declare %113 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_null_fb"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %115 = fir.address_of(@_QMomp_libEComp_atv_private) : !fir.ref<i64>
    %116:2 = hlfir.declare %115 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_private"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %117 = fir.address_of(@_QMomp_libEComp_atv_pteam) : !fir.ref<i64>
    %118:2 = hlfir.declare %117 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_pteam"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %119 = fir.address_of(@_QMomp_libEComp_atv_sequential) : !fir.ref<i64>
    %120:2 = hlfir.declare %119 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_sequential"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %121 = fir.address_of(@_QMomp_libEComp_atv_serialized) : !fir.ref<i64>
    %122:2 = hlfir.declare %121 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_serialized"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %123 = fir.address_of(@_QMomp_libEComp_atv_single) : !fir.ref<i64>
    %124:2 = hlfir.declare %123 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_single"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %125 = fir.address_of(@_QMomp_libEComp_atv_thread) : !fir.ref<i64>
    %126:2 = hlfir.declare %125 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_thread"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %127 = fir.address_of(@_QMomp_libEComp_atv_true) : !fir.ref<i64>
    %128:2 = hlfir.declare %127 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_true"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %129 = fir.address_of(@_QMomp_libEComp_atv_uncontended) : !fir.ref<i64>
    %130:2 = hlfir.declare %129 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_atv_uncontended"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %131 = fir.address_of(@_QMomp_libEComp_cgroup_mem_alloc) : !fir.ref<i64>
    %132:2 = hlfir.declare %131 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_cgroup_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %133 = fir.address_of(@_QMomp_libEComp_const_mem_alloc) : !fir.ref<i64>
    %134:2 = hlfir.declare %133 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_const_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %135 = fir.address_of(@_QMomp_libEComp_const_mem_space) : !fir.ref<i64>
    %136:2 = hlfir.declare %135 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_const_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %137 = fir.address_of(@_QMomp_libEComp_control_tool_end) : !fir.ref<i32>
    %138:2 = hlfir.declare %137 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_end"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %139 = fir.address_of(@_QMomp_libEComp_control_tool_flush) : !fir.ref<i32>
    %140:2 = hlfir.declare %139 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_flush"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %141 = fir.address_of(@_QMomp_libEComp_control_tool_ignored) : !fir.ref<i32>
    %142:2 = hlfir.declare %141 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_ignored"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %143 = fir.address_of(@_QMomp_lib_kindsEComp_control_tool_kind) : !fir.ref<i32>
    %144:2 = hlfir.declare %143 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_control_tool_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %145 = fir.address_of(@_QMomp_libEComp_control_tool_nocallback) : !fir.ref<i32>
    %146:2 = hlfir.declare %145 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_nocallback"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %147 = fir.address_of(@_QMomp_libEComp_control_tool_notool) : !fir.ref<i32>
    %148:2 = hlfir.declare %147 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_notool"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %149 = fir.address_of(@_QMomp_libEComp_control_tool_pause) : !fir.ref<i32>
    %150:2 = hlfir.declare %149 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_pause"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %151 = fir.address_of(@_QMomp_lib_kindsEComp_control_tool_result_kind) : !fir.ref<i32>
    %152:2 = hlfir.declare %151 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_control_tool_result_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %153 = fir.address_of(@_QMomp_libEComp_control_tool_start) : !fir.ref<i32>
    %154:2 = hlfir.declare %153 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_start"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %155 = fir.address_of(@_QMomp_libEComp_control_tool_success) : !fir.ref<i32>
    %156:2 = hlfir.declare %155 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_control_tool_success"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %157 = fir.address_of(@_QMomp_libEComp_default_mem_alloc) : !fir.ref<i64>
    %158:2 = hlfir.declare %157 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_default_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %159 = fir.address_of(@_QMomp_libEComp_default_mem_space) : !fir.ref<i64>
    %160:2 = hlfir.declare %159 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_default_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %161 = fir.address_of(@_QMomp_lib_kindsEComp_depend_kind) : !fir.ref<i32>
    %162:2 = hlfir.declare %161 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_depend_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %163 = fir.address_of(@_QMomp_lib_kindsEComp_event_handle_kind) : !fir.ref<i32>
    %164:2 = hlfir.declare %163 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_event_handle_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %165 = fir.address_of(@_QMomp_libEComp_high_bw_mem_alloc) : !fir.ref<i64>
    %166:2 = hlfir.declare %165 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_high_bw_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %167 = fir.address_of(@_QMomp_libEComp_high_bw_mem_space) : !fir.ref<i64>
    %168:2 = hlfir.declare %167 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_high_bw_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %169 = fir.address_of(@_QMomp_libEComp_ifr_cuda) : !fir.ref<i32>
    %170:2 = hlfir.declare %169 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_cuda"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %171 = fir.address_of(@_QMomp_libEComp_ifr_cuda_driver) : !fir.ref<i32>
    %172:2 = hlfir.declare %171 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_cuda_driver"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %173 = fir.address_of(@_QMomp_libEComp_ifr_hip) : !fir.ref<i32>
    %174:2 = hlfir.declare %173 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_hip"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %175 = fir.address_of(@_QMomp_libEComp_ifr_last) : !fir.ref<i32>
    %176:2 = hlfir.declare %175 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_last"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %177 = fir.address_of(@_QMomp_libEComp_ifr_level_zero) : !fir.ref<i32>
    %178:2 = hlfir.declare %177 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_level_zero"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %179 = fir.address_of(@_QMomp_libEComp_ifr_opencl) : !fir.ref<i32>
    %180:2 = hlfir.declare %179 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_opencl"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %181 = fir.address_of(@_QMomp_libEComp_ifr_sycl) : !fir.ref<i32>
    %182:2 = hlfir.declare %181 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_ifr_sycl"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %183 = fir.address_of(@_QMomp_lib_kindsEComp_integer_kind) : !fir.ref<i32>
    %184:2 = hlfir.declare %183 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_integer_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %185 = fir.address_of(@_QMomp_lib_kindsEComp_interop_fr_kind) : !fir.ref<i32>
    %186:2 = hlfir.declare %185 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_interop_fr_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %187 = fir.address_of(@_QMomp_lib_kindsEComp_interop_kind) : !fir.ref<i32>
    %188:2 = hlfir.declare %187 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_interop_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %189 = fir.address_of(@_QMomp_libEComp_interop_none) : !fir.ref<i64>
    %190:2 = hlfir.declare %189 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_interop_none"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %191 = fir.address_of(@_QMomp_libEComp_large_cap_mem_alloc) : !fir.ref<i64>
    %192:2 = hlfir.declare %191 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_large_cap_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %193 = fir.address_of(@_QMomp_libEComp_large_cap_mem_space) : !fir.ref<i64>
    %194:2 = hlfir.declare %193 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_large_cap_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %195 = fir.address_of(@_QMomp_libEComp_lock_hint_contended) : !fir.ref<i32>
    %196:2 = hlfir.declare %195 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_contended"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %197 = fir.address_of(@_QMomp_lib_kindsEComp_lock_hint_kind) : !fir.ref<i32>
    %198:2 = hlfir.declare %197 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_lock_hint_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %199 = fir.address_of(@_QMomp_libEComp_lock_hint_none) : !fir.ref<i32>
    %200:2 = hlfir.declare %199 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_none"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %201 = fir.address_of(@_QMomp_libEComp_lock_hint_nonspeculative) : !fir.ref<i32>
    %202:2 = hlfir.declare %201 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_nonspeculative"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %203 = fir.address_of(@_QMomp_libEComp_lock_hint_speculative) : !fir.ref<i32>
    %204:2 = hlfir.declare %203 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_speculative"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %205 = fir.address_of(@_QMomp_libEComp_lock_hint_uncontended) : !fir.ref<i32>
    %206:2 = hlfir.declare %205 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_lock_hint_uncontended"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %207 = fir.address_of(@_QMomp_lib_kindsEComp_lock_kind) : !fir.ref<i32>
    %208:2 = hlfir.declare %207 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_lock_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %209 = fir.address_of(@_QMomp_lib_kindsEComp_logical_kind) : !fir.ref<i32>
    %210:2 = hlfir.declare %209 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_logical_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %211 = fir.address_of(@_QMomp_libEComp_low_lat_mem_alloc) : !fir.ref<i64>
    %212:2 = hlfir.declare %211 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_low_lat_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %213 = fir.address_of(@_QMomp_libEComp_low_lat_mem_space) : !fir.ref<i64>
    %214:2 = hlfir.declare %213 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_low_lat_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %215 = fir.address_of(@_QMomp_lib_kindsEComp_memspace_handle_kind) : !fir.ref<i32>
    %216:2 = hlfir.declare %215 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_memspace_handle_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %217 = fir.address_of(@_QMomp_lib_kindsEComp_nest_lock_kind) : !fir.ref<i32>
    %218:2 = hlfir.declare %217 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_nest_lock_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %219 = fir.address_of(@_QMomp_libEComp_null_allocator) : !fir.ref<i64>
    %220:2 = hlfir.declare %219 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_null_allocator"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %221 = fir.address_of(@_QMomp_libEComp_null_mem_space) : !fir.ref<i64>
    %222:2 = hlfir.declare %221 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_null_mem_space"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %223 = fir.address_of(@_QMomp_libEComp_pause_hard) : !fir.ref<i32>
    %224:2 = hlfir.declare %223 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_hard"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %225 = fir.address_of(@_QMomp_lib_kindsEComp_pause_resource_kind) : !fir.ref<i32>
    %226:2 = hlfir.declare %225 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_pause_resource_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %227 = fir.address_of(@_QMomp_libEComp_pause_resume) : !fir.ref<i32>
    %228:2 = hlfir.declare %227 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_resume"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %229 = fir.address_of(@_QMomp_libEComp_pause_soft) : !fir.ref<i32>
    %230:2 = hlfir.declare %229 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_soft"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %231 = fir.address_of(@_QMomp_libEComp_pause_stop_tool) : !fir.ref<i32>
    %232:2 = hlfir.declare %231 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pause_stop_tool"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %233 = fir.address_of(@_QMomp_libEComp_proc_bind_close) : !fir.ref<i32>
    %234:2 = hlfir.declare %233 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_close"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %235 = fir.address_of(@_QMomp_libEComp_proc_bind_false) : !fir.ref<i32>
    %236:2 = hlfir.declare %235 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_false"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %237 = fir.address_of(@_QMomp_lib_kindsEComp_proc_bind_kind) : !fir.ref<i32>
    %238:2 = hlfir.declare %237 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_proc_bind_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %239 = fir.address_of(@_QMomp_libEComp_proc_bind_master) : !fir.ref<i32>
    %240:2 = hlfir.declare %239 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_master"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %241 = fir.address_of(@_QMomp_libEComp_proc_bind_spread) : !fir.ref<i32>
    %242:2 = hlfir.declare %241 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_spread"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %243 = fir.address_of(@_QMomp_libEComp_proc_bind_true) : !fir.ref<i32>
    %244:2 = hlfir.declare %243 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_proc_bind_true"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %245 = fir.address_of(@_QMomp_libEComp_pteam_mem_alloc) : !fir.ref<i64>
    %246:2 = hlfir.declare %245 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_pteam_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %247 = fir.address_of(@_QMomp_lib_kindsEComp_real_kind) : !fir.ref<i32>
    %248:2 = hlfir.declare %247 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_real_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %249 = fir.address_of(@_QMomp_libEComp_sched_auto) : !fir.ref<i32>
    %250:2 = hlfir.declare %249 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_auto"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %251 = fir.address_of(@_QMomp_libEComp_sched_dynamic) : !fir.ref<i32>
    %252:2 = hlfir.declare %251 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_dynamic"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %253 = fir.address_of(@_QMomp_libEComp_sched_guided) : !fir.ref<i32>
    %254:2 = hlfir.declare %253 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_guided"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %255 = fir.address_of(@_QMomp_lib_kindsEComp_sched_kind) : !fir.ref<i32>
    %256:2 = hlfir.declare %255 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_sched_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %257 = fir.address_of(@_QMomp_libEComp_sched_monotonic) : !fir.ref<i32>
    %258:2 = hlfir.declare %257 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_monotonic"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %259 = fir.address_of(@_QMomp_libEComp_sched_static) : !fir.ref<i32>
    %260:2 = hlfir.declare %259 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sched_static"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %261 = fir.address_of(@_QMomp_libEComp_sync_hint_contended) : !fir.ref<i32>
    %262:2 = hlfir.declare %261 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_contended"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %263 = fir.address_of(@_QMomp_lib_kindsEComp_sync_hint_kind) : !fir.ref<i32>
    %264:2 = hlfir.declare %263 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_lib_kindsEComp_sync_hint_kind"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %265 = fir.address_of(@_QMomp_libEComp_sync_hint_none) : !fir.ref<i32>
    %266:2 = hlfir.declare %265 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_none"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %267 = fir.address_of(@_QMomp_libEComp_sync_hint_nonspeculative) : !fir.ref<i32>
    %268:2 = hlfir.declare %267 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_nonspeculative"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %269 = fir.address_of(@_QMomp_libEComp_sync_hint_speculative) : !fir.ref<i32>
    %270:2 = hlfir.declare %269 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_speculative"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %271 = fir.address_of(@_QMomp_libEComp_sync_hint_uncontended) : !fir.ref<i32>
    %272:2 = hlfir.declare %271 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_sync_hint_uncontended"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %273 = fir.address_of(@_QMomp_libEComp_thread_mem_alloc) : !fir.ref<i64>
    %274:2 = hlfir.declare %273 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libEComp_thread_mem_alloc"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %275 = fir.address_of(@_QMomp_libECopenmp_version) : !fir.ref<i32>
    %276:2 = hlfir.declare %275 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QMomp_libECopenmp_version"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c1_i32 to %2#0 : i32, !fir.ref<i32>
    hlfir.assign %c2_i32 to %4#0 : i32, !fir.ref<i32>
    hlfir.assign %c0_i32 to %6#0 : i32, !fir.ref<i32>
    omp.single {
      %277 = fir.load %2#0 : !fir.ref<i32>
      %278 = fir.load %4#0 : !fir.ref<i32>
      %279 = arith.addi %277, %278 : i32
      hlfir.assign %279 to %6#0 : i32, !fir.ref<i32>
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
