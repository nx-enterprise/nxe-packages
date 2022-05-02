# Nx Enterprise

## Dev Environment Minimum Requirements

Instructions assume a Windows 10/11 process.env.

- Install and initialize [Dapr](https://docs.dapr.io/getting-started/install-dapr-cli/)
- Install [Docker Desktop](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
- Install [Git Credential Manager Core](https://github.com/GitCredentialManager/git-credential-manager)
- Install [Visual Studio Code](https://code.visualstudio.com/)
- Install this version of [NVM for Windows](https://github.com/coreybutler/nvm-windows/releases) and then add a few necessary global packages to your system:
  ```bash
  npm -g install nx yarn typescript npm@latest
  ```

## Development Runtime

To get started developing, it is as simple as eating good pie. Don't forget to start by installing NodeJS packages: `yarn install`

### Using Dapr Runtime

We the Dapr runtime to make things as lighweight as possible. This is "thinner and lighter" that executing Dapr within Docker containers, such as the **docker-compose** method.

```sh
# start all frontend and backend apps concurrently with Dapr
yarn dev # which also runs 'yarn env.set.development' to set environment vars

# stop serving
# "Ctrl + C"
```
