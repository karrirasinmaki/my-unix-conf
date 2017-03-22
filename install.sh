#!/bin/bash

cd "$(dirname "$0")"
BASEDIR=$PWD

echo $BASEDIR

ln -sfv $BASEDIR/.zshrc ~/.zshrc
ln -sfv $BASEDIR/.myrc ~/.myrc
ln -sfv $BASEDIR/.vimrc ~/.vimrc
ln -sfv $BASEDIR/.gitconfig ~/.gitconfig
ln -sfv $BASEDIR/.gitignore ~/.gitignore

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
