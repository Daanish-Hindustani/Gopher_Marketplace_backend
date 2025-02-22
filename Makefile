
# Development targets
# -------------

.PHONY: install
install: ## Install dependencies
	poetry install

.PHONY: update
update: ## Install dependencies
	poetry update

.PHONY: lock
update-lock: ## Update lock file
	poetry lock

.PHONY: run
run: start

.PHONY: start
start: ## Starts the server
	$(eval include .env)
	$(eval export $(sh sed 's/=.*//' .env))

	poetry run python main.py


# Check, lint and format targets
# ------------------------------

.PHONY: check
check: check-format lint

.PHONY: check-format
check-format: ## Dry-run code formatter
	poetry run black ./ --check
	poetry run isort ./ --profile black --check

.PHONY: lint
lint: ## Run linter
	poetry run pylint ./api ./app ./core
 
.PHONY: format
format: ## Run code formatter
	poetry run black ./
	poetry run isort ./ --profile black

.PHONY: check-lockfile
check-lockfile: ## Compares lock file with pyproject.toml
	poetry lock --no-update