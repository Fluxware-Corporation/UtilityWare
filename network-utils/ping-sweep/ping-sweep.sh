#!/usr/bin/env bash
# ping-sweep — ping sweep a /24 subnet
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: ping-sweep <a.b.c>" >&2
  exit 1
fi
base="$1"
for i in {1..254}; do
  ping -c1 -W1 "${base}.${i}" >/dev/null 2>&1 && echo "${base}.${i} up" &
done
wait
