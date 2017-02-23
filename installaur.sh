#!/bin/bash
git clone https://aur.archlinux.org/$1.git
tar -xvf $1.tar.gz
cd $1
makepkg -si

