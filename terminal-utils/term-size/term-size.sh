#!/usr/bin/env bash
# term-size — terminal dimensions
set -euo pipefail
if command -v tput >/dev/null 2>&1; then
  echo "rows:    $(tput lines)"
  echo "columns: $(tput cols)"
elif [[ -t 0 ]]; then
  read -r _ cols rows < <(stty -a <&0 | head -1 | sed 's/.* //')
  echo "rows: $rows, cols: $cols"
else
  echo "term-size: not a TTY" >&2; exit 2
fi
