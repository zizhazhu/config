if [ -f "$HOME/.bashrc" ]; then
    echo "source $(pwd)/shell/init.sh" >> $HOME/.bashrc
fi

if [ -f "$HOME/.vimrc" ]; then
    echo "source $(pwd)/vim/vimrc" >> $HOME/.vimrc
fi
