#!/usr/bin/env bash

echo
echo "INSTALLING AUR SOFTWARE"
echo

sudo -i -u $user bash << EOF

yay -S 'st-luke-git' --noconfirm --needed
yay -S 'picom-tryone-git' --noconfirm --needed
yay -S 'spotify' --noconfimg --needed
yay -S 'latex-mk' --noconfimg --needed

echo
echo "Done!"
echo
bash /home/$user/.vim/plugged/YouCompleteMe/install.sh

EOF
