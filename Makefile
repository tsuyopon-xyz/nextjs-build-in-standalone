.PHONY: help build build-local up down logs ps test
.DEFAULT_GOAL := help

DOCKER_TAG := latest
REPOSITORY_NAME := nextjs-build-in-standalone
build: ## Build docker image to deploy
	docker build -t tsuyopon-xyz/${REPOSITORY_NAME}:${DOCKER_TAG} \
		--target runner ./

run-local: ## Run docker image for deploy locally
	docker run --rm -p 28000:8080 tsuyopon-xyz/${REPOSITORY_NAME}:latest

up: ## Do docker compose up with hot reload
	docker compose up -d

down: ## Do docker compose down
	docker compose down

logs: ## Tail docker compose logs
	docker compose logs -f

ps: ## Check container status
	docker compose ps

help: ## Show options
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'