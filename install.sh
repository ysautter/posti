#!/usr/bin/env bash

function install () {
    echo
    echo
    echo
    echo "############################"
    echo -n "$1 [Y|n]"
    read -s -n 1 install
    echo
    echo "############################"
    echo
    echo
    echo
    echo
    if [ "$install" != "n" ]; then
        bash $2
    fi
}

install "INSTALL SOFTWARE (PACMAN)" ./software-pacman.sh
install "INSTALL XORG" ./xorg.sh
install "INSTALL i3" ./i3.sh
install "INSTALL SOFTWARE (MANUAL)" ./software-manual.sh
install "ADD USER AND DOWNLOAD DOTFILES" ./adduser.sh

echo
echo
echo
echo
echo "###########################################"
echo
echo "Finished installation!"
echo
echo "###########################################"
echo
