#!/usr/bin/env bash
# dk-sh — shell into container
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: dk-sh <container> [cmd...]" >&2; exit 1
fi
container="$1"; shift
cmd="${*:-}"
if [[ -z "$cmd" ]]; then
  if docker exec "$container" bash -c true 2>/dev/null; then
    docker exec -it "$container" bash
  else
    docker exec -it "$container" sh
  fi
else
  docker exec -it "$container" "$@"
fi
