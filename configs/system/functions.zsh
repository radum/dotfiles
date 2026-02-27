#!/bin/bash
# shellcheck disable=SC2164,SC2039,SC2155,SC1087,SC2154,SC2162,SC2086,SC2199

# Create a new directory and enter it
mkd() {
	mkdir -p "$@" && cd "$_"
}

# Change working directory to the top-most Finder window location
cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Determine size of a file or total size of a directory
fs() {
	if du -b /dev/null >/dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* ./*
	fi
}

# Create a data URL from a file
dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Start an HTTP server from a directory, optionally specifying the port
server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python3 -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
v() {
	if [ $# -eq 0 ]; then
		vim .
	else
		vim "$@"
	fi
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
# TODO: Prezto alias
# o() {
# 	if [ $# -eq 0 ]; then
# 		open .
# 	else
# 		open "$@"
# 	fi
# }

# Find and fetch weather for any given location, defaulting to Munich, Germany
wttr() {
	curl -4 wttr.in/${1:-london}
}

# A quick approximation of self-written LOC in a directory across languages,
# ignoring things like node_modules, .nuxt, package-lock.json, etc. by default
loc() {
	tokei -e=package-lock.json --sort=lines | bat --style=plain # tokei ignores node_modules and hidden dirs by default
}

# Delete all screenshots in ~/Desktop (safely, e.g. using `trash` instead of `rm`)
deletescreenshots() {
	find ~/Desktop -type f -name "Screen Shot*" -exec trash {} \;
}

# Clear clipboard contents
clearclipboard() {
	pbcopy </dev/null
}
