#!/bin/bash
###############################################################################
# Aliases                                                                     #
###############################################################################

# TODO: Document these
alias duf="du -sh * | sort -hr"
alias less="less -r"
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"
# shellcheck disable=SC2139
alias cheat="curl cht.sh/$1"
alias 'prettyjson=python3 -m json.tool'
alias clear='[ $[$RANDOM % 10] = 0 ] && timeout 3 cmatrix; clear || clear'
# TODO: I also have a function called `server()`, perhaps this should move over there
# alias ws -p 4243 -c --key ~/personal/ssl/local.dev.key --cert ~/personal/ssl/local.dev.crt'

###############################################################################
# Shortcuts                                                                   #
###############################################################################

alias ~="cd ~"
alias dt="~/Desktop"
alias dl="~/Downloads"
alias dof="~/.dotfiles"
alias bin="/usr/local/bin"
alias ydl="youtube-dl"
alias cat="bat"
alias cr="cargo run"
alias t="date +%H:%M"

###############################################################################
# Configs                                                                     #
###############################################################################

alias zshrc="code ~/.dotfiles/.zshrc"

###############################################################################
# Apps                                                                        #
###############################################################################

# Google Chrome
# Open chrome with files access for testing purposes
alias 'chrome=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias 'chrome-canary=/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
alias 'chrome-wafiles=open /Applications/Google\ Chrome.app --args --allow-file-access-from-files'
alias 'chrome-canary-wafiles=open /Applications/Google\ Chrome\ Canary.app --args --allow-file-access-from-files'

###############################################################################
# Helpers                                                                     #
###############################################################################

alias c="clear"

# Whenever I forget one of many zsh aliases (, I wonder what “alz” stands for… 🤔)
alias alz="alias | fzf"

# Copy ssh key
# shellcheck disable=SC2139
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"

# Copy wifi password
alias copywifipw="wifi-password | pbcopy"

# Re-source .zshrc after changes
# shellcheck disable=SC2139
alias rlcli="source $HOME/.zshrc"

# Kill all tmux processes simultaneously, leveraging fkill-cli,
# was previously using all solutions from https://goo.gl/Lqh51S
# but prefer this cause of no undesired side-effects
alias tmuxkill="fkill tmux"

alias bedtime="pmset sleepnow"

# Reload dns
# TODO: How does this realate to `fix-internet` bin?
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

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

# List only directories
# shellcheck disable=SC2139
# alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
# List only hidden files
# alias lsh="ls -ld .?*"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; npm install npm -g; npm update -g'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python3 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable/Enable Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Brew
# Show all installs and their dependencies
alias brew-deps=brew list | while read -r cask; do
	# shellcheck disable=SC2039,SC1087,SC2154,SC2086
	echo -n $fg[blue] $cask $fg[white]
	brew deps "$cask" | awk '{printf(" %s ", $0)}'
	echo ""
done

# Get all ENV vars
alias get-env='print -lio $(env)'
