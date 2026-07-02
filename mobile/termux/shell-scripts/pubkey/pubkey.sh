#!/usr/bin/env bash
# pubkey — print SSH public key
set -euo pipefail
found=0
for f in ~/.ssh/id_rsa.pub ~/.ssh/id_ed25519.pub ~/.ssh/id_ecdsa.pub; do
  if [[ -f "$f" ]]; then
    echo "=== $f ==="
    cat "$f"
    found=1
  fi
done
(( found )) || { echo "pubkey: no public key found in ~/.ssh/" >&2; exit 2; }
