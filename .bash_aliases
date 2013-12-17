
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

alias gvim='gvim -p'

# ack
alias cack='clear; ack'

# pbcopy

if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

# network stuff

alias eip='wget -q -O - checkip.dyndns.org | sed -e "s/.*Current IP Address: //" -e "s/<.*$//" '

#utils

alias sss='xfce4-screenshooter'
alias r="sshlauncher.py"

