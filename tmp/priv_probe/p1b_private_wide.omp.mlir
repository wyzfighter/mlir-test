module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "P1B"} {
    %c1 = arith.constant 1 : index
    %c20 = arith.constant 20 : index
    %c18_i32 = arith.constant 18 : i32
    %c6_i32 = arith.constant 6 : i32
    %c50_i32 = arith.constant 50 : i32
    %c0_i32 = arith.constant 0 : i32
    %c400_i32 = arith.constant 400 : i32
    %c1_i32 = arith.constant 1 : i32
    %c400 = arith.constant 400 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<400xi32>>
    %2 = fir.shape %c400 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<400xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<400xi32>>, !fir.ref<!fir.array<400xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "k", uniq_name = "_QFEk"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEk"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %8 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %9:2 = hlfir.declare %8 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    omp.parallel {
      %27 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %28 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %29 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%c1_i32) to (%c400_i32) inclusive step (%c1_i32) {
          %30:2 = hlfir.declare %27 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          %31:2 = hlfir.declare %28 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg0 to %31#0 : !fir.ref<i32>
          hlfir.assign %c0_i32 to %30#0 : i32, !fir.ref<i32>
          acc.loop control(%arg1 : i32) = (%c1_i32 : i32) to (%c50_i32 : i32)  step (%c1_i32 : i32) {
            %36:2 = hlfir.declare %29 {uniq_name = "_QFEk"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
            fir.store %arg1 to %36#0 : !fir.ref<i32>
            %37 = fir.load %30#0 : !fir.ref<i32>
            %38 = fir.load %31#0 : !fir.ref<i32>
            %39 = arith.addi %37, %38 : i32
            hlfir.assign %39 to %30#0 : i32, !fir.ref<i32>
            acc.yield
          } inclusiveUpperbound(array<i1: true>) auto_ 
          %32 = fir.load %30#0 : !fir.ref<i32>
          %33 = fir.load %31#0 : !fir.ref<i32>
          %34 = fir.convert %33 : (i32) -> i64
          %35 = hlfir.designate %3#0 (%34)  : (!fir.ref<!fir.array<400xi32>>, i64) -> !fir.ref<i32>
          hlfir.assign %32 to %35 : i32, !fir.ref<i32>
          omp.yield
        }
      }
      omp.terminator
    }
    %10 = fir.address_of(@_QQclX7031625F707269766174655F776964652E66393000) : !fir.ref<!fir.char<1,21>>
    %11 = fir.convert %10 : (!fir.ref<!fir.char<1,21>>) -> !fir.ref<i8>
    %12 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %11, %c18_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %13 = fir.address_of(@_QQclX7031622066697273742C6C6173742C73756D203D) : !fir.ref<!fir.char<1,20>>
    %14:2 = hlfir.declare %13 typeparams %c20 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX7031622066697273742C6C6173742C73756D203D"} : (!fir.ref<!fir.char<1,20>>, index) -> (!fir.ref<!fir.char<1,20>>, !fir.ref<!fir.char<1,20>>)
    %15 = fir.convert %14#0 : (!fir.ref<!fir.char<1,20>>) -> !fir.ref<i8>
    %16 = fir.convert %c20 : (index) -> i64
    %17 = fir.call @_FortranAioOutputAscii(%12, %15, %16) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %18 = hlfir.designate %3#0 (%c1)  : (!fir.ref<!fir.array<400xi32>>, index) -> !fir.ref<i32>
    %19 = fir.load %18 : !fir.ref<i32>
    %20 = fir.call @_FortranAioOutputInteger32(%12, %19) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %21 = hlfir.designate %3#0 (%c400)  : (!fir.ref<!fir.array<400xi32>>, index) -> !fir.ref<i32>
    %22 = fir.load %21 : !fir.ref<i32>
    %23 = fir.call @_FortranAioOutputInteger32(%12, %22) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %24 = hlfir.sum %3#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<400xi32>>) -> i32
    %25 = fir.call @_FortranAioOutputInteger32(%12, %24) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %26 = fir.call @_FortranAioEndIoStatement(%12) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<400xi32> {
    %0 = fir.zero_bits !fir.array<400xi32>
    fir.has_value %0 : !fir.array<400xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX7031625F707269766174655F776964652E66393000 constant : !fir.char<1,21> {
    %0 = fir.string_lit "p1b_private_wide.f90\00"(21) : !fir.char<1,21>
    fir.has_value %0 : !fir.char<1,21>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX7031622066697273742C6C6173742C73756D203D constant : !fir.char<1,20> {
    %0 = fir.string_lit "p1b first,last,sum ="(20) : !fir.char<1,20>
    fir.has_value %0 : !fir.char<1,20>
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

