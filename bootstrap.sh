if [ -f "$HOME/.bashrc" ]; then
    echo "" >> $HOME/.bashrc
    echo "# myself shell config" >> $HOME/.bashrc
    echo "source $(pwd)/shell/init.sh" >> $HOME/.bashrc
fi

if [ -f "$HOME/.vimrc" ]; then
    echo "" >> $HOME/.vimrc
    echo "source $(pwd)/vim/vimrc" >> $HOME/.vimrc
fi

if [ -f "$HOME/.tmux.conf" ]; then
    echo "" >> $HOME/.tmux.conf
    echo "mytmux=$(pwd)" >> $HOME/.tmux.conf
    echo "source $mytmux/.tmux.conf" >> $HOME/.tmux.conf
fi
