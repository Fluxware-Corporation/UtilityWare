#!/usr/bin/env bash
# timestamp — current epoch
set -euo pipefail
echo "seconds: $(date +%s)"
echo "millis:  $(date +%s%3N)"
