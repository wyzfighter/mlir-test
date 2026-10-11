module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  omp.private {type = private} @acc_private_1 : i32 init {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    omp.yield(%arg1 : !fir.ref<i32>)
  }
  omp.private {type = firstprivate} @acc_private_0 : i32 init {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    omp.yield(%arg1 : !fir.ref<i32>)
  } copy {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    %0 = fir.load %arg0 : !fir.ref<i32>
    hlfir.assign %0 to %arg1 temporary_lhs : i32, !fir.ref<i32>
    omp.yield(%arg1 : !fir.ref<i32>)
  }
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c11_i32 = arith.constant 11 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1234_i32 = arith.constant 1234 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2:2 = hlfir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %3 = fir.alloca i32 {bindc_name = "n", uniq_name = "_QFEn"}
    %4:2 = hlfir.declare %3 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %5 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %6:2 = hlfir.declare %5 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c1234_i32 to %4#0 : i32, !fir.ref<i32>
    omp.parallel private(@acc_private_1 %1 -> %arg0 : !fir.ref<i32>) {
      %7 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %8:2 = hlfir.declare %7 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %9 = fir.load %4#0 : !fir.ref<i32>
      acc.loop control(%arg1 : i32) = (%c1_i32 : i32) to (%9 : i32)  step (%c1_i32 : i32) {
        %16:2 = hlfir.declare %arg0 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg1 to %16#0 : !fir.ref<i32>
        %17 = fir.load %16#0 : !fir.ref<i32>
        %18 = arith.muli %17, %17 : i32
        hlfir.assign %18 to %8#0 : i32, !fir.ref<i32>
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      %10 = fir.address_of(@_QQclX636F6E73742E66393000) : !fir.ref<!fir.char<1,10>>
      %11 = fir.convert %10 : (!fir.ref<!fir.char<1,10>>) -> !fir.ref<i8>
      %12 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %11, %c11_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
      %13 = fir.load %8#0 : !fir.ref<i32>
      %14 = fir.call @_FortranAioOutputInteger32(%12, %13) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
      %15 = fir.call @_FortranAioEndIoStatement(%12) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
      omp.terminator
    }
    return
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX636F6E73742E66393000 constant : !fir.char<1,10> {
    %0 = fir.string_lit "const.f90\00"(10) : !fir.char<1,10>
    fir.has_value %0 : !fir.char<1,10>
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

