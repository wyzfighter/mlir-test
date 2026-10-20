#!/bin/bash
#===----------------------------------------------------------------------===!
# Run the prebuilt firstprivate-bridge check executables and compare them
# against the plain-OpenMP ground truth.
#
# For every case fp_<case> the script runs
#   * fp_<case>.bridged.exe   (produced via the OpenACC -> OpenMP bridge)
#   * fp_<case>.baseline.exe  (plain OpenMP twin, the ground truth)
# at several thread counts and compares their output as a SORTED set,
# because the order in which threads print is not defined.
#
# The bridged run must match the plain OpenMP run.  A firstprivate copy
# that was not materialized shows up as a missing or zero value and fails
# the comparison.
#
# All executables are taken from WORK (default ./work, override with
# WORK=/some/dir).  Nothing is built here.
#
# Usage:  ./run.sh            check every case at T=1,2,4
#         ./run.sh 1 2 4      check at the given thread counts
#         WORK=/tmp/fp ./run.sh
#===----------------------------------------------------------------------===!
set -u

SRCDIR=$(cd "$(dirname "$0")" && pwd) || exit 1

#--- work directory ------------------------------------------------------------
WORK=${WORK:-$SRCDIR/work}
if [ ! -d "$WORK" ]; then
  echo "run.sh: work directory $WORK does not exist; set WORK=<dir with *.exe>" >&2
  exit 1
fi

#--- runtime -------------------------------------------------------------------
OMPDIR=$(ls -d "$HOME"/.llvm/build-dcc/runtimes/runtimes-bins/openmp/runtime/src 2>/dev/null | head -1)
export LD_LIBRARY_PATH=${OMPDIR:-}:${LD_LIBRARY_PATH:-}
export OMP_DISPLAY_AFFINITY=FALSE

THREADS=("$@")
[ ${#THREADS[@]} -eq 0 ] && THREADS=(1 2 4)

CASES=(fp_scalar fp_array fp_derived)

status=0
for p in "${CASES[@]}"; do
  echo "=== $p ==="
  if [ ! -x "$WORK/$p.bridged.exe" ] || [ ! -x "$WORK/$p.baseline.exe" ]; then
    echo "  MISSING EXECUTABLE ($p.bridged.exe / $p.baseline.exe)"
    status=1
    continue
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