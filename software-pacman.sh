#!/usr/bin/env bash

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(

    # SYSTEM TOOLS

    'alsa-utils'
    'linux-headers'
    'reflector'

    # SYSTEM CONTROL

    'pavucontrol'
    'pulseaudio'

    # TERMINAL UTILITES

    'curl'
    'feh'
    'openssh'
    'unrar'
    'unzip'
    'wget'
    'ranger'
    'gvim'
    'grep'
    'lsd'
    'ueberzug'
    'man'

    # DEVELOPMENT

    'cmake'
    'git'
    'gcc'
    'python'
    'jre-openjdk'

    # WEB TOOLS

    'firefox'

    # COMMUNICATIONS

    # GRAPHICS AND DESIGN

    'vlc'
    'gimp'

    # PRODUCTIVITY

    'dmenu'
    'rofi'
    'galculator'
    'zathura'
    'noto-fonts'

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
