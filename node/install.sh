#!/bin/sh

###############################################################################
# Node                                                                        #
###############################################################################

if test ! "$(command -v node)"; then
  nvm install v10
fi

# Install global npm modules
source npm-global-modules.sh