#!/bin/zsh
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Troubleshooting.md#what-is-the-i-before-prompt-character-
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_CHAR_SYMBOL=»
# SPACESHIP_CHAR_SYMBOL=➜
# SPACESHIP_CHAR_SYMBOL=❯
# SPACESHIP_CHAR_SYMBOL=λ

# REPORTTIME is a nifty feature of zsh. If you set it to a non-negative value, then every time, any command you run that takes longer than the value you set it to in seconds,
# zsh will print usage statistics afterwards as if you had run the command prefixed with time.
# Report CPU usage for commands running longer than 10 seconds
export REPORTTIME=10
