module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 22.1.6 (https://github.com/llvm/llvm-project.git 30b06ccc36327541a0ac927e0d065ee0e8c9b37e)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32
    %1:2 = hlfir.declare %0 {uniq_name = "acc.private.init"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    acc.yield %1#0 : !fir.ref<i32>
  }
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c1 = arith.constant 1 : index
    %c9_i32 = arith.constant 9 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1_i32 = arith.constant 1 : i32
    %c100_i32 = arith.constant 100 : i32
    %c100 = arith.constant 100 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100xi32>>
    %2 = fir.shape %c100 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100xi32>>, !fir.ref<!fir.array<100xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "n", uniq_name = "_QFEn"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c100_i32 to %7#0 : i32, !fir.ref<i32>
    acc.serial combined(loop) {
      %15 = acc.private varPtr(%5#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) -> !fir.ref<i32> {implicit = true, name = "i"}
      acc.loop combined(serial) private(%15 : !fir.ref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c100_i32 : i32)  step (%c1_i32 : i32) {
        %16:2 = hlfir.declare %15 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg0 to %16#0 : !fir.ref<i32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
      acc.yield
    }
    %8 = fir.address_of(@_QQclXccba7749a48410d0e7a58a2207c580d3) : !fir.ref<!fir.char<1,51>>
    %9 = fir.convert %8 : (!fir.ref<!fir.char<1,51>>) -> !fir.ref<i8>
    %10 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %9, %c9_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %11 = hlfir.designate %3#0 (%c1)  : (!fir.ref<!fir.array<100xi32>>, index) -> !fir.ref<i32>
    %12 = fir.load %11 : !fir.ref<i32>
    %13 = fir.call @_FortranAioOutputInteger32(%10, %12) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %14 = fir.call @_FortranAioEndIoStatement(%10) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa : !fir.array<100xi32> {
    %0 = fir.zero_bits !fir.array<100xi32>
    fir.has_value %0 : !fir.array<100xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclXccba7749a48410d0e7a58a2207c580d3 constant : !fir.char<1,51> {
    %0 = fir.string_lit "/home/wangyz/test/openacc/acc_loop/acc_minimal.f90\00"(51) : !fir.char<1,51>
    fir.has_value %0 : !fir.char<1,51>
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
