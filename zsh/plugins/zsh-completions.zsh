#!/bin/bash
# 安装zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
if [ -d ~/.oh-my-zsh ]; then
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
else
  printf "NOT FOUND zsh\n"
fi
