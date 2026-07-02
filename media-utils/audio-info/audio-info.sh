#!/usr/bin/env bash
# audio-info — audio file info via ffprobe
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: audio-info <file>" >&2
  exit 1
fi
if ! command -v ffprobe >/dev/null 2>&1; then
  echo "audio-info: ffprobe not found (install ffmpeg)" >&2
  exit 2
fi
ffprobe -v error -show_format -show_streams -print_format json "$1" | python3 -m json.tool
