#!/usr/bin/env bash
# pkill-name — kill processes by name (interactive)
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: pkill-name <pattern>" >&2
  exit 1
fi
pat="$1"
ps aux | grep -i "$pat" | grep -v grep | head -20 || true
read -rp "Kill these? [y/N] " yn
if [[ "$yn" =~ ^[Yy]$ ]]; then
  pkill -i "$pat" && echo "killed."
else
  echo "aborted."
fi
