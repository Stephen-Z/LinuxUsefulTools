#!/bin/bash
echo "cloning from git..."
git clone https://aur.archlinux.org/$1\.git
echo "completed! making and install the package"
cd $1
makepkg -si
