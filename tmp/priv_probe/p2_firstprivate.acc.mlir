module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
    acc.yield %0 : !fir.ref<i32>
  }
  acc.firstprivate.recipe @firstprivatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
    acc.yield %0 : !fir.ref<i32>
  } copy {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    %0 = fir.load %arg0 : !fir.ref<i32>
    hlfir.assign %0 to %arg1 temporary_lhs : i32, !fir.ref<i32>
    acc.terminator
  }
  func.func @_QQmain() attributes {fir.bindc_name = "P2"} {
    %c9 = arith.constant 9 : index
    %c8 = arith.constant 8 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %c7_i32 = arith.constant 7 : i32
    %c10 = arith.constant 10 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<10xi32>>
    %2 = fir.shape %c10 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<10xi32>>, !fir.ref<!fir.array<10xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c7_i32 to %7#0 : i32, !fir.ref<i32>
    %8 = acc.firstprivate varPtr(%7#0 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) name("x") -> !fir.ref<i32>
    acc.parallel combined(loop) firstprivate(%8 : !fir.ref<i32>) {
      %27:2 = hlfir.declare %8 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %28 = acc.firstprivate varPtr(%27#0 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) implicit(true) name("x") -> !fir.ref<i32>
      %29 = acc.private varPtr(%5#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) implicit(true) name("i") -> !fir.ref<i32>
      acc.loop combined(parallel) private(%29 : !fir.ref<i32>) firstprivate(%28 : !fir.ref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
        %30:2 = hlfir.declare %28 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        %31:2 = hlfir.declare %29 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg0 to %31#0 : !fir.ref<i32>
        %32 = fir.load %30#0 : !fir.ref<i32>
        %33 = fir.load %31#0 : !fir.ref<i32>
        %34 = arith.addi %32, %33 : i32
        hlfir.assign %34 to %30#0 : i32, !fir.ref<i32>
        %35 = fir.load %30#0 : !fir.ref<i32>
        %36 = fir.load %31#0 : !fir.ref<i32>
        %37 = fir.convert %36 : (i32) -> i64
        %38 = hlfir.designate %3#0 (%37)  : (!fir.ref<!fir.array<10xi32>>, i64) -> !fir.ref<i32>
        hlfir.assign %35 to %38 : i32, !fir.ref<i32>
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      acc.yield
    }
    %9 = fir.address_of(@_QQclX70325F6669727374707269766174652E66393000) : !fir.ref<!fir.char<1,20>>
    %10 = fir.convert %9 : (!fir.ref<!fir.char<1,20>>) -> !fir.ref<i8>
    %11 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %10, %c17_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %12 = fir.address_of(@_QQclX70322073756D203D) : !fir.ref<!fir.char<1,8>>
    %13:2 = hlfir.declare %12 typeparams %c8 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX70322073756D203D"} : (!fir.ref<!fir.char<1,8>>, index) -> (!fir.ref<!fir.char<1,8>>, !fir.ref<!fir.char<1,8>>)
    %14 = fir.convert %13#0 : (!fir.ref<!fir.char<1,8>>) -> !fir.ref<i8>
    %15 = fir.convert %c8 : (index) -> i64
    %16 = fir.call @_FortranAioOutputAscii(%11, %14, %15) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %17 = hlfir.sum %3#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<10xi32>>) -> i32
    %18 = fir.call @_FortranAioOutputInteger32(%11, %17) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %19 = fir.address_of(@_QQclX20686F73742078203D) : !fir.ref<!fir.char<1,9>>
    %20:2 = hlfir.declare %19 typeparams %c9 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX20686F73742078203D"} : (!fir.ref<!fir.char<1,9>>, index) -> (!fir.ref<!fir.char<1,9>>, !fir.ref<!fir.char<1,9>>)
    %21 = fir.convert %20#0 : (!fir.ref<!fir.char<1,9>>) -> !fir.ref<i8>
    %22 = fir.convert %c9 : (index) -> i64
    %23 = fir.call @_FortranAioOutputAscii(%11, %21, %22) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %24 = fir.load %7#0 : !fir.ref<i32>
    %25 = fir.call @_FortranAioOutputInteger32(%11, %24) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %26 = fir.call @_FortranAioEndIoStatement(%11) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<10xi32> {
    %0 = fir.zero_bits !fir.array<10xi32>
    fir.has_value %0 : !fir.array<10xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70325F6669727374707269766174652E66393000 constant : !fir.char<1,20> {
    %0 = fir.string_lit "p2_firstprivate.f90\00"(20) : !fir.char<1,20>
    fir.has_value %0 : !fir.char<1,20>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70322073756D203D constant : !fir.char<1,8> {
    %0 = fir.string_lit "p2 sum ="(8) : !fir.char<1,8>
    fir.has_value %0 : !fir.char<1,8>
  }
  func.func private @_FortranAioOutputInteger32(!fir.ref<i8>, i32) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX20686F73742078203D constant : !fir.char<1,9> {
    %0 = fir.string_lit " host x ="(9) : !fir.char<1,9>
    fir.has_value %0 : !fir.char<1,9>
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
