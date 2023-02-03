#!/bin/bash

#Tmux session name
session=wipe

#System monitor
sysmon=htop

#Disk Monitor
iomon=iotop

#Drives to be wiped
drive1=/dev/sdb
drive2=/dev/sdc
drive3=/dev/sdd
drive4=/dev/sde


tmux new -d -s "$session"
tmux set -g mouse on
tmux split-window -h -t "$session"
tmux split-window -v -t "$session"
tmux split-window -v -t "$session"
tmux select-pane -t 1
tmux split-window -v -t "$session"
tmux select-pane -t 0
tmux split-window -v -t "$session"

tmux send -t 0 "sudo $sysmon"
tmux send-keys -t 0 Enter

tmux send -t 1 "sudo $iomon"
tmux send-keys -t 1 Enter

tmux send -t 2 "sudo dd if=/dev/zero of=$drive1 bs=1M status=progress"
tmux send-keys -t 2 Enter
tmux send -t 3 "sudo dd if=/dev/zero of=$drive2 bs=1M status=progress"
tmux send-keys -t 3 Enter
tmux send -t 4 "sudo dd if=/dev/zero of=$drive3 bs=1M status=progress"
tmux send-keys -t 4 Enter
tmux send -t 5 "sudo dd if=/dev/zero of=$drive4 bs=1M status=progress"
tmux send-keys -t 5 Enter

tmux a -t "$session"
