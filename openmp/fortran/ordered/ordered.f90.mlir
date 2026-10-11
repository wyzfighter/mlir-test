module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git fc4aad7b5db3fff421df9a9637605b9ca5667881)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "OMP_ORDERED"} {
    %c15 = arith.constant 15 : index
    %c6 = arith.constant 6 : index
    %c14_i32 = arith.constant 14 : i32
    %c6_i32 = arith.constant 6 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %c10 = arith.constant 10 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2 = fir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %3 = fir.address_of(@_QFECn) : !fir.ref<i32>
    %4 = fir.declare %3 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QFECn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %5 = fir.address_of(@_QFEresult) : !fir.ref<!fir.array<10xi32>>
    %6 = fir.shape %c10 : (index) -> !fir.shape<1>
    %7 = fir.declare %5(%6) {uniq_name = "_QFEresult"} : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>) -> !fir.ref<!fir.array<10xi32>>
    omp.parallel {
      omp.wsloop ordered(0) private(@_QFEi_private_i32 %2 -> %arg0 : !fir.ref<i32>) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%c10_i32) inclusive step (%c1_i32) {
          %8 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg1 to %8 : !fir.ref<i32>
          %9 = fir.load %8 : !fir.ref<i32>
          %10 = fir.load %8 : !fir.ref<i32>
          %11 = arith.muli %9, %10 : i32
          %12 = fir.load %8 : !fir.ref<i32>
          %13 = fir.convert %12 : (i32) -> i64
          %14 = fir.array_coor %7(%6) %13 : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
          fir.store %11 to %14 : !fir.ref<i32>
          omp.ordered.region {
            %15 = fir.address_of(@_QQclXe920e69a05a69e343c122eac0e095f65) : !fir.ref<!fir.char<1,53>>
            %16 = fir.convert %15 : (!fir.ref<!fir.char<1,53>>) -> !fir.ref<i8>
            %17 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %16, %c14_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
            %18 = fir.address_of(@_QQclXE8BFADE4BBA3) : !fir.ref<!fir.char<1,6>>
            %19 = fir.declare %18 typeparams %c6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE8BFADE4BBA3"} : (!fir.ref<!fir.char<1,6>>, index) -> !fir.ref<!fir.char<1,6>>
            %20 = fir.convert %19 : (!fir.ref<!fir.char<1,6>>) -> !fir.ref<i8>
            %21 = fir.convert %c6 : (index) -> i64
            %22 = fir.call @_FortranAioOutputAscii(%17, %20, %21) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
            %23 = fir.load %8 : !fir.ref<i32>
            %24 = fir.call @_FortranAioOutputInteger32(%17, %23) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
            %25 = fir.address_of(@_QQclXE8AEA1E7AE97E7BB93E69E9CEFBC9A) : !fir.ref<!fir.char<1,15>>
            %26 = fir.declare %25 typeparams %c15 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclXE8AEA1E7AE97E7BB93E69E9CEFBC9A"} : (!fir.ref<!fir.char<1,15>>, index) -> !fir.ref<!fir.char<1,15>>
            %27 = fir.convert %26 : (!fir.ref<!fir.char<1,15>>) -> !fir.ref<i8>
            %28 = fir.convert %c15 : (index) -> i64
            %29 = fir.call @_FortranAioOutputAscii(%17, %27, %28) fastmath<contract> : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
            %30 = fir.load %8 : !fir.ref<i32>
            %31 = fir.convert %30 : (i32) -> i64
            %32 = fir.array_coor %7(%6) %31 : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
            %33 = fir.load %32 : !fir.ref<i32>
            %34 = fir.call @_FortranAioOutputInteger32(%17, %33) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
            %35 = fir.call @_FortranAioEndIoStatement(%17) fastmath<contract> : (!fir.ref<i8>) -> i32
            omp.terminator
          }
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  fir.global internal @_QFECn constant : i32 {
    %c10_i32 = arith.constant 10 : i32
    fir.has_value %c10_i32 : i32
  }
  fir.global internal @_QFEresult : !fir.array<10xi32> {
    %0 = fir.zero_bits !fir.array<10xi32>
    fir.has_value %0 : !fir.array<10xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXe920e69a05a69e343c122eac0e095f65 constant : !fir.char<1,53> {
    %0 = fir.string_lit "/home/wangyz/test/openmp/fortran/ordered/ordered.f90\00"(53) : !fir.char<1,53>
    fir.has_value %0 : !fir.char<1,53>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE8BFADE4BBA3 constant : !fir.char<1,6> {
    %0 = fir.string_lit "\E8\BF\AD\E4\BB\A3"(6) : !fir.char<1,6>
    fir.has_value %0 : !fir.char<1,6>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXE8AEA1E7AE97E7BB93E69E9CEFBC9A constant : !fir.char<1,15> {
    %0 = fir.string_lit "\E8\AE\A1\E7\AE\97\E7\BB\93\E6\9E\9C\EF\BC\9A"(15) : !fir.char<1,15>
    fir.has_value %0 : !fir.char<1,15>
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
