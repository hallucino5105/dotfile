#!/bin/bash

OS=${1:-linux}


### mkdir
mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/kitty
mkdir -p $HOME/.config/mpv
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.omnisharp


### symlinks
ln -sfv $(pwd)/.gitconfig $HOME/
ln -sfv $(pwd)/.tmux.conf $HOME/

ln -sfv $(pwd)/.vimrc $HOME/
ln -sfv $(pwd)/.vimrc-dein.toml $HOME/
ln -sfv $(pwd)/.vimrc $HOME/.config/nvim/init.vim

ln -sfv $(pwd)/config/alacritty/alacritty_mac.yml $HOME/.config/alacritty/alacritty.yml
ln -sfv $(pwd)/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sfv $(pwd)/config/mpv/mpv.conf $HOME/.config/mpv/

ln -sfv $(pwd)/config/vscode/omnisharp.json "$HOME/.omnisharp/omnisharp.json"

ln -sfv $(pwd)/config/fish $HOME/.config/
ln -sfv $(pwd)/.myrootconf.sh $HOME/.config/fish/myrootconf.sh


### os dependencies
if [ $OS == "mac" ]; then
    mkdir -p "$HOME/Library/Application Support/Code/User"
    mkdir -p "$HOME/Library/Application Support/Code/User/snippets"

    ln -sfv $(pwd)/config/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sfv $(pwd)/config/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
    ln -sfv $(pwd)/config/vscode/snippets/* "$HOME/Library/Application Support/Code/User/snippets/"

    ln -sfv $(pwd)/.fish/config.fish.mac $HOME/comfig.fish
    ln -sfv $(pwd)/.profile_mac.sh $HOME/.config/fish/profile_mac.fish
elif [ $OS == "linux" ]; then
    mkdir -p $HOME/.config/Code/User
    mkdir -p $HOME/.config/Code/User/snippets

    ln -sfv $(pwd)/config/vscode/settings.json $HOME/.config/Code/User/settings.json
    ln -sfv $(pwd)/config/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
    ln -sfv $(pwd)/config/vscode/snippets/* $HOME/.config/Code/User/snippets/

    ln -sfv $(pwd)/.fish/config.fish.nix $HOME/comfig.fish
    ln -sfv $(pwd)/.profile_nix.sh $HOME/.config/fish/profile_nix.sh

    ln -sfv $(pwd)/.myrootconf.sh $HOME/
    #ln -sfv $(pwd)/.profile_nix.sh $HOME/.profile
else
    echo Unsupported OS
fi


### dein.vim
bash <(curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) $HOME/.vim/dein

