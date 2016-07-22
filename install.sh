#!/bin/bash

cd "$(dirname "$0")"
BASEDIR=$PWD

echo $BASEDIR

ln -sfv $BASEDIR/.zshrc ~/.zshrc
ln -sfv $BASEDIR/.myrc ~/.myrc
ln -sfv $BASEDIR/.vimrc ~/.vimrc
