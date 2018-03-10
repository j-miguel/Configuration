setopt prompt_subst

zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' stagedstr "+"
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%b%{$fg[red]%}%u%{$fg[green]%}%c%{$reset_color%}"
zstyle ':vcs_info:git*' actionformats "%{$fg[blue]%}%b%{$fg[red]%}%u%{$fg[green]%}%c%{$reset_color%}"

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function timeRight() {

	local width
		(( width = ${COLUMNS} - ${#$(get_pwd)} - ${#$(gitInfo)} ))
	local space=""
	for i in {1..$width}; do
		space="${space} "
	done
	echo $space
}

function gitInfo() {
	echo ${vcs_info_msg_0_}
}

PROMPT='$fg[red]%n: $fg[white]$(get_pwd) $(gitInfo)$(timeRight)%T
 >> '
