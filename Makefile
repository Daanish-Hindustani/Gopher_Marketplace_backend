
# Development targets
# -------------

.PHONY: install
install: ## Install dependencies
	poetry install

.PHONY: update
update: ## Install dependencies
	poetry update

.PHONY: run
run: start

.PHONY: start
start: ## Starts the server
	$(eval include .env)
	$(eval export $(sh sed 's/=.*//' .env))

	poetry run python main.py
