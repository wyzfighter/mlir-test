module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_ATOMIC"} {
    %c37 = arith.constant 37 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1000_i32 = arith.constant 1000 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "counter", uniq_name = "_QFEcounter"}
    %2 = fir.declare %1 {uniq_name = "_QFEcounter"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %3 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %4 = fir.declare %3 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %6 = fir.declare %5 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    fir.store %c0_i32 to %2 : !fir.ref<i32>
    omp.parallel {
      omp.wsloop private(@_QFEi_private_i32 %4 -> %arg0 : !fir.ref<i32>) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %18 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg1 to %18 : !fir.ref<i32>
          omp.atomic.update %2 : !fir.ref<i32> {
          ^bb0(%arg2: i32):
            %19 = arith.addi %arg2, %c1_i32 : i32
            omp.yield(%19 : i32)
          } {atomic_control = #omp.atomic_control<>}
          omp.yield
        }
      }
      omp.terminator
    }
    %7 = fir.address_of(@_QQclX2858d00045c79dff803576a61e33c50a) : !fir.ref<!fir.char<1,51>>
    %8 = fir.convert %7 : (!fir.ref<!fir.char<1,51>>) -> !fir.ref<i8>
    %9 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %8, %c17_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %10 = fir.address_of(@_QQclX8cab4c6828b3a3f4a1d55d29f56d4669) : !fir.ref<!fir.char<1,37>>
    %11 = fir.declare %10 typeparams %c37 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX8cab4c6828b3a3f4a1d55d29f56d4669"} : (!fir.ref<!fir.char<1,37>>, index) -> !fir.ref<!fir.char<1,37>>
    %12 = fir.convert %11 : (!fir.ref<!fir.char<1,37>>) -> !fir.ref<i8>
    %13 = fir.convert %c37 : (index) -> i64
    %14 = fir.call @_FortranAioOutputAscii(%9, %12, %13) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %15 = fir.load %2 : !fir.ref<i32>
    %16 = fir.call @_FortranAioOutputInteger32(%9, %15) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
    %17 = fir.call @_FortranAioEndIoStatement(%9) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFECn constant : i32 {
    %c1000_i32 = arith.constant 1000 : i32
    fir.has_value %c1000_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX2858d00045c79dff803576a61e33c50a constant : !fir.char<1,51> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/atomic/atomic.f90\00"(51) : !fir.char<1,51>
    fir.has_value %0 : !fir.char<1,51>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX8cab4c6828b3a3f4a1d55d29f56d4669 constant : !fir.char<1,37> {
    %0 = fir.string_lit "\E6\9C\80\E7\BB\88\E8\AE\A1\E6\95\B0\E5\99\A8\E5\80\BC\EF\BC\88\E5\BA\94\E4\B8\BA1000\EF\BC\89\EF\BC\9A"(37) : !fir.char<1,37>
    fir.has_value %0 : !fir.char<1,37>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
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
