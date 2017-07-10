#!/bin/sh

ln -sfv ~/dotfile/.gitconfig ~/
ln -sfv ~/dotfile/.myrootconf.sh ~/
ln -sfv ~/dotfile/.myzshconf.sh ~/
ln -sfv ~/dotfile/.tmux.conf ~/
#ln -sfv ~/dotfile/.vim ~/
ln -sfv ~/dotfile/.vimrc ~/
#ln -sfv ~/dotfile/.ctags ~/
#mkdir -p ~/.vimperator && ln -sfv ~/dotfile/.vimperator-plugin ~/.vimperator/plugin
#mkdir -p ~/.plotly && ln -sfv ~/dotfile/.plotly_credentials ~/.plotly/.credentials


echo "if [ -f ~/.profile ]; then" >> ~/.bashrc
echo "    source ~/.profile"      >> ~/.bashrc
echo "fi"                         >> ~/.bashrc
echo ""                           >> ~/.bashrc

echo "if [ -f ~/.myrootconf.sh ]; then" >> ~/.bashrc
echo "    source ~/.myrootconf.sh"      >> ~/.bashrc
echo "fi"                               >> ~/.bashrc
echo ""                                 >> ~/.bashrc

echo "if [ -f ~/.profile ]; then" >> ~/.zshrc
echo "    source ~/.profile"      >> ~/.zshrc
echo "fi"                         >> ~/.zshrc
echo ""                           >> ~/.zshrc

echo "if [ -f ~/.myrootconf.sh ]; then" >> ~/.zshrc
echo "    source ~/.myrootconf.sh"      >> ~/.zshrc
echo "fi"                               >> ~/.zshrc
echo ""                                 >> ~/.zshrc

echo "if [ -f ~/.myzshconf.sh ]; then" >> ~/.zshrc
echo "    source ~/.myzshconf.sh"      >> ~/.zshrc
echo "fi"                              >> ~/.zshrc
echo ""                                >> ~/.zshrc

