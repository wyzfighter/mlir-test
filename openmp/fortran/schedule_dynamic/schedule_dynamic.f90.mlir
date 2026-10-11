module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_SCHEDULE_DYNAMIC"} {
    %c100 = arith.constant 100 : index
    %c35 = arith.constant 35 : index
    %c14_i32 = arith.constant 14 : i32
    %c6_i32 = arith.constant 6 : i32
    %cst = arith.constant 1.000000e+00 : f32
    %c1000_i32 = arith.constant 1000 : i32
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1000 = arith.constant 1000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<1000xf32>>
    %2 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %3 = fir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5 = fir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %6 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %7 = fir.declare %6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    omp.parallel {
      omp.wsloop schedule(dynamic = %c10_i32 : i32) private(@_QFEi_private_i32 %5 -> %arg0 : !fir.ref<i32>) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %20 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg1 to %20 : !fir.ref<i32>
          %21 = fir.load %20 : !fir.ref<i32>
          %22 = fir.convert %21 : (i32) -> f32
          %23 = arith.addf %22, %cst fastmath<contract> : f32
          %24 = math.log %23 fastmath<contract> : f32
          %25 = fir.load %20 : !fir.ref<i32>
          %26 = fir.convert %25 : (i32) -> i64
          %27 = fir.array_coor %3(%2) %26 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %24 to %27 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %8 = fir.address_of(@_QQclXf488359e54a157e009455964bdfc29c3) : !fir.ref<!fir.char<1,71>>
    %9 = fir.convert %8 : (!fir.ref<!fir.char<1,71>>) -> !fir.ref<i8>
    %10 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %9, %c14_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %11 = fir.address_of(@_QQclXb9b22b161341a69d1d68e5e2daa341a1) : !fir.ref<!fir.char<1,35>>
    %12 = fir.declare %11 typeparams %c35 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXb9b22b161341a69d1d68e5e2daa341a1"} : (!fir.ref<!fir.char<1,35>>, index) -> !fir.ref<!fir.char<1,35>>
    %13 = fir.convert %12 : (!fir.ref<!fir.char<1,35>>) -> !fir.ref<i8>
    %14 = fir.convert %c35 : (index) -> i64
    %15 = fir.call @_FortranAioOutputAscii(%10, %13, %14) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %16 = fir.array_coor %3(%2) %c100 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, index) -> !fir.ref<f32>
    %17 = fir.load %16 : !fir.ref<f32>
    %18 = fir.call @_FortranAioOutputReal32(%10, %17) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %19 = fir.call @_FortranAioEndIoStatement(%10) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa : !fir.array<1000xf32> {
    %0 = fir.zero_bits !fir.array<1000xf32>
    fir.has_value %0 : !fir.array<1000xf32>
  }
  fir.global internal @_QFECn constant : i32 {
    %c1000_i32 = arith.constant 1000 : i32
    fir.has_value %c1000_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXf488359e54a157e009455964bdfc29c3 constant : !fir.char<1,71> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/schedule_dynamic/schedule_dynamic.f90\00"(71) : !fir.char<1,71>
    fir.has_value %0 : !fir.char<1,71>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXb9b22b161341a69d1d68e5e2daa341a1 constant : !fir.char<1,35> {
    %0 = fir.string_lit "\E5\8A\A8\E6\80\81\E8\B0\83\E5\BA\A6\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8Ca(100) ="(35) : !fir.char<1,35>
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
