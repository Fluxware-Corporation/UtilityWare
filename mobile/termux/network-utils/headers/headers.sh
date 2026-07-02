#!/usr/bin/env bash
# headers — show HTTP headers
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: headers <url>" >&2
  exit 1
fi
curl -sI "$1" | head -50
