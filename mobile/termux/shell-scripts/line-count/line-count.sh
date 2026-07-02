#!/usr/bin/env bash
# line-count — recursive line count
set -euo pipefail
pattern="${1:-*}"
find . -type f -name "$pattern" -exec wc -l {} + 2>/dev/null | tail -1
