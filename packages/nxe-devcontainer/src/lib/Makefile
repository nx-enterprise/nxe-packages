#!make
MAKEFLAGS += --silent --job=10

include .env
export $(shell sed 's/=.*//' .env)

nxe.images.build:
	docker compose -f ${NXE_DEVCONTAINER_LIB}/docker-compose.nxe.images.yml build base
	docker compose -f ${NXE_DEVCONTAINER_LIB}/docker-compose.nxe.images.yml build kitchen-sink
