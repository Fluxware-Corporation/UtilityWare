#!/usr/bin/env bash
# repeat — run a command N times
set -euo pipefail
if [[ $# -lt 2 ]]; then
  echo "Usage: repeat <n> <command...>" >&2; exit 1
fi
n="$1"; shift
for _ in $(seq 1 "$n"); do "$@"; done
