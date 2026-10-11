module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "P4"} {
    %c6 = arith.constant 6 : index
    %c13_i32 = arith.constant 13 : i32
    %c6_i32 = arith.constant 6 : i32
    %c100_i32 = arith.constant 100 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %2:2 = hlfir.declare %1 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %3 = fir.alloca i32 {bindc_name = "s", uniq_name = "_QFEs"}
    %4:2 = hlfir.declare %3 {uniq_name = "_QFEs"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c0_i32 to %4#0 : i32, !fir.ref<i32>
    %5 = acc.copyin varPtr(%4#0 : !fir.ref<i32>) dataClause(acc_reduction) implicit(true) name("s") -> !fir.ref<i32>
    omp.parallel {
      %17:2 = hlfir.declare %5 {uniq_name = "_QFEs"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %18 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%c1_i32) to (%c100_i32) inclusive step (%c1_i32) {
          %19:2 = hlfir.declare %17#0 {uniq_name = "_QFEs"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          %20:2 = hlfir.declare %18 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg0 to %20#0 : !fir.ref<i32>
          %21 = fir.load %19#0 : !fir.ref<i32>
          %22 = fir.load %20#0 : !fir.ref<i32>
          %23 = arith.addi %21, %22 : i32
          hlfir.assign %23 to %19#0 : i32, !fir.ref<i32>
          omp.yield
        }
      }
      omp.terminator
    }
    acc.copyout accPtr(%5 : !fir.ref<i32>) to varPtr(%4#0 : !fir.ref<i32>) dataClause(acc_reduction) implicit(true) name("s")
    %6 = fir.address_of(@_QQclX70345F726564756374696F6E2E66393000) : !fir.ref<!fir.char<1,17>>
    %7 = fir.convert %6 : (!fir.ref<!fir.char<1,17>>) -> !fir.ref<i8>
    %8 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %7, %c13_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %9 = fir.address_of(@_QQclX70342073203D) : !fir.ref<!fir.char<1,6>>
    %10:2 = hlfir.declare %9 typeparams %c6 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX70342073203D"} : (!fir.ref<!fir.char<1,6>>, index) -> (!fir.ref<!fir.char<1,6>>, !fir.ref<!fir.char<1,6>>)
    %11 = fir.convert %10#0 : (!fir.ref<!fir.char<1,6>>) -> !fir.ref<i8>
    %12 = fir.convert %c6 : (index) -> i64
    %13 = fir.call @_FortranAioOutputAscii(%8, %11, %12) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %14 = fir.load %4#0 : !fir.ref<i32>
    %15 = fir.call @_FortranAioOutputInteger32(%8, %14) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %16 = fir.call @_FortranAioEndIoStatement(%8) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70345F726564756374696F6E2E66393000 constant : !fir.char<1,17> {
    %0 = fir.string_lit "p4_reduction.f90\00"(17) : !fir.char<1,17>
    fir.has_value %0 : !fir.char<1,17>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70342073203D constant : !fir.char<1,6> {
    %0 = fir.string_lit "p4 s ="(6) : !fir.char<1,6>
    fir.has_value %0 : !fir.char<1,6>
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

