#!/usr/bin/env bash
# dk-ip — container IP
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: dk-ip <container>" >&2; exit 1
fi
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
