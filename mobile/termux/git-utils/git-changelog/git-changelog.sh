#!/usr/bin/env bash
# git-changelog — generate changelog from git log
set -euo pipefail
since="${1:-HEAD}"
{
  echo "# Changelog"
  echo
  echo "_Generated $(date -u +%Y-%m-%d)_"
  echo
  git log "$since" --pretty=format:"### %s%n%n- %h by %an on %ci%n"     | sed -E 's/^([a-f0-9]{7}) by (.*) on (.*)/- commit \1 — \2 (\3)/'
} > CHANGELOG.md
echo "git-changelog: wrote CHANGELOG.md"
