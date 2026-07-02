#!/usr/bin/env bash
# boot-time — boot time + uptime
set -euo pipefail
uptime -p 2>/dev/null || uptime
echo "Booted: $(uptime -s 2>/dev/null || echo unknown)"
