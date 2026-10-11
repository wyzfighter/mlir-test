module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  omp.private {type = private} @acc_private_1 : i32 init {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    omp.yield(%arg1 : !fir.ref<i32>)
  }
  omp.private {type = private} @acc_private_0 : !fir.array<5xi32> init {
  ^bb0(%arg0: !fir.ref<!fir.array<5xi32>>, %arg1: !fir.ref<!fir.array<5xi32>>):
    omp.yield(%arg1 : !fir.ref<!fir.array<5xi32>>)
  }
  func.func @_QQmain() attributes {fir.bindc_name = "FP_ARRAY"} {
    %c1 = arith.constant 1 : index
    %c9 = arith.constant 9 : index
    %c20_i32 = arith.constant 20 : i32
    %c6_i32 = arith.constant 6 : i32
    %c11 = arith.constant 11 : index
    %c5_i32 = arith.constant 5 : i32
    %c1_i32 = arith.constant 1 : i32
    %c5 = arith.constant 5 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca !fir.array<5xi32> {bindc_name = "b", uniq_name = "_QFEb"}
    %2 = fir.shape %c5 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<5xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<5xi32>>, !fir.ref<!fir.array<5xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.address_of(@_QQro.5xi4.0) : !fir.ref<!fir.array<5xi32>>
    %7:2 = hlfir.declare %6(%2) {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQro.5xi4.0"} : (!fir.ref<!fir.array<5xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<5xi32>>, !fir.ref<!fir.array<5xi32>>)
    hlfir.assign %7#0 to %3#0 : !fir.ref<!fir.array<5xi32>>, !fir.ref<!fir.array<5xi32>>
    omp.parallel private(@acc_private_0 %1 -> %arg0, @acc_private_1 %4 -> %arg1 : !fir.ref<!fir.array<5xi32>>, !fir.ref<i32>) {
      %8 = fir.address_of(@_QQclX28412C49302C412C493029) : !fir.ref<!fir.char<1,11>>
      %9 = fir.convert %c11 : (index) -> i64
      %10 = fir.zero_bits !fir.box<none>
      %11 = fir.address_of(@_QQclX66705F61727261792E66393000) : !fir.ref<!fir.char<1,13>>
      %12 = fir.convert %11 : (!fir.ref<!fir.char<1,13>>) -> !fir.ref<i8>
      %13 = fir.address_of(@_QQclX66705F617272617920) : !fir.ref<!fir.char<1,9>>
      %14 = fir.convert %c9 : (index) -> i64
      %15 = fir.address_of(@_QQclX20) : !fir.ref<!fir.char<1>>
      %16 = fir.convert %c1 : (index) -> i64
      omp.wsloop {
        omp.loop_nest (%arg2) : i32 = (%c1_i32) to (%c5_i32) inclusive step (%c1_i32) {
          %17:2 = hlfir.declare %arg0(%2) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<5xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<5xi32>>, !fir.ref<!fir.array<5xi32>>)
          %18:2 = hlfir.declare %arg1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg2 to %18#0 : !fir.ref<i32>
          %19 = fir.load %18#0 : !fir.ref<i32>
          %20 = fir.convert %19 : (i32) -> i64
          %21 = hlfir.designate %17#0 (%20)  : (!fir.ref<!fir.array<5xi32>>, i64) -> !fir.ref<i32>
          %22 = fir.load %21 : !fir.ref<i32>
          %23 = arith.addi %22, %19 : i32
          hlfir.assign %23 to %21 : i32, !fir.ref<i32>
          %24:2 = hlfir.declare %8 typeparams %c11 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX28412C49302C412C493029"} : (!fir.ref<!fir.char<1,11>>, index) -> (!fir.ref<!fir.char<1,11>>, !fir.ref<!fir.char<1,11>>)
          %25 = fir.convert %24#0 : (!fir.ref<!fir.char<1,11>>) -> !fir.ref<i8>
          %26 = fir.call @_FortranAioBeginExternalFormattedOutput(%25, %9, %10, %c6_i32, %12, %c20_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
          %27:2 = hlfir.declare %13 typeparams %c9 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX66705F617272617920"} : (!fir.ref<!fir.char<1,9>>, index) -> (!fir.ref<!fir.char<1,9>>, !fir.ref<!fir.char<1,9>>)
          %28 = fir.convert %27#0 : (!fir.ref<!fir.char<1,9>>) -> !fir.ref<i8>
          %29 = fir.call @_FortranAioOutputAscii(%26, %28, %14) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
          %30 = fir.load %18#0 : !fir.ref<i32>
          %31 = fir.call @_FortranAioOutputInteger32(%26, %30) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
          %32:2 = hlfir.declare %15 typeparams %c1 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX20"} : (!fir.ref<!fir.char<1>>, index) -> (!fir.ref<!fir.char<1>>, !fir.ref<!fir.char<1>>)
          %33 = fir.convert %32#0 : (!fir.ref<!fir.char<1>>) -> !fir.ref<i8>
          %34 = fir.call @_FortranAioOutputAscii(%26, %33, %16) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
          %35 = fir.load %18#0 : !fir.ref<i32>
          %36 = fir.convert %35 : (i32) -> i64
          %37 = hlfir.designate %17#0 (%36)  : (!fir.ref<!fir.array<5xi32>>, i64) -> !fir.ref<i32>
          %38 = fir.load %37 : !fir.ref<i32>
          %39 = fir.call @_FortranAioOutputInteger32(%26, %38) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
          %40 = fir.call @_FortranAioEndIoStatement(%26) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  fir.global internal @_QQro.5xi4.0(dense<[1, 2, 3, 4, 5]> : tensor<5xi32>) {alignment = 64 : i64} constant : !fir.array<5xi32>
  func.func private @_FortranAioBeginExternalFormattedOutput(!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX28412C49302C412C493029 constant : !fir.char<1,11> {
    %0 = fir.string_lit "(A,I0,A,I0)"(11) : !fir.char<1,11>
    fir.has_value %0 : !fir.char<1,11>
  }
  fir.global linkonce @_QQclX66705F61727261792E66393000 constant : !fir.char<1,13> {
    %0 = fir.string_lit "fp_array.f90\00"(13) : !fir.char<1,13>
    fir.has_value %0 : !fir.char<1,13>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX66705F617272617920 constant : !fir.char<1,9> {
    %0 = fir.string_lit "fp_array "(9) : !fir.char<1,9>
    fir.has_value %0 : !fir.char<1,9>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX20 constant : !fir.char<1> {
    %0 = fir.string_lit " "(1) : !fir.char<1>
    fir.has_value %0 : !fir.char<1>
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

