module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.declare_reduction @max_f32 : f32 init {
  ^bb0(%arg0: f32):
    %cst = arith.constant -3.40282347E+38 : f32
    omp.yield(%cst : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = arith.maxnumf %arg0, %arg1 fastmath<contract> : f32
    omp.yield(%0 : f32)
  }
  omp.declare_reduction @add_reduction_f32 : f32 init {
  ^bb0(%arg0: f32):
    %cst = arith.constant 0.000000e+00 : f32
    omp.yield(%cst : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = arith.addf %arg0, %arg1 fastmath<contract> : f32
    omp.yield(%0 : f32)
  }
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_REDUCTION"} {
    %c18 = arith.constant 18 : index
    %c25_i32 = arith.constant 25 : i32
    %c15 = arith.constant 15 : index
    %c24_i32 = arith.constant 24 : i32
    %c6_i32 = arith.constant 6 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.500000e+00 : f32
    %c1 = arith.constant 1 : index
    %c1000_i32 = arith.constant 1000 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1000 = arith.constant 1000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEdata) : !fir.ref<!fir.array<1000xf32>>
    %2 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %3 = fir.declare %1(%2) {uniq_name = "_QFEdata"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5 = fir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %6 = fir.alloca f32 {bindc_name = "max_val", uniq_name = "_QFEmax_val"}
    %7 = fir.declare %6 {uniq_name = "_QFEmax_val"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %8 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %9 = fir.declare %8 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %10 = fir.alloca f32 {bindc_name = "total_sum", uniq_name = "_QFEtotal_sum"}
    %11 = fir.declare %10 {uniq_name = "_QFEtotal_sum"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %12 = fir.convert %c1_i32 : (i32) -> index
    %13 = fir.convert %c1000_i32 : (i32) -> index
    %14 = fir.convert %12 : (index) -> i32
    %15 = fir.do_loop %arg0 = %12 to %13 step %c1 iter_args(%arg1 = %14) -> (i32) {
      fir.store %arg1 to %5 : !fir.ref<i32>
      %38 = fir.load %5 : !fir.ref<i32>
      %39 = fir.convert %38 : (i32) -> f32
      %40 = arith.mulf %39, %cst_0 fastmath<contract> : f32
      %41 = fir.load %5 : !fir.ref<i32>
      %42 = fir.convert %41 : (i32) -> i64
      %43 = fir.array_coor %3(%2) %42 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
      fir.store %40 to %43 : !fir.ref<f32>
      %44 = fir.convert %c1 : (index) -> i32
      %45 = fir.load %5 : !fir.ref<i32>
      %46 = arith.addi %45, %44 overflow<nsw> : i32
      fir.result %46 : i32
    }
    fir.store %15 to %5 : !fir.ref<i32>
    fir.store %cst to %11 : !fir.ref<f32>
    fir.store %cst to %7 : !fir.ref<f32>
    omp.parallel {
      omp.wsloop private(@_QFEi_private_i32 %5 -> %arg0 : !fir.ref<i32>) reduction(@add_reduction_f32 %11 -> %arg1, @max_f32 %7 -> %arg2 : !fir.ref<f32>, !fir.ref<f32>) {
        omp.loop_nest (%arg3) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %38 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          %39 = fir.declare %arg1 {uniq_name = "_QFEtotal_sum"} : (!fir.ref<f32>) -> !fir.ref<f32>
          %40 = fir.declare %arg2 {uniq_name = "_QFEmax_val"} : (!fir.ref<f32>) -> !fir.ref<f32>
          fir.store %arg3 to %38 : !fir.ref<i32>
          %41 = fir.load %39 : !fir.ref<f32>
          %42 = fir.load %38 : !fir.ref<i32>
          %43 = fir.convert %42 : (i32) -> i64
          %44 = fir.array_coor %3(%2) %43 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %45 = fir.load %44 : !fir.ref<f32>
          %46 = arith.addf %41, %45 fastmath<contract> : f32
          fir.store %46 to %39 : !fir.ref<f32>
          %47 = fir.load %40 : !fir.ref<f32>
          %48 = fir.load %38 : !fir.ref<i32>
          %49 = fir.convert %48 : (i32) -> i64
          %50 = fir.array_coor %3(%2) %49 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %51 = fir.load %50 : !fir.ref<f32>
          %52 = arith.cmpf ogt, %47, %51 fastmath<contract> : f32
          %53 = arith.select %52, %47, %51 : f32
          fir.store %53 to %40 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %16 = fir.address_of(@_QQclX5a5f96ac7e6e290e36c5a84d2907c771) : !fir.ref<!fir.char<1,57>>
    %17 = fir.convert %16 : (!fir.ref<!fir.char<1,57>>) -> !fir.ref<i8>
    %18 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %17, %c24_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %19 = fir.address_of(@_QQclXE695B0E7BB84E680BBE5928CEFBC9A) : !fir.ref<!fir.char<1,15>>
    %20 = fir.declare %19 typeparams %c15 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE695B0E7BB84E680BBE5928CEFBC9A"} : (!fir.ref<!fir.char<1,15>>, index) -> !fir.ref<!fir.char<1,15>>
    %21 = fir.convert %20 : (!fir.ref<!fir.char<1,15>>) -> !fir.ref<i8>
    %22 = fir.convert %c15 : (index) -> i64
    %23 = fir.call @_FortranAioOutputAscii(%18, %21, %22) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %24 = fir.load %11 : !fir.ref<f32>
    %25 = fir.call @_FortranAioOutputReal32(%18, %24) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %26 = fir.call @_FortranAioEndIoStatement(%18) fastmath<contract> : (!fir.ref<i8>) -> i32
    %27 = fir.address_of(@_QQclX5a5f96ac7e6e290e36c5a84d2907c771) : !fir.ref<!fir.char<1,57>>
    %28 = fir.convert %27 : (!fir.ref<!fir.char<1,57>>) -> !fir.ref<i8>
    %29 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %28, %c25_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %30 = fir.address_of(@_QQclXE695B0E7BB84E69C80E5A4A7E580BCEFBC9A) : !fir.ref<!fir.char<1,18>>
    %31 = fir.declare %30 typeparams %c18 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE695B0E7BB84E69C80E5A4A7E580BCEFBC9A"} : (!fir.ref<!fir.char<1,18>>, index) -> !fir.ref<!fir.char<1,18>>
    %32 = fir.convert %31 : (!fir.ref<!fir.char<1,18>>) -> !fir.ref<i8>
    %33 = fir.convert %c18 : (index) -> i64
    %34 = fir.call @_FortranAioOutputAscii(%29, %32, %33) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %35 = fir.load %7 : !fir.ref<f32>
    %36 = fir.call @_FortranAioOutputReal32(%29, %35) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %37 = fir.call @_FortranAioEndIoStatement(%29) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEdata : !fir.array<1000xf32> {
    %0 = fir.zero_bits !fir.array<1000xf32>
    fir.has_value %0 : !fir.array<1000xf32>
  }
  fir.global internal @_QFECn constant : i32 {
    %c1000_i32 = arith.constant 1000 : i32
    fir.has_value %c1000_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX5a5f96ac7e6e290e36c5a84d2907c771 constant : !fir.char<1,57> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/reduction/reduction.f90\00"(57) : !fir.char<1,57>
    fir.has_value %0 : !fir.char<1,57>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE695B0E7BB84E680BBE5928CEFBC9A constant : !fir.char<1,15> {
    %0 = fir.string_lit "\E6\95\B0\E7\BB\84\E6\80\BB\E5\92\8C\EF\BC\9A"(15) : !fir.char<1,15>
    fir.has_value %0 : !fir.char<1,15>
  }
  func.func private @_FortranAioOutputReal32(!fir.ref<i8>, f32) -> i1 attributes {fir.io, fir.runtime}
  func.func private @_FortranAioEndIoStatement(!fir.ref<i8>) -> i32 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE695B0E7BB84E69C80E5A4A7E580BCEFBC9A constant : !fir.char<1,18> {
    %0 = fir.string_lit "\E6\95\B0\E7\BB\84\E6\9C\80\E5\A4\A7\E5\80\BC\EF\BC\9A"(18) : !fir.char<1,18>
    fir.has_value %0 : !fir.char<1,18>
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
