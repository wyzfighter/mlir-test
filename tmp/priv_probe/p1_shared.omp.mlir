module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "P1"} {
    %c1 = arith.constant 1 : index
    %c19 = arith.constant 19 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c1000_i32 = arith.constant 1000 : i32
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
    %6 = fir.alloca i32 {bindc_name = "x", uniq_name = "_QFEx"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    omp.parallel {
      %26 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%c1_i32) to (%c400_i32) inclusive step (%c1_i32) {
          %27:2 = hlfir.declare %6 {uniq_name = "_QFEx"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          %28:2 = hlfir.declare %26 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg0 to %28#0 : !fir.ref<i32>
          hlfir.assign %c0_i32 to %27#0 : i32, !fir.ref<i32>
          %29 = fir.load %27#0 : !fir.ref<i32>
          %30 = fir.load %28#0 : !fir.ref<i32>
          %31 = arith.addi %29, %30 : i32
          hlfir.assign %31 to %27#0 : i32, !fir.ref<i32>
          %32 = fir.load %27#0 : !fir.ref<i32>
          %33 = arith.addi %32, %c1000_i32 : i32
          hlfir.assign %33 to %27#0 : i32, !fir.ref<i32>
          %34 = fir.load %27#0 : !fir.ref<i32>
          %35 = fir.load %28#0 : !fir.ref<i32>
          %36 = fir.convert %35 : (i32) -> i64
          %37 = hlfir.designate %3#0 (%36)  : (!fir.ref<!fir.array<400xi32>>, i64) -> !fir.ref<i32>
          hlfir.assign %34 to %37 : i32, !fir.ref<i32>
          omp.yield
        }
      }
      omp.terminator
    }
    %8 = fir.address_of(@_QQclX70315F707269766174655F7363616C61722E66393000) : !fir.ref<!fir.char<1,22>>
    %9 = fir.convert %8 : (!fir.ref<!fir.char<1,22>>) -> !fir.ref<i8>
    %10 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %9, %c17_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %11 = fir.address_of(@_QQclX70312066697273742C6C6173742C73756D203D) : !fir.ref<!fir.char<1,19>>
    %12:2 = hlfir.declare %11 typeparams %c19 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX70312066697273742C6C6173742C73756D203D"} : (!fir.ref<!fir.char<1,19>>, index) -> (!fir.ref<!fir.char<1,19>>, !fir.ref<!fir.char<1,19>>)
    %13 = fir.convert %12#0 : (!fir.ref<!fir.char<1,19>>) -> !fir.ref<i8>
    %14 = fir.convert %c19 : (index) -> i64
    %15 = fir.call @_FortranAioOutputAscii(%10, %13, %14) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %16 = hlfir.designate %3#0 (%c1)  : (!fir.ref<!fir.array<400xi32>>, index) -> !fir.ref<i32>
    %17 = fir.load %16 : !fir.ref<i32>
    %18 = fir.call @_FortranAioOutputInteger32(%10, %17) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %19 = hlfir.designate %3#0 (%c400)  : (!fir.ref<!fir.array<400xi32>>, index) -> !fir.ref<i32>
    %20 = fir.load %19 : !fir.ref<i32>
    %21 = fir.call @_FortranAioOutputInteger32(%10, %20) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %22 = hlfir.sum %3#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<400xi32>>) -> i32
    %23 = fir.call @_FortranAioOutputInteger32(%10, %22) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %24 = fir.call @_FortranAioEndIoStatement(%10) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<400xi32> {
    %0 = fir.zero_bits !fir.array<400xi32>
    fir.has_value %0 : !fir.array<400xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70315F707269766174655F7363616C61722E66393000 constant : !fir.char<1,22> {
    %0 = fir.string_lit "p1_private_scalar.f90\00"(22) : !fir.char<1,22>
    fir.has_value %0 : !fir.char<1,22>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70312066697273742C6C6173742C73756D203D constant : !fir.char<1,19> {
    %0 = fir.string_lit "p1 first,last,sum ="(19) : !fir.char<1,19>
    fir.has_value %0 : !fir.char<1,19>
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

