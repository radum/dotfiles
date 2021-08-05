#!/bin/bash
###############################################################################
# thefuck                                                                     #
###############################################################################

# Configure thefuck alias
if test "$(command -v thefuck)"; then
	eval "$(thefuck --alias)"
fi
