# Sourced by zshenv and zshrc

# Adds a specified directory to the PATH environment variable if it's not already included.
# Arguments:
#   $1 - The directory path to add to PATH
# Example:
#   _path_add "/usr/local/bin"
function _path_add() {
	case ":$PATH:" in
		*:"$1":*) ;;
		*) PATH="$1${PATH+:$PATH}" ;;
	esac
	export PATH
}

# Removes a specified directory from the PATH environment variable.
#
# Uses 'sd' (sed alternative) to safely remove the directory by temporarily
# wrapping PATH with colons to handle edge cases (beginning/end of PATH).
#
# Arguments:
#   $1 - The directory path to remove from PATH
#
# Example:
#   _path_remove "/usr/local/bin"
function _path_remove() {
	case ":$PATH:" in
		*:"$1":*)
		PATH=$(echo ":$PATH:" | sd ":$1:" ":" | sd '^:' '' | sd ':$' '')
		;;
	esac
	export PATH
}

function _ensure_first_path() {
	_path_remove $1
	_path_add $1
}

export CARGO_HOME="$HOME/.cargo"

# TODO: Not sure what I need from here
# _ensure_first_path "/opt/homebrew/bin"
# _ensure_first_path "/opt/homebrew/sbin"

_ensure_first_path "$CARGO_HOME/bin"

# _ensure_first_path "/opt/homebrew/opt/fzf/bin"
_ensure_first_path "$HOME/.local/bin"
