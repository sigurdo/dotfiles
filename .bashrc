#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\w 💩 '

if [ -f $HOME/.local.bashrc ]
then
    source $HOME/.local.bashrc
fi
