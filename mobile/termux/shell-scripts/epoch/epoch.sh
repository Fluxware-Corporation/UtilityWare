#!/usr/bin/env bash
# epoch — epoch <-> date conversion
set -euo pipefail
if [[ $# -eq 0 ]]; then
  date +%s
elif [[ "$1" =~ ^[0-9]+$ ]]; then
  date -d "@$1" 2>/dev/null || date -r "$1"
else
  date -d "$1" +%s 2>/dev/null || echo "epoch: bad input" >&2 && exit 1
fi
