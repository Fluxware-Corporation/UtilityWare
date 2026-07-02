#!/usr/bin/env bash
# ssl-info — SSL certificate info
set -euo pipefail
host="${1:-}"
port="${2:-443}"
if [[ -z "$host" ]]; then
  echo "Usage: ssl-info <host> [port]" >&2; exit 1
fi
echo | openssl s_client -connect "$host:$port" -servername "$host" 2>/dev/null \
  | openssl x509 -noout -subject -issuer -dates -fingerprint 2>/dev/null
