#!/bin/bash

###############################################################################
# Antidote                                                                     #
###############################################################################

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Antidote"

if command -v brew >/dev/null 2>&1; then
	brew install antidote
else
	git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-~}"/.antidote
fi

antidote bundle <"$DOTFILES/antidote/bundles.txt" >~/.zsh_plugins.sh
antidote update
