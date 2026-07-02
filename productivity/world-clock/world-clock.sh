#!/usr/bin/env bash
# world-clock — world clocks
set -euo pipefail
for tz in UTC America/New_York America/Los_Angeles Europe/London Europe/Paris Asia/Tokyo Asia/Kolkata Australia/Sydney; do
  printf "%-25s %s\n" "$tz" "$(TZ=$tz date '+%Y-%m-%d %H:%M:%S %Z')"
done
