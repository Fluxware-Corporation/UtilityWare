#!/usr/bin/env bash
# header — print a banner
set -euo pipefail
text="${*:-header}"
len=${#text}
echo
printf "┌"; printf "─%.0s" $(seq 1 $((len+2))); printf "┐\n"
printf "│ %s │\n" "$text"
printf "└"; printf "─%.0s" $(seq 1 $((len+2))); printf "┘\n"
echo
