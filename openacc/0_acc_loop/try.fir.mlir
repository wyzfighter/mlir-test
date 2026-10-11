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
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c1_i32 = arith.constant 1 : i32
    %c1234_i32 = arith.constant 1234 : i32
    %c100000 = arith.constant 100000 : index
    %0 = fir.dummy_scope : !fir.dscope
    %1 = fir.address_of(@_QFEa) : !fir.ref<!fir.array<100000xi32>>
    %2 = fir.shape %c100000 : (index) -> !fir.shape<1>
    %3:2 = hlfir.declare %1(%2) {uniq_name = "_QFEa"} : (!fir.ref<!fir.array<100000xi32>>, !fir.shape<1>) -> (!fir.ref<!fir.array<100000xi32>>, !fir.ref<!fir.array<100000xi32>>)
    %4 = fir.alloca i32 {bindc_name = "i", uniq_name = "_QFEi"}
    %5:2 = hlfir.declare %4 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    %6 = fir.alloca i32 {bindc_name = "n", uniq_name = "_QFEn"}
    %7:2 = hlfir.declare %6 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    hlfir.assign %c1234_i32 to %7#0 : i32, !fir.ref<i32>
    %8 = acc.firstprivate varPtr(%7#0 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) name("n") -> !fir.ref<i32>
    acc.parallel combined(loop) firstprivate(%8 : !fir.ref<i32>) {
      %9:2 = hlfir.declare %8 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
      %10 = acc.firstprivate varPtr(%9#0 : !fir.ref<i32>) recipe(@firstprivatization_ref_i32) implicit(true) name("n") -> !fir.ref<i32>
      %11 = fir.load %9#0 : !fir.ref<i32>
      %12 = acc.private varPtr(%5#0 : !fir.ref<i32>) recipe(@privatization_ref_i32) implicit(true) name("i") -> !fir.ref<i32>
      acc.loop combined(parallel) private(%12 : !fir.ref<i32>) firstprivate(%10 : !fir.ref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%11 : i32)  step (%c1_i32 : i32) {
        %13:2 = hlfir.declare %10 {uniq_name = "_QFEn"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        %14:2 = hlfir.declare %12 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
        fir.store %arg0 to %14#0 : !fir.ref<i32>
        %15 = fir.load %14#0 : !fir.ref<i32>
        %16 = arith.muli %15, %15 : i32
        %17 = arith.addi %15, %15 overflow<nsw> : i32
        %18 = fir.convert %17 : (i32) -> i64
        %19 = hlfir.designate %3#0 (%18)  : (!fir.ref<!fir.array<100000xi32>>, i64) -> !fir.ref<i32>
        hlfir.assign %16 to %19 : i32, !fir.ref<i32>
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent 
      acc.yield
    }
    return
  }
  fir.global internal @_QFEa {alignment = 64 : i64} : !fir.array<100000xi32> {
    %0 = fir.zero_bits !fir.array<100000xi32>
    fir.has_value %0 : !fir.array<100000xi32>
  }
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
