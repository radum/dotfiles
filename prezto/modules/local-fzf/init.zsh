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

export FZF_COMPLETION_TRIGGER='**'

# shellcheck disable=SC1091,SC1094,SC1090
source "$(brew --prefix)"/opt/fzf/shell/completion.zsh
source "$(brew --prefix)"/opt/fzf/shell/key-bindings.zsh
