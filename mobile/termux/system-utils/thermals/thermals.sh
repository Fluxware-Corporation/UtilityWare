#!/usr/bin/env bash
# thermals — all thermal zones
set -euo pipefail
if ls /sys/class/thermal/thermal_zone* >/dev/null 2>&1; then
  for z in /sys/class/thermal/thermal_zone*; do
    type=$(cat "$z/type" 2>/dev/null)
    raw=$(cat "$z/temp" 2>/dev/null)
    echo "$type: $((raw/1000))°C"
  done
else
  echo "thermals: no /sys/class/thermal (not Linux?)" >&2; exit 2
fi
