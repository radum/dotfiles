#!/bin/bash

###############################################################################
# SublimeText Command Line Interface                                          #
# https://www.sublimetext.com/docs/command_line.html                          #
###############################################################################

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "SublimeText Command Line Interface (subl)"

# On Linux
if [ "$(uname -s)" = "Linux" ]; then
	ln -s /opt/sublime_text/sublime_text /usr/local/bin/subl
fi

# On Mac
if [ "$(uname -s)" = "Darwin" ]; then
	ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

if test "$(command -v subl)"; then
	print_success "Subl version: $(subl --version)"
fi
