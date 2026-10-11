// Probe: what does omp.target wrapping produce at translation time?
// The module attribute line is rewritten with sed to switch modes.
module attributes {omp.is_target_device = false, dlti.dl_spec = #dlti.dl_spec<>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @report(i32)

  llvm.func @f() {
    omp.target {
      %lb = llvm.mlir.constant(1 : i32) : i32
      %ub = llvm.mlir.constant(100 : i32) : i32
      %st = llvm.mlir.constant(1 : i32) : i32
      omp.parallel {
        omp.wsloop {
          omp.loop_nest (%iv) : i32 = (%lb) to (%ub) inclusive step (%st) {
            llvm.call @report(%iv) : (i32) -> ()
            omp.yield
          }
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }

  llvm.func @main() -> i32 {
    llvm.call @f() : () -> ()
    %zero = llvm.mlir.constant(0 : i32) : i32
    llvm.return %zero : i32
  }
}
