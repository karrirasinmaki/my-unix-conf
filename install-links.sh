#!/bin/bash

cd "$(dirname "$0")"
BASEDIR=$PWD

echo $BASEDIR

echo "Creating links..."
ln -sfv $BASEDIR/.alacritty.yml ~/.alacritty.yml
ln -sfv $BASEDIR/.zshrc ~/.zshrc
ln -sfv $BASEDIR/.myrc ~/.myrc
ln -sfv $BASEDIR/.vimrc ~/.vimrc
ln -sfv $BASEDIR/.gitconfig ~/.gitconfig
ln -sfv $BASEDIR/.gitignore ~/.gitignore
