#!/bin/sh

# UNIX shell (command interpreter)
# This is done manually for now, check out the readme file for details.
# brew install zsh

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

brew install git
brew install git-lfs
brew install git-recent
brew install openssh
brew install ack
brew install asciinema
brew install brotli
brew install certbot
brew install exiftool
brew install diff-so-fancy
# Simple, fast and user-friendly alternative to find
brew install fd
brew install ffmpeg
brew install imagemagick
brew install ios-webkit-debug-proxy
# Tool and file format for losslessly compressing JPEGs
brew install lepton
brew install mitmproxy
brew install mozjpeg
brew install neovim
brew install nmap
brew install p7zip
brew install rename
brew install jq
brew install youtube-dl
brew install httpie
brew install shellcheck
# Trigger notifications when a process completes
brew install noti
# Watch files and take action when they change
brew install watchman
# Command-line fuzzy finder written in Go
brew install fzf
# CLI program that accepts piped input and presents files for selection
brew install fpp
# Top-like interface for container metrics
brew install ctop
# Improved top (interactive process viewer)
brew install htop
# Wrapper to colorize and simplify ping's output
brew install prettyping
# Clone of cat(1) with syntax highlighting and Git integration
brew install bat
# Replaces LS - https://the.exa.website/
brew install exa
# Simplified and community-driven man pages - https://github.com/tldr-pages/tldr
brew install tldr
# ripgrep combines the usability of The Silver Searcher with the raw speed of grep - https://github.com/BurntSushi/ripgrep
brew install ripgrep
# Install fun stuff
brew install cowsay
# Fully featured Firefox Send client
brew install ffsend
# Command-line benchmarking tool
brew install hyperfine
# Simplistic interactive filtering tool
brew install peco
# Terminal multiplexer
brew install tmux
# Program that allows you to count code, quickly
brew install tokei
# CLI tool that moves files or folder to the trash
brew install trash
# Display directories as trees (with optional color/HTML output)
brew install tree
# Show the current WiFi network password
brew install wifi-password
# Fast CSV toolkit written in Rust
brew install xsv
# Install GnuPG to enable PGP-signing commits.
brew install gnupg
# NPM alternative
brew install yarn
# NCurses Disk Usage
brew install ncdu
# Programatically correct mistyped console commands
brew install thefuck
