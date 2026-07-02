#!/usr/bin/env bash
# dk-logs-tail — tailed docker logs
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: dk-logs-tail <container> [n]" >&2; exit 1
fi
container="$1"; n="${2:-50}"
docker logs -f --tail "$n" "$container"
