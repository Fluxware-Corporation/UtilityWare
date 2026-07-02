#!/usr/bin/env bash
# lsblk-pretty — block devices
set -euo pipefail
if command -v lsblk >/dev/null 2>&1; then
  lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT,MODEL
else
  echo "lsblk-pretty: lsblk not available" >&2; exit 2
fi
