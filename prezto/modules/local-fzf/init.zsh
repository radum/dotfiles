#!/bin/bash

# Fuzzy completion for bash and zsh
# https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
#
#  Files under current directory
#  - You can select multiple items with TAB key
#  vim **<TAB>
#  Directories under current directory (single-selection)
#  cd **<TAB>
# shellcheck disable=SC1090
test -d "$(brew --prefix)"/opt/fzf/shell || return 0

function _fzf_has() {
	which "$@" >/dev/null 2>&1
}

export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# Add our plugin's bin directory to the user's path
local FZF_PLUGIN_BIN="$(dirname $0)/bin"
path+=(${FZF_PLUGIN_BIN})
unset FZF_PLUGIN_BIN

# shellcheck disable=SC1091,SC1094,SC1090
source "$(brew --prefix)"/opt/fzf/shell/completion.zsh
source "$(brew --prefix)"/opt/fzf/shell/key-bindings.zsh

if _fzf_has pbcopy; then
	if _fzf_has ghead; then
		function falias {
			# Search alias by key or values
			local out
			out=$(alias | fzf)
			echo -n "$(echo -n "${out}" | cut -d= -f2 | ghead -c -1 | pbcopy)"
		}
	fi
fi

# Cleanup internal functions
unset -f _fzf_has
