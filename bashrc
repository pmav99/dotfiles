#!/usr/bin/bash
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

### History
# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# PS1 configuration
if [ $UID -ne 0 ]; then
    # regular user prompt
    PS1='\n\[\e[1;32m\]\u\[\e[0m\] at \[\e[1;33m\]\H \[\e[0m\]in \[\e[m\]\[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\n\$\[\e[m\] \[\e[1;37m\]'
    PS1="\n\[$(tput bold)\]\[$(tput setaf 2)\]\u\[$(tput setaf 7)\] at \[$(tput setaf 3)\]\H\[$(tput setaf 7)\] in \[$(tput setaf 4)\]\w\[$(tput setaf 2)\]\n\\$ \[$(tput sgr0)\]"
    PS1="\n\[$(tput bold)\]\[$(tput setaf 2)\]\u\[$(tput setaf 7)\] at \[$(tput setaf 3)\]\H\[$(tput setaf 7)\] in \[$(tput setaf 4)\]\w\[$(tput setaf 2)\]\n\\$ \[$(tput sgr0)\] \[\e[0m\]"
else
    # root prompt
    PS1='\n\[\e[1;31m\]\u\[\e[0m\] at \[\e[1;33m\]\H \[\e[0m\]in \[\e[m\]\[\e[1;34m\]\w\[\e[m\] \[\e[1;31m\]\$\[\e[m\] \[\e[1;37m\]'
fi

trap 'echo -ne "\e[0m"' DEBUG

# colored directories
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Alias definitions.
if [ -f ./.shell_aliases ]; then
    source ./.shell_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
