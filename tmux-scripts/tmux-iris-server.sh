#!/bin/zsh
tmux new-session -s iris -n "iris" -d

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
tmux send-keys "cd /Projects/rails/iris/" Enter "npm start"

# ZStart Pane
tmux select-pane -t 1
sleep .3
tmux send-keys "cd /Projects/dboxes" Enter "vagrant ssh" Enter 
tmux send-keys "cd /var/www/rails/iris" Enter "ZEUSSOCK=/tmp/.zeus.sock zeus start" Enter

# Rails Server
tmux select-pane -t 3
sleep 5
tmux send-keys "cd /Projects/dboxes" Enter "vagrant ssh" Enter 
tmux send-keys "cd /var/www/rails/iris" Enter "zeus server -b 0.0.0.0" Enter

tmux new-window -t iris:2 -n "zeus test spec"
tmux send-keys -t iris:2 "cd /Projects/dboxes" Enter "vagrant ssh" Enter "cd /var/www/rails/iris" Enter "sleep 5" Enter "zeus test spec"

tmux new-window -t iris:3 -n "database"
tmux send-keys -t iris:3 "psql -h 127.0.0.1 -p 5432 -U dbadmin datalink_development"

tmux select-window -t iris:1

tmux a -t iris
