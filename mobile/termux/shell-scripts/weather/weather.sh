#!/usr/bin/env bash
# weather — terminal weather from wttr.in
set -euo pipefail
loc="${1:-}"
if [[ -z "$loc" ]]; then
  loc=$(curl -s ifconfig.io 2>/dev/null || echo "")
fi
curl -s "https://wttr.in/${loc}?format=v2" || echo "weather: network error" >&2
