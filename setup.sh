#!/usr/bin/env bash

echo
echo "FINAL SETUP AND CONFIGURATION"

echo "ADD USER"
echo
echo "Username:"
read user
echo "Password:"
read pass
useradd -m -g wheel $user
passwd $user << EOF
$pass
$pass
EOF

export user=$user
sed -i 'NOPASSWD/s/^#//g' /etc/sudoers

cd /home/$user

sudo -i -u $user bash << EOF

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

EOF
