#!/usr/bin/env bash

# Set the desired TMUX session name
SESSION_NAME="std_session"

# Function to launch Kitty terminal and attach to TMUX session
launch_kitty() {
  nohup kitty tmux attach-session -t $SESSION_NAME &>/dev/null &
}

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # If the session does not exist, create a new one
  tmux new-session -d -s $SESSION_NAME
fi

# Check if we're in a terminal environment
if [ -z "$DISPLAY" ]; then
  echo "Not in a graphical environment, exiting."
  exit 1
fi

# Launch terminal if run through Alt+F2 or non-terminal environment
if command -v kitty &>/dev/null; then
  launch_kitty
elif command -v gnome-terminal &>/dev/null; then
  gnome-terminal -- bash -c "tmux attach-session -t $SESSION_NAME"
elif command -v xterm &>/dev/null; then
  xterm -e "tmux attach-session -t $SESSION_NAME"
else
  echo "No suitable terminal emulator found!"
fi

