#!/usr/bin/env bash
# port-check — TCP port check
set -euo pipefail
if [[ $# -lt 2 ]]; then
  echo "Usage: port-check <host> <port>" >&2; exit 1
fi
host="$1"; port="$2"
if timeout 3 bash -c "</dev/tcp/$host/$port" 2>/dev/null; then
  echo "OPEN: $host:$port"
else
  echo "CLOSED: $host:$port"; exit 2
fi
