#!/usr/bin/env bash
set -e

pushd /tmp
# Detect OS name and machine architecture
OS=$(uname -s)
ARCH=$(uname -m)

# Set golang version
GOVERSION=go1.20.1

# Set download URL based on OS and ARCH
case $OS in
Linux)
  case $ARCH in
  x86_64)
    URL=https://golang.org/dl/$GOVERSION.linux-amd64.tar.gz
    ;;
  i686)
    URL=https://golang.org/dl/$GOVERSION.linux-386.tar.gz
    ;;
  aarch64)
    URL=https://golang.org/dl/$GOVERSION.linux-arm64.tar.gz
    ;;
  arm64)
    URL=https://golang.org/dl/$GOVERSION.linux-arm64.tar.gz
    ;;
  armv6l)
    URL=https://golang.org/dl/$GOVERSION.linux-armv6l.tar.gz
    ;;
  armv8l)
    URL=https://golang.org/dl/$GOVERSION.linux-arm64.tar.gz
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
    URL=https://golang.org/dl/$GOVERSION.darwin-amd64.tar.gz
    ;;
  aarch64)
    URL=https://golang.org/dl/$GOVERSION.darwin-arm64.tar.gz
    ;;
  arm64)
    URL=https://golang.org/dl/$GOVERSION.darwin-arm64.tar.gz
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

# Download golang binary using wget or curl
if command -v wget &>/dev/null; then
  wget -O go.tgz "$URL"
elif command -v curl &>/dev/null; then
  curl -o go.tgz "$URL"
else
  echo "Please install wget or curl"
  exit 1
fi

# Extract golang binary
tar -vxzf go.tgz && rm go.tgz
cp go/bin/* /usr/local/bin/
mv go /usr/local/go
chmod +x /usr/local/bin/*

# test
go version

# Print success message
echo "Golang $GOVERSION installed successfully!"

# cleanup
exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
