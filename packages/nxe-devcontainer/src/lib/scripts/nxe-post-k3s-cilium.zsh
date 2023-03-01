#!/bin/zsh

helm repo add cilium https://helm.cilium.io/

# https://github.com/cilium/cilium/issues/18257 <-- Cilium + Wireguard

if [ -z "$(kubectl get secret cilium-ca -n kube-system | grep cilium-ca)" ]; then

  cilium install \
    --namespace kube-system \
    --helm-set tunnel=geneve \
    --helm-set kubeProxyReplacement=partial \
    --helm-set k8sServiceHost=240.0.0.250 \
    --helm-set k8sServicePort=6443 \
    --helm-set endpointRoutes.enabled=true \
    --helm-set ipam.operator.clusterPoolIPv4MaskSize=24 \
    --helm-set ipam.operator.clusterPoolIPv4PodCIDR="244.16.0.0/12" \
    --helm-set ipam.operator.clusterPoolIPv4PodCIDRList="{244.16.0.0/12}" \
    --helm-set bpf.masquerade=true \
    --helm-set hostFirewall.enabled=true \
    --helm-set containerRuntime.integration=containerd \
    --helm-set ipam.mode=cluster-pool \
    --helm-set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
    --version=$NXE_CILIUM_VERSION \
    --helm-auto-gen-values $NXE_WS_DEVCONTAINER/k8s/cilium-values-install.yaml
  cilium install --version=$NXE_CILIUM_VERSION --helm-values $NXE_WS_DEVCONTAINER/k8s/cilium-values-install.yaml

else
  echo 'No need to install cilium, but lets upgrade using helm'
fi

helm template cilium cilium/cilium \
  --namespace kube-system \
  --set tunnel=geneve \
  --set kubeProxyReplacement=partial \
  --set k8sServiceHost=240.0.0.250 \
  --set k8sServicePort=6443 \
  --set endpointRoutes.enabled=true \
  --set ipam.operator.clusterPoolIPv4MaskSize=24 \
  --set ipam.operator.clusterPoolIPv4PodCIDR="244.16.0.0/12" \
  --set ipam.operator.clusterPoolIPv4PodCIDRList="{244.16.0.0/12}" \
  --set bpf.masquerade=true \
  --set hostFirewall.enabled=true \
  --set containerRuntime.integration=containerd \
  --set ipam.mode=cluster-pool \
  --set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
  --version=$NXE_CILIUM_VERSION \
  > $NXE_WS_DEVCONTAINER/k8s/cilium-helm-values-install.yaml
kubectl apply -f $NXE_WS_DEVCONTAINER/k8s/cilium-helm-values-install.yaml
