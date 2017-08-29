#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install asciinema
brew install brotli
brew install ccat
brew install certbot
brew install exiftool
brew install git
brew install git-lfs
brew install guetzli
brew install diff-so-fancy
brew install flow
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools
brew install imagemagick --with-webp
brew install ios-webkit-debug-proxy
brew install httpie
brew install lepton
brew install lua
brew install lynx
brew install mitmproxy
brew install mozjpeg
brew install neovim
brew install nmap
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
brew install shellcheck
brew install noti
brew install yarn
brew install hub

# Replaces LS - https://the.exa.website/
brew install exa

# Install fun stuff
brew install cowsay
brew install gource

# Brew CASK
# brew tap caskroom/cask
# brew cask install android-sdk
brew cask install android-platform-tools

# Remove outdated versions from the cellar.
brew cleanup
