#!/bin/bash

# mkdir
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/mpv

# symlinks
ln -sfv ~/dotfile/.gitconfig ~/
ln -sfv ~/dotfile/.myrootconf.sh ~/
ln -sfv ~/dotfile/.myzshconf.sh ~/
ln -sfv ~/dotfile/.tmux.conf ~/
ln -sfv ~/dotfile/.vimrc ~/
ln -sfv ~/dotfile/.vimrc-dein.toml ~/
ln -sfv ~/dotfile/alacritty.yml ~/.config/alacritty/
ln -sfv ~/dotfile/mpv.conf ~/.config/mpv/

# dein.vim
bash <(curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.vim/dein

# vim
mkdir -p ~/.vim/backup

