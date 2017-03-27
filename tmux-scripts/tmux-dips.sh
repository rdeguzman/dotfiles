#!/bin/zsh
tmux new-session -s dips -n "dips-client" -d
tmux send-keys -t dips:1 "cd /Projects/dips/dips-client" Enter

tmux new-window -t dips:2 -n "npm start"
tmux send-keys -t dips:2 "cd /Projects/dips/dips-client" Enter "npm start" Enter "y" Enter

tmux new-window -t dips:3 -n "dips-api"

tmux new-window -t dips:4 -n "rails-server"
tmux send-keys -t dips:4 "cd /Projects/dips/dips-api" Enter "rails s -b 0.0.0.0 -p 3003" Enter

tmux new-window -t dips:5 -n "dips-listener"
tmux new-window -t dips:6 -n "listener"

tmux a -t dips
