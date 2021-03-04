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
current_dir=$(pwd)
export pass=$pass
sed -i '/NOPASSWD/s/^#//g' /etc/sudoers

USER_HOME=/home/$user

sudo -i -u $user bash << EOF

echo
echo "CLONING DOTFILES"

cd /home/$user
echo ".dotfiles"  >> .gitignore

git clone --bare https://github.com/ysautter/dotfiles $USER_HOME/.dotfiles

mkdir -p .config-backup && \
/usr/bin/git --git-dir=$USER_HOME/.dotfiles/ --work-tree=$USER_HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

/usr/bin/git --git-dir=$USER_HOME/.dotfiles/ --work-tree=$USER_HOME checkout

/usr/bin/git --git-dir=$USER_HOME/.dotfiles/ --work-tree=$USER_HOME config --local status.showUntrackedFiles no

curl -fLo $USER_HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo localectl set-x11-keymap de

vim +'PlugInstall --sync' +qall

EOF

cd $current_dir
export user=$user; bash ./software-yay.sh
