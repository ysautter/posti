#!/usr/bin/env bash

echo
echo "INSTALLING SOFTWARE"
echo

pacman -Syy
PKGS=(

    # SYSTEM TOOLS

    'alsa-utils'
    'linux-headers'
    'reflector'
    'xdotool'

    # UI
    'picom'

    # FONTS
    'ttf-font-awesome'
    'ttf-nerd-fonts-symbols'
    'noto-fonts'

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
    'openvpn'
    'base-devel'

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

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
