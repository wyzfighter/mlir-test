module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = private} @_QFEtmp_private_f32 : f32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_PRIVATE"} {
    %c15 = arith.constant 15 : index
    %c24_i32 = arith.constant 24 : i32
    %c6_i32 = arith.constant 6 : i32
    %c100_i32 = arith.constant 100 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2 = fir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %3 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %4 = fir.declare %3 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.alloca f32 {bindc_name = "sum_total", uniq_name = "_QFEsum_total"}
    %6 = fir.declare %5 {uniq_name = "_QFEsum_total"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %7 = fir.alloca f32 {bindc_name = "tmp", uniq_name = "_QFEtmp"}
    %8 = fir.declare %7 {uniq_name = "_QFEtmp"} : (!fir.ref<f32>) -> !fir.ref<f32>
    fir.store %cst to %6 : !fir.ref<f32>
    omp.parallel private(@_QFEtmp_private_f32 %8 -> %arg0, @_QFEi_private_i32 %2 -> %arg1 : !fir.ref<f32>, !fir.ref<i32>) {
      %20 = fir.declare %arg0 {uniq_name = "_QFEtmp"} : (!fir.ref<f32>) -> !fir.ref<f32>
      %21 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
      fir.store %cst to %20 : !fir.ref<f32>
      omp.wsloop private(@_QFEi_private_i32 %21 -> %arg2 : !fir.ref<i32>) {
        omp.loop_nest (%arg3) : i32 = (%c1_i32) to (%c100_i32) inclusive step (%c1_i32) {
          %22 = fir.declare %arg2 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg3 to %22 : !fir.ref<i32>
          %23 = fir.load %20 : !fir.ref<f32>
          %24 = fir.load %22 : !fir.ref<i32>
          %25 = fir.convert %24 : (i32) -> f32
          %26 = arith.addf %23, %25 fastmath<contract> : f32
          fir.store %26 to %20 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.critical {
        %22 = fir.load %6 : !fir.ref<f32>
        %23 = fir.load %20 : !fir.ref<f32>
        %24 = arith.addf %22, %23 fastmath<contract> : f32
        fir.store %24 to %6 : !fir.ref<f32>
        omp.terminator
      }
      omp.terminator
    }
    %9 = fir.address_of(@_QQclXe0ad4f8c9a710a44281d5c1fa8184af2) : !fir.ref<!fir.char<1,53>>
    %10 = fir.convert %9 : (!fir.ref<!fir.char<1,53>>) -> !fir.ref<i8>
    %11 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %10, %c24_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %12 = fir.address_of(@_QQclXE7B4AFE58AA0E7BB93E69E9CEFBC9A) : !fir.ref<!fir.char<1,15>>
    %13 = fir.declare %12 typeparams %c15 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE7B4AFE58AA0E7BB93E69E9CEFBC9A"} : (!fir.ref<!fir.char<1,15>>, index) -> !fir.ref<!fir.char<1,15>>
    %14 = fir.convert %13 : (!fir.ref<!fir.char<1,15>>) -> !fir.ref<i8>
    %15 = fir.convert %c15 : (index) -> i64
    %16 = fir.call @_FortranAioOutputAscii(%11, %14, %15) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %17 = fir.load %6 : !fir.ref<f32>
    %18 = fir.call @_FortranAioOutputReal32(%11, %17) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %19 = fir.call @_FortranAioEndIoStatement(%11) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFECn constant : i32 {
    %c100_i32 = arith.constant 100 : i32
    fir.has_value %c100_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXe0ad4f8c9a710a44281d5c1fa8184af2 constant : !fir.char<1,53> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/private/private.f90\00"(53) : !fir.char<1,53>
    fir.has_value %0 : !fir.char<1,53>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE7B4AFE58AA0E7BB93E69E9CEFBC9A constant : !fir.char<1,15> {
    %0 = fir.string_lit "\E7\B4\AF\E5\8A\A0\E7\BB\93\E6\9E\9C\EF\BC\9A"(15) : !fir.char<1,15>
    fir.has_value %0 : !fir.char<1,15>
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
