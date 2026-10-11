#!/bin/bash
for src in *.f90; do
    # 跳过不存在的文件（当没有匹配时）
    [ -e "$src" ] || continue

    SRC_DIR="${src%.f90}"          # 去掉 .f90 后缀，例如 barrier
    echo "处理 $src -> $SRC_DIR/"

    mkdir -p "$SRC_DIR"
    mv "$src" "$SRC_DIR/"
    cd "$SRC_DIR" || exit 1

    flang -fc1 -fopenmp -emit-mlir "$src" -o "${src}.mlir"
    flang -fc1 -fopenmp -emit-llvm "${src}.mlir" -o "${src}.ll"
    # 最后一步：注意 flang 可能需要 -o 来指定输出文件
    flang -fopenmp "${src}.ll" -o "${src}.out"

    cd ..
done