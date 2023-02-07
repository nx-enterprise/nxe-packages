#!make
MAKEFLAGS += --silent --job=10

include packages/nxe-devcontainer/Makefile
NxeMakefile := $(NXE_MAKEFILE_DIR)/Makefile

# read in the environment variables
environment ?= development
$(shell cp .env-$(environment) .env)
$(shell cp .env-$(environment) .devcontainer/.env)
$(shell cp .env-$(environment) packages/nxe-devcontainer/src/lib/.env)
include .env
export $(shell sed 's/=.*//' .env)

# trick variables
noop =
comma := ,
space = $(noop) $(noop)

# build the base first, then everything else
nxe.images.build:
	$(MAKE) -f $(NxeMakefile) $@

docker.system.cleanup:
	docker system prune -a -f
	docker image prune -a

# leave this at the end, and leave it blank as it will force the run of it
FORCE:
