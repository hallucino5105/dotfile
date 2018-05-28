#!/bin/bash

# symlinks
ln -sfv ~/dotfile/.gitconfig ~/
ln -sfv ~/dotfile/.myrootconf.sh ~/
ln -sfv ~/dotfile/.myzshconf.sh ~/
ln -sfv ~/dotfile/.tmux.conf ~/
ln -sfv ~/dotfile/.vimrc ~/
ln -sfv ~/dotfile/.vimrc-dein.toml ~/

# dein.vim
bash <(curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.cache/dein

