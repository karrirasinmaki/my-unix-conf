# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(git)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

if [ -f ~/.myrc ]; then
    source ~/.myrc
else
    print "404: ~/.myrc not found."
fi

if [ -f ~/.profile ]; then
    source ~/.profile
else
    print "404: ~/.profile not found."
fi

