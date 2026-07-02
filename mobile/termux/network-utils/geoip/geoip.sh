#!/usr/bin/env bash
# geoip — IP geolocation
set -euo pipefail
ip="${1:-}"
if [[ -z "$ip" ]]; then
  ip=$(curl -s --max-time 5 https://ifconfig.io)
fi
curl -s --max-time 5 "http://ip-api.com/json/$ip" | python3 -m json.tool
