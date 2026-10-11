module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
    acc.yield %0 : !fir.ref<i32>
  }
  func.func @_QQmain() attributes {fir.bindc_name = "P1C"} {
    %c22 = arith.constant 22 : index
    %c20_i32 = arith.constant 20 : i32
    %c6_i32 = arith.constant 6 : i32
    %c2002001000000_i64 = arith.constant 2002001000000 : i64
    %c1000_i32 = arith.constant 1000 : i32
    %c0_i32 = arith.constant 0 : i32
    %c2000000_i32 = arith.constant 2000000 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2000000 = arith.constant 2000000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<2000000xi32>>
    %2 = fir.shape %c2000000 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<2000000xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<2000000xi32>>, !fir.ref<!fir.array<2000000xi32>>)
    %4 = fir.alloca i64 {bindc_name = "expect", uniq_name = "_QFEexpect"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEexpect"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %6 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %8 = fir.alloca i64 {bindc_name = "s", uniq_name = "_QFEs"}
    %9:2 = hlfir.declare %8 {uniq_name = "_QFEs"} : (!fir.ref<i64>) -> (!fir.ref<i64>, !fir.ref<i64>)
    %10 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %11:2 = hlfir.declare %10 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    acc.parallel combined(loop) {
      %31 = acc.private varPtr(%11#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) name("x") -> !fir.ref<i32>
      %32 = acc.private varPtr(%7#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) implicit(true) name("i") -> !fir.ref<i32>
      acc.loop combined(parallel) private(%31, %32 : !fir.ref<i32>, !fir.ref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c2000000_i32 : i32)  step (%c1_i32 : i32) {
        %33:2 = hlfir.declare %31 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        %34:2 = hlfir.declare %32 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg0 to %34#0 : !fir.ref<i32>
        hlfir.assign %c0_i32 to %33#0 : i32, !fir.ref<i32>
        %35 = fir.load %33#0 : !fir.ref<i32>
        %36 = fir.load %34#0 : !fir.ref<i32>
        %37 = arith.addi %35, %36 : i32
        hlfir.assign %37 to %33#0 : i32, !fir.ref<i32>
        %38 = fir.load %33#0 : !fir.ref<i32>
        %39 = arith.addi %38, %c1000_i32 : i32
        hlfir.assign %39 to %33#0 : i32, !fir.ref<i32>
        %40 = fir.load %33#0 : !fir.ref<i32>
        %41 = fir.load %34#0 : !fir.ref<i32>
        %42 = fir.convert %41 : (i32) -> i64
        %43 = hlfir.designate %3#0 (%42)  : (!fir.ref<!fir.array<2000000xi32>>, i64) -> !fir.ref<i32>
        hlfir.assign %40 to %43 : i32, !fir.ref<i32>
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      acc.yield
    }
    %12 = hlfir.elemental %2 unordered : (!fir.shape<1>) -> !hlfir.expr<2000000xi64> {
    ^bb0(%arg0: index):
      %31 = hlfir.designate %3#0 (%arg0)  : (!fir.ref<!fir.array<2000000xi32>>, index) -> !fir.ref<i32>
      %32 = fir.load %31 : !fir.ref<i32>
      %33 = fir.convert %32 : (i32) -> i64
      hlfir.yield_element %33 : i64
    }
    %13 = hlfir.sum %12 {fastmath = #arith.fastmath<contract>} : (!hlfir.expr<2000000xi64>) -> i64
    hlfir.assign %13 to %9#0 : i64, !fir.ref<i64>
    hlfir.destroy %12 : !hlfir.expr<2000000xi64>
    hlfir.assign %c2002001000000_i64 to %5#0 : i64, !fir.ref<i64>
    %14 = fir.address_of(@_QQclX7031635F707269766174655F6269672E66393000) : !fir.ref<!fir.char<1,20>>
    %15 = fir.convert %14 : (!fir.ref<!fir.char<1,20>>) -> !fir.ref<i8>
    %16 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %15, %c20_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %17 = fir.address_of(@_QQclX703163206578706563742C676F742C6D61746368203D) : !fir.ref<!fir.char<1,22>>
    %18:2 = hlfir.declare %17 typeparams %c22 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX703163206578706563742C676F742C6D61746368203D"} : (!fir.ref<!fir.char<1,22>>, index) -> (!fir.ref<!fir.char<1,22>>, !fir.ref<!fir.char<1,22>>)
    %19 = fir.convert %18#0 : (!fir.ref<!fir.char<1,22>>) -> !fir.ref<i8>
    %20 = fir.convert %c22 : (index) -> i64
    %21 = fir.call @_FortranAioOutputAscii(%16, %19, %20) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %22 = fir.load %5#0 : !fir.ref<i64>
    %23 = fir.call @_FortranAioOutputInteger64(%16, %22) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i64) -> i1
    %24 = fir.load %9#0 : !fir.ref<i64>
    %25 = fir.call @_FortranAioOutputInteger64(%16, %24) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i64) -> i1
    %26 = fir.load %9#0 : !fir.ref<i64>
    %27 = fir.load %5#0 : !fir.ref<i64>
    %28 = arith.cmpi eq, %26, %27 : i64
    %29 = fir.call @_FortranAioOutputLogical(%16, %28) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i1) -> i1
    %30 = fir.call @_FortranAioEndIoStatement(%16) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<2000000xi32> {
    %0 = fir.zero_bits !fir.array<2000000xi32>
    fir.has_value %0 : !fir.array<2000000xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX7031635F707269766174655F6269672E66393000 constant : !fir.char<1,20> {
    %0 = fir.string_lit "p1c_private_big.f90\00"(20) : !fir.char<1,20>
    fir.has_value %0 : !fir.char<1,20>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX703163206578706563742C676F742C6D61746368203D constant : !fir.char<1,22> {
    %0 = fir.string_lit "p1c expect,got,match ="(22) : !fir.char<1,22>
    fir.has_value %0 : !fir.char<1,22>
  }
  func.func private @_FortranAioOutputInteger64(!fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  func.func private @_FortranAioOutputLogical(!fir.ref<i8>, i1) -> i1 attributes {fir.io, fir.runtime}
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
