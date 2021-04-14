#!/bin/bash

# Heavily inspired by: Keefer Rourke <https://krourke.org>
# Based on AUR package <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-google-fonts-git>

srcdir="/tmp/nerd-fonts"
pkgdir="/usr/share/fonts/nerd-fonts"

echo "Downloading..."
mkdir $srcdir
cd $srcdir
curl -fLo "Droid Sans Mono for Powerline Nerd Font Icons Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

echo "Installing fonts..."
sudo mkdir -p $pkgdir
sudo find $srcdir -type f -name "*.otf" -exec install -Dm644 {} $pkgdir \;

echo "Cleaning up..."
rm -Rf $srcdir

echo "Updating font-cache..."
sudo fc-cache -f > /dev/null

echo "Done!"
