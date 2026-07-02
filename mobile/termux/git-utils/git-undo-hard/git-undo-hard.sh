#!/usr/bin/env bash
# git-undo-hard — undo last commit, discard changes
set -euo pipefail
read -rp "This discards all uncommitted changes. Continue? [y/N] " yn
[[ "$yn" =~ ^[Yy]$ ]] || { echo "aborted"; exit 0; }
git reset --hard HEAD~1
echo "git-undo-hard: last commit discarded"
