#!make
MAKEFLAGS += --silent --job=10

# read in the environment variables
environment ?= development
$(shell cp .env-$(environment) .env)
$(shell cp .env-$(environment) .devcontainer/.env)
$(shell cp .env-$(environment) packages/nxe-devcontainer/src/lib/.env)
include .env
export $(shell sed 's/=.*//' .env)

include $(NXE_DEVCONTAINER_LIB)/Makefile
NxeMakefile := $(NXE_DEVCONTAINER_LIB)/Makefile

# trick variables
noop =
comma := ,
space = $(noop) $(noop)

# build the base first, then everything else
nxe.images.build:
	$(MAKE) -f $(NxeMakefile) $@

cilium.route-list:
	kubectl -n kube-system exec ds/cilium -- ip route list scope global

docker.system.cleanup:
	docker system prune -a -f
	docker image prune -a
	docker volume prune

kube.whoami:
	kubectl apply -f $(NXE_CONFIG)/k3s-whoami.yml
	kubectl port-forward svc/whoami 8080:5678

apt.ping:
	sudo apt update && sudo apt install iputils-ping

# leave this at the end, and leave it blank as it will force the run of it
FORCE:
