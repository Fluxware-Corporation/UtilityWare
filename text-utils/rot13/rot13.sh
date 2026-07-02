#!/usr/bin/env bash
# rot13 — ROT13 cipher
set -euo pipefail
if [[ $# -ge 1 ]]; then
  echo "$*" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
else
  tr 'A-Za-z' 'N-ZA-Mn-za-m'
fi
