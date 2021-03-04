#!/usr/bin/env bash

sudo -i -u $user bash << EOF

echo
echo "INSTALLING AUR SOFTWARE [Y|n]:"
read -s -n 1 install_aur

echo

if [ "$install_aur" != "n" ]; then
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
fi

echo
echo "INSTALLING MANUAL SOFTWARE [Y|n]"
read -s -n 1 install_manual
echo
if [ "$install_manual" != "n" ]; then
echo "INSTALLING LUKE SMITH ST"
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install
fi

EOF

