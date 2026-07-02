#!/usr/bin/env bash
# cleanup — system cleanup
set -euo pipefail
echo "Before:"
df -h / | tail -1
echo
read -rp "Clear user caches (~/.cache)? [y/N] " yn
[[ "$yn" =~ ^[Yy]$ ]] && rm -rf ~/.cache/* && echo "  cleared ~/.cache"
read -rp "Clear /tmp older than 7 days? [y/N] " yn
[[ "$yn" =~ ^[Yy]$ ]] && find /tmp -type f -atime +7 -delete 2>/dev/null && echo "  cleared /tmp"
read -rp "Empty trash? [y/N] " yn
[[ "$yn" =~ ^[Yy]$ ]] && rm -rf ~/.local/share/Trash/* && echo "  emptied trash"
echo
echo "After:"
df -h / | tail -1
