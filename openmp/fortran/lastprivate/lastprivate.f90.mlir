module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = private} @_QFEfinal_val_private_f32 : f32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_LASTPRIVATE"} {
    %c38 = arith.constant 38 : index
    %c14_i32 = arith.constant 14 : i32
    %c6_i32 = arith.constant 6 : i32
    %cst = arith.constant 3.000000e+00 : f32
    %c100_i32 = arith.constant 100 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca f32 {bindc_name = "final_val", uniq_name = "_QFEfinal_val"}
    %2 = fir.declare %1 {uniq_name = "_QFEfinal_val"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %3 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %4 = fir.declare %3 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %6 = fir.declare %5 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    omp.parallel {
      omp.wsloop private(@_QFEfinal_val_private_f32 %2 -> %arg0, @_QFEi_private_i32 %4 -> %arg1 : !fir.ref<f32>, !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c100_i32) inclusive step (%c1_i32) {
          %18 = fir.declare %arg0 {uniq_name = "_QFEfinal_val"} : (!fir.ref<f32>) -> !fir.ref<f32>
          %19 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %19 : !fir.ref<i32>
          %20 = fir.load %19 : !fir.ref<i32>
          %21 = fir.convert %20 : (i32) -> f32
          %22 = arith.mulf %21, %cst fastmath<contract> : f32
          fir.store %22 to %18 : !fir.ref<f32>
          %23 = arith.addi %arg2, %c1_i32 : i32
          %24 = arith.cmpi sgt, %23, %c100_i32 : i32
          fir.if %24 {
            fir.store %23 to %19 : !fir.ref<i32>
            %25 = fir.load %18 : !fir.ref<f32>
            fir.store %25 to %2 : !fir.ref<f32>
          }
          omp.yield
        }
      }
      omp.terminator
    }
    %7 = fir.address_of(@_QQclX031e80c9682c25e191d0a63cd0847541) : !fir.ref<!fir.char<1,61>>
    %8 = fir.convert %7 : (!fir.ref<!fir.char<1,61>>) -> !fir.ref<i8>
    %9 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %8, %c14_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %10 = fir.address_of(@_QQclX6d265bb46739c510989b7ce549fc0ad7) : !fir.ref<!fir.char<1,38>>
    %11 = fir.declare %10 typeparams %c38 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX6d265bb46739c510989b7ce549fc0ad7"} : (!fir.ref<!fir.char<1,38>>, index) -> !fir.ref<!fir.char<1,38>>
    %12 = fir.convert %11 : (!fir.ref<!fir.char<1,38>>) -> !fir.ref<i8>
    %13 = fir.convert %c38 : (index) -> i64
    %14 = fir.call @_FortranAioOutputAscii(%9, %12, %13) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %15 = fir.load %2 : !fir.ref<f32>
    %16 = fir.call @_FortranAioOutputReal32(%9, %15) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %17 = fir.call @_FortranAioEndIoStatement(%9) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFECn constant : i32 {
    %c100_i32 = arith.constant 100 : i32
    fir.has_value %c100_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX031e80c9682c25e191d0a63cd0847541 constant : !fir.char<1,61> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/lastprivate/lastprivate.f90\00"(61) : !fir.char<1,61>
    fir.has_value %0 : !fir.char<1,61>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX6d265bb46739c510989b7ce549fc0ad7 constant : !fir.char<1,38> {
    %0 = fir.string_lit "\E6\9C\80\E5\90\8E\E4\B8\80\E6\AC\A1\E8\BF\AD\E4\BB\A3\E7\9A\84 final_val \E5\80\BC\EF\BC\9A"(38) : !fir.char<1,38>
    fir.has_value %0 : !fir.char<1,38>
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
