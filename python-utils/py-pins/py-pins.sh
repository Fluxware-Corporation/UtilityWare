#!/usr/bin/env bash
# py-pins — show pinned packages
set -euo pipefail
file="${1:-requirements.txt}"
[[ -f "$file" ]] || { echo "py-pins: $file not found" >&2; exit 2; }
grep -E '^[a-zA-Z0-9_-]+==' "$file"
