# source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# set shell options
shopt -s cdspell checkwinsize
shopt -s globstar extglob extquote
shopt -s histappend cmdhist
set -o vi

# sets history variables
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# set title for terminal tab
nametab () {
	echo -ne "\033]0;"$@"\007"
}

alias ll='ls -Al'
alias h='history'

bind -x '"\C-l": clear'

# enable color support
CLICOLOR=1
LS_COLORS='no=0:di=34:fi=0:ln=35:ex=31:so=32:pi=33'
test $(uname) = 'Linux' && alias ls='ls --color=auto'
alias grep='grep --color=auto'

EDITOR=vim
PS1='\[\e[32m\]\h:\W$\[\e[0m\] '
PATH=~/bin:/usr/local/bin:${PATH}

# source bash completion scripts
if [[ -e /usr/local/bin/brew && -f $(brew --prefix)/etc/bash_completion ]]; then
	source $(brew --prefix)/etc/bash_completion
fi

# configure shell for rbenv if installed
if hash rbenv 2>/dev/null; then
	PATH=~/.rbenv/shims:~/.rbenv/bin:${PATH}
	rbenv rehash
fi

# set predictable ssh authentication socket location
sock=~/.ssh/sock
if [[ -n $SSH_AUTH_SOCK && $SSH_AUTH_SOCK != $sock ]]; then
	ln -sf $SSH_AUTH_SOCK $sock
	export SSH_AUTH_SOCK=$sock
fi

# source homeshick
if [[ -f ${HOME}/.homesick/repos/homeshick/homeshick.sh ]]; then
	source ${HOME}/.homesick/repos/homeshick/homeshick.sh
fi

export CLICOLOR EDITOR PS1 PATH LS_COLORS

# source local definitions
if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
