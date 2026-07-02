#!/usr/bin/env bash
# top-cpu — top processes by CPU
set -euo pipefail
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -11
