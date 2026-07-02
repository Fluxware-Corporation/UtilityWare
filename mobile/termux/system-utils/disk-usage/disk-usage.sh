#!/usr/bin/env bash
# disk-usage — top 20 largest dirs
set -euo pipefail
du -h --max-depth=2 . 2>/dev/null | sort -rh | head -20
