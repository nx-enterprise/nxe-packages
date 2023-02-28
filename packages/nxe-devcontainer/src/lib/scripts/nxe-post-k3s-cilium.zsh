#!/bin/zsh

helm repo add cilium https://helm.cilium.io/

# https://github.com/cilium/cilium/issues/18257 <-- Cilium + Wireguard

if [ -z "$(kubectl get secret cilium-ca -n kube-system | grep cilium-ca)" ]; then

  cilium install \
    --helm-set operator.replicas=2 \
    --helm-set kubeProxyReplacement=strict \
    --helm-set bgpControlPlane.enabled=true \
    --helm-set k8s.requireIPv4PodCIDR=false \
    --helm-set ipv4.enabled=true \
    --helm-set ipv6.enabled=false \
    --helm-set ipv4NativeRoutingCIDR="240.0.0.0/4" \
    --helm-set tunnel=disabled \
    --helm-set ipam.mode=kubernetes \
    --helm-set ipam.operator.clusterPoolIPv4PodCIDR="244.16.0.0/12" \
    --helm-set ipam.operator.clusterPoolIPv4PodCIDRList="{244.16.0.0/12}" \
    --helm-set ipam.operator.clusterPoolIPv4MaskSize=24 \
    --helm-set bandwidthManager.enabled=true \
    --helm-set hostFirewall.enabled=true \
    --helm-set endpointRoutes.enabled=true \
    --helm-set policyEnforcementMode="never" \
    --helm-set localRedirectPolicy=true \
    --helm-set l7Proxy=true \
    --helm-set installIptablesRules=true \
    --helm-set rollOutCiliumPods=true \
    --helm-set bpf.masquerade=true \
    --helm-set bpf.lbExternalClusterIP=true \
    --helm-set ipMasqAgent.enabled=true \
    --helm-set prometheus.enabled=true \
    --helm-set hubble.enabled=true \
    --helm-set monitor.enabled=true \
    --helm-set autoDirectNodeRoutes=true \
    --helm-set pprof.enabled=true \
    --helm-set gatewayAPI.enabled=false \
    --helm-set containerRuntime.integration=containerd \
    --helm-set k8sServiceHost=240.0.0.250 \
    --helm-set k8sServicePort=6443 \
    --helm-set cgroup.autoMount.enabled=true \
    --helm-set cgroup.hostRoot=/run/cilium/cgroupv2 \
    --helm-set tag="v$NXE_CILIUM_VERSION" \
    --helm-set devices=eth0 \
    --helm-set debug.enabled=true \
    --helm-set clustermesh.config.enabled=true \
    --helm-set clustermesh.useAPIServer=true \
    --helm-set clustermesh.apiserver.enabled=true \
    --helm-set clustermesh.apiserver.tls.auto.method=certmanager \
    --helm-set identityAllocationMode=kvstore \
    --helm-set hubble.relay.enable=true \
    --helm-set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
    --version=$NXE_CILIUM_VERSION \
    --helm-auto-gen-values $NXE_WS_DEVCONTAINER/k8s/cilium-values-install.yaml
  cilium install --version=$NXE_CILIUM_VERSION --helm-values $NXE_WS_DEVCONTAINER/k8s/cilium-values-install.yaml

else
  echo 'No need to install cilium, but lets upgrade using helm'
fi

helm template cilium cilium/cilium \
  --namespace kube-system \
  --set upgradeCompatibility=1.13 \
  --set operator.replicas=2 \
	--set kubeProxyReplacement=strict \
  --set bgpControlPlane.enabled=true \
  --set k8s.requireIPv4PodCIDR=false \
  --set tag="v$NXE_CILIUM_VERSION" \
  --set ipv4.enabled=true \
  --set ipv6.enabled=false \
  --set ipv4NativeRoutingCIDR="240.0.0.0/4" \
  --set tunnel=disabled \
  --set ipam.mode=kubernetes \
  --set ipam.operator.clusterPoolIPv4PodCIDR="244.16.0.0/12" \
  --set ipam.operator.clusterPoolIPv4PodCIDRList="{244.16.0.0/12}" \
  --set ipam.operator.clusterPoolIPv4MaskSize=24 \
  --set bandwidthManager.enabled=true \
  --set hostFirewall.enabled=true \
  --set endpointRoutes.enabled=true \
  --set policyEnforcementMode="never" \
  --set localRedirectPolicy=true \
  --set l7Proxy=true \
  --set installIptablesRules=true \
  --set rollOutCiliumPods=true \
  --set bpf.masquerade=true \
  --set bpf.lbExternalClusterIP=true \
  --set ipMasqAgent.enabled=true \
  --set prometheus.enabled=true \
  --set hubble.enabled=true \
  --set monitor.enabled=true \
  --set autoDirectNodeRoutes=true \
  --set pprof.enabled=true \
  --set gatewayAPI.enabled=false \
  --set containerRuntime.integration=auto \
  --set k8sServiceHost=240.0.0.250 \
  --set k8sServicePort=6443 \
  --set cgroup.autoMount.enabled=true \
  --set cgroup.hostRoot=/run/cilium/cgroupv2 \
  --set devices=eth0 \
  --set debug.enabled=true \
  --set clustermesh.config.enabled=true \
  --set clustermesh.useAPIServer=true \
  --set clustermesh.apiserver.enabled=true \
  --set clustermesh.apiserver.tls.auto.method=certmanager \
  --set identityAllocationMode=kvstore \
  --set hubble.relay.enable=true \
  --set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
  --version=$NXE_CILIUM_VERSION \
  > $NXE_WS_DEVCONTAINER/k8s/cilium-helm-values-install.yaml
kubectl apply -f $NXE_WS_DEVCONTAINER/k8s/cilium-helm-values-install.yaml
