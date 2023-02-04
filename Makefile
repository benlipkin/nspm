SHELL := /usr/bin/env bash
IMAGE = nspm:latest
PORT = 4000
SERVE = "jekyll serve --watch --incremental --host 0.0.0.0"
.DEFAULT_GOAL := help

## help      : print available build commands.
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## build     : build the docker image.
.PHONY : build
build :
	@docker build . --file Dockerfile --tag $(IMAGE)

## serve     : serve the containerized application.
.PHONY : serve
serve : build
	@docker run -p $(PORT):$(PORT) $(IMAGE) $(SERVE)

## clean     : remove build artifacts.
.PHONY : clean
clean :
	@docker system prune -af