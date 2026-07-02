#!/usr/bin/env bash
# find-empty — empty files/dirs
set -euo pipefail
path="${1:-.}"
echo "=== empty files ==="
find "$path" -type f -empty 2>/dev/null
echo
echo "=== empty dirs ==="
find "$path" -type d -empty 2>/dev/null
