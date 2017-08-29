# Useful information
# ---------------------------
# https://github.com/zsh-users/antigen
# https://github.com/zsh-users/antigen/wiki/Requirements
#
# https://github.com/powerline/fonts
# https://www.addictivetips.com/windows-tips/update-windows-subsystem-for-linux-on-windows-10/

# https://github.com/Microsoft/BashOnWindows/issues/1887
# Fixes: -zcache-generate-cache:78: nice(5) failed: operation not permitted
# unsetopt BG_NICE

source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # Guess what to install when running an unknown command.
    command-not-found

    # Helper for extracting different types of archives.
    extract

    # Add some color to our man pages
    colored-man-pages

    # Common aliases like ll and la
    common-aliases

    # An oh-my-zsh plugin to help remembering those aliases you defined once
    djui/alias-tips

    # Tracks your most used directories, based on 'frecency'.
    rupa/z

    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git
    git-extras
    brew
    docker
    gem

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions

    # https://github.com/sindresorhus/pure
    # Comment theme bellow if this is used
    mafredri/zsh-async
    sindresorhus/pure
EOBUNDLES

# Load the theme.
# antigen theme ys

# Tell antigen that you're done
antigen apply

# Other configuration details
# ---------------------------

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Log bash history. Save commands run in a file for posterity
# ---------------------------
preexec() { echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $1" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; }

setopt inc_append_history
setopt share_history

# Anything bellow this line is most likely appended automatically by some script.
# ---------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
