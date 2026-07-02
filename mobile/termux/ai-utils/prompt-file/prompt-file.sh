#!/usr/bin/env bash
# prompt-file — read a .prompt file
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: prompt-file <file.prompt>" >&2; exit 1
fi
[[ -f "$1" ]] || { echo "prompt-file: $1 not found" >&2; exit 2; }
cat "$1"
