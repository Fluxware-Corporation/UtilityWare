#!/usr/bin/env bash
# theme-preview — preview colors
echo "Foreground:"
for c in 30 31 32 33 34 35 36 37; do
  printf "\033[%dm  %s  \033[0m" "$c" "$c"
done
echo
echo
echo "Background:"
for c in 40 41 42 43 44 45 46 47; do
  printf "\033[%dm  %s  \033[0m" "$c" "$c"
done
echo
