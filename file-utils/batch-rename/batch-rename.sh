#!/usr/bin/env bash
# batch-rename — sed-style batch rename
set -euo pipefail
if [[ $# -lt 2 ]]; then
  echo "Usage: batch-rename '<pattern>' <files...>" >&2
  echo "Example: batch-rename 's/ /_/g' *.mp3" >&2
  exit 1
fi
pat="$1"; shift
for f in "$@"; do
  new=$(echo "$f" | sed -E "$pat")
  if [[ "$f" != "$new" && ! -e "$new" ]]; then
    mv -n "$f" "$new"
    echo "renamed: $f -> $new"
  fi
done
