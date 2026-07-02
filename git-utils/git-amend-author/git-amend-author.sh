#!/usr/bin/env bash
# git-amend-author — fix author of last commit
set -euo pipefail
git commit --amend --reset-author --no-edit
echo "git-amend-author: author updated to $(git config user.name) <$(git config user.email)>"
