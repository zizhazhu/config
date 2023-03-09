#!/bin/bash

fillConfig() {
    # params: 1:file 2:source 3:comment
    begin="$3 start"
    end="$3 end"

    echo $1

    if [ -f $1 ]; then
        grep "$begin" $1 &> /dev/null
        ret=$?
        if [ $ret = 1 ]; then
            echo "" >> $1
            echo "$begin" >> $1
            echo -e "$2" >> $1
            echo "$end" >> $1
        else
            echo "$1 already exists"
        fi
    else
        echo "$1 not exist"
    fi
}

bashrc="$HOME/.bashrc"
zshrc="$HOME/.zshrc"
vimrc="$HOME/.vimrc"
tmuxconf="$HOME/.tmux.conf"

dirnow=$(pwd)

fillConfig $bashrc "export CONFIG_PATH=$dirnow\nsource $dirnow/shell/init.sh" "# myself config"
fillConfig $zshrc "export CONFIG_PATH=$dirnow\nsource $dirnow/shell/init.sh" "# myself config"
fillConfig $vimrc "source $dirnow/vim/vimrc" "\" myself config"

tmux_version=$(tmux -V | cut -f 2 -d" " | cut -f 1 -d".")
tmux_config="$dirnow/tmux/tmux${tmux_version}.conf"
fillConfig $tmuxconf "source ${tmux_config}\nsource $dirnow/tmux/common.conf" "# myself config"

if [ -x "$(command -v curl)" ]; then
    if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
        echo "plug.vim already exists"
    else
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "plug.vim installed."
    fi
else
    echo "Please install curl."
fi

mkdir -p ~/.tmux/plugins
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "tmux tpm already exists"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
