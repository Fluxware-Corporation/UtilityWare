#!/usr/bin/env bash
# install-termux.sh - UtilityWare installer with sleek adaptive menu (Termux)
#
# >>> REPLACE THE NEXT LINE WITH YOUR REPO URL <<<
REPO_URL="https://github.com/Fluxware-Corporation/UtilityWare.git"
# =========================================================================

set -euo pipefail

: "${PREFIX:=/data/data/com.termux/files/usr}"
TARGET_DIR="${TARGET_DIR:-$PREFIX/bin}"
CLONE_DIR="${CLONE_DIR:-$HOME/.utilityware-source}"

# ─── Colors ─────────────────────────────────────────────────
if command -v tput >/dev/null 2>&1 && [[ -t 1 ]]; then
  C_RED=$(tput setaf 1); C_GREEN=$(tput setaf 2); C_YELLOW=$(tput setaf 3)
  C_BLUE=$(tput setaf 4); C_CYAN=$(tput setaf 6); C_WHITE=$(tput setaf 7)
  C_BOLD=$(tput bold); C_DIM=$(tput dim); C_RESET=$(tput sgr0)
else
  C_RED=""; C_GREEN=""; C_YELLOW=""; C_BLUE=""; C_CYAN=""; C_WHITE=""
  C_BOLD=""; C_DIM=""; C_RESET=""
fi

# ─── Clone / update ─────────────────────────────────────────
echo
if [[ -d "$CLONE_DIR/.git" ]]; then
  printf "  %s→ Updating existing clone...%s\n" "$C_DIM" "$C_RESET"
  git -C "$CLONE_DIR" pull --ff-only -q 2>/dev/null || true
else
  printf "  %s→ Cloning from %s...%s\n" "$C_DIM" "$REPO_URL" "$C_RESET"
  git clone --depth 1 "$REPO_URL" "$CLONE_DIR" -q
fi
printf "  %s✓ Ready.%s\n\n" "$C_GREEN" "$C_RESET"

# Prefer the mobile/termux/ copy if it exists
if [[ -d "$CLONE_DIR/mobile/termux" ]]; then
  CLONE_DIR="$CLONE_DIR/mobile/termux"
fi

# ─── Terminal size (adapted to zoom) ────────────────────────
term_lines() { tput lines 2>/dev/null || echo 24; }
term_cols() { tput cols 2>/dev/null || echo 80; }

viewport_size() {
  local lines
  lines=$(term_lines)
  local vp=3
  (( lines >= 30 )) && vp=5
  (( lines >= 40 )) && vp=7
  (( lines >= 50 )) && vp=10
  (( lines <= 16 )) && vp=2
  (( lines <= 13 )) && vp=1
  echo "$vp"
}

# ─── Data ───────────────────────────────────────────────────
declare -a CAT_NAMES=() CAT_COUNTS=()
declare -A CAT_TOOLS=()
declare -A TOOL_SELECTED=()

# ─── Menu state ─────────────────────────────────────────────
MENU_MODE="cats"
CAT_CURSOR=0
CAT_OFFSET=0
TOOL_CURSOR=0
TOOL_OFFSET=0
CUR_CAT=""
CUR_CAT_COUNT=0

# ─── Get tool description from README ───────────────────────
get_desc() {
  local script="$1" name="$2"
  local readme
  readme="$(dirname "$script")/README.md"
  if [[ -f "$readme" ]]; then
    local desc
    desc=$(grep -m1 '^> ' "$readme" 2>/dev/null | sed 's/^> //')
    [[ -n "$desc" ]] && echo "$desc" && return
  fi
  echo "$name"
}

# ─── Discover tools ─────────────────────────────────────────
discover_tools() {
  cd "$CLONE_DIR"
  for cat_dir in */; do
    [[ -d "$cat_dir" ]] || continue
    [[ "$cat_dir" == "mobile/" ]] && continue
    local cat_name="${cat_dir%/}"
    local count=0
    local tools=""
    for tool_dir in "$cat_dir"*/; do
      [[ -d "$tool_dir" ]] || continue
      local tool_name
      tool_name=$(basename "$tool_dir")
      for ext in sh py js go rs; do
        local script="$tool_dir${tool_name}.${ext}"
        if [[ -f "$script" ]]; then
          local desc path
          desc=$(get_desc "$script" "$tool_name")
          path=$(cd "$tool_dir" && pwd)/${tool_name}.${ext}
          tools+="${tool_name}|${desc}|${path}"$'\n'
          count=$((count + 1))
          break
        fi
      done
    done
    if (( count > 0 )); then
      CAT_NAMES+=("$cat_name")
      CAT_COUNTS+=("$count")
      CAT_TOOLS["$cat_name"]="$tools"
    fi
  done
}

# ─── Count helpers ──────────────────────────────────────────
count_selected_total() {
  local n=0 k
  for k in "${!TOOL_SELECTED[@]}"; do
    [[ "${TOOL_SELECTED[$k]:-0}" == "1" ]] && n=$((n+1))
  done
  echo "$n"
}

count_selected_in_cat() {
  local cat_name="$1" n=0
  while IFS='|' read -r name desc path; do
    [[ -z "$name" ]] && continue
    [[ "${TOOL_SELECTED[$path]:-0}" == "1" ]] && n=$((n+1))
  done <<< "${CAT_TOOLS[$cat_name]}"
  echo "$n"
}

count_tools_in_cat() {
  local cat_name="$1" n=0
  while IFS='|' read -r name desc path; do
    [[ -z "$name" ]] && continue
    n=$((n+1))
  done <<< "${CAT_TOOLS[$cat_name]}"
  echo "$n"
}

# ─── Render: category view ──────────────────────────────────
render_cats() {
  local vp total
  vp=$(viewport_size)
  total=${#CAT_NAMES[@]}

  if (( CAT_CURSOR < CAT_OFFSET )); then
    CAT_OFFSET=$CAT_CURSOR
  elif (( CAT_CURSOR >= CAT_OFFSET + vp )); then
    CAT_OFFSET=$((CAT_CURSOR - vp + 1))
  fi

  tput clear 2>/dev/null || true

  echo
  printf "  %s%s◆ UtilityWare%s %sInstaller%s\n" \
    "$C_BOLD" "$C_CYAN" "$C_RESET" "$C_DIM" "$C_RESET"
  printf "  %s│ %s selected%s\n\n" "$C_DIM" "$(count_selected_total)" "$C_RESET"
  printf "  %sBrowse categories — press → to expand%s\n\n" "$C_DIM" "$C_RESET"

  if (( CAT_OFFSET > 0 )); then
    printf "  %s▲ %d above%s\n\n" "$C_DIM" "$CAT_OFFSET" "$C_RESET"
  fi

  local last=$((CAT_OFFSET + vp - 1))
  (( last >= total )) && last=$((total - 1))

  local i
  for ((i=CAT_OFFSET; i<=last; i++)); do
    local name="${CAT_NAMES[$i]}" count="${CAT_COUNTS[$i]}"
    local cat_sel
    cat_sel=$(count_selected_in_cat "$name")

    if [[ $i -eq $CAT_CURSOR ]]; then
      printf "  %s%s❯%s %s%-22s%s" "$C_YELLOW" "$C_BOLD" "$C_RESET" "$C_BOLD" "$name" "$C_RESET"
    else
      printf "  %s %-22s%s" "$C_DIM" "$name" "$C_RESET"
    fi

    printf "  %s%3d tools%s" "$C_DIM" "$count" "$C_RESET"
    if (( cat_sel > 0 )); then
      printf "  %s%d✓%s" "$C_GREEN" "$cat_sel" "$C_RESET"
    fi
    echo
  done

  local below=$((total - last - 1))
  if (( below > 0 )); then
    echo
    printf "  %s▼ %d below%s\n" "$C_DIM" "$below" "$C_RESET"
  fi

  echo
  printf "  %s↑↓ navigate   → expand   a all in cat   enter install   q quit%s\n" "$C_DIM" "$C_RESET"
}

# ─── Render: tool view ──────────────────────────────────────
render_tools() {
  local vp cols
  vp=$(viewport_size)
  cols=$(term_cols)

  declare -a t_names=() t_descs=() t_paths=()
  while IFS='|' read -r name desc path; do
    [[ -z "$name" ]] && continue
    t_names+=("$name")
    t_descs+=("$desc")
    t_paths+=("$path")
  done <<< "${CAT_TOOLS[$CUR_CAT]}"

  local total=${#t_names[@]}
  CUR_CAT_COUNT=$total

  if (( TOOL_CURSOR < TOOL_OFFSET )); then
    TOOL_OFFSET=$TOOL_CURSOR
  elif (( TOOL_CURSOR >= TOOL_OFFSET + vp )); then
    TOOL_OFFSET=$((TOOL_CURSOR - vp + 1))
  fi

  local cat_sel
  cat_sel=$(count_selected_in_cat "$CUR_CAT")

  tput clear 2>/dev/null || true

  echo
  printf "  %s%s❰ %s%s" "$C_BOLD" "$C_CYAN" "$CUR_CAT" "$C_RESET"
  printf "  %s%d/%d in cat — %d total%s\n\n" "$C_DIM" "$cat_sel" "$total" "$(count_selected_total)" "$C_RESET"
  printf "  %sspace to toggle — ← to go back%s\n\n" "$C_DIM" "$C_RESET"

  if (( TOOL_OFFSET > 0 )); then
    printf "  %s▲ %d above%s\n\n" "$C_DIM" "$TOOL_OFFSET" "$C_RESET"
  fi

  local last=$((TOOL_OFFSET + vp - 1))
  (( last >= total )) && last=$((total - 1))
  local max_desc=$((cols - 40))
  (( max_desc < 10 )) && max_desc=10

  local i
  for ((i=TOOL_OFFSET; i<=last; i++)); do
    local name="${t_names[$i]}" desc="${t_descs[$i]}" path="${t_paths[$i]}"
    local checked="☐"
    [[ "${TOOL_SELECTED[$path]:-0}" == "1" ]] && checked="${C_GREEN}☑${C_RESET}"

    local short_desc="$desc"
    (( ${#desc} > max_desc )) && short_desc="${desc:0:$((max_desc-1))}…"

    if [[ $i -eq $TOOL_CURSOR ]]; then
      printf "  %s%s❯%s %s %s%-16s%s %s%s%s\n" \
        "$C_YELLOW" "$C_BOLD" "$C_RESET" "$checked" "$C_BOLD" "$name" "$C_RESET" "$C_DIM" "$short_desc" "$C_RESET"
    else
      printf "   %s %s%-16s%s %s%s%s\n" \
        "$checked" "$C_DIM" "$name" "$C_RESET" "$C_DIM" "$short_desc" "$C_RESET"
    fi
  done

  local below=$((total - last - 1))
  if (( below > 0 )); then
    echo
    printf "  %s▼ %d below%s\n" "$C_DIM" "$below" "$C_RESET"
  fi

  echo
  printf "  %s↑↓ navigate   ← back   space toggle   a all   n none   enter install   q quit%s\n" "$C_DIM" "$C_RESET"
}

# ─── Get current tool path ──────────────────────────────────
get_current_tool_path() {
  local idx=0
  while IFS='|' read -r name desc path; do
    [[ -z "$name" ]] && continue
    if [[ $idx -eq $TOOL_CURSOR ]]; then
      echo "$path"
      return
    fi
    idx=$((idx+1))
  done <<< "${CAT_TOOLS[$CUR_CAT]}"
}

# ─── Select / deselect all in category ──────────────────────
select_all_in_cat() {
  local cat_name="$1"
  while IFS='|' read -r name desc path; do
    [[ -z "$name" ]] && continue
    TOOL_SELECTED["$path"]="1"
  done <<< "${CAT_TOOLS[$cat_name]}"
}

deselect_all_in_cat() {
  local cat_name="$1"
  while IFS='|' read -r name desc path; do
    [[ -z "$name" ]] && continue
    TOOL_SELECTED["$path"]="0"
  done <<< "${CAT_TOOLS[$cat_name]}"
}

# ─── Main interactive loop ──────────────────────────────────
main_loop() {
  if [[ ! -t 0 ]]; then
    echo -e "${C_YELLOW}Non-interactive: installing all tools.${C_RESET}"
    local cat_name
    for cat_name in "${CAT_NAMES[@]}"; do
      select_all_in_cat "$cat_name"
    done
    return
  fi

  local old_stty=""
  if command -v stty >/dev/null 2>&1; then
    old_stty=$(stty -g </dev/tty)
    stty raw -echo </dev/tty 2>/dev/null || true
    trap 'stty "$old_stty" </dev/tty 2>/dev/null || true; echo; exit 0' INT
  fi

  while true; do
    if [[ "$MENU_MODE" == "cats" ]]; then
      render_cats
    else
      render_tools
    fi

    IFS= read -r -n1 -s key </dev/tty

    case "$key" in
      $'\x1b')
        IFS= read -r -n1 -s _ </dev/tty 2>/dev/null || true
        IFS= read -r -n1 -s arrow </dev/tty 2>/dev/null || true
        case "$arrow" in
          A|k)
            if [[ "$MENU_MODE" == "cats" ]]; then
              (( CAT_CURSOR > 0 )) && (( CAT_CURSOR-- ))
            else
              (( TOOL_CURSOR > 0 )) && (( TOOL_CURSOR-- ))
            fi
            ;;
          B|j)
            if [[ "$MENU_MODE" == "cats" ]]; then
              (( CAT_CURSOR < ${#CAT_NAMES[@]} - 1 )) && (( CAT_CURSOR++ ))
            else
              (( TOOL_CURSOR < CUR_CAT_COUNT - 1 )) && (( TOOL_CURSOR++ ))
            fi
            ;;
          C)
            if [[ "$MENU_MODE" == "cats" ]]; then
              MENU_MODE="tools"
              CUR_CAT="${CAT_NAMES[$CAT_CURSOR]}"
              TOOL_CURSOR=0
              TOOL_OFFSET=0
              CUR_CAT_COUNT=$(count_tools_in_cat "$CUR_CAT")
            fi
            ;;
          D)
            if [[ "$MENU_MODE" == "tools" ]]; then
              MENU_MODE="cats"
            fi
            ;;
        esac
        ;;
      ' ')
        if [[ "$MENU_MODE" == "tools" ]]; then
          local path
          path=$(get_current_tool_path)
          if [[ -n "$path" ]]; then
            if [[ "${TOOL_SELECTED[$path]:-0}" == "1" ]]; then
              TOOL_SELECTED["$path"]="0"
            else
              TOOL_SELECTED["$path"]="1"
            fi
          fi
        fi
        ;;
      a|A)
        if [[ "$MENU_MODE" == "cats" ]]; then
          select_all_in_cat "${CAT_NAMES[$CAT_CURSOR]}"
        else
          select_all_in_cat "$CUR_CAT"
        fi
        ;;
      n|N)
        if [[ "$MENU_MODE" == "tools" ]]; then
          deselect_all_in_cat "$CUR_CAT"
        fi
        ;;
      $'\r'|$'\n')
        break
        ;;
      q|Q|$'\x03')
        if [[ -n "$old_stty" ]] && command -v stty >/dev/null 2>&1; then
          stty "$old_stty" </dev/tty 2>/dev/null || true
        fi
        echo
        echo -e "${C_YELLOW}Cancelled.${C_RESET}"
        exit 0
        ;;
    esac
  done

  if [[ -n "$old_stty" ]] && command -v stty >/dev/null 2>&1; then
    stty "$old_stty" </dev/tty 2>/dev/null || true
  fi
  echo
}

# ─── Install selected ───────────────────────────────────────
do_install() {
  local installed=0
  mkdir -p "$TARGET_DIR"
  local cat_name
  for cat_name in "${CAT_NAMES[@]}"; do
    while IFS='|' read -r name desc path; do
      [[ -z "$name" ]] && continue
      if [[ "${TOOL_SELECTED[$path]:-0}" == "1" ]]; then
        ln -sf "$path" "$TARGET_DIR/$name"
        printf "  %s✓%s %s%-20s%s %s%s%s\n" \
          "$C_GREEN" "$C_RESET" "$C_BOLD" "$name" "$C_RESET" "$C_DIM" "$cat_name" "$C_RESET"
        installed=$((installed + 1))
      fi
    done <<< "${CAT_TOOLS[$cat_name]}"
  done
  echo
  if (( installed > 0 )); then
    echo -e "${C_GREEN}${C_BOLD}Installed ${installed} tool(s) into ${TARGET_DIR}${C_RESET}"
    echo -e "${C_DIM}\$PREFIX/bin is already on PATH in Termux.${C_RESET}"
  else
    echo -e "${C_YELLOW}No tools selected. Nothing installed.${C_RESET}"
  fi
}

# ─── Main ───────────────────────────────────────────────────
main() {
  discover_tools
  if ((${#CAT_NAMES[@]} == 0)); then
    echo -e "${C_RED}No tools found in $CLONE_DIR${C_RESET}" >&2
    exit 2
  fi
  main_loop
  do_install
}
main "$@"
