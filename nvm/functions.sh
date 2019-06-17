loadnvm() {
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Disable to make zsh load faster
# loadnvm

# TODO: Make this work
# Initialize worker
# async_init
# async_start_worker nvm_worker -n
# async_register_callback nvm_worker loadnvm
# async_job nvm_worker sleep 0.1
