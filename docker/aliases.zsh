#!/bin/zsh
docker_prune() {
	docker system prune --volumes -fa
}
