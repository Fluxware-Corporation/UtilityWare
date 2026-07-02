#!/usr/bin/env bash
# dk-clean — docker cleanup
set -euo pipefail
echo "Removing stopped containers..."
docker container prune -f
echo "Removing dangling images..."
docker image prune -f
echo "Removing unused volumes..."
docker volume prune -f
echo "dk-clean: done"
