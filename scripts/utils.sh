#!/bin/bash

###############################################################################
# Functions used during bootstraping                                          #
###############################################################################

# This function prints a formatted information message to the console.
# Arguments:
# * \$1: A message to be printed.
# The function will print a message to the console with a trailing ellipsis (...).
# The message will be preceded by a blue ellipsis (‥) to improve readability.
info() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[00;34m‥\033[0m ] $1\n"
}

user() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
}

print_in_color() {
	printf "%b" \
		"$(tput setaf "$2" 2>/dev/null)" \
		"$1" \
		"$(tput sgr0 2>/dev/null)"
}

print_in_blue() {
	print_in_color "$1" 4
}

print_in_green() {
	print_in_color "$1" 2
}

print_in_purple() {
	print_in_color "$1" 5
}

print_in_red() {
	print_in_color "$1" 1
}

print_error() {
	print_in_red "  [ ✖ ] $1 $2\n"
}

print_error_stream() {
	while read -r line; do
		print_error "↳ ERROR: $line"
	done
}

print_in_yellow() {
	print_in_color "$1" 3
}

print_question() {
	print_in_yellow "  [ ? ] $1"
}

print_result() {

	if [ "$1" -eq 0 ]; then
		print_success "$2"
	else
		print_error "$2"
	fi

	return "$1"

}

print_success() {
	print_in_green "  [ ✔ ] $1\n"
}

print_warning() {
	print_in_yellow "  [ ! ] $1\n"
}

print_headline() {
	print_in_purple "\n  • $1 \n\n"
}

print_sub_heading() {
	print_in_purple "  $1 \n\n"
}

print_task() {
	print_in_blue "  › $1\n"
}

ask_for_sudo() {
	# Ask for the administrator password upfront.

	sudo -v &>/dev/null

	# Update existing `sudo` time stamp
	# until this script has finished.
	#
	# https://gist.github.com/cowboy/3118588

	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done &>/dev/null &
}

answer_is_yes() {
	[[ "$REPLY" =~ ^[Yy]$ ]] &&
		return 0 ||
		return 1
}

ask_for_confirmation() {
	print_question "$1 (y/n) "
	read -r -n 1
	printf "\n"
}

# Usage:
# if cmd_exists "brew"; then
cmd_exists() {
	command -v "$1" &>/dev/null
}

set_trap() {

	trap -p "$1" | grep "$2" &>/dev/null ||
		trap '$2' "$1"

}

kill_all_subprocesses() {

	local i=""

	for i in $(jobs -p); do
		kill "$i"
		wait "$i" &>/dev/null
	done

}

execute() {
	local -r CMDS="$1"
	local -r MSG="${2:-$1}"
	local -r TMP_FILE="$(mktemp /tmp/XXXXX)"

	local exitCode=0
	local cmdsPID=""

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# If the current process is ended,
	# also end all its subprocesses.

	set_trap "EXIT" "kill_all_subprocesses"

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Execute commands in background

	eval "$CMDS" \
		&>/dev/null \
		2>"$TMP_FILE" &

	cmdsPID=$!

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Show a spinner if the commands
	# require more time to complete.

	show_spinner "$cmdsPID" "$CMDS" "$MSG"

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Wait for the commands to no longer be executing
	# in the background, and then get their exit code.

	wait "$cmdsPID" &>/dev/null
	exitCode=$?

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Print output based on what happened.

	print_result $exitCode "$MSG"

	if [ $exitCode -ne 0 ]; then
		print_error_stream <"$TMP_FILE"
	fi

	rm -rf "$TMP_FILE"

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	return $exitCode
}

get_answer() {
	printf "%s" "$REPLY"
}

get_os() {

	local os=""
	local kernelName=""

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	kernelName="$(uname -s)"

	if [ "$kernelName" == "Darwin" ]; then
		os="macos"
	elif [ "$kernelName" == "Linux" ] &&
		[ -e "/etc/os-release" ]; then
		os="$(
			# shellcheck disable=SC1091
			. /etc/os-release
			printf "%s" "$ID"
		)"
	else
		os="$kernelName"
	fi

	printf "%s" "$os"

}

get_os_version() {

	local os=""
	local version=""

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	os="$(get_os)"

	if [ "$os" == "macos" ]; then
		version="$(sw_vers -productVersion)"
	elif [ -e "/etc/os-release" ]; then
		version="$(
			# shellcheck disable=SC1091
			. /etc/os-release
			printf "%s" "$VERSION_ID"
		)"
	fi

	printf "%s" "$version"

}

is_git_repository() {
	git rev-parse &>/dev/null
}

skip_questions() {

	while :; do
		case $1 in
		-y | --yes) return 0 ;;
		*) break ;;
		esac
		shift 1
	done

	return 1

}

mkd() {
	if [ -n "$1" ]; then
		if [ -e "$1" ]; then
			if [ ! -d "$1" ]; then
				print_error "$1 - a file with the same name already exists!"
			else
				print_success "$1"
			fi
		else
			execute "mkdir -p $1" "$1"
		fi
	fi
}

show_spinner() {

	# local -r FRAMES='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
	local -r FRAMES='⣾⣽⣻⢿⡿⣟⣯⣷'
	# shellcheck disable=SC2034
	local -r NUMBER_OR_FRAMES=${#FRAMES}

	local -r CMDS="$2"
	local -r MSG="$3"
	local -r PID="$1"

	local i=0
	local frameText=""

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Note: In order for the Travis CI site to display
	# things correctly, it needs special treatment, hence,
	# the "is Travis CI?" checks.

	if [ "$TRAVIS" != "true" ]; then

		# Provide more space so that the text hopefully
		# doesn't reach the bottom line of the terminal window.
		#
		# This is a workaround for escape sequences not tracking
		# the buffer position (accounting for scrolling).
		#
		# See also: https://unix.stackexchange.com/a/278888

		printf "\n\n\n"
		tput cuu 3

		tput sc

	fi

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Display spinner while the commands are being executed.

	while kill -0 "$PID" &>/dev/null; do

		frameText="  [ ${FRAMES:i++%NUMBER_OR_FRAMES:1} ] $MSG"

		# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		# Print frame text.

		if [ "$TRAVIS" != "true" ]; then
			printf "%s\n" "$frameText"
		else
			printf "%s" "$frameText"
		fi

		sleep 0.2

		# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		# Clear frame text.

		if [ "$TRAVIS" != "true" ]; then
			tput rc
		else
			printf "\r"
		fi

	done

}
