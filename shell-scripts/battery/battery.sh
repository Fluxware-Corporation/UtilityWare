#!/usr/bin/env bash
# battery — show battery status
case "$(uname -s)" in
  Darwin)
    pmset -g batt | grep --color=never -E "InternalBattery|ExternalBattery"
    ;;
  Linux)
    for bat in /sys/class/power_supply/BAT*; do
      [[ -d "$bat" ]] || continue
      cap=$(cat "$bat/capacity" 2>/dev/null || echo "?")
      st=$(cat "$bat/status" 2>/dev/null || echo "?")
      echo "$(basename "$bat"): ${cap}% (${st})"
    done
    ;;
  *) echo "battery: unsupported OS" >&2; exit 2 ;;
esac
