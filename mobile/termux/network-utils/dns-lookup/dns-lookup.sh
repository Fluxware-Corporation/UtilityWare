#!/usr/bin/env bash
# dns-lookup — multi-record DNS lookup
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: dns-lookup <domain>" >&2
  exit 1
fi
dom="$1"
for r in A AAAA MX NS TXT SOA CNAME; do
  echo "=== $r ==="
  dig +short "$dom" "$r" 2>/dev/null || nslookup -type="$r" "$dom" 2>/dev/null
done
