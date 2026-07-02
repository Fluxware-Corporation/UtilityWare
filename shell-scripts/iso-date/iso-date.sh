#!/usr/bin/env bash
# iso-date — ISO 8601 timestamps
set -euo pipefail
echo "UTC:   $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "Local: $(date +%Y-%m-%dT%H:%M:%S%z)"
