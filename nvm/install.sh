#!/bin/sh

###############################################################################
# nvm                                                                        #
###############################################################################

# Check for nvm and install if needed
if test ! "$(command -v nvm)"; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
fi
