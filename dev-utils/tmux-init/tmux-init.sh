#!/usr/bin/env bash
# tmux-init — start a dev tmux session
set -euo pipefail
name="${1:-dev}"
tmux new-session -d -s "$name" -n editor
tmux new-window -t "$name" -n server
tmux new-window -t "$name" -n logs
tmux select-window -t "$name:0"
tmux attach-session -t "$name"
