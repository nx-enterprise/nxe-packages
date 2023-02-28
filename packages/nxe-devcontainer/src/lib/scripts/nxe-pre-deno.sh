#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

# Detect OS name and machine architecture
OS=$(uname -s)
ARCH=$(uname -m)

# Set download URL based on OS and ARCH
case $OS in
Linux)
  case $ARCH in
  x86_64)
    su $USERNAME -c 'curl -fsSL https://deno.land/x/install/install.sh | sh'
    ;;
  i686)
    su $USERNAME -c 'curl -fsSL https://deno.land/x/install/install.sh | sh'
    ;;
  aarch64)
    echo "Unsupported architecture: $ARCH"
    ;;
  arm64)
    echo "Unsupported architecture: $ARCH"
    ;;
  armv6l)
    echo "Unsupported architecture: $ARCH"
    ;;
  armv8l)
    echo "Unsupported architecture: $ARCH"
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
    su $USERNAME -c 'curl -fsSL https://deno.land/x/install/install.sh | sh'
    ;;
  aarch64)
    su $USERNAME -c 'curl -fsSL https://deno.land/x/install/install.sh | sh'
    ;;
  arm64)
    su $USERNAME -c 'curl -fsSL https://deno.land/x/install/install.sh | sh'
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

popd
