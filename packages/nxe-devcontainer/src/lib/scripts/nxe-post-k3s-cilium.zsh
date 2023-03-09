#!/bin/zsh

# sudo apt install gcc build-essential make arping net-tools iputils-ping -y

helm repo add cilium https://helm.cilium.io/

# https://github.com/cilium/cilium/issues/18257 <-- Cilium + Wireguard

if [ -z "$(kubectl get secret cilium-ca -n kube-system | grep cilium-ca)" ]; then

  # cilium install \
  #   --namespace kube-system \
  #   --helm-set tunnel=geneve \
  #   --helm-set kubeProxyReplacement=strict \
  #   --helm-set loadBalancer.algorithm=maglev \
  #   --helm-set loadBalancer.mode=hybrid \
  #   --helm-set loadBalancer.acceleration=native \
  #   --helm-set loadBalancer.l7.backend=envoy \
  #   --helm-set loadBalancer.l7.algorithm=least_request \
  #   --helm-set ingressController.enabled=true \
  #   --helm-set ingressController.loadbalancerMode=dedicated \
  #   --helm-set gatewayAPI.enabled=true \
  #   --helm-set endpointRoutes.enabled=true \
  #   --helm-set k8sServiceHost=172.20.3.1 \
  #   --helm-set k8sServicePort=6443 \
  #   --helm-set ipv4NativeRoutingCIDR="172.20.2.0/23" \
  #   --helm-set ipam.operator.clusterPoolIPv4MaskSize=24 \
  #   --helm-set ipam.operator.clusterPoolIPv4PodCIDR="10.244.0.0/12" \
  #   --helm-set ipam.operator.clusterPoolIPv4PodCIDRList="{10.244.0.0/12}" \
  #   --helm-set bpf.masquerade=true \
  #   --helm-set hostFirewall.enabled=false \
  #   --helm-set containerRuntime.integration=containerd \
  #   --helm-set ipam.mode=kubernetes \
  #   --helm-set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
  #   --helm-set cluster.name=cluster \
  #   --helm-set cluster.id=1 \
  #   --helm-set clustermesh.config.enabled=true \
  #   --helm-set clustermesh.useAPIServer=true \
  #   --helm-set clustermesh.apiserver.replicas=2 \
  #   --helm-set hubble.relay.enabled=true \
  #   --helm-set hubble.ui.enabled=true \
  #   --helm-set hubble.peerService.clusterDomain=cluster.local \
  #   --version=$NXE_CILIUM_VERSION \
  #   --helm-auto-gen-values $NXE_WS_DEVCONTAINER/persist/cilium-values-install.yaml
  # cilium install --version=$NXE_CILIUM_VERSION --helm-values $NXE_WS_DEVCONTAINER/persist/cilium-values-install.yaml

#    --helm-set clustermesh.apiserver.tls.auto.method=certmanager \

else
  echo 'No need to install cilium, but lets upgrade using helm'
fi

# helm template cilium cilium/cilium \
#   --namespace kube-system \
#   --set operator.replicas=3 \
#   --set tunnel=disabled \
#   --set autoDirectNodeRoutes=false `# unable to lookup route for node <nil>` \
#   --set kubeProxyReplacement=strict \
#   --set loadBalancer.standalone=false `# not sure why this isn't working` \
#   --set loadBalancer.algorithm=maglev \
#   --set loadBalancer.mode=hybrid `# what happens?` \
#   --set loadBalancer.acceleration=native \
#   --set loadBalancer.l7.backend=envoy \
#   --set loadBalancer.serviceTopology=true \
#   --set loadBalancer.l7.algorithm=least_request \
#   --set l7Proxy=true \
#   --set rollOutCiliumPods=true \
#   --set nodeInit.enabled=true \
#   --set k8sServiceHost=172.20.3.1 \
#   --set k8sServicePort=6443 \
#   --set socketLB.enabled=true \
#   --set socketLB.hostNamespaceOnly=true \
#   --set ingressController.enabled=true \
#   --set ingressController.loadbalancerMode=shared \
#   --set gatewayAPI.enabled=true \
#   --set endpointRoutes.enabled=false `# Disables BPF if enabled. Enable use of per endpoint routes instead of routing via the cilium_host interface.` \
#   --set ipam.operator.clusterPoolIPv4MaskSize=24 \
#   --set ipam.operator.clusterPoolIPv4PodCIDR="10.244.0.0/16" \
#   --set ipam.operator.clusterPoolIPv4PodCIDRList="{10.244.0.0/16}" \
#   --set ipv4NativeRoutingCIDR="172.20.2.0/23" `# maybe should be 172.20.3.0/24 ` \
#   --set ipMasqAgent.enabled=false \
#   --set enableIPv4Masquerade=true \
#   --set bpf.masquerade=true `# Enable native IP masquerade support in eBPF` \
#   --set bpf.clockProbe=true \
#   --set bpf.preallocateMaps=true \
#   --set bpf.tproxy=true \
#   --set bpf.hostLegacyRouting=false `# traffic via host stack (true) or directly and more efficiently out of BPF (false)` \
#   --set bpf.lbExternalClusterIP=true `# Allow cluster external access to ClusterIP services.` \
#   --set bgp.enabled=false `# true not supported with ipam.mode=cluster-pool-v2beta ` \
#   --set bgp.announce.loadbalancerIP=false `# true not supported with ipam.mode=cluster-pool-v2beta ` \
#   --set bgp.announce.podCIDR=false `# true not supported with ipam.mode=cluster-pool-v2beta ` \
#   --set cleanState=false \
#   --set cleanBpfState=false \
#   --set hostFirewall.enabled=false \
#   --set containerRuntime.integration=containerd \
#   --set ipam.mode=cluster-pool-v2beta \
#   --set enableRuntimeDeviceDetection=true \
#   --set enableCiliumEndpointSlice=true \
#   --set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
#   --set cluster.name=cluster \
#   --set cluster.id=1 \
#   --set clustermesh.config.enabled=true \
#   --set clustermesh.useAPIServer=true \
#   --set clustermesh.apiserver.replicas=3 \
#   --set hubble.relay.enabled=true \
#   --set hubble.ui.enabled=true \
#   --set hubble.peerService.clusterDomain=cluster.local \
#   --version=$NXE_CILIUM_VERSION \
#   > $NXE_WS_DEVCONTAINER/persist/cilium-helm-values-install.yaml
# kubectl apply -f $NXE_WS_DEVCONTAINER/persist/cilium-helm-values-install.yaml

#  --set clustermesh.apiserver.tls.auto.method=certmanager \

helm template cilium cilium/cilium \
  --namespace kube-system \
  --set tunnel=geneve \
  --set kubeProxyReplacement=partial \
  --set k8sServiceHost=172.20.3.1 \
  --set k8sServicePort=6443 \
  --set endpointRoutes.enabled=true \
  --set ipam.operator.clusterPoolIPv4MaskSize=24 \
  --set ipam.operator.clusterPoolIPv4PodCIDR="10.244.0.0/16" \
  --set ipam.operator.clusterPoolIPv4PodCIDRList="{10.244.0.0/16}" \
  --set bpf.masquerade=true \
  --set hostFirewall.enabled=true \
  --set containerRuntime.integration=containerd \
  --set ipam.mode=cluster-pool \
  --set metrics.enabled="{dns:query;ignoreAAAA,drop,tcp,flow,icmp,http}" \
  --version=$NXE_CILIUM_VERSION \
  > $NXE_WS_DEVCONTAINER/persist/cilium-helm-values-install.yaml
kubectl apply -f $NXE_WS_DEVCONTAINER/persist/cilium-helm-values-install.yaml
