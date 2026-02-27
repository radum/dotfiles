#!/bin/zsh
# ! Most of the configs here are disabled because we are uzing prezto.
# ! If that changes in the future we need to make sure the minimum defaults are set.
# export LSCOLORS='exfxcxdxbxegedabagacad'
# export CLICOLOR=true

# fpath=($DOTFILES/functions $fpath)

# autoload -U "$DOTFILES"/functions/*(:t)
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# autoload -U edit-command-line

# Your project folder that we can `cd [tab]` to
# TODO: implement cd function
export PROJECTS="$HOME/personal/projects"

# If command execution time above min. time, plugins will not output time (uses `popstas/zsh-command-time`).
ZSH_COMMAND_TIME_MIN_SECONDS=120

# https://github.com/Microsoft/BashOnWindows/issues/1887
# Fixes: -zcache-generate-cache:78: nice(5) failed: operation not permitted
# unsetopt BG_NICE

# Other configuration details
# ---------------------------

# Increase Bash history size. Allow 40³ entries; the default is 500.
# HISTSIZE='64000'
# HISTFILESIZE="${HISTSIZE}"
# SAVEHIST="${HISTSIZE}"
# HISTFILE=~/.zsh_history

# Omit duplicates and commands that begin with a space from history.
# HISTCONTROL='ignoreboth'

# Don't record some commands
# HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Prefer US English and use UTF-8.
# LANG='en_US.UTF-8'
# LC_ALL='en_US.UTF-8'

# Don’t clear the screen after quitting a manual page.
# MANPAGER='less -X'

# Log bash history. Save commands run in a file for posterity
# ---------------------------
LOG_FILE=~/.logs/bash-history-$(date +%Y-%m-%d).log
if [[ ! -f "$LOG_FILE" ]]; then
    touch "$LOG_FILE"
fi
preexec() { echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $1" >>~/.logs/bash-history-$(date "+%Y-%m-%d").log; }

# # don't nice background tasks
# # setopt NO_BG_NICE
# # setopt NO_HUP
# # setopt NO_BEEP
# # allow functions to have local options
# setopt LOCAL_OPTIONS
# # allow functions to have local traps
# setopt LOCAL_TRAPS
# # share history between sessions ???
# # setopt SHARE_HISTORY -> already defined bellow
# # add timestamps to history
# setopt EXTENDED_HISTORY
# setopt PROMPT_SUBST
# setopt CORRECT
# setopt COMPLETE_IN_WORD
# # adds history
# setopt APPEND_HISTORY
# # adds history incrementally and share it across sessions
# setopt INC_APPEND_HISTORY
# # share command history data
# setopt SHARE_HISTORY
# # do not put duplicated command into history list
# setopt HIST_IGNORE_ALL_DUPS
# # do not save duplicated command
# # setopt HIST_SAVE_NO_DUPS
# # remove unnecessary blanks
# setopt HIST_REDUCE_BLANKS
# # ignore duplicated commands history list
# setopt HIST_IGNORE_DUPS
# # ignore commands that start with space
# setopt HIST_IGNORE_SPACE
# # show command with history expansion to user before running it
# setopt HIST_VERIFY
# setopt HIST_EXPIRE_DUPS_FIRST
# # append command to history file immediately after execution
# # setopt INC_APPEND_HISTORY_TIME
# # dont ask for confirmation in rm globs*
# setopt RM_STAR_SILENT

# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# zle -N edit-command-line

# # fuzzy find: start to type
# # ! These break Warp for some reason. It makes each cmd to require double ENTER
# # ! Not sure if I need them. Comment out for now.
# # bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
# # bindkey "$terminfo[kcud1]" down-line-or-beginning-search
# # bindkey "$terminfo[cuu1]" up-line-or-beginning-search
# # ! This is the main culprit
# # bindkey "$terminfo[cud1]" down-line-or-beginning-search

# # backward and forward word with option+left/right
# bindkey '^[^[[D' backward-word
# bindkey '^[b' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '^[f' forward-word

# # to to the beggining/end of line with fn+left/right or home/end
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey '^[[H' beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
# bindkey '^[[F' end-of-line

# # delete char with backspaces and delete
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char

# # delete word with ctrl+backspace
# bindkey '^[[3;5~' backward-delete-word
# # bindkey '^[[3~' backward-delete-word

# # edit command line in $EDITOR
# bindkey '^e' edit-command-line

# # search history with fzf if installed, default otherwise
# if test -d "$(brew --prefix)"/opt/fzf/shell; then
# 	source "$(brew --prefix)"/opt/fzf/shell/key-bindings.zsh
# else
# 	bindkey '^R' history-incremental-search-backward
# fi
