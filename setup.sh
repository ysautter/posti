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
sed -i '/NOPASSWD/s/^#//g' /etc/sudoers

HOME=/home/$user

sudo -i -u $user bash << EOF

echo
echo "CLONING DOTFILES"

cd /home/$user
echo ".dotfiles"  >> .gitignore

git clone --bare https://github.com/ysautter/dotfiles $HOME/.dotfiles

mkdir -p .config-backup && \
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

sudo localectl set-x11-keymap de

bash $HOME/.vim/plugged/YouCompleteMe/install.sh

EOF
