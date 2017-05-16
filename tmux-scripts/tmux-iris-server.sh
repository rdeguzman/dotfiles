#!/bin/zsh
VAGRANTFILE="/Projects/dboxes"
VAGRANT_PROJECT_DIR="/var/www/rails"
PROJECT_NAME="iris"

tmux new-session -s $PROJECT_NAME -n "$PROJECT_NAME" -d

#|------------------|-----------------------------------|
#|                  |                                   |
#|                  |-----------------------------------|
#|                  |                                   |
#|------------------|-----------------------------------|

tmux split-window -h -p 70
tmux split-window -v -p 50

# NPM Start
tmux select-pane -t 2
sleep .3
tmux send-keys "cd /Projects/rails/$PROJECT_NAME/" Enter "sleep 10" Enter "npm start" Enter

# ZStart Pane
tmux select-pane -t 1
sleep .3
tmux send-keys "cd $VAGRANTFILE" Enter "vagrant ssh" Enter
tmux send-keys "cd $VAGRANT_PROJECT_DIR/$PROJECT_NAME" Enter "sleep 2" Enter "zeus start" Enter

# Rails Server
tmux select-pane -t 3
sleep 5 #gives time for vagrant pane 1 not to collide
tmux send-keys "cd $VAGRANTFILE" Enter "vagrant ssh" Enter
tmux send-keys "cd $VAGRANT_PROJECT_DIR/$PROJECT_NAME" Enter "sleep 5" Enter "zeus server -b 0.0.0.0" Enter

# Test Window
tmux new-window -t $PROJECT_NAME:2 -n "zeus test spec"
tmux send-keys -t $PROJECT_NAME:2 "cd $VAGRANTFILE" Enter "vagrant ssh" Enter "cd $VAGRANT_PROJECT_DIR/$PROJECT_NAME" Enter "zeus test spec"

# DB Window
tmux new-window -t $PROJECT_NAME:3 -n "database"
tmux send-keys -t $PROJECT_NAME:3 "psql -h 127.0.0.1 -p 5432 -U dbadmin datalink_development"

tmux select-window -t $PROJECT_NAME:1

tmux a -t $PROJECT_NAME
