module {
  acc.private.recipe @privatization_ref_i32 : !fir.ref<i32> init {
  ^bb0(%arg0: !fir.ref<i32>):
    %0 = fir.alloca i32
    %1:2 = hlfir.declare %0 {uniq_name = "acc.private.init"}
          : (!fir.ref<i32>) -> (!fir.ref<i32>, !fir.ref<i32>)
    acc.yield %1#0 : !fir.ref<i32>
  }

  func.func @_QQmain(%p: !fir.ref<i32>) {
    %c1 = arith.constant 1 : i32
    %c5 = arith.constant 5 : i32
    acc.parallel combined(loop) {
      %3 = acc.private varPtr(%p : !fir.ref<i32>) recipe(@privatization_ref_i32) -> !fir.ref<i32>
      acc.loop combined(parallel) private(%3 : !fir.ref<i32>) control(%iv : i32) = (%c1 : i32) to (%c5 : i32) step (%c1 : i32) {
        fir.store %iv to %3 : !fir.ref<i32>
        acc.yield
      } inclusiveUpperbound(array<i1: true>) independent
      acc.yield
    }
    return
  }
}
