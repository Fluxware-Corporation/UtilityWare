#!/usr/bin/env bash
# standup — daily standup template
set -euo pipefail
cat <<EOF
=== Standup — $(date '+%A, %B %d %Y') ===

Yesterday:
  - 
  - 
  - 

Today:
  - 
  - 
  - 

Blockers:
  - 

EOF
