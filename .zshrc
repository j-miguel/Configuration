# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/jmmiguel/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="user"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd(){
	vcs_info
}

# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

setopt auto_cd
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_ignore_dups

#correction
setopt correct #commands
setopt correctall #arguments

#completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export BROWSER="chromium"
export EDITOR="vim"

alias I3="cd ~/.config/i3"

bindkey '^[' clear-screen
alias pacman="sudo pacman"
alias ls="ls --color"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsd='ls -aFhlG'
alias size='du -sckx * | sort -nr'
alias py='python2.7'

alias wifilist='nmcli dev wifi list'


# git aliases
alias gitstatus="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gitstatuss="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''   %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# Auto-completar para o comando 'kill':
zstyle ':completion:*:processes' command 'ps x -o pid,command'
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS


bindkey '\e[1~' beginning-of-line

ex() 
{
	if [[ -f $1 ]]; then
		case $1 in
			*.tar.bz2) tar xvjf $1;;
			*.tar.gz) tar xvzf $1;;
			*.tar.xz) tar xvJf $1;;
			*.tar.lzma) tar --lzma xvf $1;;
			*.bz2) bunzip $1;;
			*.rar) unrar $1;;
			*.gz) gunzip $1;;
			*.tar) tar xvf $1;;
			*.tbz2) tar xvjf $1;;
			*.tgz) tar xvzf $1;;
			*.zip) unzip $1;;
			*.Z) uncompress $1;;
			*.7z) 7z x $1;;
			*.dmg) hdiutul mount $1;; # mount OS X disk images
			*) echo "'$1' cannot be extracted via >ex<";;
			esac
			else
				echo "'$1' is not a valid file"
			fi
}

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}


# =========================================================
# =======			oh my 		=============================		

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
# fi
