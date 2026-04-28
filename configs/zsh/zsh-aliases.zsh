# Zsh aliases
# > Most aliases here will use tools that will be installed via brew.

## Docker
alias docker_prune="docker system prune --volumes -fa"

## Various
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias clear='[ $[$RANDOM % 10] = 0 ] && timeout 3 cmatrix; clear || clear'
# Brew - Show all installs and their dependencies
alias brew-deps=brew list | while read -r cask; do
	# shellcheck disable=SC2039,SC1087,SC2154,SC2086
	echo -n $fg[blue] $cask $fg[white]
	brew deps "$cask" | awk '{printf(" %s ", $0)}'
	echo ""
done

## Dev specific
alias editorconfig="cp ~/.dotfiles/editorconfig/.editorconfig ."

## Shortcuts
alias ~="cd ~"
alias dt="~/Desktop"
alias dl="~/Downloads"
alias dof="~/.dotfiles"
alias cat="bat"
alias t="date +%H:%M"

## Helpers
# Whenever I forget one of many zsh aliases (, I wonder what “alz” stands for… 🤔)
alias alz="alias | fzf"

# Copy ssh key
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"

# Copy wifi password
alias copywifipw="wifi-password | pbcopy"

# List all files colorized in long format
if test "$(command -v lsd)"; then
	# general use
	alias ls='lsd --group-dirs first'				# ls
	alias l='lsd -la --git --group-dirs first'		# list, size, type, git

	# speciality views
	alias lS='lsd -1  --group-dirs first'			# one column, just names
	alias lt='lsd --tree --depth 2' 				# tree
else
	if [ "$(uname -s)" = "Darwin" ]; then
		alias ls="ls -FG"
	else
		alias ls="ls -F --color"
	fi
	alias l="ls -lAh"
	alias la="ls -A"
	alias ll="ls -l"
fi

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Get all ENV vars
alias get-env='print -lio $(env)'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"
