#!/bin/sh

# TODO: Move thes into the gitconfig file
# `git forget` for quickly discarding unstaged changes
# https://stackoverflow.com/a/1021384
git config --global alias.forget 'checkout .'

# Undo last commit, I keep using this, assuming it exists…
# Now it does
git config --global alias.undo 'reset HEAD~'
