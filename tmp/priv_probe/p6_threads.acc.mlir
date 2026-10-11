module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
    acc.yield %0 : !fir.ref<i32>
  }
  func.func @_QQmain() attributes {fir.bindc_name = "P6"} {
    %c0_i32 = arith.constant 0 : i32
    %c25 = arith.constant 25 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1000_i32 = arith.constant 1000 : i32
    %c1_i32 = arith.constant 1 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c1000 = arith.constant 1000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2:2 = hlfir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %3 = fir.address_of(@_QFEtid) : !fir.ref<!fir.array<1000xi32>>
    %4 = fir.shape %c1000 : (index) -> !fir.shape<1>
    %5:2 = hlfir.declare %3(%4) {uniq_name = "_QFEtid"} : (!fir.ref<!fir.array<1000xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<1000xi32>>, !fir.ref<!fir.array<1000xi32>>)
    hlfir.assign %c-1_i32 to %5#0 : i32, !fir.ref<!fir.array<1000xi32>>
    acc.parallel combined(loop) {
      %24 = acc.private varPtr(%2#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) name("i") -> !fir.ref<i32>
      acc.loop combined(parallel) private(%24 : !fir.ref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c1000_i32 : i32)  step (%c1_i32 : i32) {
        %25:2 = hlfir.declare %24 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg0 to %25#0 : !fir.ref<i32>
        %26 = fir.call @omp_get_thread_num() proc_attrs<bind_c> fastmath<contract> : () -> i32
        %27 = fir.load %25#0 : !fir.ref<i32>
        %28 = fir.convert %27 : (i32) -> i64
        %29 = hlfir.designate %5#0 (%28)  : (!fir.ref<!fir.array<1000xi32>>, i64) -> !fir.ref<i32>
        hlfir.assign %26 to %29 : i32, !fir.ref<i32>
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      acc.yield
    }
    %6 = fir.address_of(@_QQclX70365F746872656164732E66393000) : !fir.ref<!fir.char<1,15>>
    %7 = fir.convert %6 : (!fir.ref<!fir.char<1,15>>) -> !fir.ref<i8>
    %8 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %7, %c17_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %9 = fir.address_of(@_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D) : !fir.ref<!fir.char<1,25>>
    %10:2 = hlfir.declare %9 typeparams %c25 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D"} : (!fir.ref<!fir.char<1,25>>, index) -> (!fir.ref<!fir.char<1,25>>, !fir.ref<!fir.char<1,25>>)
    %11 = fir.convert %10#0 : (!fir.ref<!fir.char<1,25>>) -> !fir.ref<i8>
    %12 = fir.convert %c25 : (index) -> i64
    %13 = fir.call @_FortranAioOutputAscii(%8, %11, %12) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %14 = hlfir.minval %5#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<1000xi32>>) -> i32
    %15 = fir.call @_FortranAioOutputInteger32(%8, %14) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %16 = hlfir.maxval %5#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<1000xi32>>) -> i32
    %17 = fir.call @_FortranAioOutputInteger32(%8, %16) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %18 = hlfir.sum %5#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<1000xi32>>) -> i32
    %19 = fir.call @_FortranAioOutputInteger32(%8, %18) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %20 = hlfir.elemental %4 unordered : (!fir.shape<1>) -> !hlfir.expr<1000x!fir.logical<4>> {
    ^bb0(%arg0: index):
      %24 = hlfir.designate %5#0 (%arg0)  : (!fir.ref<!fir.array<1000xi32>>, index) -> !fir.ref<i32>
      %25 = fir.load %24 : !fir.ref<i32>
      %26 = arith.cmpi sge, %25, %c0_i32 : i32
      %27 = fir.convert %26 : (i1) -> !fir.logical<4>
      hlfir.yield_element %27 : !fir.logical<4>
    }
    %21 = hlfir.count %20 : (!hlfir.expr<1000x!fir.logical<4>>) -> i32
    %22 = fir.call @_FortranAioOutputInteger32(%8, %21) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    hlfir.destroy %20 : !hlfir.expr<1000x!fir.logical<4>>
    %23 = fir.call @_FortranAioEndIoStatement(%8) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEtid {alignment = 64 : i64} : !fir.array<1000xi32> {
    %0 = fir.zero_bits !fir.array<1000xi32>
    fir.has_value %0 : !fir.array<1000xi32>
  }
  func.func private @omp_get_thread_num() -> i32 attributes {fir.bindc_name = "omp_get_thread_num", fir.proc_attrs = #fir.proc_attrs<bind_c>}
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70365F746872656164732E66393000 constant : !fir.char<1,15> {
    %0 = fir.string_lit "p6_threads.f90\00"(15) : !fir.char<1,15>
    fir.has_value %0 : !fir.char<1,15>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX7036206D696E2C6D61782C73756D2C636F756E743E3D30203D constant : !fir.char<1,25> {
    %0 = fir.string_lit "p6 min,max,sum,count>=0 ="(25) : !fir.char<1,25>
    fir.has_value %0 : !fir.char<1,25>
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
