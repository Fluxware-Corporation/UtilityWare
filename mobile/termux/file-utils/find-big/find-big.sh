#!/usr/bin/env bash
# find-big — largest files
set -euo pipefail
n="${1:-20}"
shift 2>/dev/null || true
path="${1:-.}"
find "$path" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -"$n"
