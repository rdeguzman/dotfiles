#!/bin/zsh
VAGRANTFILE="/Projects/dboxes"
VAGRANT_PROJECT_DIR="/var/www/rails"
TMUX_SESSION="iris-docker"
APP="iris"

tmux new-session -s $TMUX_SESSION -n "$TMUX_SESSION" -d

#|----------------|-------------------|
#|                |                   |
#|----------------|                   |
#|                |                   |
#|----------------|-------------------

tmux split-window -h -p 50

tmux select-pane -t 1
tmux split-window -v -p 70
tmux split-window -v -p 70

tmux select-pane -t 1
sleep 0.5
tmux send-keys "cd /Projects/rails/$APP/" Enter "sleep 1" Enter "docker-compose up app"

tmux select-pane -t 2
tmux send-keys "cd /Projects/rails/$APP/" Enter "sleep 1" Enter "docker-compose up webjs"

tmux select-pane -t 3
tmux send-keys "cd /Projects/rails/$APP/" Enter "sleep 1" Enter "docker-compose run app /bin/bash -l"

tmux select-pane -t 4
tmux send-keys "cd /Projects/rails/$APP/" Enter "vim" Enter

tmux new-window -t $TMUX_SESSION:2 -n "iris-builds"
tmux send-keys -t $TMUX_SESSION:2 "sleep 1" Enter "vag ssh" Enter "cd $VAGRANT_PROJECT_DIR/iris-builds" Enter

tmux select-window -t $TMUX_SESSION:1

tmux a -t $TMUX_SESSION
