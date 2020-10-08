#!/usr/bin/env bash

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "/tmp"

echo "CLONING: YAY"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

PKGS=(
    'st-luke-git'
    'picom-tryone-git'
    'spotify'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    yay -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
