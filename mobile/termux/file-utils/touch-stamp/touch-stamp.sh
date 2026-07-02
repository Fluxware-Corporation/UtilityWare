#!/usr/bin/env bash
# touch-stamp — touch with timestamp
set -euo pipefail
if [[ $# -lt 2 ]]; then
  echo "Usage: touch-stamp <YYYYMMDDHHMM> <file...>" >&2; exit 1
fi
ts="$1"; shift
touch -t "$ts" "$@"
echo "touch-stamp: set mtime to $ts for $*"
