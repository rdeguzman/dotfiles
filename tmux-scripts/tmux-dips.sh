#!/bin/zsh
tmux new-session -s dips -n "dips-client" -d
tmux send-keys -t dips:1 "cd /Projects/dips/dips-client" Enter "vim" Enter ":NERDTree" Enter

tmux new-window -t dips:2 -n "npm start"
#tmux send-keys -t dips:2 "cd /Projects/dips/dips-client" Enter "npm start" Enter "y" Enter # Too slow
tmux send-keys -t dips:2 "cd /Projects/dips/dips-client" Enter "npm start"

tmux new-window -t dips:3 -n "dips-api"
tmux send-keys -t dips:3 "cd /Projects/dips/dips-api" Enter "vim" Enter ":NERDTree" Enter

tmux new-window -t dips:4 -n "rails-server"
tmux send-keys -t dips:4 "cd /Projects/dips/dips-api" Enter "rails s -b 0.0.0.0 -p 3003" Enter

tmux new-window -t dips:5 -n "dips-listener"
tmux send-keys -t dips:5 "cd /Projects/dips/dips-listener" Enter "vim" Enter ":NERDTree" Enter

tmux new-window -t dips:6 -n "listener"
tmux send-keys -t dips:6 "cd /Projects/dips/dips-listener" Enter

tmux select-window -t dips:1

tmux a -t dips
