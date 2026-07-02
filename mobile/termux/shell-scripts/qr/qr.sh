#!/usr/bin/env bash
# qr — generate a QR code in the terminal
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: qr <text-or-url>" >&2
  exit 1
fi
text="$*"
curl -s "https://api.qrserver.com/v1/create-qr-code/?data=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$text")&size=200x200&charset-source=UTF-8" -o /tmp/qr.png
if command -v img2txt >/dev/null 2>&1; then
  img2txt /tmp/qr.png
elif command -v chafa >/dev/null 2>&1; then
  chafa /tmp/qr.png
else
  echo "qr: saved to /tmp/qr.png (install chafa or img2txt for in-terminal display)"
fi
