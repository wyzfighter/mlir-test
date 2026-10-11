module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEj_private_i32 : i32
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_COLLAPSE"} {
    %c10 = arith.constant 10 : index
    %c35 = arith.constant 35 : index
    %c24_i32 = arith.constant 24 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1 = arith.constant 1 : index
    %c200_i32 = arith.constant 200 : i32
    %c1_i32 = arith.constant 1 : i32
    %c200 = arith.constant 200 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFECcol) : !fir.ref<i32>
    %2 = fir.declare %1 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECcol"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %3 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %4 = fir.declare %3 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.alloca i32 {bindc_name = "j", uniq_name = "_QFEj"}
    %6 = fir.declare %5 {uniq_name = "_QFEj"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %7 = fir.address_of(@_QFEmat_a) : !fir.ref<!fir.array<200x200xf32>>
    %8 = fir.shape %c200, %c200 : (index, index) -> !fir.shape<2>
    %9 = fir.declare %7(%8) {uniq_name = "_QFEmat_a"} : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>) -> !fir.ref<!fir.array<200x200xf32>>
    %10 = fir.address_of(@_QFEmat_b) : !fir.ref<!fir.array<200x200xf32>>
    %11 = fir.shape %c200, %c200 : (index, index) -> !fir.shape<2>
    %12 = fir.declare %10(%11) {uniq_name = "_QFEmat_b"} : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>) -> !fir.ref<!fir.array<200x200xf32>>
    %13 = fir.address_of(@_QFEmat_c) : !fir.ref<!fir.array<200x200xf32>>
    %14 = fir.shape %c200, %c200 : (index, index) -> !fir.shape<2>
    %15 = fir.declare %13(%14) {uniq_name = "_QFEmat_c"} : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>) -> !fir.ref<!fir.array<200x200xf32>>
    %16 = fir.address_of(@_QFECrow) : !fir.ref<i32>
    %17 = fir.declare %16 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECrow"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %18 = fir.convert %c1_i32 : (i32) -> index
    %19 = fir.convert %c200_i32 : (i32) -> index
    %20 = fir.convert %18 : (index) -> i32
    %21 = fir.do_loop %arg0 = %18 to %19 step %c1 iter_args(%arg1 = %20) -> (i32) {
      fir.store %arg1 to %6 : !fir.ref<i32>
      %34 = fir.convert %c1_i32 : (i32) -> index
      %35 = fir.convert %c200_i32 : (i32) -> index
      %36 = fir.convert %34 : (index) -> i32
      %37 = fir.do_loop %arg2 = %34 to %35 step %c1 iter_args(%arg3 = %36) -> (i32) {
        fir.store %arg3 to %4 : !fir.ref<i32>
        %41 = fir.load %4 : !fir.ref<i32>
        %42 = fir.load %6 : !fir.ref<i32>
        %43 = arith.addi %41, %42 : i32
        %44 = fir.convert %43 : (i32) -> f32
        %45 = fir.load %4 : !fir.ref<i32>
        %46 = fir.convert %45 : (i32) -> i64
        %47 = fir.load %6 : !fir.ref<i32>
        %48 = fir.convert %47 : (i32) -> i64
        %49 = fir.array_coor %9(%8) %46, %48 : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>, i64, i64) -> !fir.ref<f32>
        fir.store %44 to %49 : !fir.ref<f32>
        %50 = fir.load %4 : !fir.ref<i32>
        %51 = fir.load %6 : !fir.ref<i32>
        %52 = arith.subi %50, %51 : i32
        %53 = fir.convert %52 : (i32) -> f32
        %54 = fir.load %4 : !fir.ref<i32>
        %55 = fir.convert %54 : (i32) -> i64
        %56 = fir.load %6 : !fir.ref<i32>
        %57 = fir.convert %56 : (i32) -> i64
        %58 = fir.array_coor %12(%11) %55, %57 : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>, i64, i64) -> !fir.ref<f32>
        fir.store %53 to %58 : !fir.ref<f32>
        %59 = fir.convert %c1 : (index) -> i32
        %60 = fir.load %4 : !fir.ref<i32>
        %61 = arith.addi %60, %59 overflow<nsw> : i32
        fir.result %61 : i32
      }
      fir.store %37 to %4 : !fir.ref<i32>
      %38 = fir.convert %c1 : (index) -> i32
      %39 = fir.load %6 : !fir.ref<i32>
      %40 = arith.addi %39, %38 overflow<nsw> : i32
      fir.result %40 : i32
    }
    fir.store %21 to %6 : !fir.ref<i32>
    omp.parallel {
      omp.wsloop private(@_QFEi_private_i32 %4 -> %arg0, @_QFEj_private_i32 %6 -> %arg1 : !fir.ref<i32>, !fir.ref<i32>) {
        omp.loop_nest (%arg2, %arg3) : i32 = (%c1_i32, %c1_i32) to (%c200_i32, %c200_i32) inclusive step (%c1_i32, %c1_i32) collapse(2) {
          %34 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          %35 = fir.declare %arg1 {uniq_name = "_QFEj"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %35 : !fir.ref<i32>
          fir.store %arg3 to %34 : !fir.ref<i32>
          %36 = fir.load %34 : !fir.ref<i32>
          %37 = fir.convert %36 : (i32) -> i64
          %38 = fir.load %35 : !fir.ref<i32>
          %39 = fir.convert %38 : (i32) -> i64
          %40 = fir.array_coor %9(%8) %37, %39 : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>, i64, i64) -> !fir.ref<f32>
          %41 = fir.load %40 : !fir.ref<f32>
          %42 = fir.load %34 : !fir.ref<i32>
          %43 = fir.convert %42 : (i32) -> i64
          %44 = fir.load %35 : !fir.ref<i32>
          %45 = fir.convert %44 : (i32) -> i64
          %46 = fir.array_coor %12(%11) %43, %45 : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>, i64, i64) -> !fir.ref<f32>
          %47 = fir.load %46 : !fir.ref<f32>
          %48 = arith.addf %41, %47 fastmath<contract> : f32
          %49 = fir.load %34 : !fir.ref<i32>
          %50 = fir.convert %49 : (i32) -> i64
          %51 = fir.load %35 : !fir.ref<i32>
          %52 = fir.convert %51 : (i32) -> i64
          %53 = fir.array_coor %15(%14) %50, %52 : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>, i64, i64) -> !fir.ref<f32>
          fir.store %48 to %53 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %22 = fir.address_of(@_QQclXde3ec603b76cf37a97d8be954f2861f5) : !fir.ref<!fir.char<1,55>>
    %23 = fir.convert %22 : (!fir.ref<!fir.char<1,55>>) -> !fir.ref<i8>
    %24 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %23, %c24_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %25 = fir.address_of(@_QQclXb4704274e03105d4beba5fae9890b8a6) : !fir.ref<!fir.char<1,35>>
    %26 = fir.declare %25 typeparams %c35 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXb4704274e03105d4beba5fae9890b8a6"} : (!fir.ref<!fir.char<1,35>>, index) -> !fir.ref<!fir.char<1,35>>
    %27 = fir.convert %26 : (!fir.ref<!fir.char<1,35>>) -> !fir.ref<i8>
    %28 = fir.convert %c35 : (index) -> i64
    %29 = fir.call @_FortranAioOutputAscii(%24, %27, %28) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %30 = fir.array_coor %15(%14) %c10, %c10 : (!fir.ref<!fir.array<200x200xf32>>, !fir.shape<2>, index, index) -> !fir.ref<f32>
    %31 = fir.load %30 : !fir.ref<f32>
    %32 = fir.call @_FortranAioOutputReal32(%24, %31) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %33 = fir.call @_FortranAioEndIoStatement(%24) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFECcol constant : i32 {
    %c200_i32 = arith.constant 200 : i32
    fir.has_value %c200_i32 : i32
  }
  fir.global internal @_QFEmat_a : !fir.array<200x200xf32> {
    %0 = fir.zero_bits !fir.array<200x200xf32>
    fir.has_value %0 : !fir.array<200x200xf32>
  }
  fir.global internal @_QFEmat_b : !fir.array<200x200xf32> {
    %0 = fir.zero_bits !fir.array<200x200xf32>
    fir.has_value %0 : !fir.array<200x200xf32>
  }
  fir.global internal @_QFEmat_c : !fir.array<200x200xf32> {
    %0 = fir.zero_bits !fir.array<200x200xf32>
    fir.has_value %0 : !fir.array<200x200xf32>
  }
  fir.global internal @_QFECrow constant : i32 {
    %c200_i32 = arith.constant 200 : i32
    fir.has_value %c200_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXde3ec603b76cf37a97d8be954f2861f5 constant : !fir.char<1,55> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/collapse/collapse.f90\00"(55) : !fir.char<1,55>
    fir.has_value %0 : !fir.char<1,55>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXb4704274e03105d4beba5fae9890b8a6 constant : !fir.char<1,35> {
    %0 = fir.string_lit "\E7\9F\A9\E9\98\B5\E5\8A\A0\E6\B3\95\E5\AE\8C\E6\88\90\EF\BC\8Cmat_c(10,10) ="(35) : !fir.char<1,35>
    fir.has_value %0 : !fir.char<1,35>
  }
  func.func private @_FortranAioOutputReal32(!fir.ref<i8>, f32) -> i1 attributes {fir.io, fir.runtime}
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
