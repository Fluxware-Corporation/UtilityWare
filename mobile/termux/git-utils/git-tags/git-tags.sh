#!/usr/bin/env bash
# git-tags — list tags
set -euo pipefail
git for-each-ref --sort=-creatordate refs/tags \
  --format='%(creatordate:short) %(refname:short)'
