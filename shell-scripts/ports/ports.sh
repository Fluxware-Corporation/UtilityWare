#!/usr/bin/env bash
# ports — list listening ports
set -euo pipefail
if command -v ss >/dev/null 2>&1; then
  ss -tulnp
elif command -v netstat >/dev/null 2>&1; then
  netstat -tulnp
else
  echo "ports: neither ss nor netstat available" >&2
  exit 2
fi
