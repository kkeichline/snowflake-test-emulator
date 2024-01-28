# Makefile

# Define commands
PIPENV = pipenv
PYTHON = $(PIPENV) run python
FLASK = $(PIPENV) run flask
DOCKER_COMPOSE = docker-compose

# Define target for setting up the environment
init:
	$(PIPENV) install --dev

# Define target for activating the virtual environment
shell:
	$(PIPENV) shell

# Install packages ("make install PACKAGE=flask")
install:
	$(PIPENV) install $(PACKAGE)
	$(PIPENV) lock

# install from requirements.txt if available
install-req:
	$(PIPENV) install -r requirements.txt
	$(PIPENV) lock

# Define target for running the application
run:
	$(FLASK) run

# Define target for running tests
test:
	$(PIPENV) run pytest

# Define target for building the Docker image
docker-build:
	$(DOCKER_COMPOSE) build

# Define target for running the Docker container
docker-up:
	$(DOCKER_COMPOSE) up

# help: Show this help message
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  setup         to setup the environment"
	@echo "  shell         to activate the virtual environment"
	@echo "  run           to run the application"
	@echo "  test          to run tests"
	@echo "  docker-build  to build the Docker image"
	@echo "  docker-up     to run the Docker container"
	@echo "  help          to show this help message"
