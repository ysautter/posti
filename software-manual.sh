#!/usr/bin/env bash

echo "INSTALLING MANUAL SOFTWARE"
echo
echo "INSTALLING LUKE SMITH ST"
cd /tmp
rm -rf st
git clone https://github.com/LukeSmithxyz/st
cd st
make install

