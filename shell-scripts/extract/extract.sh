#!/usr/bin/env bash
# extract — universal archive extractor
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: extract <file> [file...]" >&2
  exit 1
fi
for f in "$@"; do
  if [[ ! -f "$f" ]]; then
    echo "extract: $f is not a file" >&2
    continue
  fi
  case "$f" in
    *.tar.bz2|*.tbz2) tar xjf "$f" ;;
    *.tar.gz|*.tgz)   tar xzf "$f" ;;
    *.tar.xz|*.txz)   tar xJf "$f" ;;
    *.tar.zst)        tar --zstd -xf "$f" ;;
    *.tar)            tar xf "$f" ;;
    *.bz2)            bunzip2 "$f" ;;
    *.gz)             gunzip "$f" ;;
    *.zip)            unzip -q "$f" ;;
    *.rar)            unrar x "$f" ;;
    *.7z)             7z x "$f" ;;
    *.Z)              uncompress "$f" ;;
    *) echo "extract: unknown extension for $f" >&2 ;;
  esac
  echo "extract: $f done"
done
