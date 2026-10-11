module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.flags = #omp.flags<openmp_device_version = 31>, omp.integer_wrap_around = #omp.integer_wrap_around<integer_wrap_around = false>, omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp.clause_requires<none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c99999 = arith.constant 99999 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1234_i32 = arith.constant 1234 : i32
    %c100000 = arith.constant 100000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100000xi32>>
    %2 = fir.shape %c100000 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100000xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100000xi32>>, !fir.ref<!fir.array<100000xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "n", uniq_name = "_QFEn"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c1234_i32 to %7#0 : i32, !fir.ref<i32>
    %8 = omp.map.info var_ptr(%7#1 : !fir.ref<i32>, i32) map_clauses(to) capture(ByRef) name("n") -> !fir.ref<i32>
    %9 = omp.map.bounds lower_bound(%c0 : index) upper_bound(%c99999 : index) extent(%c100000 : index) stride(%c1 : index) start_idx(%c1 : index)
    %10 = omp.map.info var_ptr(%3#1 : !fir.ref<!fir.array<100000xi32>>, !fir.array<100000xi32>) map_clauses(from) capture(ByRef) bounds(%9) name("a") -> !fir.ref<!fir.array<100000xi32>>
    %11 = omp.map.info var_ptr(%5#1 : !fir.ref<i32>, i32) map_clauses(implicit) capture(ByCopy) name("i") -> !fir.ref<i32>
    omp.target kernel_type(generic) map_entries(%8 -> %arg0, %10 -> %arg1, %11 -> %arg2 : !fir.ref<i32>, !fir.ref<!fir.array<100000xi32>>, !fir.ref<i32>) {
      %c1_0 = arith.constant 1 : index
      %c0_1 = arith.constant 0 : index
      %c1_i32 = arith.constant 1 : i32
      %c100000_2 = arith.constant 100000 : index
      %12:2 = hlfir.declare %arg0 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %13 = fir.shape %c100000_2 : (index) -> !fir.shape<1>
      %14:2 = hlfir.declare %arg1(%13) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100000xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100000xi32>>, !fir.ref<!fir.array<100000xi32>>)
      %15:2 = hlfir.declare %arg2 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %16 = fir.load %12#0 : !fir.ref<i32>
      %17 = fir.convert %16 : (i32) -> index
      cf.br ^bb1(%c1_i32, %17 : i32, index)
    ^bb1(%18: i32, %19: index):  // 2 preds: ^bb0, ^bb2
      %20 = arith.cmpi sgt, %19, %c0_1 : index
      cf.cond_br %20, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      fir.store %18 to %15#0 : !fir.ref<i32>
      %21 = fir.load %15#0 : !fir.ref<i32>
      %22 = arith.muli %21, %21 : i32
      %23 = arith.addi %21, %21 overflow<nsw> : i32
      %24 = fir.convert %23 : (i32) -> i64
      %25 = hlfir.designate %14#0 (%24)  : (!fir.ref<!fir.array<100000xi32>>, i64) -> !fir.ref<i32>
      hlfir.assign %22 to %25 : i32, !fir.ref<i32>
      %26 = arith.addi %18, %c1_i32 overflow<nsw> : i32
      %27 = arith.subi %19, %c1_0 : index
      cf.br ^bb1(%26, %27 : i32, index)
    ^bb3:  // pred: ^bb1
      %28 = arith.maxsi %17, %c0_1 : index
      %29 = arith.addi %28, %c1_0 : index
      %30 = fir.convert %29 : (index) -> i32
      fir.store %30 to %15#0 : !fir.ref<i32>
      omp.terminator
    }
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<100000xi32> {
    %0 = fir.zero_bits !fir.array<100000xi32>
    fir.has_value %0 : !fir.array<100000xi32>
  }
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
