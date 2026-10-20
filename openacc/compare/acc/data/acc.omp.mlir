module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, fir.allocation_policy = #fir.allocation_policy<stack_arrays = false, small_array_threshold = 1024, total_stack_limit = 4194304>, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.relocation_model = 1 : i32, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "flang version 24.0.0 (git@github.com:wyzfighter/fortran-mlir-acc.git 63b57cf2085b76b9c533461f44798b0b6ec90c9e)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  omp.private {type = private} @acc_private_0 : i32 init {
  ^bb0(%arg0: !fir.ref<i32>, %arg1: !fir.ref<i32>):
    omp.yield(%arg1 : !fir.ref<i32>)
  }
  func.func @_QQmain() attributes {fir.bindc_name = "MAIN"} {
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %c5 = arith.constant 5 : index
    %c1 = arith.constant 1 : index
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
    %8 = fir.load %7#0 : !fir.ref<i32>
    %9 = arith.muli %8, %c2_i32 : i32
    %10 = fir.convert %9 : (i32) -> index
    %11 = arith.subi %10, %c1 : index
    %12 = acc.bounds lowerbound(%c5 : index) upperbound(%11 : index) extent(%c100000 : index) stride(%c1 : index) startIdx(%c1 : index)
    %13 = acc.copyin varPtr(%3#0 : !fir.ref<!fir.array<100000xi32>>) bounds(%12) dataClause(acc_copy) name("a(6:2_4*n)") -> !fir.ref<!fir.array<100000xi32>>
    acc.data dataOperands(%13 : !fir.ref<!fir.array<100000xi32>>) {
      %14 = fir.load %7#0 : !fir.ref<i32>
      %15 = omp.map.info var_ptr(%3#0 : !fir.ref<!fir.array<100000xi32>>, !fir.array<100000xi32>) map_clauses(tofrom) capture(ByRef) -> !fir.ref<!fir.array<100000xi32>>
      omp.target kernel_type(spmd_no_loop) host_eval(%c3_i32 -> %arg0, %14 -> %arg1, %c1_i32 -> %arg2 : i32, i32, i32) map_entries(%15 -> %arg3 : !fir.ref<!fir.array<100000xi32>>) {
        omp.teams {
          omp.parallel {
            %16 = fir.alloca i32 {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">, bindc_name = "acc.private.init"}
            omp.distribute {
              omp.wsloop {
                omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) inclusive step (%arg2) {
                  %17:2 = hlfir.declare %16 {uniq_name = "_QFEi"} : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
                  fir.store %arg4 to %17#0 : !fir.ref<i32>
                  %18 = fir.load %17#0 : !fir.ref<i32>
                  %19 = arith.muli %18, %18 : i32
                  %20 = arith.addi %18, %18 overflow<nsw> : i32
                  %21 = fir.convert %20 : (i32) -> i64
                  %22 = hlfir.designate %arg3 (%21)  : (!fir.ref<!fir.array<100000xi32>>, i64) -> !fir.ref<i32>
                  hlfir.assign %19 to %22 : i32, !fir.ref<i32>
                  omp.yield
                }
              } {omp.composite}
            } {omp.composite}
            omp.terminator
          } {omp.composite}
          omp.terminator
        } {omp.combined}
        omp.terminator
      } {omp.combined}
      acc.terminator
    }
    acc.copyout accPtr(%13 : !fir.ref<!fir.array<100000xi32>>) bounds(%12) to varPtr(%3#0 : !fir.ref<!fir.array<100000xi32>>) dataClause(acc_copy) name("a(6:2_4*n)")
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

