#!/usr/bin/env bash
# battery-health — battery wear level
set -euo pipefail
for bat in /sys/class/power_supply/BAT*; do
  [[ -d "$bat" ]] || continue
  energy_full=$(cat "$bat/energy_full" 2>/dev/null || cat "$bat/charge_full" 2>/dev/null || echo 0)
  energy_design=$(cat "$bat/energy_full_design" 2>/dev/null || cat "$bat/charge_full_design" 2>/dev/null || echo 0)
  if (( energy_design > 0 )); then
    pct=$((energy_full * 100 / energy_design))
    echo "$(basename "$bat"): ${pct}% of original capacity"
  fi
done
