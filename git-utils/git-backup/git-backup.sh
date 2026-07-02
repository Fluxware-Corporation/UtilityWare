#!/usr/bin/env bash
# git-backup — git bundle
set -euo pipefail
out="repo-$(basename $(pwd))-$(date +%Y%m%d).bundle"
git bundle create "$out" --all
echo "git-backup: created $out"
