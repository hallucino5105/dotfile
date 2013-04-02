#!/bin/sh

ln -s dotfile/.gitconfig ~/
ln -s dotfile/.myrootconf.sh ~/
ln -s dotfile/.myzshconf.sh ~/
ln -s dotfile/.tmux.conf ~/
ln -s dotfile/.vimrc ~/
ln -s dotfile/.ssh/config ~/.ssh/
chmod 600 ~/.ssh/config

