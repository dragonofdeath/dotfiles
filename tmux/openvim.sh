#!/usr/bin/env bash

content="$(tmux capture-pane -S -3000 -J -p)"

echo "${content}" > /tmp/tmux.log
nvim /tmp/tmux.log
