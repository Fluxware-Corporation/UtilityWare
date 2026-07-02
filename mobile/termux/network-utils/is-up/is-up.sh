#!/usr/bin/env bash
# is-up — host ping check
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: is-up <host>" >&2; exit 1
fi
if ping -c1 -W2 "$1" >/dev/null 2>&1; then
  echo "UP: $1"
else
  echo "DOWN: $1"; exit 2
fi
