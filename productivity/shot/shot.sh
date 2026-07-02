#!/usr/bin/env bash
# shot — take a screenshot
set -euo pipefail
dir="${SHOT_DIR:-$HOME/Pictures/Screenshots}"
mkdir -p "$dir"
out="${dir}/shot-$(date +%Y%m%d-%H%M%S).png"
case "$(uname -s)" in
  Darwin) screencapture -i "$out" ;;
  Linux)
    if command -v gnome-screenshot >/dev/null; then gnome-screenshot -a -f "$out"
    elif command -v scrot >/dev/null; then scrot -s "$out"
    elif command -v maim >/dev/null; then maim -s "$out"
    else echo "shot: no screenshot tool found" >&2; exit 2 ;;
    fi
    ;;
esac
echo "shot: saved $out"
