#!/usr/bin/fish

rm -rf ~/.config/fish
rm -rf ~/.config/i3
rm -rf ~/.config/i3status
rm -rf ~/.config/nvim

ln -s (pwd)/config/fish ~/.config/fish
ln -s (pwd)/config/i3 ~/.config/i3
ln -s (pwd)/config/i3status ~/.config/i3status
ln -s (pwd)/config/nvim ~/.config/nvim

mkdir ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
