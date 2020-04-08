#!/bin/bash

###############################################################################
# Fonts                                                                       #
# https://gist.github.com/Kevin-Lee/328e9993d6b3ad250636023fb2c7827f          #
###############################################################################

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Fonts"

the_fonts_dir="$HOME/.dotfiles/fonts/sources"
info "Fonts dir: $the_fonts_dir"

find_command="find \"$the_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ $(uname) == 'Darwin' ]]; then
	# MacOS
	font_dir="$HOME/Library/Fonts"
else
	# Linux
	font_dir="$HOME/.local/share/fonts"
	mkdir -p "$font_dir"
fi

# Copy all fonts to user fonts directory
info "Copying fonts..."

eval "$find_command" | xargs -0 -I % cp "%" "$font_dir/"

# Printing
eval "$find_command" | xargs -0 -I % echo "  [ ✔ ] % → $font_dir"

# Reset font cache on Linux
if command -v fc-cache @ >/dev/null; then
	print_warning "Resetting font cache, this may take a moment..."
	fc-cache -f "$font_dir"
fi

print_success "All fonts have been installed to $font_dir"
