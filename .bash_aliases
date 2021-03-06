
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# vi

if [ "$(uname)" '==' "Darwin" ]; then
    alias gvim='mvim -p'
    alias mvim='mvim -p'
else
    alias gvim='gvim -p'
    alias mvim='gvim -p'
fi

alias evim='evim -u ~/.evimrc'

# ack
alias cack='clear; ack'

# pbcopy

if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi
