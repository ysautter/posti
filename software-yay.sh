#!/usr/bin/env bash

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "/tmp"

echo "CLONING: YAY"


sudo -i -u $user bash << EOF



git clone https://aur.archlinux.org/yay.git
cd yay
echo "Y" | makepkg -si

yay -S 'st-luke-git' --noconfirm --needed
yay -S 'picom-tryone-git' --noconfirm --needed
yay -S 'spotify' --noconfimg --needed
yay -S 'latex-mk' --noconfimg --needed

echo
echo "Done!"
echo
bash /home/$user/.vim/plugged/YouCompleteMe/install.sh

EOF
