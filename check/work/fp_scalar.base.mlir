module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu", omp.flags = #omp.flags<openmp_device_version = 31>, omp.integer_wrap_around = #omp.integer_wrap_around<integer_wrap_around = false>, omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = [], omp.version = #omp.version<version = 31>} {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = private} @_QFEx_private_i32 : i32
  func.func @_QQmain() attributes {fir.bindc_name = "FP_SCALAR"} {
    %c10 = arith.constant 10 : index
    %c12_i32 = arith.constant 12 : i32
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
    omp.parallel {
      omp.wsloop private(@_QFEx_private_i32 %4#0 -> %arg0, @_QFEi_private_i32 %2#0 -> %arg1 : !fir.ref<i32>, !fir.ref<i32>) {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c4_i32) inclusive step (%c1_i32) {
          %5:2 = hlfir.declare %arg0 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          %6:2 = hlfir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          hlfir.assign %arg2 to %6#0 : i32, !fir.ref<i32>
          %7 = fir.load %5#0 : !fir.ref<i32>
          %8 = fir.load %6#0 : !fir.ref<i32>
          %9 = arith.addi %7, %8 : i32
          hlfir.assign %9 to %5#0 : i32, !fir.ref<i32>
          %10 = fir.address_of(@_QQclX28412C493029) : !fir.ref<!fir.char<1,6>>
          %11:2 = hlfir.declare %10 typeparams %c6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX28412C493029"} : (!fir.ref<!fir.char<1,6>>, index) -> (!fir.ref<!fir.char<1,6>>, !fir.ref<!fir.char<1,6>>)
          %12 = fir.convert %11#0 : (!fir.ref<!fir.char<1,6>>) -> !fir.ref<i8>
          %13 = fir.convert %c6 : (index) -> i64
          %14 = fir.zero_bits !fir.box<none>
          %15 = fir.address_of(@_QQclX66705F7363616C61725F6F6D702E66393000) : !fir.ref<!fir.char<1,18>>
          %16 = fir.convert %15 : (!fir.ref<!fir.char<1,18>>) -> !fir.ref<i8>
          %17 = fir.call @_FortranAioBeginExternalFormattedOutput(%12, %13, %14, %c6_i32, %16, %c12_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
          %18 = fir.address_of(@_QQclX66705F7363616C617220) : !fir.ref<!fir.char<1,10>>
          %19:2 = hlfir.declare %18 typeparams %c10 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX66705F7363616C617220"} : (!fir.ref<!fir.char<1,10>>, index) -> (!fir.ref<!fir.char<1,10>>, !fir.ref<!fir.char<1,10>>)
          %20 = fir.convert %19#0 : (!fir.ref<!fir.char<1,10>>) -> !fir.ref<i8>
          %21 = fir.convert %c10 : (index) -> i64
          %22 = fir.call @_FortranAioOutputAscii(%17, %20, %21) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
          %23 = fir.load %5#0 : !fir.ref<i32>
          %24 = fir.call @_FortranAioOutputInteger32(%17, %23) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
          %25 = fir.call @_FortranAioEndIoStatement(%17) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    return
  }
  func.func private @_FortranAioBeginExternalFormattedOutput(!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX28412C493029 constant : !fir.char<1,6> {
    %0 = fir.string_lit "(A,I0)"(6) : !fir.char<1,6>
    fir.has_value %0 : !fir.char<1,6>
  }
  fir.global linkonce @_QQclX66705F7363616C61725F6F6D702E66393000 constant : !fir.char<1,18> {
    %0 = fir.string_lit "fp_scalar_omp.f90\00"(18) : !fir.char<1,18>
    fir.has_value %0 : !fir.char<1,18>
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
