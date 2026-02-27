#!/bin/bash

# shellcheck disable=SC1091
cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../scripts/utils.sh"

print_sub_heading "Autoupdate cron job"

# setups the auto-update
(
	crontab -l | grep -v "dot_update"
	echo "0 * * */1 * $HOME/.dotfiles/scripts/dot_update > ${TMPDIR:-/tmp}dot_update.log 2>&1"
) | crontab -
