#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/ ~/code ~/Documents/code -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# kill active window
# tmux kill-window -t $(tmux list-windows -F '#{window_id}' | sort -n | tail -n 1)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

# Create a new window in the current session
tmux neww -n "$selected_name" -c "$selected"

new_window_index=$(tmux display-message -p '#I')

# Switch to the newly created window
tmux select-window -t "$selected_name"

tmux swap-window -s $((new_window_index - 1)) -t "$new_window_index"
