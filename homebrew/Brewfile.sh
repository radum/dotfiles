#!/bin/bash

# This is done manually for now, check out the readme file for details.
# brew install zsh

brew install git
brew install git-lfs
brew install git-recent
brew install ack
brew install diff-so-fancy
brew install neovim
brew install p7zip
# Command-line fuzzy finder written in Go
brew install fzf
# Clone of cat(1) with syntax highlighting and Git integration
brew install bat
# Replaces LS - https://the.exa.website/ NO LONGER MAINTAINED
# brew install exa
# The next gen ls command
brew install lsd
# Simplified and community-driven man pages - https://github.com/tldr-pages/tldr
brew install tldr
# ripgrep combines the usability of The Silver Searcher with the raw speed of grep - https://github.com/BurntSushi/ripgrep
brew install ripgrep
# Programatically correct mistyped console commands
brew install thefuck
# A syntax-highlighting pager for git - https://github.com/dandavison/delta
brew install git-delta
# Wrapper to colorize and simplify ping's output
brew install prettyping
# Improved top (interactive process viewer)
brew install htop
# The cmatrix command is based off the digital rain animation from the opening scenes of Matrix movie series.
# I use it mostly for a cool clear replacement command
brew install cmatrix
# du + rust = dust. Like du but more intuitive. (folder size)
brew install dust
# mprocs runs multiple commands in parallel and shows output of each command separately. https://github.com/pvolok/mprocs
brew install mprocs
# Custom local domain aliases for local dev servers
brew install peterldowns/tap/localias
# An extremely fast Python package and project manager, written in Rust.
brew install uv

# Atuin replaces your existing shell history with a SQLite database, and records additional context for your commands.
brew install atuin
echo "Atuin has been installed, you need to configure and migrate the history - https://atuin.sh/docs/"
