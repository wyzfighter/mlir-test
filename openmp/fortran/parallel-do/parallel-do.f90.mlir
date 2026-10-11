module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_PARALLEL_DO_COMBINED"} {
    %c5 = arith.constant 5 : index
    %c26 = arith.constant 26 : index
    %c23_i32 = arith.constant 23 : i32
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
    %7 = fir.alloca f32 {bindc_name = "factor", uniq_name = "_QFEfactor"}
    %8 = fir.declare %7 {uniq_name = "_QFEfactor"} : (!fir.ref<f32>) -> !fir.ref<f32>
    %9 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %10 = fir.declare %9 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %11 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %12 = fir.declare %11 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %13 = fir.address_of(@_QFEresult) : !fir.ref<!fir.array<1000xf32>>
    %14 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %15 = fir.declare %13(%14) {uniq_name = "_QFEresult"} : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>) -> !fir.ref<!fir.array<1000xf32>>
    fir.store %cst_0 to %8 : !fir.ref<f32>
    %16 = fir.convert %c1_i32 : (i32) -> index
    %17 = fir.convert %c1000_i32 : (i32) -> index
    %18 = fir.convert %16 : (index) -> i32
    %19 = fir.do_loop %arg0 = %16 to %17 step %c1 iter_args(%arg1 = %18) -> (i32) {
      fir.store %arg1 to %10 : !fir.ref<i32>
      %32 = fir.load %10 : !fir.ref<i32>
      %33 = fir.convert %32 : (i32) -> f32
      %34 = fir.load %10 : !fir.ref<i32>
      %35 = fir.convert %34 : (i32) -> i64
      %36 = fir.array_coor %3(%2) %35 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
      fir.store %33 to %36 : !fir.ref<f32>
      %37 = fir.load %10 : !fir.ref<i32>
      %38 = fir.convert %37 : (i32) -> f32
      %39 = arith.mulf %38, %cst fastmath<contract> : f32
      %40 = fir.load %10 : !fir.ref<i32>
      %41 = fir.convert %40 : (i32) -> i64
      %42 = fir.array_coor %6(%5) %41 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
      fir.store %39 to %42 : !fir.ref<f32>
      %43 = fir.convert %c1 : (index) -> i32
      %44 = fir.load %10 : !fir.ref<i32>
      %45 = arith.addi %44, %43 overflow<nsw> : i32
      fir.result %45 : i32
    }
    fir.store %19 to %10 : !fir.ref<i32>
    omp.parallel {
      omp.wsloop private(@_QFEi_private_i32 %10 -> %arg0 : !fir.ref<i32>) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%c1000_i32) inclusive step (%c1_i32) {
          %32 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg1 to %32 : !fir.ref<i32>
          %33 = fir.load %32 : !fir.ref<i32>
          %34 = fir.convert %33 : (i32) -> i64
          %35 = fir.array_coor %3(%2) %34 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %36 = fir.load %35 : !fir.ref<f32>
          %37 = fir.load %32 : !fir.ref<i32>
          %38 = fir.convert %37 : (i32) -> i64
          %39 = fir.array_coor %6(%5) %38 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          %40 = fir.load %39 : !fir.ref<f32>
          %41 = fir.load %8 : !fir.ref<f32>
          %42 = arith.mulf %40, %41 fastmath<contract> : f32
          %43 = arith.addf %36, %42 fastmath<contract> : f32
          %44 = fir.load %32 : !fir.ref<i32>
          %45 = fir.convert %44 : (i32) -> i64
          %46 = fir.array_coor %15(%14) %45 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, i64) -> !fir.ref<f32>
          fir.store %43 to %46 : !fir.ref<f32>
          omp.yield
        }
      }
      omp.terminator
    }
    %20 = fir.address_of(@_QQclXac60221774614d8da92f8bca69c46959) : !fir.ref<!fir.char<1,61>>
    %21 = fir.convert %20 : (!fir.ref<!fir.char<1,61>>) -> !fir.ref<i8>
    %22 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %21, %c23_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %23 = fir.address_of(@_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C726573756C74283529203D) : !fir.ref<!fir.char<1,26>>
    %24 = fir.declare %23 typeparams %c26 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C726573756C74283529203D"} : (!fir.ref<!fir.char<1,26>>, index) -> !fir.ref<!fir.char<1,26>>
    %25 = fir.convert %24 : (!fir.ref<!fir.char<1,26>>) -> !fir.ref<i8>
    %26 = fir.convert %c26 : (index) -> i64
    %27 = fir.call @_FortranAioOutputAscii(%22, %25, %26) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %28 = fir.array_coor %15(%14) %c5 : (!fir.ref<!fir.array<1000xf32>>, !fir.shape<1>, index) -> !fir.ref<f32>
    %29 = fir.load %28 : !fir.ref<f32>
    %30 = fir.call @_FortranAioOutputReal32(%22, %29) fastmath<contract> : (!fir.ref<i8>, f32) -> i1
    %31 = fir.call @_FortranAioEndIoStatement(%22) fastmath<contract> : (!fir.ref<i8>) -> i32
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
  fir.global internal @_QFEresult : !fir.array<1000xf32> {
    %0 = fir.zero_bits !fir.array<1000xf32>
    fir.has_value %0 : !fir.array<1000xf32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXac60221774614d8da92f8bca69c46959 constant : !fir.char<1,61> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/parallel-do/parallel-do.f90\00"(61) : !fir.char<1,61>
    fir.has_value %0 : !fir.char<1,61>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE8AEA1E7AE97E5AE8CE68890EFBC8C726573756C74283529203D constant : !fir.char<1,26> {
    %0 = fir.string_lit "\E8\AE\A1\E7\AE\97\E5\AE\8C\E6\88\90\EF\BC\8Cresult(5) ="(26) : !fir.char<1,26>
    fir.has_value %0 : !fir.char<1,26>
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
