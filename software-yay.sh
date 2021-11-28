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

yay -S 'latex-mk' --noconfirm --needed
yay -S 'polybar' --noconfirm --needed

echo
echo "Done!"
echo

EOF
fi
