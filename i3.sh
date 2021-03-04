echo
echo "INSTALLING i3"
echo

PKGS=(
    'i3-gaps'
    'i3status-rust'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
