#!/usr/bin/env bash
# countdown — days until a date
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: countdown <YYYY-MM-DD>" >&2; exit 1
fi
target=$(date -d "$1" +%s 2>/dev/null || date -j -f "%Y-%m-%d" "$1" +%s)
now=$(date +%s)
diff=$((target - now))
if (( diff < 0 )); then
  echo "Already passed by $(((-diff) / 86400)) days"
else
  printf "%d days, %d hours, %d minutes\n" $((diff/86400)) $(((diff%86400)/3600)) $(((diff%3600)/60))
fi
