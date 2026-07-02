#!/usr/bin/env bash
# watch-cmd — minimal watch
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: watch-cmd [interval] <command...>" >&2; exit 1
fi
interval=2
if [[ "$1" =~ ^[0-9]+$ ]]; then interval="$1"; shift; fi
while true; do
  clear
  echo "every ${interval}s: $*"
  date
  echo
  "$@" || true
  sleep "$interval"
done
