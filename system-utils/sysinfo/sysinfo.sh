#!/usr/bin/env bash
# sysinfo — system summary
set -euo pipefail
echo "=== OS ==="
uname -a
echo
echo "=== Uptime ==="
uptime
echo
echo "=== CPU ==="
lscpu 2>/dev/null | grep -E "Model name|^CPU\(s\)|Thread|Core" || echo "(lscpu not available)"
echo
echo "=== Memory ==="
free -h 2>/dev/null || vm_stat
echo
echo "=== Disk ==="
df -h | grep -vE "tmpfs|udev"
