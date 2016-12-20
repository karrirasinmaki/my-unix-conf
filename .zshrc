# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

