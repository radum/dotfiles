#!/bin/bash

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Git settings"

# Don't ask ssh password all the time
if [ "$(uname -s)" = "Darwin" ]; then
	git config --global credential.helper osxkeychain
else
	git config --global credential.helper cache
fi

print_success "Git credential helper"

# better diffs
# TODO: This will not run on a fresh machinne, as homebrew / rust is not done yet.
# We should find a way to do these stuff as last instance.
if command -v delta >/dev/null 2>&1; then
	git config --global core.pager "delta --dark"
elif command -v diff-so-fancy >/dev/null 2>&1; then
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

print_success "Git core pager"

# use vscode as mergetool
# if command -v code >/dev/null 2>&1; then
# 	git config --global merge.tool vscode
# 	git config --global mergetool.vscode.cmd "code --wait $MERGED"
# fi
