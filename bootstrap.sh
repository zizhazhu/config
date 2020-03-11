#!/bin/bash

fillConfig() {
    # params: 1:file 2:source 3:comment
    begin="$3 start"
    end="$3 end"

    echo $1

    if [ -f $1 ]; then
      grep "$begin" $1 &> /dev/null
      if [ $? != 0 ]; then
          echo "" >> $1
          echo "$begin" >> $1
          echo "$2" >> $1
          echo "$end" >> $1
      else
          echo "$1 already exists"
      fi
    else
      echo "$1 not exist"
    fi
}

bashrc="$HOME/.bashrc"
vimrc="$HOME/.vimrc"
tmuxconf="$HOME/.tmux.conf"

dirnow=$(pwd)

fillConfig $bashrc "source $dirnow/shell/init.sh" "# myself config"
fillConfig "$HOME/.zshrc" "source $dirnow/shell/init.sh" "# myself config"
fillConfig $vimrc "source $dirnow/vim/vimrc" "\" myself config"
fillConfig $tmuxconf "source $dirnow/tmux/tmux.conf" "# myself config"

