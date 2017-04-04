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
tmux send-keys "npm start" Enter

# Rails Server
tmux select-pane -t 3
sleep .3
tmux send-keys "sshdev rupert" Enter "ji" Enter "sleep 5" Enter "zserver" Enter

# ZStart Pane
tmux select-pane -t 1
sleep .3
tmux send-keys "sshdev rupert" Enter "ji" Enter "zstart" Enter

tmux new-window -t iris:2 -n "zeus test spec"
tmux send-keys -t iris:2 "sshdev rupert" Enter "ji" Enter "sleep 5" Enter "zeus test spec"

tmux new-window -t iris:3 -n "database"
tmux send-keys -t iris:3 "psql -h 127.0.0.1 -p 5432 -U dbadmin datalink_development"

tmux select-window -t iris:1

tmux a -t iris
