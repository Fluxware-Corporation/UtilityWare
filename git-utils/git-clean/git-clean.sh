#!/usr/bin/env bash
# git-clean — delete merged local branches
set -euo pipefail
default=$(git symbolic-ref --short HEAD)
echo "Current default: $default"
git branch --merged "$default" | grep -vE "^\s*($default|main|master|develop)\s*$" | while read -r b; do
  git branch -d "$b"
done
echo "git-clean: done"
