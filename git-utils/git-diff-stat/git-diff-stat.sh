#!/usr/bin/env bash
# git-diff-stat — diff stat helper
set -euo pipefail
range="${1:-HEAD~1..HEAD}"
git diff --stat "$range"
