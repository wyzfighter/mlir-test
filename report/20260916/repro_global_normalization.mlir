// 最小复现：全局归一化缺陷
//
// 本文件本身是**合法**的 acc IR。它含有一个 pass 不会转换的 compute 构造
// （acc.serial + acc.loop），其中 acc.loop 的 private 操作数由 acc.private 定义。
//
// 若 pass 采用「模块级」归一化（把 acc.private 的结果全局替换成 host 变量），
// 归一化后 acc.loop 的 private 操作数就不再由 acc.private 定义，
// acc dialect verifier 会在 pass 结束后报错：
//   error: 'acc.loop' op expected private as defining op
//
// 运行：fir-opt --convert-openacc-to-openmp repro_global_normalization.mlir

func.func @repro(%lb: i32, %ub: i32, %st: i32, %p: !fir.ref<i32>) {
  acc.serial {
    %0 = acc.private varPtr(%p : !fir.ref<i32>) -> !fir.ref<i32> {implicit = true, name = "i"}
    acc.loop combined(serial) private(%0 : !fir.ref<i32>) control(%iv: i32) = (%lb : i32) to (%ub : i32) step (%st : i32) {
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    acc.yield
  }
  return
}
