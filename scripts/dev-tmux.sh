#!/bin/bash

tmux new-session -d -s "dev"

# top left
tmux send-keys "cd ~/working/" C-m

# bottom left
tmux split-window -v
tmux send-keys "cd ~/working/" C-m

# top right
tmux select-pane -U
tmux split-window -h
tmux send-keys "cd ~/working/" C-m

# bottom right
tmux select-pane -D
tmux split-window -h
tmux send-keys "cd ~/working/" C-m

tmux new-window

# top left
tmux send-keys "cd ~/working/docker-compose" C-m
tmux send-keys "docker-compose ps" C-m

# top right
tmux split-window -h
tmux send-keys "cd ~/working/" C-m

# bottom right
tmux split-window -v
tmux send-keys "htop" C-m
tmux select-pane -t 0

# bottom left
#tmux split-window -v
#tmux resize-pane -y 6
#tmux send-keys "watch -n 300 'df -h /dev/sda1 /dev/sdb1'" C-m

tmux new-window

# left
tmux send-keys "sudo service docker start"

# right
tmux split-window -h
tmux select-pane -t 0

tmux select-window -t 1

tmux -2 attach -t "dev"
