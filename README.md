# Nx Enterprise

## Why? ... from the Maintainer
My company [Snyder Tech](https://snyder.tech) has standardized most of its new projects to combine the following tech:
- Nrwl's [Nx](https://nx.dev)
- [Nx Cloud](https://nx.app/)
- [AgentEnder](https://github.com/AgentEnder)'s excellent [@nx-dotnet](https://www.nx-dotnet.com/)
- Angular + React Frontends, with NestJS/NodeJS backends
- [Dapr](https://dapr.io/)
- Kubernetes via [K3s](https://k3s.io/)
)
- [Docker](https://www.docker.com/)
- Amazing CLI tooling via ZSH + [Oh-My-Zsh](https://ohmyz.sh/)

This repo brings it all together, with almost as much effort as a click of a button! This is an excellent way to get started learning micro-services and kubernetes -- which is difficult for most developers at every stage of their modernizaiton journey.

## Pre-release
This repository is a WIP and packages are experimental. We will publish (and republish) on npmjs when ready.
## Build images
We do not publish multi-arch docker images yet and make them available online. You need to clone this repo to you localhost and build images to use them.

After cloning this repo: `make nxe.images.build`


## Known Issues
We're anxiously waiting for this to close to speed up builds: [Incrementally copy features near the layer they're installed #382](https://github.com/devcontainers/cli/pull/382)
