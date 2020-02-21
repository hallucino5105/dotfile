#!/bin/bash

# mkdir
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/mpv
mkdir -p ~/.config/nvim
mkdir -p ~/.vim/backup

# symlinks
ln -sfv $(pwd)/.gitconfig ~/
ln -sfv $(pwd)/.myrootconf.sh ~/
#ln -sfv $(pwd)/.myzshconf.sh ~/
ln -sfv $(pwd)/.tmux.conf ~/
ln -sfv $(pwd)/.vimrc ~/
ln -sfv $(pwd)/.vimrc-dein.toml ~/
ln -sfv $(pwd)/.vimrc ~/.config/nvim/init.vim
ln -sfv $(pwd)/config/alacritty/alacritty_mac.yml ~/.config/alacritty/alacritty.yml
ln -sfv $(pwd)/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sfv $(pwd)/config/mpv/mpv.conf ~/.config/mpv/
ln -sfv $(pwd)/config/fish ~/.config/

# vscode
if [ "$(uname)" == "Darwin" ]; then
    mkdir -p "$HOME/Library/Application Support/Code/User"
    mkdir -p "$HOME/Library/Application Support/Code/User/snippets"
    mkdir -p $HOME/.omnisharp
    ln -sfv $(pwd)/config/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sfv $(pwd)/config/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
    ln -sfv $(pwd)/config/vscode/snippets/* "$HOME/Library/Application Support/Code/User/snippets/"
    ln -sfv $(pwd)/config/vscode/omnisharp.json "$HOME/.omnisharp/omnisharp.json"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    mkdir -p $HOME/.config/Code/User
    mkdir -p $HOME/.config/Code/User/snippets
    mkdir -p $HOME/.omnisharp
    ln -sfv $(pwd)/config/vscode/settings.json $HOME/.config/Code/User/settings.json
    ln -sfv $(pwd)/config/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
    ln -sfv $(pwd)/config/vscode/snippets/* $HOME/.config/Code/User/snippets/
    ln -sfv $(pwd)/config/vscode/omnisharp.json $HOME/.omnisharp/omnisharp.json
else
    echo Unsupported OS
fi

# dein.vim
bash <(curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.vim/dein

