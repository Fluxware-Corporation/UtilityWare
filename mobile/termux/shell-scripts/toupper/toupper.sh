#!/usr/bin/env bash
# toupper — uppercase text
set -euo pipefail
if [[ $# -ge 1 ]]; then
  echo "$*" | tr 'a-z' 'A-Z'
else
  tr 'a-z' 'A-Z'
fi
