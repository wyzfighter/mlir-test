module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_NOWAIT"} {
    %c500 = arith.constant 500 : index
    %c30 = arith.constant 30 : index
    %c23_i32 = arith.constant 23 : i32
    %c6_i32 = arith.constant 6 : i32
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %c1000_i32 = arith.constant 1000 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1000 = arith.constant 1000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<1000xf32>>
    %2 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %3 = fir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %4 = fir.address_of(@_QFEb) : !fir.ref<!fir.array<1000xf32>>
    %5 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %6 = fir.declare %4(%5) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %7 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %8 = fir.declare %7 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %9 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %10 = fir.declare %9 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    omp.parallel private(@_QFEi_private_i32 %8 -> %arg0 : !fir.ref<i32>) {
      %23 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
      omp.wsloop nowait schedule(static) private(@_QFEi_private_i32 %23 -> %arg1 : !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %24 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %24 : !fir.ref<i32>
          %25 = fir.load %24 : !fir.ref<i32>
          %26 = fir.convert %25 : (i32) -> f32
          %27 = arith.mulf %26, %cst_0 fastmath<contract> : f32
          %28 = fir.load %24 : !fir.ref<i32>
          %29 = fir.convert %28 : (i32) -> i64
          %30 = fir.array_coor %3(%2) %29 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %27 to %30 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.wsloop schedule(static) private(@_QFEi_private_i32 %23 -> %arg1 : !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %24 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %24 : !fir.ref<i32>
          %25 = fir.load %24 : !fir.ref<i32>
          %26 = fir.convert %25 : (i32) -> i64
          %27 = fir.array_coor %3(%2) %26 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %28 = fir.load %27 : !fir.ref<f32>
          %29 = arith.addf %28, %cst fastmath<contract> : f32
          %30 = fir.load %24 : !fir.ref<i32>
          %31 = fir.convert %30 : (i32) -> i64
          %32 = fir.array_coor %6(%5) %31 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %29 to %32 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %11 = fir.address_of(@_QQclXe9f359e33a146a86a5a2a1b8d39f4a60) : !fir.ref<!fir.char<1,51>>
    %12 = fir.convert %11 : (!fir.ref<!fir.char<1,51>>) -> !fir.ref<i8>
    %13 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %12, %c23_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %14 = fir.address_of(@_QQclX6E6F7761697420E6B58BE8AF95E5AE8CE68890EFBC8C622835303029203D) : !fir.ref<!fir.char<1,30>>
    %15 = fir.declare %14 typeparams %c30 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX6E6F7761697420E6B58BE8AF95E5AE8CE68890EFBC8C622835303029203D"} : (!fir.ref<!fir.char<1,30>>, index) -> !fir.ref<!fir.char<1,30>>
    %16 = fir.convert %15 : (!fir.ref<!fir.char<1,30>>) -> !fir.ref<i8>
    %17 = fir.convert %c30 : (index) -> i64
    %18 = fir.call @_FortranAioOutputAscii(%13, %16, %17) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %19 = fir.array_coor %6(%5) %c500 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, index) -> !fir.ref<f32>
    %20 = fir.load %19 : !fir.ref<f32>
    %21 = fir.call @_FortranAioOutputReal32(%13, %20) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %22 = fir.call @_FortranAioEndIoStatement(%13) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa : !fir.array<1000xf32> {
    %0 = fir.zero_bits !fir.array<1000xf32>
    fir.has_value %0 : !fir.array<1000xf32>
  }
  fir.global internal @_QFEb : !fir.array<1000xf32> {
    %0 = fir.zero_bits !fir.array<1000xf32>
    fir.has_value %0 : !fir.array<1000xf32>
  }
  fir.global internal @_QFECn constant : i32 {
    %c1000_i32 = arith.constant 1000 : i32
    fir.has_value %c1000_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXe9f359e33a146a86a5a2a1b8d39f4a60 constant : !fir.char<1,51> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/nowait/nowait.f90\00"(51) : !fir.char<1,51>
    fir.has_value %0 : !fir.char<1,51>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX6E6F7761697420E6B58BE8AF95E5AE8CE68890EFBC8C622835303029203D constant : !fir.char<1,30> {
    %0 = fir.string_lit "nowait \E6\B5\8B\E8\AF\95\E5\AE\8C\E6\88\90\EF\BC\8Cb(500) ="(30) : !fir.char<1,30>
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
