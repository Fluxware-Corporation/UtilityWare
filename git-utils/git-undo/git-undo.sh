#!/usr/bin/env bash
# git-undo — undo last commit, keep changes
set -euo pipefail
git reset --soft HEAD~1
echo "git-undo: last commit undone (changes kept in index)"
