#!/usr/bin/env bash
# trim — strip whitespace
set -euo pipefail
if [[ $# -ge 1 ]]; then
  echo "$*" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
else
  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
fi
