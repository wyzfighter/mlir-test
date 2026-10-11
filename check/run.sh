#!/bin/bash
#===----------------------------------------------------------------------===!
# Verify firstprivate semantics through the OpenACC -> OpenMP bridge.
#
# For every fp_<case>.f90 this script
#   1. builds it through the OpenACC pipeline (bbc -> fir-opt -> tco -> llvm),
#   2. builds the plain OpenMP twin fp_<case>_omp.f90, which never goes through
#      the bridge and is therefore the ground truth,
#   3. runs both at several thread counts and compares their output as a SORTED
#      set, because the order in which threads print is not defined.
#
# The bridged run must match the plain OpenMP run.  A firstprivate copy that was
# not materialized shows up as a missing or zero value and fails the comparison.
# fp_array is the case only the in-loop print can decide: mutating a
# firstprivate array inside the region is discarded when the region ends, so the
# array's final value is the same with or without the copy.
#
# All build products, including the .mod files bbc writes next to its input,
# land in WORK (default ./work, override with WORK=/some/writable/dir).  The
# sources are copied there so the check also runs from a read-only checkout.
#
# Toolchain: the four pipeline tools are taken from PATH (see AGENTS.md 6.3),
# but PATH order is NOT trusted blindly, because this checkout is routinely
# newer than the tree installed under ~/.llvm/install -> dtk-dcc-staging.  Two
# distinct breakages were observed on this machine and both are probed for:
#   * a fir-opt that predates the firstprivate bridge: it silently drops the
#     recipes, leaving acc.*.recipe in the module, and the failure only shows up
#     two stages later as "failed to legalize operation
#     'builtin.unrealized_conversion_cast'" out of tco;
#   * a clang from another LLVM release (the DTK 23.04 clang is 15.0.0) that
#     cannot even parse this tree's textual LLVM IR.
# The script therefore picks the first candidate directory that passes both
# functional probes, prints the one it chose, and explains on stderr why any
# PATH-preferred tool was rejected.  Override with TOOLDIR=<dir>.
#
# Usage:  ./run.sh            check every case at T=1,2,4
#         ./run.sh 1 2 4      check at the given thread counts
#         WORK=/tmp/fp ./run.sh
#         TOOLDIR=$HOME/.llvm/install/bin ./run.sh
#===----------------------------------------------------------------------===!
set -u

SRCDIR=$(cd "$(dirname "$0")" && pwd) || exit 1

#--- Fortran intrinsic modules -------------------------------------------------
# bbc needs -J; the environment variable FLANG_INTRINSIC_MODULES_DIR has no
# effect.  install is a symlink to dtk-dcc-staging/llvm-release-aomp, so both
# spellings are tried.
MODDIR=${MODDIR:-}
if [ -z "$MODDIR" ]; then
  for d in "$HOME/.llvm/build-dcc" "$HOME/.llvm/install" \
           "$HOME/dtk-dcc-staging/llvm-release-aomp"; do
    MODDIR=$(ls -d "$d"/lib/clang/*/finclude/flang/*/ 2>/dev/null | head -1)
    [ -n "$MODDIR" ] && break
  done
fi
if [ -z "$MODDIR" ]; then
  echo "run.sh: cannot find the Fortran intrinsic module directory; set MODDIR=" >&2
  exit 1
fi

#--- work directory ------------------------------------------------------------
# A directory is usable only if a file can actually be created in it: mkdir -p
# succeeds even on a read-only filesystem, so it cannot be used as the probe.
# The checkout this script lives in is frequently mounted read-only, and bbc
# writes <module>.mod next to its input, so everything runs from WORK.
is_writable_dir() {
  [ -d "$1" ] && [ -w "$1" ] || return 1
  local probe="$1/.run.sh.write-probe.$$"
  ( : >"$probe" ) 2>/dev/null || return 1
  rm -f "$probe"
  return 0
}

WORK=${WORK:-$SRCDIR/work}
if ! mkdir -p "$WORK" 2>/dev/null || ! is_writable_dir "$WORK"; then
  WORK=${TMPDIR:-/tmp}/fp-firstprivate-check
  mkdir -p "$WORK" 2>/dev/null
  if ! is_writable_dir "$WORK"; then
    echo "run.sh: no writable work directory (tried $WORK); set WORK=<writable dir>" >&2
    exit 1
  fi
  echo "run.sh: $SRCDIR is not writable, using WORK=$WORK" >&2
fi

# bbc drops <module>.mod next to its input, so run on copies inside WORK.
if ! cp "$SRCDIR"/*.f90 "$WORK"/ 2>/dev/null; then
  echo "run.sh: cannot copy the sources into $WORK" >&2
  exit 1
fi
cd "$WORK" || exit 1

#--- toolchain selection -------------------------------------------------------
# 0 = ok, 1 = tools could not run at all, 2 = bridge missing from fir-opt.
probe_bridge() { # $1 = directory holding bbc/fir-opt/tco/clang
  local d=$1
  "$d/bbc" -fopenacc -J "$MODDIR" fp_scalar.f90 -o probe.acc.mlir \
      >/dev/null 2>&1 || return 1
  "$d/fir-opt" -convert-openacc-to-openmp probe.acc.mlir -o probe.omp.mlir \
      >/dev/null 2>&1 || return 1
  # The bridge must produce omp.private and must consume the acc recipes; an
  # unbridged module keeps acc.*.recipe and dies later inside tco.
  grep -q 'omp\.private' probe.omp.mlir || return 2
  grep -qE 'acc\.[a-z]+\.recipe' probe.omp.mlir && return 2
  return 0
}

# 0 = ok, 1 = could not run, 2 = cannot parse this tree's LLVM IR.
probe_clang() { # $1 = directory holding clang
  local d=$1
  printf 'define void @f() #0 { ret void }\n' >probe.ll
  printf 'attributes #0 = { memory(argmem: readwrite, inaccessiblemem: readwrite) }\n' >>probe.ll
  "$d/clang" -x ir -c probe.ll -o probe.o >/dev/null 2>&1 || return 2
  return 0
}

cands=()
add_cand() {
  local d=${1%/} c
  [ -n "$d" ] && [ -d "$d" ] || return 0
  for c in ${cands[@]+"${cands[@]}"}; do
    [ "$c" = "$d" ] && return 0
  done
  cands+=("$d")
}
[ -n "${TOOLDIR:-}" ] && add_cand "$TOOLDIR"
IFS=: read -r -a _pathdirs <<<"$PATH" || true
for d in ${_pathdirs[@]+"${_pathdirs[@]}"}; do add_cand "$d"; done
# Fallbacks, so the script also works from a shell that has nothing on PATH.
add_cand "$HOME/.llvm/build-dcc/bin"
add_cand "$HOME/.llvm/install/bin"

TOOLS=""
WARN=""
for d in "${cands[@]}"; do
  have_all=1
  for t in bbc fir-opt tco clang; do
    [ -x "$d/$t" ] || { have_all=0; break; }
  done
  [ "$have_all" = 1 ] || continue

  probe_bridge "$d"
  case $? in
    0) ;;
    2) WARN="$WARN
run.sh: note: $d/fir-opt has no firstprivate bridge: its output still contains
        acc.*.recipe and no omp.private, which makes tco fail later with
        'failed to legalize operation builtin.unrealized_conversion_cast'.
        That tree predates the current checkout.  Refresh it with
            ninja -C $HOME/.llvm/build-dcc install
        or prepend the tree that is up to date."
       continue ;;
    *) continue ;;
  esac

  if ! probe_clang "$d"; then
    WARN="$WARN
run.sh: note: $d/clang cannot compile this tree's LLVM IR
        ($("$d/clang" --version 2>/dev/null | head -1)).
        It belongs to a different LLVM release."
    continue
  fi

  TOOLS=$d
  break
done

rm -f probe.acc.mlir probe.omp.mlir probe.ll probe.o

if [ -z "$TOOLS" ]; then
  echo "run.sh: no usable toolchain found; looked in:" >&2
  for d in "${cands[@]}"; do echo "           $d" >&2; done
  [ -n "$WARN" ] && echo "$WARN" >&2
  echo "         set TOOLDIR=<dir with bbc/fir-opt/tco/clang> to override" >&2
  exit 1
fi

# Keep the commands below using bare tool names resolved through PATH, but make
# PATH resolve them to the directory that passed the probes.
PATH="$TOOLS:$PATH"
export PATH
echo "toolchain: $TOOLS"
[ -n "$WARN" ] && echo "$WARN" >&2

#--- runtime --------------------------------------------------------------
RTLIB=$(ls -d "$HOME"/.llvm/build-dcc/lib/clang/*/lib/*/libflang_rt.runtime.a 2>/dev/null | head -1)
OMPDIR=$(ls -d "$HOME"/.llvm/build-dcc/runtimes/runtimes-bins/openmp/runtime/src 2>/dev/null | head -1)
if [ ! -f "$RTLIB" ]; then
  echo "run.sh: cannot find libflang_rt.runtime.a" >&2
  exit 1
fi
export LD_LIBRARY_PATH=${OMPDIR:-}:${LD_LIBRARY_PATH:-}
export OMP_DISPLAY_AFFINITY=FALSE

THREADS=("$@")
[ ${#THREADS[@]} -eq 0 ] && THREADS=(1 2 4)

CASES=(fp_scalar fp_array fp_derived)

#--- build through the OpenACC -> OpenMP bridge ---
build_bridged() { # $1 = case
  local p=$1
  bbc -fopenacc -J "$MODDIR" "$p.f90" -o "$WORK/$p.acc.mlir" || return 1
  fir-opt -convert-openacc-to-openmp "$WORK/$p.acc.mlir" -o "$WORK/$p.omp.mlir" || return 1
  tco --emit-final-mlir "$WORK/$p.omp.mlir" -o "$WORK/$p.final.mlir" || return 1
  tco --code-gen-llvm "$WORK/$p.final.mlir" -o "$WORK/$p.ll" || return 1
  clang -fopenmp "$WORK/$p.ll" "$RTLIB" "$OMPDIR/libomp.so" -L"$OMPDIR" \
      -o "$WORK/$p.bridged.exe" -lm || return 1
}

#--- build the plain OpenMP twin (ground truth) ---
build_baseline() { # $1 = case
  local p=$1
  bbc -fopenmp -J "$MODDIR" "${p}_omp.f90" -o "$WORK/$p.base.mlir" || return 1
  tco --emit-final-mlir "$WORK/$p.base.mlir" -o "$WORK/$p.base.final.mlir" || return 1
  tco --code-gen-llvm "$WORK/$p.base.final.mlir" -o "$WORK/$p.base.ll" || return 1
  clang -fopenmp "$WORK/$p.base.ll" "$RTLIB" "$OMPDIR/libomp.so" -L"$OMPDIR" \
      -o "$WORK/$p.baseline.exe" -lm || return 1
}

status=0
for p in "${CASES[@]}"; do
  echo "=== $p ==="
  if ! build_bridged "$p"; then
    echo "  BRIDGED BUILD FAILED"; status=1; continue
  fi
  if ! build_baseline "$p"; then
    echo "  BASELINE BUILD FAILED"; status=1; continue
  fi
  for t in "${THREADS[@]}"; do
    got=$(OMP_NUM_THREADS=$t "$WORK/$p.bridged.exe" 2>/dev/null | sort)
    want=$(OMP_NUM_THREADS=$t "$WORK/$p.baseline.exe" 2>/dev/null | sort)
    if [ "$got" = "$want" ]; then
      echo "  T=$t OK   [$(echo "$got" | tr '\n' ' ')]"
    else
      echo "  T=$t FAIL"
      echo "    bridged : [$(echo "$got"  | tr '\n' ' ')]"
      echo "    baseline: [$(echo "$want" | tr '\n' ' ')]"
      status=1
    fi
  done
done

[ $status -eq 0 ] && echo "ALL OK" || echo "FAILURES PRESENT"
exit $status
