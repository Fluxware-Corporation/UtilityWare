#!/usr/bin/env bash
# ruler — print a column ruler
set -euo pipefail
width="${1:-80}"
for i in $(seq 1 "$width"); do
  if (( i % 10 == 0 )); then printf "%-9d" "$i"
  elif (( i % 10 == 1 )); then printf "1"
  else printf "."; fi
done
echo
