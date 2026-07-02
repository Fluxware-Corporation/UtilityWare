#!/usr/bin/env bash
# dk-size — docker image sizes
set -euo pipefail
docker images --format "{{.Size}}\t{{.Repository}}:{{.Tag}}\t{{.ID}}" | sort -h
