#!/usr/bin/env bash
echo
echo "INSTALLING MANUAL SOFTWARE"
echo

cd /tmp

echo "INSTALLING LUKE SMITH ST"
sudo -i -u $user bash << EOF
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install
EOF
