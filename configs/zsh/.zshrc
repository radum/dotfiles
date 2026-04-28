#!/bin/zsh

###########################################################################
# Zsh                                                                     #
###########################################################################

# Shortcut to this dotfiles path is $DOTFILES.
# This is used in the zsh config files to source other files and to load custom functions.
# (prezto uses this to source the modules folder in zpreztorc file)
export DOTFILES="$HOME/.dotfiles"

# Your default editor
export EDITOR='vim'
export VISUAL='code'

# Load the main zsh config file, which contains the minimum defaults.
# Most of the configs in `zsh-config.zsh` are disabled because we are uzing prezto bellow.
# But the modules folder `configs/zsh/prezto/modules` will be loaded.
source "$DOTFILES/configs/zsh/zsh-config.zsh"

# ❯ Source Prezto.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ❯ Source zinit.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# Because we source zinit.zsh after compinit (prezto does it in the completeions module) we need this:
# (from https://github.com/zdharma-continuum/zinit docs)
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit plugins
# ----------------
# Order matters for Syntax Highlighting, history-substring-search, autosuggestions
# To elaborate, the relative order of loading the modules would be syntax-highlighting, history-substring-search, autosuggestions and prompt.
zinit ice depth"1"; zinit light z-shell/F-Sy-H
# zinit ice depth"1"; zinit light zsh-users/zsh-history-substring-search	# Already loaded by prezto/modules/history-substring-search
# zinit ice depth"1"; zinit light zsh-users/zsh-autosuggestions				# Already loaded by prezto/modules/autosuggestions
# zinit ice depth"1"; zinit light zsh-users/zsh-completions					# Already loaded by prezto/modules/completion

# https://zdharma-continuum.github.io/zinit/wiki/LS_COLORS-explanation/
zinit ice atclone"dircolors -b LS_COLORS > lscolors.sh" \
    atpull'%atclone' pick"lscolors.sh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# This will source the remote files from ohmyzsh/plugins.
zinit snippet OMZP::extract

# TODO: Not if I need this or make it better from the standard way of loading it.
# # Load starship theme
# # line 1: `starship` binary as command, from github release
# # line 2: starship setup at clone(create init.zsh, completion)
# # line 3: pull behavior same as clone, source init.zsh
# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#           atpull"%atclone" src"init.zsh"
# zinit light starship/starship
# ----------------

# ❯ Source other cofiguration files (PATHs, aliases, functions, etc.).
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
source $DOTFILES/configs/zsh/zsh-path.zsh
source $DOTFILES/configs/zsh/zsh-aliases.zsh

# ❯ Source local "secret" stuff.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.localrc ] && . ~/.localrc

# ❯ Load Starship prompt
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# ❯ Load mise, fzf, zoxide and others.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
eval "$(mise activate zsh)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# # Anything bellow this line is most likely appended automatically by some script.
# # ---------------------------
