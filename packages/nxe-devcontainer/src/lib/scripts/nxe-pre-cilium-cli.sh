#!/bin/bash
#set -e

pushd /tmp # safely execute scripts from /tmp/scripts

OS=$(uname -s)
ARCH=$(uname -m)

if [ -z "$NXE_CILIUM_CLI_VERSION" ]; then
  NXE_CILIUM_CLI_VERSION=0.13.0
fi
CILIUM_CLI_VERSION=v$NXE_CILIUM_CLI_VERSION

if [ "$ARCH" = "aarch64" ]; then
  ARCH=arm64
fi

# Set download URL based on OS and ARCH
case $OS in
Linux)
  case $ARCH in
  x86_64)
    URL=https://github.com/cilium/cilium-cli/releases/download/$CILIUM_CLI_VERSION/cilium-linux-amd64.tar.gz
    ;;
  i686)
    URL=https://github.com/cilium/cilium-cli/releases/download/$CILIUM_CLI_VERSION/cilium-linux-386.tar.gz
    ;;
  arm64)
    URL=https://github.com/cilium/cilium-cli/releases/download/$CILIUM_CLI_VERSION/cilium-linux-arm64.tar.gz
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
  esac
  ;;
Darwin)
  case $ARCH in
  x86_64)
    URL=https://github.com/cilium/cilium-cli/releases/download/$CILIUM_CLI_VERSION/cilium-darwin-amd64.tar.gz
    ;;
  arm64)
    URL=https://github.com/cilium/cilium-cli/releases/download/$CILIUM_CLI_VERSION/cilium-darwin-arm64.tar.gz
    ;;
  *)
    echo "Unsupported architecture:  $ARCH"
    exit 1
    ;;
  esac
  ;;
*)
  echo "Unsupported operating system: $OS"
  exit 1
  ;;
esac

# Download kubectl binary and checksum using wget or curl
if command -v wget &>/dev/null; then
  wget $URL
  wget $URL.sha256sum
elif command -v curl &>/dev/null; then
  curl $URL
  curl $URL.sha256sum
else
  echo "Please install wget or curl"
  exit 1
fi

# validate cilium checksum
sha256sum --check cilium-linux-$ARCH.tar.gz.sha256sum

# install cilium cli
tar xzvfC cilium-linux-$ARCH.tar.gz /usr/local/bin
rm cilium-linux-$ARCH.tar.gz{,.sha256sum}

chown -R $USERNAME:$USERNAME /usr/local/bin/cilium

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
