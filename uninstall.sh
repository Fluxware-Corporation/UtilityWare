#!/usr/bin/env bash
# uninstall.sh - remove UtilityWare symlinks from the install target
set -euo pipefail

TARGET_DIR="${TARGET_DIR:-$HOME/.local/bin}"
count=0

for link in "$TARGET_DIR"/*; do
  [[ -L "$link" ]] || continue
  target=$(readlink "$link")
  if [[ "$target" == *"/.utilityware-source/"* ]]; then
    rm "$link"
    count=$((count + 1))
  fi
done

echo "uninstall.sh: removed $count symlinks from $TARGET_DIR"
echo "Source clone left at $HOME/.utilityware-source - remove manually if desired:"
echo "  rm -rf ~/.utilityware-source"
