#!/usr/bin/env bash
# iso8601 — timestamp stream
set -euo pipefail
while true; do
  date -u +%Y-%m-%dT%H:%M:%SZ
  sleep 1
done
