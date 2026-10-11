// 最小复现：acc.dialect verifier 在 private 操作数为 block argument 时段错误
//
// 本文件**不需要任何 pass**。仅 `fir-opt repro_verifier_crash.mlir`
// （解析 + 验证）即会段错误。
//
// 根因：mlir/lib/Dialect/OpenACC/IR/OpenACC.cpp:1698
//   if (!mlir::isa<OpT>(operand.getDefiningOp()))
// operand 是 block argument 时 getDefiningOp() 返回 nullptr，
// mlir::isa 对空指针不做检查，直接崩溃。
//
// 对照：若把 private 操作数换成某个非 acc.private 算子的结果（见下），
// 得到的是干净诊断 "expected private as defining op" 而非崩溃。
//
// 用 -split-input-file 可分别运行两个用例：
//   fir-opt -split-input-file repro_verifier_crash.mlir

func.func @block_arg_private(%p: !fir.ref<i32>, %lb: i32, %ub: i32, %st: i32) {
  acc.serial {
    acc.loop combined(serial) private(%p : !fir.ref<i32>) control(%iv: i32) = (%lb : i32) to (%ub : i32) step (%st : i32) {
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    acc.yield
  }
  return
}

// -----

// 对照函数：private 操作数由 cast 算子定义（非 block argument）→ 干净报错。
// 单独喂给 fir-opt 时不崩溃，报 error: 'acc.loop' op expected private as defining op
func.func @cast_defined_private(%p: !llvm.ptr, %lb: i32, %ub: i32, %st: i32) {
  acc.serial {
    %c = builtin.unrealized_conversion_cast %p : !llvm.ptr to !fir.ref<i32>
    acc.loop combined(serial) private(%c : !fir.ref<i32>) control(%iv: i32) = (%lb : i32) to (%ub : i32) step (%st : i32) {
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    acc.yield
  }
  return
}
