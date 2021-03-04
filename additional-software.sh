#!/usr/bin/env bash

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "/tmp"

echo "CLONING: YAY"


sudo -i -u $user bash << EOF

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

echo
echo "INSTALLING MANUAL SOFTWARE"
echo
echo "INSTALLING LUKE SMITH ST"
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install

EOF

