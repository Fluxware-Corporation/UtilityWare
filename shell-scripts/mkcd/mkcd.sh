#!/usr/bin/env bash
# mkcd — make directory and cd into it
set -euo pipefail
if [[ $# -ne 1 ]]; then
  echo "Usage: mkcd <dir>" >&2
  exit 1
fi
mkdir -p "$1"
cd "$1"
echo "mkcd: now in $(pwd)"
