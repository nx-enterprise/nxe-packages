#!/bin/bash
#set -e

pushd /tmp # safely execute scripts from /tmp/scripts

OS=$(uname -s)
ARCH=$(uname -m)

# Set golang version
KUBECTLVERSION=1.26.0

# Set download URL based on OS and ARCH
case $OS in
Linux)
  case $ARCH in
  x86_64)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/linux/amd64/kubectl
    ;;
  i686)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/linux/386/kubectl
    ;;
  aarch64)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/linux/arm64/kubectl
    ;;
  arm64)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/linux/arm64/kubectl
    ;;
  armv6l)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/linux/armv6l/kubectl
    ;;
  armv8l)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/linux/armv8l/kubectl
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
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/darwin/amd64/kubectl
    ;;
  aarch64)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/darwin/arm64/kubectl
    ;;
  arm64)
    URL=https://dl.k8s.io/release/v$KUBECTLVERSION/bin/darwin/arm64/kubectl
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
  wget -O kubectl $URL
  wget -O kubectl.sha256 $URL.sha256
elif command -v curl &>/dev/null; then
  curl -o kubectl $URL
  curl -o kubectl.sha256 $URL.sha256
else
  echo "Please install wget or curl"
  exit 1
fi

# validate checksum
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# move to /usr/local/bin
mv kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

# install k9s
su $USERNAME -c 'curl -sS https://webinstall.dev/k9s | bash'
mv /root/.local/opt/k9s*/bin/k9s /usr/local/bin && chown -R $USERNAME:$USERNAME /usr/local/bin/k9s && chmod +x /usr/local/bin/k9s
rm -Rf /root/.local/opt/k9s*

# install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# move webi
mv /root/.local/opt/webi* /usr/local/bin/webi && chmod +x /usr/local/bin/webi && chown $USERNAME:$USERNAME /usr/local/bin/webi

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
