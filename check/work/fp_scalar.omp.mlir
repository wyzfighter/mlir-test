module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  omp.private {type = private} @acc_private_1 : i32 init {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    omp.yield(%arg1 : !fir.ref<i32>)
  }
  omp.private {type = private} @acc_private_0 : i32 init {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    omp.yield(%arg1 : !fir.ref<i32>)
  }
  func.func @_QQmain() attributes {fir.bindc_name = "FP_SCALAR"} {
    %c10 = arith.constant 10 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c6 = arith.constant 6 : index
    %c4_i32 = arith.constant 4 : i32
    %c1_i32 = arith.constant 1 : i32
    %c7_i32 = arith.constant 7 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2:2 = hlfir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %3 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %4:2 = hlfir.declare %3 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c7_i32 to %4#0 : i32, !fir.ref<i32>
    omp.parallel private(@acc_private_0 %3 -> %arg0, @acc_private_1 %1 -> %arg1 : !fir.ref<i32>, !fir.ref<i32>) {
      %5 = fir.address_of(@_QQclX28412C493029) : !fir.ref<!fir.char<1,6>>
      %6 = fir.convert %c6 : (index) -> i64
      %7 = fir.zero_bits !fir.box<none>
      %8 = fir.address_of(@_QQclX66705F7363616C61722E66393000) : !fir.ref<!fir.char<1,14>>
      %9 = fir.convert %8 : (!fir.ref<!fir.char<1,14>>) -> !fir.ref<i8>
      %10 = fir.address_of(@_QQclX66705F7363616C617220) : !fir.ref<!fir.char<1,10>>
      %11 = fir.convert %c10 : (index) -> i64
      omp.wsloop {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c4_i32) inclusive step (%c1_i32) {
          %12:2 = hlfir.declare %arg0 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          %13:2 = hlfir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg2 to %13#0 : !fir.ref<i32>
          %14 = fir.load %12#0 : !fir.ref<i32>
          %15 = fir.load %13#0 : !fir.ref<i32>
          %16 = arith.addi %14, %15 : i32
          hlfir.assign %16 to %12#0 : i32, !fir.ref<i32>
          %17:2 = hlfir.declare %5 typeparams %c6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX28412C493029"} : (!fir.ref<!fir.char<1,6>>, index) -> (!fir.ref<!fir.char<1,6>>, !fir.ref<!fir.char<1,6>>)
          %18 = fir.convert %17#0 : (!fir.ref<!fir.char<1,6>>) -> !fir.ref<i8>
          %19 = fir.call @_FortranAioBeginExternalFormattedOutput(%18, %6, %7, %c6_i32, %9, %c17_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
          %20:2 = hlfir.declare %10 typeparams %c10 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX66705F7363616C617220"} : (!fir.ref<!fir.char<1,10>>, index) -> (!fir.ref<!fir.char<1,10>>, !fir.ref<!fir.char<1,10>>)
          %21 = fir.convert %20#0 : (!fir.ref<!fir.char<1,10>>) -> !fir.ref<i8>
          %22 = fir.call @_FortranAioOutputAscii(%19, %21, %11) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
          %23 = fir.load %12#0 : !fir.ref<i32>
          %24 = fir.call @_FortranAioOutputInteger32(%19, %23) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
          %25 = fir.call @_FortranAioEndIoStatement(%19) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  func.func private @_FortranAioBeginExternalFormattedOutput(!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX28412C493029 constant : !fir.char<1,6> {
    %0 = fir.string_lit "(A,I0)"(6) : !fir.char<1,6>
    fir.has_value %0 : !fir.char<1,6>
  }
  fir.global linkonce @_QQclX66705F7363616C61722E66393000 constant : !fir.char<1,14> {
    %0 = fir.string_lit "fp_scalar.f90\00"(14) : !fir.char<1,14>
    fir.has_value %0 : !fir.char<1,14>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX66705F7363616C617220 constant : !fir.char<1,10> {
    %0 = fir.string_lit "fp_scalar "(10) : !fir.char<1,10>
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

