#!/usr/bin/env bash
# term-title — set window title
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: term-title <text>" >&2; exit 1
fi
printf '\033]0;%s\007' "$*"
