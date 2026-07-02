#!/usr/bin/env bash
# hack — fake hacker animation
set -euo pipefail
trap 'tput sgr0; exit 0' INT
phrases=("Bypassing firewall..." "Decrypting RSA-4096..." "Accessing mainframe..."
         "Routing through 7 proxies..." "Cracking password hash..."
         "Extracting database..." "Wiping logs..." "Done.")
for p in "${phrases[@]}"; do
  printf "\033[32m[+]\033[0m %s " "$p"
  for _ in {1..8}; do
    printf "\033[32m#\033[0m"; sleep 0.1
  done
  echo " OK"
  sleep 0.3
done
