#!/usr/bin/env bash
# prompt-list — list .prompt files
set -euo pipefail
dir="${1:-.}"
find "$dir" -type f -name "*.prompt" | sort
