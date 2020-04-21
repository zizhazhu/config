#!/bin/bash
# 安装zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
if [ -d ~/.oh-my-zsh ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  printf "NOT FOUND zsh\n"
fi
