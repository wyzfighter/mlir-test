module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/llvm-project.git 416fe4d867bf010c7b6c155075847866beb79905)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @_QQmain() attributes {fir.bindc_name = "P3"} {
    %c1 = arith.constant 1 : index
    %c19 = arith.constant 19 : index
    %c17_i32 = arith.constant 17 : i32
    %c6_i32 = arith.constant 6 : i32
    %c10_i32 = arith.constant 10 : i32
    %c150_i32 = arith.constant 150 : i32
    %c1_i32 = arith.constant 1 : i32
    %c10 = arith.constant 10 : index
    %c150 = arith.constant 150 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<150xi32>>
    %2 = fir.shape %c150 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<150xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<150xi32>>, !fir.ref<!fir.array<150xi32>>)
    %4 = fir.address_of(@_QFEb) : !fir.ref<!fir.array<10xi32>>
    %5 = fir.shape %c10 : (index) -> !fir.shape<1>
    %6:2 = hlfir.declare %4(%5) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<10xi32>>, !fir.ref<!fir.array<10xi32>>)
    %7 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %8:2 = hlfir.declare %7 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %9 = fir.alloca i32 {bindc_name = "j", uniq_name = "_QFEj"}
    %10:2 = hlfir.declare %9 {uniq_name = "_QFEj"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    omp.parallel {
      %28 = fir.alloca !fir.array<10xi32> {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %29 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      %30 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
      omp.wsloop {
        omp.loop_nest (%arg0) : i32 = (%c1_i32) to (%c150_i32) inclusive step (%c1_i32) {
          %31:2 = hlfir.declare %28(%5) {uniq_name = "_QFEb"} : (!fir.ref<!fir.array<10xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<10xi32>>, !fir.ref<!fir.array<10xi32>>)
          %32:2 = hlfir.declare %29 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
          fir.store %arg0 to %32#0 : !fir.ref<i32>
          acc.loop control(%arg1 : i32) = (%c1_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
            %38:2 = hlfir.declare %30 {uniq_name = "_QFEj"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
            fir.store %arg1 to %38#0 : !fir.ref<i32>
            %39 = fir.load %38#0 : !fir.ref<i32>
            %40 = fir.convert %39 : (i32) -> i64
            %41 = hlfir.designate %31#0 (%40)  : (!fir.ref<!fir.array<10xi32>>, i64) -> !fir.ref<i32>
            hlfir.assign %39 to %41 : i32, !fir.ref<i32>
            acc.yield
          } inclusiveUpperbound(array<i1: true>) auto_ 
          %33 = hlfir.designate %31#0 (%c10)  : (!fir.ref<!fir.array<10xi32>>, index) -> !fir.ref<i32>
          %34 = fir.load %33 : !fir.ref<i32>
          %35 = fir.load %32#0 : !fir.ref<i32>
          %36 = fir.convert %35 : (i32) -> i64
          %37 = hlfir.designate %3#0 (%36)  : (!fir.ref<!fir.array<150xi32>>, i64) -> !fir.ref<i32>
          hlfir.assign %34 to %37 : i32, !fir.ref<i32>
          omp.yield
        }
      }
      omp.terminator
    }
    %11 = fir.address_of(@_QQclX70335F707269766174655F61727261792E66393000) : !fir.ref<!fir.char<1,21>>
    %12 = fir.convert %11 : (!fir.ref<!fir.char<1,21>>) -> !fir.ref<i8>
    %13 = fir.call @_FortranAioBeginExternalListOutput(%c6_i32, %12, %c17_i32) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (i32, !fir.ref<i8>, i32) -> !fir.ref<i8>
    %14 = fir.address_of(@_QQclX70332066697273742C6C6173742C73756D203D) : !fir.ref<!fir.char<1,19>>
    %15:2 = hlfir.declare %14 typeparams %c19 {fortran_attrs = #fir.var_attrs<parameter>, uniq_name = "_QQclX70332066697273742C6C6173742C73756D203D"} : (!fir.ref<!fir.char<1,19>>, index) -> (!fir.ref<!fir.char<1,19>>, !fir.ref<!fir.char<1,19>>)
    %16 = fir.convert %15#0 : (!fir.ref<!fir.char<1,19>>) -> !fir.ref<i8>
    %17 = fir.convert %c19 : (index) -> i64
    %18 = fir.call @_FortranAioOutputAscii(%13, %16, %17) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, !fir.ref<i8>, i64) -> i1
    %19 = hlfir.designate %3#0 (%c1)  : (!fir.ref<!fir.array<150xi32>>, index) -> !fir.ref<i32>
    %20 = fir.load %19 : !fir.ref<i32>
    %21 = fir.call @_FortranAioOutputInteger32(%13, %20) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %22 = hlfir.designate %3#0 (%c150)  : (!fir.ref<!fir.array<150xi32>>, index) -> !fir.ref<i32>
    %23 = fir.load %22 : !fir.ref<i32>
    %24 = fir.call @_FortranAioOutputInteger32(%13, %23) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %25 = hlfir.sum %3#0 {fastmath = #arith.fastmath<contract>} : (!fir.ref<!fir.array<150xi32>>) -> i32
    %26 = fir.call @_FortranAioOutputInteger32(%13, %25) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>, i32) -> i1
    %27 = fir.call @_FortranAioEndIoStatement(%13) fastmath<contract> {fir.llvm_memory = #llvm.memory_effects<other = none, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, llvm.nocallback, llvm.nosync} : (!fir.ref<i8>) -> i32
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<150xi32> {
    %0 = fir.zero_bits !fir.array<150xi32>
    fir.has_value %0 : !fir.array<150xi32>
  }
  fir.global internal @_QFEb {alignment = 64 : i64} : !fir.array<10xi32> {
    %0 = fir.zero_bits !fir.array<10xi32>
    fir.has_value %0 : !fir.array<10xi32>
  }
  func.func private @_FortranAioBeginExternalListOutput(i32, !fir.ref<i8>, i32) -> !fir.ref<i8> attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70335F707269766174655F61727261792E66393000 constant : !fir.char<1,21> {
    %0 = fir.string_lit "p3_private_array.f90\00"(21) : !fir.char<1,21>
    fir.has_value %0 : !fir.char<1,21>
  }
  func.func private @_FortranAioOutputAscii(!fir.ref<i8>, !fir.ref<i8>, i64) -> i1 attributes {fir.io, fir.runtime}
  fir.global linkonce @_QQclX70332066697273742C6C6173742C73756D203D constant : !fir.char<1,19> {
    %0 = fir.string_lit "p3 first,last,sum ="(19) : !fir.char<1,19>
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

