#!/bin/zsh
tmux new-session -s devices -n "devices" -d

tmux split-window -h -p 50
tmux send-keys "ping 10.0.0.40" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.41" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.42" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.43" Enter
tmux split-window -v -p 70
tmux send-keys "ping 10.0.0.44" Enter
tmux split-window -v 
tmux send-keys "ping 10.0.0.45" Enter

tmux select-pane -t 1
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.46" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.47" Enter
tmux split-window -v -p 80
tmux send-keys "ping 10.0.0.48" Enter
tmux split-window -v -p 70
tmux send-keys "ping 10.0.0.49" Enter

tmux select-window -t devices:1

tmux a -t devices
