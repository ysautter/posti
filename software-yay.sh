#!/usr/bin/env bash

echo
echo "INSTALL YAY? [Y|n]"
read -s -n 1 install_yay
echo
if [ "$install_yay" != "n" ]; then
sudo -i -u $user bash << EOF

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "/tmp"

echo "CLONING: YAY"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S 'picom-tryone-git' --noconfirm --needed
yay -S 'spotify' --noconfirm --needed
yay -S 'latex-mk' --noconfirm --needed

echo
echo "Done!"
echo
bash /home/$user/.vim/plugged/YouCompleteMe/install.sh

EOF
fi
