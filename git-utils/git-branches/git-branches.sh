#!/usr/bin/env bash
# git-branches — branches by recency
set -euo pipefail
git for-each-ref --sort=-committerdate refs/heads/ \
  --format='%(committerdate:short) %(refname:short) %(subject)'
