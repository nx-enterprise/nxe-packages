#!/bin/bash
pushd /tmp # safely execute scripts from /tmp/scripts

apt update && export DEBIAN_FRONTEND=noninteractive &&
  apt -y install --no-install-recommends \
    debian-keyring debian-archive-keyring apt-transport-https

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

apt update
apt-get install caddy libnss3-tools  -y

# link it up
if [ -f /etc/caddy/Caddyfile ]; then rm /etc/caddy/Caddyfile; fi
ln -s $NXE_CONFIG/apps.Caddyfile /etc/caddy/Caddyfile

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
