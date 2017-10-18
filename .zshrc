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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/karrirasinmaki/google-cloud-sdk/path.zsh.inc' ]; then source '/home/karrirasinmaki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/karrirasinmaki/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/karrirasinmaki/google-cloud-sdk/completion.zsh.inc'; fi
