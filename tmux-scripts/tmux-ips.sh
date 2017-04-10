#!/bin/zsh
tmux new-session -s devices -n "devices" -d

tmux split-window -h -p 50
tmux send-keys "ping 10.0.0.14" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.20" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.21" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.22" Enter
tmux split-window -v -p 70
tmux send-keys "ping 10.0.0.23" Enter
tmux split-window -v 
tmux send-keys "ping 10.0.0.24" Enter

tmux select-pane -t 1
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.25" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.26" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.27" Enter
tmux split-window -v -p 70
tmux send-keys "ping 10.0.0.28" Enter
tmux split-window -v 
tmux send-keys "ping 10.0.0.29" Enter

tmux select-window -t devices:1

tmux a -t devices
