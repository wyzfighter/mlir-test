module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c1 = arith.constant 1 : index
    %c12_i32 = arith.constant 12 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1_i32 = arith.constant 1 : i32
    %c100_i32 = arith.constant 100 : i32
    %c100 = arith.constant 100 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100xi32>>
    %2 = fir.shape %c100 : (index) -> !fir.shape<1>
    %3 = fir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>) -> !fir.ref<!fir.array<100xi32>>
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5 = fir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
    %6 = fir.alloca i32 {bindc_name = "n", uniq_name = "_QFEn"}
    %7 = fir.declare %6 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> !fir.ref<i32>
    fir.store %c100_i32 to %7 : !fir.ref<i32>
    omp.paralel {
      %15 = fir.load %7 : !fir.ref<i32>
      omp.wsloop private(@_QFEi_private_i32 %5 -> %arg0 : !fir.ref<i32>) {
        omp.loop_nest (%arg1) : i32 = (%c1_i32) to (%15) inclusive step (%c1_i32) {
          %16 = fir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> !fir.ref<i32>
          fir.store %arg1 to %16 : !fir.ref<i32>
          %17 = fir.load %16 : !fir.ref<i32>
          %18 = fir.load %16 : !fir.ref<i32>
          %19 = fir.convert %18 : (i32) -> i64
          %20 = fir.array_coor %3(%2) %19 : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>, i64) -> !fir.ref<i32>
          fir.store %17 to %20 : !fir.ref<i32>
          omp.yield
        }
      }
      omp.terminator
    }
    %8 = fir.address_of(@_QQclXc42c3ed62e89e541943dd53ff9662d01) : !fir.ref<!fir.char<1,43>>
    %9 = fir.convert %8 : (!fir.ref<!fir.char<1,43>>) -> !fir.ref<i8>
    %10 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %9, %c12_i32) fastmath<contract> : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %11 = fir.array_coor %3(%2) %c1 : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>, index) -> !fir.ref<i32>
    %12 = fir.load %11 : !fir.ref<i32>
    %13 = fir.call @_FortranAioOutputInteger32(%10, %12) fastmath<contract> : (!fir.ref<i8>, i32) -> i1
    %14 = fir.call @_FortranAioEndIoStatement(%10) fastmath<contract> : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa : !fir.array<100xi32> {
    %0 = fir.zero_bits !fir.array<100xi32>
    fir.has_value %0 : !fir.array<100xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXc42c3ed62e89e541943dd53ff9662d01 constant : !fir.char<1,43> {
    %0 = fir.string_lit "/home/wangyz/test/openacc/raw/parallel.f90\00"(43) : !fir.char<1,43>
    fir.has_value %0 : !fir.char<1,43>
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
