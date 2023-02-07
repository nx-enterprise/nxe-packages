#!/bin/zsh
pushd $NXE_SCRIPTS # safely execute scripts from /tmp/scripts

# required to run this at startup
source "${NXE_SCRIPTS}/init-postCreate-base.sh" && echo "Sourced ${NXE_SCRIPTS}/init-postCreate-base.sh"


##
## These scripts run AFTER the container is built.
## And MUST be run sequentially... note the '&& \'
##


# # Mac M1 compat

# #RUN python3 -m ensurepip
# #RUN pip3 install --no-cache --upgrade pip setuptools

# # # [Option] Enable non-root Docker access in container
# # ARG ENABLE_NONROOT_DOCKER="true"
# # # [Option] Use the OSS Moby CLI instead of the licensed Docker CLI
# # ARG USE_MOBY="true"

# # ARG USERNAME=vscode

# # # Install needed packages and setup non-root user. Use a separate RUN statement to add your
# # # own dependencies. A user of "automatic" attempts to reuse an user ID if one already exists.
# # COPY scripts/docker-debian.sh /tmp/scripts/
# # RUN apt-get update --allow-insecure-repositories \
# #   # Use Docker script from script library to set things up
# #   && /bin/bash /tmp/scripts/docker-debian.sh "${ENABLE_NONROOT_DOCKER}" "/var/run/docker-host.sock" "/var/run/docker.sock" "${USERNAME}" \
# #   # Install Dapr
# #   && wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash \
# #   # Clean up
# #   && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/scripts/

# # Add daprd to the path for the VS Code Dapr extension.
# ENV PATH "$PATH:/home/${USERNAME}/.dapr/bin"

# # [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#   && apt-get -y install --no-install-recommends \
#   curl git-core gnupg locales zsh wget fonts-powerline fontconfig \
#   g++ make python3 glibc-source ruby-full build-essential procps curl file \
#   # set up locale
#   && locale-gen en_US.UTF-8

# # generate locale for agnoster
# #RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && /usr/sbin/locale-gen
# # the user we're applying this too (otherwise it most likely install for root)
# #USER vscode
# #ENV TERM xterm
# # Set the default shell to bash rather than sh
# ENV SHELL /bin/zsh

# # starship
# RUN su vscode -c "curl -sS https://starship.rs/install.sh | sh -s -- -y" 2>&1

# # git safety, people :D ... and ensure GCM works the way its supposed to
# RUN git config --system --add safe.directory /nxe-apps-ws
# RUN git config --system credential.useHttpPath true
# RUN git config --system core.checkStat minimal
# RUN git config --system core.trustctime false

# ENV PNPM_HOME /home/vscode/.pnpm
# #RUN su vscode -c "PATH='$PATH:/home/vscode/.pnpm'; /usr/local/share/nvm/nvm.sh && pnpm add -g nx npm pnpm" 2>&1

popd
