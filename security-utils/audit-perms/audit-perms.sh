#!/usr/bin/env bash
# audit-perms — find world-writable files
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: audit-perms <dir>" >&2
  exit 1
fi
echo "World-writable files under $1:"
find "$1" -type f -perm -0002 2>/dev/null | head -100
echo
echo "SUID binaries under $1:"
find "$1" -type f -perm -4000 2>/dev/null | head -100
