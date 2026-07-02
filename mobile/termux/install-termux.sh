#!/usr/bin/env bash
# install-termux.sh - clone UtilityWare from git, then pick tools via arrow menu
#
# >>> REPLACE THE NEXT LINE WITH YOUR REPO URL <<<
REPO_URL="https://github.com/PLACEHOLDER/UtilityWare.git"
# =========================================================================

set -euo pipefail

: "${PREFIX:=/data/data/com.termux/files/usr}"
TARGET_DIR="${TARGET_DIR:-$PREFIX/bin}"
CLONE_DIR="${CLONE_DIR:-$HOME/.utilityware-source}"

# ---- colors via tput (no hardcoded escape sequences) ----
if command -v tput >/dev/null 2>&1 && [[ -t 1 ]]; then
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  CYAN=$(tput setaf 6)
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
  DIM=""
else
  RED=""
  GREEN=""
  YELLOW=""
  CYAN=""
  BOLD=""
  RESET=""
  DIM=""
fi

# ---- step 1: clone or update ----
echo -e "${CYAN}${BOLD}=== UtilityWare installer (Termux) ===${RESET}"
echo
if [[ -d "$CLONE_DIR/.git" ]]; then
  echo -e "${YELLOW}>>${RESET} Existing clone found at ${DIM}$CLONE_DIR${RESET}"
  echo -e "${YELLOW}>>${RESET} Pulling latest..."
  git -C "$CLONE_DIR" pull --ff-only
else
  echo -e "${YELLOW}>>${RESET} Cloning from ${DIM}$REPO_URL${RESET}"
  echo -e "${YELLOW}>>${RESET} Target: ${DIM}$CLONE_DIR${RESET}"
  git clone --depth 1 "$REPO_URL" "$CLONE_DIR"
fi
echo

cd "$CLONE_DIR"

# ---- step 2: discover tools (prefer the mobile/termux/ copy if it exists) ----
SOURCE_ROOT="$CLONE_DIR"
if [[ -d "$CLONE_DIR/mobile/termux" ]]; then
  SOURCE_ROOT="$CLONE_DIR/mobile/termux"
fi
cd "$SOURCE_ROOT"

declare -a TOOL_PATHS=()
declare -a TOOL_NAMES=()
declare -a TOOL_CATS=()

for cat_dir in */; do
  [[ -d "$cat_dir" ]] || continue
  cat_name="${cat_dir%/}"
  for tool_dir in "$cat_dir"*/; do
    [[ -d "$tool_dir" ]] || continue
    tool_name=$(basename "$tool_dir")
    for ext in sh py js go rs; do
      if [[ -f "$tool_dir${tool_name}.${ext}" ]]; then
        TOOL_PATHS+=("$(cd "$tool_dir" && pwd)/${tool_name}.${ext}")
        TOOL_NAMES+=("$tool_name")
        TOOL_CATS+=("$cat_name")
        break
      fi
    done
  done
done

count=${#TOOL_NAMES[@]}
if (( count == 0 )); then
  echo -e "${RED}No tools found in $SOURCE_ROOT${RESET}" >&2
  exit 2
fi
echo -e "${GREEN}Found ${BOLD}${count}${RESET}${GREEN} tools.${RESET}"
echo

# ---- step 3: arrow-key menu ----
declare -a SELECTED=()
for i in $(seq 0 $((count-1))); do SELECTED+=("0"); done
cursor=0

if [[ ! -t 0 ]]; then
  echo -e "${YELLOW}Not a TTY - installing ALL tools (non-interactive mode).${RESET}"
  for i in $(seq 0 $((count-1))); do SELECTED[$i]="1"; done
else
  if command -v stty >/dev/null 2>&1; then
    old_stty=$(stty -g </dev/tty)
    stty raw -echo </dev/tty 2>/dev/null || true
    trap 'stty "$old_stty" </dev/tty 2>/dev/null || true; echo; exit 0' INT
  fi

  render_menu() {
    printf '%s' "$(tput clear 2>/dev/null || true)"
    echo -e "${CYAN}${BOLD}=== UtilityWare - select tools to install ===${RESET}"
    echo -e "${DIM}Up/Down move  Space toggle  a all  n none  Enter install  q quit${RESET}"
    echo
    for i in $(seq 0 $((count-1))); do
      mark=" "
      [[ "${SELECTED[$i]}" == "1" ]] && mark="${GREEN}x${RESET}"
      arrow=" "
      [[ $i -eq $cursor ]] && arrow="${YELLOW}>${RESET}"
      printf " %s [%s] %-4s %s\n" "$arrow" "$mark" "${TOOL_CATS[$i]}" "${TOOL_NAMES[$i]}"
    done
    echo
    local sel=0
    for s in "${SELECTED[@]}"; do [[ "$s" == "1" ]] && sel=$((sel+1)); done
    echo -e "${DIM}-- ${sel}/${count} selected --${RESET}"
  }

  render_menu
  while true; do
    IFS= read -r -n1 -s key </dev/tty
    case "$key" in
      $'\x1b')
        IFS= read -r -n1 -s _ </dev/tty
        IFS= read -r -n1 -s arrow </dev/tty
        case "$arrow" in
          A|k) cursor=$((cursor - 1)); [[ $cursor -lt 0 ]] && cursor=$((count-1)) ;;
          B|j) cursor=$((cursor + 1)); [[ $cursor -ge $count ]] && cursor=0 ;;
        esac
        ;;
      ' ')
        [[ "${SELECTED[$cursor]}" == "1" ]] && SELECTED[$cursor]="0" || SELECTED[$cursor]="1"
        ;;
      a|A)
        for i in $(seq 0 $((count-1))); do SELECTED[$i]="1"; done
        ;;
      n|N)
        for i in $(seq 0 $((count-1))); do SELECTED[$i]="0"; done
        ;;
      $'\r'|$'\n')
        break
        ;;
      q|Q|$'\x03')
        if command -v stty >/dev/null 2>&1; then
          stty "$old_stty" </dev/tty 2>/dev/null || true
        fi
        echo
        echo -e "${YELLOW}Cancelled.${RESET}"
        exit 0
        ;;
    esac
    render_menu
  done

  if command -v stty >/dev/null 2>&1; then
    stty "$old_stty" </dev/tty 2>/dev/null || true
  fi
  echo
fi

# ---- step 4: install selected ----
mkdir -p "$TARGET_DIR"
installed=0
for i in $(seq 0 $((count-1))); do
  if [[ "${SELECTED[$i]}" == "1" ]]; then
    ln -sf "${TOOL_PATHS[$i]}" "$TARGET_DIR/${TOOL_NAMES[$i]}"
    echo -e "  ${GREEN}OK${RESET} ${TOOL_NAMES[$i]}  ${DIM}(${TOOL_CATS[$i]})${RESET}"
    installed=$((installed + 1))
  fi
done

echo
if (( installed > 0 )); then
  echo -e "${GREEN}${BOLD}Installed ${installed} tool(s) into ${TARGET_DIR}${RESET}"
  echo -e "${DIM}\$PREFIX/bin is already on PATH in Termux.${RESET}"
else
  echo -e "${YELLOW}No tools selected. Nothing installed.${RESET}"
fi
