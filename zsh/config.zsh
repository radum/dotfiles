#!/bin/zsh
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U "$DOTFILES"/functions/*(:t)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U edit-command-line

# https://github.com/Microsoft/BashOnWindows/issues/1887
# Fixes: -zcache-generate-cache:78: nice(5) failed: operation not permitted
# unsetopt BG_NICE

# If command execution time above min. time, plugins will not output time (uses `popstas/zsh-command-time`).
ZSH_COMMAND_TIME_MIN_SECONDS=120

# Other configuration details
# ---------------------------

# Increase Bash history size. Allow 32³ entries; the default is 500.
HISTSIZE='32768'
HISTFILESIZE="${HISTSIZE}"
HISTFILE=~/.zsh_history

# Omit duplicates and commands that begin with a space from history.
HISTCONTROL='ignoreboth'

# Don't record some commands
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Prefer US English and use UTF-8.
LANG='en_US.UTF-8'
LC_ALL='en_US.UTF-8'

# Don’t clear the screen after quitting a manual page.
MANPAGER='less -X'

# Used by lukechilds/zsh-nvm plugin to auto load NVM / lazy load NVM
NVM_AUTO_USE=true
# NVM_LAZY_LOAD=true

# Log bash history. Save commands run in a file for posterity
# ---------------------------
preexec() { echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $1" >>~/.logs/bash-history-$(date "+%Y-%m-%d").log; }

# don't nice background tasks
# setopt NO_BG_NICE
# setopt NO_HUP
# setopt NO_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# share history between sessions ???
# setopt SHARE_HISTORY -> already defined bellow
# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word
# bindkey '^[[3~' backward-delete-word

# edit command line in $EDITOR
bindkey '^e' edit-command-line

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
	# shellcheck disable=SC1091
	. /usr/local/opt/fzf/shell/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi
