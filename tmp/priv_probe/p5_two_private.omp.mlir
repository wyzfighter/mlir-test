module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "P5"} {
    %c1 = arith.constant 1 : index
    %c19 = arith.constant 19 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c5_i32 = arith.constant 5 : i32
    %c100_i32 = arith.constant 100 : i32
    %c1_i32 = arith.constant 1 : i32
    %c100 = arith.constant 100 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100xi32>>
    %2 = fir.shape %c100 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100xi32>>, !fir.ref<!fir.array<100xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "y", uniq_name = "_QFEy"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEy"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %8 = fir.alloca f32 {bindc_name = "z", uniq_name = "_QFEz"}
    %9:2 = hlfir.declare %8 {uniq_name = "_QFEz"} : (!fir.ref<f32>) -> (!fir.ref<f32>, !fir.ref<f32>)
    omp.parallel {
      %27 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %28 = fir.alloca f32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %29 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%c1_i32) to (%c100_i32) inclusive step (%c1_i32) {
          %30:2 = hlfir.declare %27 {uniq_name = "_QFEy"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          %31:2 = hlfir.declare %28 {uniq_name = "_QFEz"} : (!fir.ref<f32>) -> (!fir.ref<f32>, !fir.ref<f32>)
          %32:2 = hlfir.declare %29 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg0 to %32#0 : !fir.ref<i32>
          %33 = fir.load %32#0 : !fir.ref<i32>
          %34 = arith.addi %33, %c5_i32 : i32
          hlfir.assign %34 to %30#0 : i32, !fir.ref<i32>
          %35 = fir.load %30#0 : !fir.ref<i32>
          %36 = fir.convert %35 : (i32) -> f32
          hlfir.assign %36 to %31#0 : f32, !fir.ref<f32>
          %37 = fir.load %30#0 : !fir.ref<i32>
          %38 = fir.load %31#0 : !fir.ref<f32>
          %39 = fir.call @llvm.lround.i32.f32(%38) fastmath<contract> : (f32) -> i32
          %40 = arith.addi %37, %39 : i32
          %41 = fir.load %30#0 : !fir.ref<i32>
          %42 = arith.subi %40, %41 : i32
          %43 = fir.load %32#0 : !fir.ref<i32>
          %44 = fir.convert %43 : (i32) -> i64
          %45 = hlfir.designate %3#0 (%44)  : (!fir.ref<!fir.array<100xi32>>, i64) -> !fir.ref<i32>
          hlfir.assign %42 to %45 : i32, !fir.ref<i32>
          omp.yield
        }
      }
      omp.terminator
    }
    %10 = fir.address_of(@_QQclX70355F74776F5F707269766174652E66393000) : !fir.ref<!fir.char<1,19>>
    %11 = fir.convert %10 : (!fir.ref<!fir.char<1,19>>) -> !fir.ref<i8>
    %12 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %11, %c17_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %13 = fir.address_of(@_QQclX70352066697273742C6C6173742C73756D203D) : !fir.ref<!fir.char<1,19>>
    %14:2 = hlfir.declare %13 typeparams %c19 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX70352066697273742C6C6173742C73756D203D"} : (!fir.ref<!fir.char<1,19>>, index) -> (!fir.ref<!fir.char<1,19>>, !fir.ref<!fir.char<1,19>>)
    %15 = fir.convert %14#0 : (!fir.ref<!fir.char<1,19>>) -> !fir.ref<i8>
    %16 = fir.convert %c19 : (index) -> i64
    %17 = fir.call @_FortranAioOutputAscii(%12, %15, %16) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %18 = hlfir.designate %3#0 (%c1)  : (!fir.ref<!fir.array<100xi32>>, index) -> !fir.ref<i32>
    %19 = fir.load %18 : !fir.ref<i32>
    %20 = fir.call @_FortranAioOutputInteger32(%12, %19) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %21 = hlfir.designate %3#0 (%c100)  : (!fir.ref<!fir.array<100xi32>>, index) -> !fir.ref<i32>
    %22 = fir.load %21 : !fir.ref<i32>
    %23 = fir.call @_FortranAioOutputInteger32(%12, %22) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %24 = hlfir.sum %3#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<100xi32>>) -> i32
    %25 = fir.call @_FortranAioOutputInteger32(%12, %24) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %26 = fir.call @_FortranAioEndIoStatement(%12) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<100xi32> {
    %0 = fir.zero_bits !fir.array<100xi32>
    fir.has_value %0 : !fir.array<100xi32>
  }
  func.func private @llvm.lround.i32.f32(f32) -> i32 attributes {fir.bindc_name = "llvm.lround.i32.f32", fir.runtime}
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70355F74776F5F707269766174652E66393000 constant : !fir.char<1,19> {
    %0 = fir.string_lit "p5_two_private.f90\00"(19) : !fir.char<1,19>
    fir.has_value %0 : !fir.char<1,19>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70352066697273742C6C6173742C73756D203D constant : !fir.char<1,19> {
    %0 = fir.string_lit "p5 first,last,sum ="(19) : !fir.char<1,19>
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

