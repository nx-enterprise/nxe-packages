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

docker.cleanup:
	$(shell .devcontainer/scripts/devcontainer-cleanup.sh)

docker.system.cleanup:
	docker system prune -a -f
	docker image prune -a
	docker volume prune

kube.whoami:
	kubectl apply -f $(NXE_CONFIG)/k3s-whoami.yaml
	kubectl port-forward svc/whoami 8080:5678 -n nx-enterprise

kube.io.services:
	kubectl get services -o wide --all-namespaces

kube.portainer:
	kubectl port-forward svc/portainer 9443:9443 -n portainer

kube.clean:
	kubectl get nodes -o wide
	kubectl delete nodes $(shell kubectl get nodes -n kube-system | grep NotReady | awk '{print $$1}' | paste -s -d' ' -)
	kubectl get nodes -o wide

apt.tools:
	sudo apt update && sudo apt install iputils-ping inetutils-traceroute net-tools ipcalc bpfcc-tools -y

# leave this at the end, and leave it blank as it will force the run of it
FORCE:
