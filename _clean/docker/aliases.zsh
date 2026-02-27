#!/bin/bash
docker_prune() {
	docker system prune --volumes -fa
}
