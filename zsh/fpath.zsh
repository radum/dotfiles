#!/bin/zsh
# Add each topic folder to fpath so that they can add functions and completion scripts
# TODO: Better document this, especialy in realation to zsh config $DOTFILES/functions autoload
for topic_folder in $DOTFILES/*; do
	if [ -d "$topic_folder" ]; then
		fpath=($topic_folder $fpath)
	fi
done
