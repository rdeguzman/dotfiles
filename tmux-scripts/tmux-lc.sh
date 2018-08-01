#!/bin/zsh
TMUX_SESSION="lc"

cd /Projects
tmux new-session -s $TMUX_SESSION -n "services" -d

#|----------------|-------------------|
#|                |                   |
#|----------------|                   |
#|                |                   |
#|----------------|-------------------

tmux split-window -h -p 50

tmux select-pane -t 1
tmux split-window -v -p 70

tmux select-pane -t 1
sleep 0.5
tmux send-keys "cd /Projects/web" Enter "ember server --proxy=http://localhost:3000"

sleep 0.5
tmux select-pane -t 2
tmux send-keys "ssh root@192.168.33.10" Enter "sleep 1" Enter "cd /home/vagrant/static-map-api" Enter "export LCHKA_API_HOST=http://192.168.33.1:3000" Enter "npm start" 

sleep 0.5
tmux select-pane -t 3
tmux send-keys "cd /Projects/api" Enter "bundle exec rails s -b 0.0.0.0 -p 3000"

tmux new-window -t $TMUX_SESSION:2 -n "vim"
tmux send-keys -t $TMUX_SESSION:2 "sleep 1" Enter "cd /Projects/api"

tmux select-window -t $TMUX_SESSION:1

tmux a -t $TMUX_SESSION
