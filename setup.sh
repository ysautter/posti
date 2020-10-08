#!/usr/bin/env bash

echo
echo "FINAL SETUP AND CONFIGURATION"

echo
echo "CLONING DOTFILES"

echo ".dotfiles"  >> .gitignore

git clone --bare https://github.com/ysautter/dotfiles $HOME/.dotfiles

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout

config config --local status.showUntrackedFiles no

localectl set-x11-keymap de

bash $HOME/.vim/plugged/YouCompleteMe/install.sh
