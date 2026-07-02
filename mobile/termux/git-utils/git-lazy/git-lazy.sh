#!/usr/bin/env bash
# git-lazy — add, commit, push
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: git-lazy <commit-message>" >&2
  exit 1
fi
msg="$*"
git add -A
git commit -m "$msg"
git push
echo "git-lazy: pushed '$msg'"
