module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = firstprivate} @_QFEbase_val_firstprivate_f32 : f32 copy {
  ^bb0(%arg0: !fir.ref<f32>, %arg1: !fir.ref<f32>):
    %0 = fir.load %arg0 : !fir.ref<f32>
    fir.store %0 to %arg1 : !fir.ref<f32>
    omp.yield(%arg1 : !fir.ref<f32>)
  }
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_FIRSTPRIVATE"} {
    %c1 = arith.constant 1 : index
    %c30 = arith.constant 30 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant 1.000000e+02 : f32
    %c10 = arith.constant 10 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca f32 {bindc_name = "base_val", uniq_name = "_QFEbase_val"}
    %2 = fir.declare %1 {uniq_name = "_QFEbase_val"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %3 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %4 = fir.declare %3 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %6 = fir.declare %5 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %7 = fir.address_of(@_QFEresult) : !fir.ref<!fir.array<10xf32>>
    %8 = fir.shape %c10 : (index) -> !fir.shape<1>
    %9 = fir.declare %7(%8) {uniq_name = "_QFEresult"} : (!fir.ref<!fir.array<10xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<10xf32>>
    fir.store %cst to %2 : !fir.ref<f32>
    omp.parallel {
      omp.wsloop private(@_QFEbase_val_firstprivate_f32 %2 -> %arg0, @_QFEi_private_i32 %4 -> %arg1 : !fir.ref<f32>, !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c10_i32) inclusive step (%c1_i32) {
          %22 = fir.declare %arg0 {uniq_name = "_QFEbase_val"} : (!fir.ref<f32>) -> !fir.ref<f32>
          %23 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %23 : !fir.ref<i32>
          %24 = fir.load %22 : !fir.ref<f32>
          %25 = fir.load %23 : !fir.ref<i32>
          %26 = fir.convert %25 : (i32) -> f32
          %27 = arith.addf %24, %26 fastmath<contract> : f32
          %28 = fir.load %23 : !fir.ref<i32>
          %29 = fir.convert %28 : (i32) -> i64
          %30 = fir.array_coor %9(%8) %29 : (!fir.ref<!fir.array<10xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %27 to %30 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %10 = fir.address_of(@_QQclXec43bae8df2f3aa38a9e6441f25a20ac) : !fir.ref<!fir.char<1,63>>
    %11 = fir.convert %10 : (!fir.ref<!fir.char<1,63>>) -> !fir.ref<i8>
    %12 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %11, %c17_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %13 = fir.address_of(@_QQclXE7BB93E69E9CE695B0E7BB84E7ACACE4B880E4B8AAE58583E7B4A0EFBC9A) : !fir.ref<!fir.char<1,30>>
    %14 = fir.declare %13 typeparams %c30 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE7BB93E69E9CE695B0E7BB84E7ACACE4B880E4B8AAE58583E7B4A0EFBC9A"} : (!fir.ref<!fir.char<1,30>>, index) -> !fir.ref<!fir.char<1,30>>
    %15 = fir.convert %14 : (!fir.ref<!fir.char<1,30>>) -> !fir.ref<i8>
    %16 = fir.convert %c30 : (index) -> i64
    %17 = fir.call @_FortranAioOutputAscii(%12, %15, %16) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %18 = fir.array_coor %9(%8) %c1 : (!fir.ref<!fir.array<10xf32>>, !fir.shape<1>, index) -> !fir.ref<f32>
    %19 = fir.load %18 : !fir.ref<f32>
    %20 = fir.call @_FortranAioOutputReal32(%12, %19) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %21 = fir.call @_FortranAioEndIoStatement(%12) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFECn constant : i32 {
    %c10_i32 = arith.constant 10 : i32
    fir.has_value %c10_i32 : i32
  }
  fir.global internal @_QFEresult : !fir.array<10xf32> {
    %0 = fir.zero_bits !fir.array<10xf32>
    fir.has_value %0 : !fir.array<10xf32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXec43bae8df2f3aa38a9e6441f25a20ac constant : !fir.char<1,63> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/firstprivate/firstprivate.f90\00"(63) : !fir.char<1,63>
    fir.has_value %0 : !fir.char<1,63>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE7BB93E69E9CE695B0E7BB84E7ACACE4B880E4B8AAE58583E7B4A0EFBC9A constant : !fir.char<1,30> {
    %0 = fir.string_lit "\E7\BB\93\E6\9E\9C\E6\95\B0\E7\BB\84\E7\AC\AC\E4\B8\80\E4\B8\AA\E5\85\83\E7\B4\A0\EF\BC\9A"(30) : !fir.char<1,30>
    fir.has_value %0 : !fir.char<1,30>
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
