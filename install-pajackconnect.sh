#!/bin/bash

srcdir="/tmp/pajackconnect"
giturl="git@github.com:brummer10/pajackconnect.git"

mkdir $srcdir
cd $srcdir
echo "Cloning Git repository..."
git clone $giturl ./

# Copying script...
cp pajackconnect ~/.local/bin/

# echo "Building package..."
# dpkg-buildpackage -rfakeroot -uc -us -b
# 
# echo "Enabling the service..."
# sudo systemctl enable resume-fix-pulseaudio.service
# sudo systemctl daemon-reload

echo "Cleaning..."
rm -rf $srcdir

echo "Done!"
