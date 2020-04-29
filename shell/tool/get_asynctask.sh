#!/bin/bash
git clone https://github.com/skywind3000/asynctasks.vim.git $1
mkdir -p ~/.config/asynctask/
# global config
touch ~/.config/asynctask/asynctask.ini
# global task
touch ~/.config/asynctask/tasks.ini
