#!/bin/bash

pushd /tmp # safely execute scripts from /tmp/scripts
echo "Started running: scripts/init-postCreate-base.sh"

# ~/nxe.log
touch $NXE_HOME/nxe.log
chown -R $USERNAME:$USERNAME $NXE_HOME/nxe.log
whoami

# ~/bin/
mkdir -p $NXE_HOME/bin/

# #
# # ZSH + oh my zsh
# ########################################
rm $NXE_HOME/.zshrc
rm $NXE_HOME/.antigenrc
ln -s $NXE_SHELL/.zshrc $NXE_HOME/.zshrc
ln -s $NXE_SHELL/.antigenrc $NXE_HOME/.antigenrc

source $NXE_HOME/.zshrc

# ignore files that we persist across sessions
sudo chown -R $USERNAME:$USERNAME $NXE_WS/.devcontainer
mkdir -p $NXE_WS_DEVCONTAINER/persist/
touch $NXE_WS_DEVCONTAINER/persist/.gitignore
echo "*" > $NXE_WS_DEVCONTAINER/persist/.gitignore

# add dapr cli in case 'the people' want it :)
source $NXE_SCRIPTS/nxe-post-dapr-cli.zsh && echo "Sourced ${NXE_SCRIPTS}/nxe-post-dapr-cli.zsh" # before postStart
source $NXE_SCRIPTS/nxe-post-k3s.zsh && echo "Sourced ${NXE_SCRIPTS}/nxe-post-k3s.zsh" # before postStart

# install PNPM and Node stuff
sudo chown -R $USERNAME:$USERNAME $NXE_WS/node_modules
source $NXE_SCRIPTS/nxe-post-pnpm.zsh             # install pnpm
source $NXE_SCRIPTS/nxe-post-node-packages.zsh    # node stuff

# set permissions
nohup sh -c 'sudo chown -R $USERNAME:$USERNAME $NXE_HOME' > $NXE_HOME/nxe.log 2>&1 &
nohup sh -c 'sudo chown -R $USERNAME:$USERNAME $NXE_WS' > $NXE_HOME/nxe.log 2>&1 &
nohup sh -c 'sudo chown -R $USERNAME:$USERNAME $NXE_SCRIPTS' > $NXE_HOME/nxe.log 2>&1 &
nohup sh -c 'sudo chown -R $USERNAME:$USERNAME $NXE_SHELL' > $NXE_HOME/nxe.log 2>&1 &
nohup sh -c 'sudo chown -R $USERNAME:$USERNAME $NXE_DAPR' > $NXE_HOME/nxe.log 2>&1 &

##
## These scripts run AFTER the container is built.
##

# # Mac M1 compat
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# # Install python/pip
# ENV PYTHONUNBUFFERED=1
# #RUN python3 -m ensurepip
# #RUN pip3 install --no-cache --upgrade pip setuptools

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

# # the user we're applying this too (otherwise it most likely install for root)
# #USER vscode
# #ENV TERM xterm
# # Set the default shell to bash rather than sh
#

# ENV PNPM_HOME /home/vscode/.pnpm
# #RUN su vscode -c "PATH='$PATH:/home/vscode/.pnpm'; /usr/local/share/nvm/nvm.sh && pnpm add -g nx npm pnpm" 2>&1

echo "Finished running: scripts/init-postCreate-base.sh"
popd
