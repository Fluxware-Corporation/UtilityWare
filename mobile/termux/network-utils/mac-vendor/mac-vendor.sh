#!/usr/bin/env bash
# mac-vendor — MAC vendor lookup
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: mac-vendor <mac>" >&2; exit 1
fi
mac=$(echo "$1" | tr -d ':-' | tr 'a-f' 'A-F' | cut -c1-6)
# Use the public macvendors.com API
curl -s --max-time 5 "https://api.macvendors.com/$mac" || echo "(lookup failed)"
