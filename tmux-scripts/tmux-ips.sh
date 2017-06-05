#!/bin/zsh
tmux new-session -s devices -n "devices" -d

tmux split-window -h -p 50
tmux send-keys "ping 10.0.0.13" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.30" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.31" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.33" Enter
tmux split-window -v -p 70
tmux send-keys "ping 10.0.0.33" Enter
tmux split-window -v 
tmux send-keys "ping 10.0.0.34" Enter

tmux select-pane -t 1
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.35" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.36" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.37" Enter
tmux split-window -v -p 70
tmux send-keys "ping 10.0.0.38" Enter
tmux split-window -v 
tmux send-keys "ping 10.0.0.39" Enter

tmux select-window -t devices:1

tmux a -t devices
