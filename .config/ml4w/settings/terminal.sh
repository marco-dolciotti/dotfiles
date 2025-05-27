#!/bin/bash

# Name of the tmux session
SESSION_NAME="home"

# Check if the session exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Attaching to existing tmux session: $SESSION_NAME"
else
    echo "Creating new tmux session: $SESSION_NAME"
    tmux new-session -d -s "$SESSION_NAME"
fi

# Attach to the session
kitty tmux attach-session -t "$SESSION_NAME"

