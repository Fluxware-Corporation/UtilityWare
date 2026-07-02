#!/usr/bin/env bash
# tolower — lowercase text
set -euo pipefail
if [[ $# -ge 1 ]]; then
  echo "$*" | tr 'A-Z' 'a-z'
else
  tr 'A-Z' 'a-z'
fi
