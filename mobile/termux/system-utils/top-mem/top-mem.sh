#!/usr/bin/env bash
# top-mem — top processes by RAM
set -euo pipefail
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -11
