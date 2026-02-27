#!/bin/bash

###############################################################################
# nvm                                                                        #
###############################################################################

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Node & NVM"

# Check for nvm and install if needed
if test ! "$(command -v nvm)"; then
	print_task "Install NVM"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi

###############################################################################
# Node                                                                        #
###############################################################################

# On Linux load NVM before we can use it
if [ "$(uname -s)" = "Linux" ]; then
	NVM_DIR="$HOME/.nvm"
	# shellcheck disable=SC1090
	. "$NVM_DIR/nvm.sh"
fi

print_success "nvm version: $(nvm --version)"

if test ! "$(command -v node)" && test "$(command -v nvm)"; then
	print_task "Install node v20 via nvm"
	nvm install v20
	print_task "Install node v22 via nvm"
	nvm install v22
fi

if test "$(command -v node)"; then
	print_success "node version: $(node --version)"
fi

# Install global npm modules
# TODO: Make this run only if a flag is set
# source ~/.dotfiles/node/npm-global-modules.sh
