#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Line wrap on window resize
shopt -s checkwinsize 2> /dev/null

# Case-insensitive tab completetion
bind 'set completion-ignore-case on'

bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'

# Append to the Bash history file, rather than overwriting
shopt -s histappend 2> /dev/null

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignorespace:erasedups"

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "

# Lots o' history.
export HISTSIZE=10000
export HISTFILESIZE=10000

###########
# Exports #
###########

export EDITOR="vim"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias ls='ls -lhF ${colorflag}'
alias lsa='ls -A'
alias lsd="ls ${colorflag} | /usr/bin/grep --color=never '^d'"
alias lsda="lsa | /usr/bin/grep --color=never '^d'"

alias grep='grep --color=auto -n -i'

alias clear="clear && printf '\e[3J'";

alias df="df -h"
alias du="du -h"

# Search in files
sif() {
grep -EiIrl "$*" .
}

# Colored man pages
man() {
env LESS_TERMCAP_mb=$'\E[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \
man "$@"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
