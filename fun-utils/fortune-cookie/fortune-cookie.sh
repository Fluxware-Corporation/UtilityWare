#!/usr/bin/env bash
# fortune-cookie — random fortune
set -euo pipefail
cookies=(
  "The best time to plant a tree was 20 years ago. The second best time is now."
  "Talk is cheap. Show me the code. — Linus Torvalds"
  "Simplicity is the soul of efficiency. — Austin Freeman"
  "Programs must be written for people to read. — Harold Abelson"
  "There are only two hard things in CS: cache invalidation and naming things."
  "Premature optimization is the root of all evil. — Donald Knuth"
  "Make it work, make it right, make it fast. — Kent Beck"
  "The only way to learn a new programming language is by writing programs in it. — Ritchie & Kernighan"
)
echo "🥢 ${cookies[RANDOM % ${#cookies[@]}]}"
