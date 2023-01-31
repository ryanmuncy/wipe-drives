#!/bin/bash

session=wipe


tmux new -d -s "$session"
tmux set -g mouse on
tmux split-window -h -t "$session"
tmux split-window -v -t "$session"
tmux split-window -v -t "$session"
tmux select-pane -t 1
tmux split-window -v -t "$session"
tmux select-pane -t 0
tmux split-window -v -t "$session"

tmux send -t 0 "sudo htop"
tmux send-keys -t 0 Enter

tmux send -t 1 "sudo iotop"
tmux send-keys -t 1 Enter

tmux send -t 2 '#sudo dd if=/dev/zero of=/dev/sdb bs=1M status=progress'
tmux send-keys -t 2 Enter
tmux send -t 3 '#sudo dd if=/dev/zero of=/dev/sdc bs=1M status=progress'
tmux send-keys -t 3 Enter
tmux send -t 4 '#sudo dd if=/dev/zero of=/dev/sdd bs=1M status=progress'
tmux send-keys -t 4 Enter
tmux send -t 5 '#sudo dd if=/dev/zero of=/dev/sde bs=1M status=progress'
tmux send-keys -t 5 Enter


tmux a -t "$session"
