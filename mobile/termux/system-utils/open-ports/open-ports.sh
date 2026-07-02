#!/usr/bin/env bash
# open-ports — listening ports
set -euo pipefail
ss -tulnp 2>/dev/null || netstat -tulnp
