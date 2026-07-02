#!/usr/bin/env bash
# py-venv — create venv
set -euo pipefail
name="${1:-.venv}"
python3 -m venv "$name"
echo "py-venv: created $name"
echo "Activate with: source $name/bin/activate"
