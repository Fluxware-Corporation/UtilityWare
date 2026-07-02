#!/usr/bin/env bash
# speedtest — quick download speed test
set -euo pipefail
url="${SPEEDTEST_URL:-https://speed.cloudflare.com/__down?bytes=104857600}"
tmp=$(mktemp)
echo "Downloading 100MB from $url ..."
time curl -s -o "$tmp" "$url"
size=$(wc -c < "$tmp")
echo "Downloaded $size bytes"
rm -f "$tmp"
