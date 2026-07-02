#!/usr/bin/env bash
# git-stats — repository statistics
set -euo pipefail
echo "=== Commits by author ==="
git shortlog -sne
echo
echo "=== Last 5 commits ==="
git log -5 --oneline
echo
echo "=== Repo size ==="
git count-objects -vH | grep -E "size-pack|count-pack"
