#!/usr/bin/env bash
# py-freeze — clean requirements.txt
set -euo pipefail
pip freeze 2>/dev/null | sort -u > requirements.txt
echo "py-freeze: wrote requirements.txt ($(wc -l < requirements.txt) packages)"
