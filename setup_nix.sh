#!/bin/bash

# mkdir
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/mpv
mkdir -p ~/.config/nvim
mkdir -p ~/.config/Code/User

# symlinks
ln -sfv $(pwd)/.gitconfig ~/
ln -sfv $(pwd)/.myrootconf.sh ~/
ln -sfv $(pwd)/.myzshconf.sh ~/
ln -sfv $(pwd)/.tmux.conf ~/
ln -sfv $(pwd)/.vimrc ~/
ln -sfv $(pwd)/.vimrc-dein.toml ~/
ln -sfv $(pwd)/.vimrc ~/.config/nvim/init.vim
ln -sfv $(pwd)/conf/alacritty/alacritty_mac.yml ~/.config/alacritty/alacritty.yml
ln -sfv $(pwd)/conf/mpv/mpv.conf ~/.config/mpv/

# vim
mkdir -p ~/.vim/backup

# vscode
if [ "$(uname)" == "Darwin" ]; then
    mkdir -p $HOME/.omnisharp
    ln -sfv $(pwd)/conf/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sfv $(pwd)/conf/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
    ln -sfv $(pwd)/conf/vscode/omnisharp.json "$HOME/.omnisharp/omnisharp.json"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    mkdir -p $HOME/.omnisharp
    ln -sfv $(pwd)/conf/vscode/settings.json $HOME/.config/Code/User/settings.json
    ln -sfv $(pwd)/conf/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
    ln -sfv $(pwd)/conf/vscode/omnisharp.json $HOME/.omnisharp/omnisharp.json
else
    echo Unsupported OS
fi

# dein.vim
bash <(curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.vim/dein

