#!/usr/bin/env bash
# git-ignore — append to .gitignore
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: git-ignore <pattern> [pattern...]" >&2
  exit 1
fi
touch .gitignore
for p in "$@"; do
  grep -qxF "$p" .gitignore || echo "$p" >> .gitignore
done
echo "git-ignore: updated .gitignore"
cat .gitignore
