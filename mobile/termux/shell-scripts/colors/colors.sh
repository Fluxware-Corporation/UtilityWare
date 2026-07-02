#!/usr/bin/env bash
# colors — print 256-color palette
echo "ANSI 256-color palette:"
for i in {0..255}; do
  printf "\033[48;5;%dm%3d\033[0m " "$i" "$i"
  if (( (i+1) % 16 == 0 )); then echo; fi
done
echo
echo "Styles:"
echo -e "\033[1mbold\033[0m  \033[3mitalic\033[0m  \033[4munderline\033[0m  \033[9mstrikethrough\033[0m"
