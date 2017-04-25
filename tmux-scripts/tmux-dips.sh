#!/bin/zsh
tmux new-session -s dips -n "dips-client" -d
tmux send-keys -t dips:1 "cd /Projects/dips/dips-client" Enter 

tmux new-window -t dips:2 -n "npm start"
tmux send-keys -t dips:2 "cd /Projects/dips/dips-client" Enter "npm start"

tmux new-window -t dips:3 -n "dips-api"
tmux send-keys -t dips:3 "cd /Projects/dips/dips-api" Enter

tmux new-window -t dips:4 -n "rails-server"
tmux send-keys -t dips:4 "cd /Projects/dips/dips-api" Enter "rails s -b 0.0.0.0 -p 3003" Enter

tmux new-window -t dips:5 -n "dips-listener"
tmux send-keys -t dips:5 "cd /Projects/dips/dips-listener" Enter

tmux new-window -t dips:6 -n "listener"
tmux send-keys -t dips:6 "cd /Projects/dips/dips-listener" Enter

tmux new-window -t dips:7 -n "dips-deploy"
tmux send-keys -t dips:7 "cd /Projects/dips/dips-deploy" Enter

tmux new-window -t dips:8 -n "database"
tmux send-keys -t dips:8 "cd /Projects/dips/dips-api" Enter "psql -h 127.0.0.1 -p 5432 -U dips atlas_development"

tmux select-window -t dips:1

tmux a -t dips
