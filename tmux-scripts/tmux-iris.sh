#!/bin/zsh
tmux new-session -s iris-vim -n "vim" -d
tmux send-keys -t iris-vim:1 "ji" Enter "vim" Enter ":NERDTree" Enter
tmux a -t iris-vim 
