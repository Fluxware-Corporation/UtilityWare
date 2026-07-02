#!/usr/bin/env bash
# serve-py — minimal HTTP server
set -euo pipefail
port="${1:-8000}"
echo "http://localhost:${port}/"
python3 -m http.server "$port"
