#!/usr/bin/env bash
# bk — create timestamped backup
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: bk <file-or-dir>" >&2
  exit 1
fi
target="$1"
ts=$(date +%Y%m%d-%H%M%S)
out="${target}.bak.${ts}"
if [[ -d "$target" ]]; then
  tar czf "${out}.tgz" "$target"
  echo "bk: created ${out}.tgz"
else
  cp -p "$target" "$out"
  echo "bk: created $out"
fi
