#!/bin/bash

print_sub_heading "Docker"

print_task "Add Docker ZSH completion files to 'HOME/.docker/completions'"

mkdir -p "$HOME/.docker/completions"

if command -v docker-compose >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
		-o "$HOME/.docker/completions/_docker-compose"

	print_result $? "docker-compose completion installed"
fi
if command -v docker-machine >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/machine/master/contrib/completion/zsh/_docker-machine \
		-o "$HOME/.docker/completions/_docker-machine"

	print_result $? "docker-machine completion installed"
fi
if command -v docker >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
		-o "$HOME/.docker/completions/_docker"

	print_result $? "docker completion installed"
fi
