#!/bin/bash

###############################################################################
# Rust                                                                        #
###############################################################################

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Rust"

# Check for rustup and install if needed
if test ! "$(command -v rustup)"; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
