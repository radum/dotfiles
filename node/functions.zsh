#!/bin/bash
loadnvm() {
	if [ "$(uname -s)" = "Linux" ]; then
		export NVM_DIR="$HOME/.config/nvm"
	fi

	# shellcheck disable=SC1090
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	# shellcheck disable=SC1090
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

# Disable to make zsh load faster
# loadnvm

# TODO: Make this work
# Initialize worker
# async_init
# async_start_worker nvm_worker -n
# async_register_callback nvm_worker loadnvm
# async_job nvm_worker sleep 0.1
