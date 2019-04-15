#!/bin/sh

###############################################################################
# Rust                                                                        #
###############################################################################

# Check for rustup and install if needed
if test ! "$(command -v rustup)"; then
  curl https://sh.rustup.rs -sSf | sh
fi
