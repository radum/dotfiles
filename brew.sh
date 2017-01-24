#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install ccat
brew install git
brew install git-lfs
brew install diff-so-fancy
brew install flow
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install rename
brew install speedtest_cli
brew install webkit2png
brew install phantomjs
brew install fortune
brew install jq
brew install imagemagick
brew install youtube-dl
brew install httpie
brew install noti
brew install android-platform-tools
brew install yarn

# Remove outdated versions from the cellar.
brew cleanup
