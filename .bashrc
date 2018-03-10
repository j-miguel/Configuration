#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias startzsh='clear ; echo -n "Connected to " ; echo -n $(iwgetid -r) ; echo " network." ; echo -n $(date +%d) ; echo -n " " ; echo -n $(date +%B) ; echo -n "  " ; echo $(date +%R) ; zsh'
alias startx='startx ~/.xinitrc'
bind '"\C-x": "startzsh\n"'


bind '"^[": "clear\n"'
alias pacman="sudo pacman"
alias ls="ls --color"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsd='ls -aFhlG'
alias size='du -sckx * | sort -nr'
alias py='python2.7'

alias wifilist='nmcli dev wifi list'
