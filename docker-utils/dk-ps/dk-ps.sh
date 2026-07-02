#!/usr/bin/env bash
# dk-ps — pretty docker ps
set -euo pipefail
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Size}}" "$@"
