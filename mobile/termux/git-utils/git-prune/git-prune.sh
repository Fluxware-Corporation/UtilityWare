#!/usr/bin/env bash
# git-prune — prune deleted remote branches
set -euo pipefail
git remote prune origin
git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D
echo "git-prune: done"
