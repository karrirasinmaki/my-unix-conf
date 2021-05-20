#!/bin/bash

cd "$(dirname "$0")"
BASEDIR=$PWD

echo $BASEDIR

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing vim colors..."
mkdir ~/.vim/colors

echo "Installing vimbrains..."
curl -o ~/.vim/colors/vimbrains.vim https://raw.githubusercontent.com/sherifkandeel/vim-colors/master/colors/vimbrains.vim 

echo "Installing Universal ctags..."
git clone https://github.com/universal-ctags/ctags ~/.vim/bundle/universal-ctags
cd ~/.vim/bundle/universal-ctags && ./autogen.sh && ./configure && make && sudo make install

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
