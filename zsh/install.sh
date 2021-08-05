#!/bin/bash
# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

find_zsh() {
	if command -v zsh >/dev/null 2>&1 && grep "$(command -v zsh)" /etc/shells >/dev/null; then
		command -v zsh
	else
		echo "/bin/zsh"
	fi
}

print_sub_heading "ZSH"

# Make Zsh the default shell environment
zsh="$(find_zsh)"
test -z "$TRAVIS_JOB_ID" &&
	test "$(expr "$SHELL" : '.*/\(.*\)')" != "zsh" &&
	command -v chsh >/dev/null 2>&1 &&
	sudo chsh -s "$zsh" &&
	success "set $("$zsh" --version) at $zsh as default shell"

print_success "Zsh installed"
