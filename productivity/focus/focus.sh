#!/usr/bin/env bash
# focus — block distracting sites for N minutes
set -euo pipefail
SITES=(reddit.com twitter.com facebook.com youtube.com instagram.com tiktok.com)
if [[ $# -lt 1 ]]; then
  echo "Usage: focus <minutes>" >&2
  exit 1
fi
mins="$1"
echo "Blocking distractions for ${mins}m..."
echo "" | sudo tee -a /etc/hosts >/dev/null
echo "# focus-block-start" | sudo tee -a /etc/hosts >/dev/null
for s in "${SITES[@]}"; do
  echo "127.0.0.1 $s" | sudo tee -a /etc/hosts >/dev/null
  echo "127.0.0.1 www.$s" | sudo tee -a /etc/hosts >/dev/null
done
(sleep "${mins}m" && sudo sed -i '/# focus-block-start/,/# focus-block-end/d' /etc/hosts) &
echo "Focus mode active. Will auto-clear in ${mins}m."
