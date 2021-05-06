#!/bin/bash

# Heavily inspired by: Keefer Rourke <https://krourke.org>
# Based on AUR package <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-google-fonts-git>

srcdir="/tmp/noto"
pkgdir="/usr/share/fonts/TTF"

echo "Downloading..."
mkdir $srcdir
cd $srcdir
curl -fLo "NotoColorEmoji.zip" https://noto-website-2.storage.googleapis.com/pkgs/NotoColorEmoji-unhinted.zip
unzip NotoColorEmoji.zip

echo "Installing fonts..."
sudo mkdir -p $pkgdir
sudo find $srcdir -type f -name "*.ttf" -exec install -Dm644 {} $pkgdir \;

echo "Cleaning up..."
rm -Rf $srcdir

echo "Updating font-cache..."
sudo fc-cache -f > /dev/null

echo "Done!"
