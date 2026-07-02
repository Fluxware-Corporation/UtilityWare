#!/usr/bin/env bash
# ips — show all IP addresses
set -euo pipefail
echo "=== Local ==="
if command -v ip >/dev/null 2>&1; then
  ip -o addr show | awk '{print $2, $4}'
elif command -v ifconfig >/dev/null 2>&1; then
  ifconfig | grep -E "^[a-z]|inet " | awk '{print $1, $2}'
else
  echo "(no ip/ifconfig)"
fi
echo
echo "=== Public ==="
curl -s --max-time 5 https://ifconfig.io || echo "(no network)"
