#!/usr/bin/env bash
# matrix — matrix rain effect
set -euo pipefail
trap 'tput sgr0; clear; exit 0' INT
lines=$(tput lines); cols=$(tput cols)
chars='ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿ0123456789'
while true; do
  for i in $(seq 1 "$cols"); do
    printf "\033[32m%s" "${chars:RANDOM%${#chars}:1}"
  done
  sleep 0.05
done
