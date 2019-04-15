#!/bin/sh

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Check for Homebrew and install if needed
if test ! $(command -v brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# # Install all dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
# brew bundle

# Install all dependencies
source ~/.dotfiles/homebrew/Brewfile.sh
