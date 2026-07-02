#!/usr/bin/env bash
# cpu-temp — CPU temperature
set -euo pipefail
if [[ -f /sys/class/thermal/thermal_zone0/temp ]]; then
  raw=$(cat /sys/class/thermal/thermal_zone0/temp)
  echo "$((raw / 1000))°C"
elif command -v sensors >/dev/null 2>&1; then
  sensors | grep -i "core\|package\|temp"
else
  echo "cpu-temp: no sensor available" >&2
  exit 2
fi
