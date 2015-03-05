#!/bin/sh

ln -sfv ~/dotfile/.gitconfig ~/
ln -sfv ~/dotfile/.myrootconf.sh ~/
ln -sfv ~/dotfile/.myzshconf.sh ~/
ln -sfv ~/dotfile/.tmux.conf ~/
ln -sfv ~/dotfile/.vimrc ~/
ln -sfv ~/dotfile/.ctags ~/
mkdir -p ~/.vimperator && ln -sfv ~/dotfile/.vimperator-plugin ~/.vimperator/plugin

