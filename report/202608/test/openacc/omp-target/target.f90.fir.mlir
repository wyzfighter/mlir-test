module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.8 (git@github.com:wyzfighter/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp<clause_requires none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c99 = arith.constant 99 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c100_i32 = arith.constant 100 : i32
    %c100 = arith.constant 100 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100xi32>>
    %2 = fir.shape %c100 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100xi32>>, !fir.ref<!fir.array<100xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "n", uniq_name = "_QFEn"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c100_i32 to %7#0 : i32, !fir.ref<i32>
    %8 = omp.map.info var_ptr(%7#1 : !fir.ref<i32>, i32) map_clauses(to) capture(ByRef) -> !fir.ref<i32> {name = "n"}
    %9 = omp.map.bounds lower_bound(%c0 : index) upper_bound(%c99 : index) extent(%c100 : index) stride(%c1 : index) start_idx(%c1 : index)
    %10 = omp.map.info var_ptr(%3#1 : !fir.ref<!fir.array<100xi32>>, !fir.array<100xi32>) map_clauses(from) capture(ByRef) bounds(%9) -> !fir.ref<!fir.array<100xi32>> {name = "a"}
    %11 = omp.map.info var_ptr(%5#1 : !fir.ref<i32>, i32) map_clauses(implicit) capture(ByCopy) -> !fir.ref<i32> {name = "i"}
    omp.target map_entries(%8 -> %arg0, %10 -> %arg1, %11 -> %arg2 : !fir.ref<i32>, !fir.ref<!fir.array<100xi32>>, !fir.ref<i32>) {
      %c0_0 = arith.constant 0 : index
      %c1_1 = arith.constant 1 : index
      %c100_2 = arith.constant 100 : index
      %12:2 = hlfir.declare %arg0 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %13 = fir.shape %c100_2 : (index) -> !fir.shape<1>
      %14:2 = hlfir.declare %arg1(%13) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100xi32>>, !fir.ref<!fir.array<100xi32>>)
      %15:2 = hlfir.declare %arg2 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %16 = fir.load %12#0 : !fir.ref<i32>
      %17 = fir.convert %16 : (i32) -> index
      %18 = fir.convert %c1_1 : (index) -> i32
      cf.br ^bb1(%18, %17 : i32, index)
    ^bb1(%19: i32, %20: index):  // 2 preds: ^bb0, ^bb2
      %21 = arith.cmpi sgt, %20, %c0_0 : index
      cf.cond_br %21, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      fir.store %19 to %15#0 : !fir.ref<i32>
      %22 = fir.load %15#0 : !fir.ref<i32>
      %23 = arith.addi %22, %18 overflow<nsw> : i32
      %24 = arith.subi %20, %c1_1 : index
      cf.br ^bb1(%23, %24 : i32, index)
    ^bb3:  // pred: ^bb1
      fir.store %19 to %15#0 : !fir.ref<i32>
      omp.terminator
    }
    return
  }
  fir.global internal @_QFEa : !fir.array<100xi32> {
    %0 = fir.zero_bits !fir.array<100xi32>
    fir.has_value %0 : !fir.array<100xi32>
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
