#!/usr/bin/env bash
echo
echo "INSTALLING XORG"
echo

PKGS=(
        'xorg-server'
        'xorg-apps'
        'xorg-xinit'
        'xf86-video-intel'
        'xf86-input-libinput'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
