#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# Load UTILS
# shellcheck disable=SC1090
. "$DOTFILES/scripts/utils.sh"

create_directories() {
	declare -a DIRECTORIES=(
		"$HOME/.logs"
		"$HOME/personal"
		"$HOME/work"
	)

	for i in "${DIRECTORIES[@]}"; do
		mkd "$i"
	done
}

main() {
	print_headline "Create directories"
	create_directories
}

main
