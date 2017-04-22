# Path to your oh-my-zsh installation.
export ZSH=/Volumes/Data/Users/radmicu/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="bullet-train"

# Install instructions: https://github.com/sindresorhus/pure#oh-my-zsh
# ln -s "$PWD/pure.zsh" ~/personal/oh-my-zsh-custom/pure.zsh-theme
# ln -s "$PWD/async.zsh" ~/personal/oh-my-zsh-custom/async.zsh
ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/personal/oh-my-zsh-custom/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker gem git-extras knife vagrant osx autojump chucknorris git-open colored-man-pages nvm jira)

# Plugins config
JIRA_URL="https://jira.lbi.co.uk"

# User configuration

export PATH=$PATH:"/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set GO Lang GOPATH
export GOPATH="${HOME}/go"
export PATH=$GOPATH/bin:$PATH

# Use homebrew PHP version
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# Add global composer to the PATH
export PATH=~/.composer/vendor/bin:$PATH

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Set caddyserver PATH
export CADDYSERVER="${HOME}/personal/local-server/caddy"
export PATH=$CADDYSERVER:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Alias settings
# alias 'rm=rm -i'
alias 'helios-go-compiled-folder=cd ~/Projects/helios/application/helios-id/helios/deploy'
alias 'helios-run-local-server=ws -p 4243 -c --key ~/personal/ssl/local.dev.key --cert ~/personal/ssl/local.dev.crt'

alias 'chrome-wafiles=open /Applications/Google\ Chrome.app --args --allow-file-access-from-files'
alias 'chrome-canary-wafiles=open /Applications/Google\ Chrome\ Canary.app --args --allow-file-access-from-files'

alias 'prettyjson=python -m json.tool'

# # bullet-train-oh-my-zsh-theme options
# BULLETTRAIN_PROMPT_ORDER=(
#   time
#   context
#   dir
#   git
# )
# BULLETTRAIN_DIR_EXTENDED=2
# BULLETTRAIN_GIT_COLORIZE_DIRTY=true

# Log bash history
# Save commands run in a file for posterity
preexec() { echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $1" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; }

setopt inc_append_history
setopt share_history

# Syntax highlight for command you type, like fish shell has
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
source ~/personal/oh-my-zsh-custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load Node global modules from NVM instance
export NVM_DIR="/Volumes/Data/Users/radmicu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
