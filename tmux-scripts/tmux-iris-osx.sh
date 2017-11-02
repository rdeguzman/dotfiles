#!/bin/zsh
VAGRANT_PROJECT_DIR="/var/www/rails"
TMUX_SESSION="iris-osx"
APP="iris"

cd /Projects/rails/$APP/
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
tmux send-keys "cd /Projects/rails/$APP/" Enter "sleep 1" Enter "bundle exec rails s -b 0.0.0.0 -p 3000"

tmux select-pane -t 2
tmux send-keys "cd /Projects/rails/$APP/" Enter "sleep 1" Enter "npm start"

tmux select-pane -t 3
tmux send-keys "cd /Projects/rails/$APP/" Enter "sleep 1" Enter "npm run jest:watch"

tmux select-pane -t 4
tmux send-keys "cd /Projects/rails/$APP/" Enter

tmux new-window -t $TMUX_SESSION:2 -n "perseus"
tmux send-keys -t $TMUX_SESSION:2 "sleep 1" Enter "cd /Projects/rails/perseus" Enter "bundle exec rails s -b 0.0.0.0 -p 3002"

tmux new-window -t $TMUX_SESSION:3 -n "iris-builds"
tmux send-keys -t $TMUX_SESSION:3 "sleep 1" Enter "vag ssh" Enter "cd $VAGRANT_PROJECT_DIR/iris-builds" Enter

tmux select-window -t $TMUX_SESSION:1

tmux a -t $TMUX_SESSION
