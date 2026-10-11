module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
    acc.yield %0 : !fir.ref<i32>
  }
  acc.private.recipe @privatization_ref_5xi32 : !fir.ref<!fir.array<5xi32>> init {
  ^bb0(%arg0: !fir.ref<!fir.array<5xi32>>):
    %0 = fir.alloca !fir.array<5xi32> {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
    acc.yield %0 : !fir.ref<!fir.array<5xi32>>
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
    acc.parallel combined(loop) {
      %8 = acc.private varPtr(%3#0 : !fir.ref<!fir.array<5xi32>>) recipe(@privatization_ref_5xi32) name("b") -> !fir.ref<!fir.array<5xi32>>
      %9 = acc.private varPtr(%5#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) implicit(true) name("i") -> !fir.ref<i32>
      %10 = fir.address_of(@_QQclX28412C49302C412C493029) : !fir.ref<!fir.char<1,11>>
      %11 = fir.convert %c11 : (index) -> i64
      %12 = fir.zero_bits !fir.box<none>
      %13 = fir.address_of(@_QQclX66705F61727261792E66393000) : !fir.ref<!fir.char<1,13>>
      %14 = fir.convert %13 : (!fir.ref<!fir.char<1,13>>) -> !fir.ref<i8>
      %15 = fir.address_of(@_QQclX66705F617272617920) : !fir.ref<!fir.char<1,9>>
      %16 = fir.convert %c9 : (index) -> i64
      %17 = fir.address_of(@_QQclX20) : !fir.ref<!fir.char<1>>
      %18 = fir.convert %c1 : (index) -> i64
      acc.loop combined(parallel) private(%8, %9 : !fir.ref<!fir.array<5xi32>>, !fir.ref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c5_i32 : i32)  step (%c1_i32 : i32) {
        %19:2 = hlfir.declare %8(%2) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<5xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<5xi32>>, !fir.ref<!fir.array<5xi32>>)
        %20:2 = hlfir.declare %9 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg0 to %20#0 : !fir.ref<i32>
        %21 = fir.load %20#0 : !fir.ref<i32>
        %22 = fir.convert %21 : (i32) -> i64
        %23 = hlfir.designate %19#0 (%22)  : (!fir.ref<!fir.array<5xi32>>, i64) -> !fir.ref<i32>
        %24 = fir.load %23 : !fir.ref<i32>
        %25 = arith.addi %24, %21 : i32
        hlfir.assign %25 to %23 : i32, !fir.ref<i32>
        %26:2 = hlfir.declare %10 typeparams %c11 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX28412C49302C412C493029"} : (!fir.ref<!fir.char<1,11>>, index) -> (!fir.ref<!fir.char<1,11>>, !fir.ref<!fir.char<1,11>>)
        %27 = fir.convert %26#0 : (!fir.ref<!fir.char<1,11>>) -> !fir.ref<i8>
        %28 = fir.call @_FortranAioBeginExternalFormattedOutput(%27, %11, %12, %c6_i32, %14, %c20_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i64, !fir.box<none>, i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
        %29:2 = hlfir.declare %15 typeparams %c9 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX66705F617272617920"} : (!fir.ref<!fir.char<1,9>>, index) -> (!fir.ref<!fir.char<1,9>>, !fir.ref<!fir.char<1,9>>)
        %30 = fir.convert %29#0 : (!fir.ref<!fir.char<1,9>>) -> !fir.ref<i8>
        %31 = fir.call @_FortranAioOutputAscii(%28, %30, %16) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
        %32 = fir.load %20#0 : !fir.ref<i32>
        %33 = fir.call @_FortranAioOutputInteger32(%28, %32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
        %34:2 = hlfir.declare %17 typeparams %c1 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX20"} : (!fir.ref<!fir.char<1>>, index) -> (!fir.ref<!fir.char<1>>, !fir.ref<!fir.char<1>>)
        %35 = fir.convert %34#0 : (!fir.ref<!fir.char<1>>) -> !fir.ref<i8>
        %36 = fir.call @_FortranAioOutputAscii(%28, %35, %18) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
        %37 = fir.load %20#0 : !fir.ref<i32>
        %38 = fir.convert %37 : (i32) -> i64
        %39 = hlfir.designate %19#0 (%38)  : (!fir.ref<!fir.array<5xi32>>, i64) -> !fir.ref<i32>
        %40 = fir.load %39 : !fir.ref<i32>
        %41 = fir.call @_FortranAioOutputInteger32(%28, %40) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
        %42 = fir.call @_FortranAioEndIoStatement(%28) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      acc.yield
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
