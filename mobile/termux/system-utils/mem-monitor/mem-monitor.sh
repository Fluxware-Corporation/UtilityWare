#!/usr/bin/env bash
# mem-monitor — memory monitor
set -euo pipefail
interval="${1:-2}"
while true; do
  clear
  echo "=== $(date) ==="
  free -h 2>/dev/null || vm_stat
  sleep "$interval"
done
