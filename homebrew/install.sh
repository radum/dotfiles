#!/bin/bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Homebrew"

install_homebrew() {
	if ! cmd_exists "brew"; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" &>/dev/null
	fi

	print_result $? "homebrew installed"
}

# Check for Homebrew and install if needed
if test ! "$(command -v brew)"; then
	info "installing homebrew"
	install_homebrew
fi

# Brew will not be in PATH after install on Linux
# https://github.com/Homebrew/brew/blob/master/docs/Homebrew-on-Linux.md
if [ "$(uname -s)" = "Linux" ]; then
	print_task "Initialize homebrew"

	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
	echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.path_linux_brew.zsh
	echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

# Update Homebrew recipes
# print_task "Brew update"
execute \
	"brew update" \
	"Homebrew (update)"

# # Install all dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
# brew bundle

# Install all dependencies
print_task "Install all brew dependencies"
execute \
	"$DOTFILES/homebrew/Brewfile.sh" \
	"Install all brew dependencies"
