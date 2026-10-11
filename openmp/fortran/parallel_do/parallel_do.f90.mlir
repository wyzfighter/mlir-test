module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_PARALLEL_DO"} {
    %c6 = arith.constant 6 : index
    %c21 = arith.constant 21 : index
    %c27_i32 = arith.constant 27 : i32
    %c6_i32 = arith.constant 6 : i32
    %cst = arith.constant 5.000000e-01 : f32
    %c1 = arith.constant 1 : index
    %c1000_i32 = arith.constant 1000 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 3.500000e+00 : f32
    %c1000 = arith.constant 1000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<1000xf32>>
    %2 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %3 = fir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %4 = fir.address_of(@_QFEb) : !fir.ref<!fir.array<1000xf32>>
    %5 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %6 = fir.declare %4(%5) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %7 = fir.address_of(@_QFEc) : !fir.ref<!fir.array<1000xf32>>
    %8 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %9 = fir.declare %7(%8) {uniq_name = "_QFEc"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    %10 = fir.alloca f32 {bindc_name = "factor", uniq_name = "_QFEfactor"}
    %11 = fir.declare %10 {uniq_name = "_QFEfactor"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %12 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %13 = fir.declare %12 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %14 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %15 = fir.declare %14 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    fir.store %cst_0 to %11 : !fir.ref<f32>
    %16 = fir.convert %c1_i32 : (i32) -> index
    %17 = fir.convert %c1000_i32 : (i32) -> index
    %18 = fir.convert %16 : (index) -> i32
    %19 = fir.do_loop %arg0 = %16 to %17 step %c1 iter_args(%arg1 = %18) -> (i32) {
      fir.store %arg1 to %13 : !fir.ref<i32>
      %40 = fir.load %13 : !fir.ref<i32>
      %41 = fir.convert %40 : (i32) -> f32
      %42 = fir.load %13 : !fir.ref<i32>
      %43 = fir.convert %42 : (i32) -> i64
      %44 = fir.array_coor %3(%2) %43 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
      fir.store %41 to %44 : !fir.ref<f32>
      %45 = fir.load %13 : !fir.ref<i32>
      %46 = fir.convert %45 : (i32) -> f32
      %47 = arith.mulf %46, %cst fastmath<contract> : f32
      %48 = fir.load %13 : !fir.ref<i32>
      %49 = fir.convert %48 : (i32) -> i64
      %50 = fir.array_coor %6(%5) %49 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
      fir.store %47 to %50 : !fir.ref<f32>
      %51 = fir.convert %c1 : (index) -> i32
      %52 = fir.load %13 : !fir.ref<i32>
      %53 = arith.addi %52, %51 overflow<nsw> : i32
      fir.result %53 : i32
    }
    fir.store %19 to %13 : !fir.ref<i32>
    omp.parallel private(@_QFEi_private_i32 %13 -> %arg0 : !fir.ref<i32>) {
      %40 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
      omp.wsloop private(@_QFEi_private_i32 %40 -> %arg1 : !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %41 = fir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg2 to %41 : !fir.ref<i32>
          %42 = fir.load %41 : !fir.ref<i32>
          %43 = fir.convert %42 : (i32) -> i64
          %44 = fir.array_coor %3(%2) %43 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %45 = fir.load %44 : !fir.ref<f32>
          %46 = fir.load %41 : !fir.ref<i32>
          %47 = fir.convert %46 : (i32) -> i64
          %48 = fir.array_coor %6(%5) %47 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %49 = fir.load %48 : !fir.ref<f32>
          %50 = fir.load %11 : !fir.ref<f32>
          %51 = arith.mulf %49, %50 fastmath<contract> : f32
          %52 = arith.addf %45, %51 fastmath<contract> : f32
          %53 = fir.load %41 : !fir.ref<i32>
          %54 = fir.convert %53 : (i32) -> i64
          %55 = fir.array_coor %9(%8) %54 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %52 to %55 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %20 = fir.address_of(@_QQclXa5336c224cda77bfbb28ef764cee8b17) : !fir.ref<!fir.char<1,61>>
    %21 = fir.convert %20 : (!fir.ref<!fir.char<1,61>>) -> !fir.ref<i8>
    %22 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %21, %c27_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %23 = fir.address_of(@_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C63283129203D) : !fir.ref<!fir.char<1,21>>
    %24 = fir.declare %23 typeparams %c21 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C63283129203D"} : (!fir.ref<!fir.char<1,21>>, index) -> !fir.ref<!fir.char<1,21>>
    %25 = fir.convert %24 : (!fir.ref<!fir.char<1,21>>) -> !fir.ref<i8>
    %26 = fir.convert %c21 : (index) -> i64
    %27 = fir.call @_FortranAioOutputAscii(%22, %25, %26) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %28 = fir.array_coor %9(%8) %c1 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, index) -> !fir.ref<f32>
    %29 = fir.load %28 : !fir.ref<f32>
    %30 = fir.call @_FortranAioOutputReal32(%22, %29) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %31 = fir.address_of(@_QQclX63286E29203D) : !fir.ref<!fir.char<1,6>>
    %32 = fir.declare %31 typeparams %c6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX63286E29203D"} : (!fir.ref<!fir.char<1,6>>, index) -> !fir.ref<!fir.char<1,6>>
    %33 = fir.convert %32 : (!fir.ref<!fir.char<1,6>>) -> !fir.ref<i8>
    %34 = fir.convert %c6 : (index) -> i64
    %35 = fir.call @_FortranAioOutputAscii(%22, %33, %34) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %36 = fir.array_coor %9(%8) %c1000 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, index) -> !fir.ref<f32>
    %37 = fir.load %36 : !fir.ref<f32>
    %38 = fir.call @_FortranAioOutputReal32(%22, %37) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %39 = fir.call @_FortranAioEndIoStatement(%22) fastmath<contract> : (!fir.ref<i8>) -> i32
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
  fir.global internal @_QFEc : !fir.array<1000xf32> {
    %0 = fir.zero_bits !fir.array<1000xf32>
    fir.has_value %0 : !fir.array<1000xf32>
  }
  fir.global internal @_QFECn constant : i32 {
    %c1000_i32 = arith.constant 1000 : i32
    fir.has_value %c1000_i32 : i32
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXa5336c224cda77bfbb28ef764cee8b17 constant : !fir.char<1,61> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/parallel_do/parallel_do.f90\00"(61) : !fir.char<1,61>
    fir.has_value %0 : !fir.char<1,61>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C63283129203D constant : !fir.char<1,21> {
    %0 = fir.string_lit "\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8Cc(1) ="(21) : !fir.char<1,21>
    fir.has_value %0 : !fir.char<1,21>
  }
  func.func private @_FortranAioOutputReal32(!fir.ref<i8>, f32) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX63286E29203D constant : !fir.char<1,6> {
    %0 = fir.string_lit "c(n) ="(6) : !fir.char<1,6>
    fir.has_value %0 : !fir.char<1,6>
  }
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
