#!/bin/zsh

# run this script to make sure cilium can run
source $NXE_SCRIPTS/nxe-post-k3s-cilium-nohup.zsh

sudo apt update && sudo apt install iputils-ping inetutils-traceroute net-tools ipcalc -y

#kubectl apply -f $NXE_CONFIG/k3s-kuberouter.yaml


# curl https://kube-vip.io/manifests/rbac.yaml > $NXE_CONFIG/k3s-kubevip-rbac.yaml
# curl https://raw.githubusercontent.com/kube-vip/kube-vip-cloud-provider/main/manifest/kube-vip-cloud-controller.yaml > $NXE_CONFIG/k3s-kubevip-ccm.yaml

# export VIP=172.20.3.254
# export INTERFACE=eth0
# export KVVERSION=v0.5.11
# alias kube-vip="docker run --network host --rm ghcr.io/kube-vip/kube-vip:$KVVERSION" && \
# kube-vip manifest daemonset \
#     --interface $INTERFACE \
#     --address $VIP \
#     --inCluster \
#     --taint \
#     --controlplane \
#     --services \
#     --arp \
#     --leaderElection \
#     > $NXE_CONFIG/k3s-kubevip-daemonset.yaml


# kubectl create configmap kubevip -n kube-system --from-literal range-global=172.20.3.100-172.20.3.354 --dry-run=client -o yaml | kubectl apply -f -
# kubectl apply -f $NXE_CONFIG/k3s-kubevip-ccm.yaml
# kubectl apply -f $NXE_CONFIG/k3s-kubevip-daemonset.yaml
# kubectl apply -f $NXE_CONFIG/k3s-kubevip-rbac.yaml

# kubectl apply -f $NXE_CONFIG/k3s-cilium-lb-apiserver.yaml

# helm upgrade portainer portainer/portainer \
#   --install \
#   --create-namespace -n portainer \
#   --set service.type=LoadBalancer \
#   --set tls.force=true

# BGP announcements for pod CIDRs is not supported with IPAM mode "cluster-pool-v2beta" (only "cluster-pool" and "kubernetes" are supported)
# kubectl apply -f $NXE_CONFIG/k3s-cilium-bgp-configmap.yaml

# add gateway-api CRDs
kubectl apply -k "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v0.6.1"

#kubectl apply -f $NXE_CONFIG/k3s-kube-vip.yaml
#kubectl apply -f $NXE_CONFIG/k3s-cilium-outside-ipam.yaml

kubectl create namespace nx-enterprise
kubectl apply -f $NXE_CONFIG/k3s-whoami.yaml -n nx-enterprise


# cert manager
# helm repo add jetstack https://charts.jetstack.io
# helm repo update
# helm upgrade cert-manager jetstack/cert-manager \
#   --namespace cert-manager \
#   --install \
#   --create-namespace \
#   --version v1.11.0 \
#   --set installCRDs=true

tmux new -d 'exec $NXE_SCRIPTS/nxe-post-k3s-cilium.zsh |& tee -a /tmp/nxe-k3s-cilium.log'

echo "                                                                         "
echo " ======================================================================= "
echo " == ATTENTION: ========================================================= "
echo " ======================================================================= "
echo "                                                                         "
echo " Monitor cilium installation via:    tmux attach -t 0                    "
echo " Also monitor via k9s utility:       k9s                                 "
echo "                                                                         "
echo " ======================================================================= "
echo "                                                                         "

kubectl scale deployment/coredns --replicas=3 -n kube-system
kubectl scale deployment/metrics-server --replicas=3 -n kube-system
kubectl scale deployment/local-path-provisioner --replicas=3 -n kube-system
# kubectl scale deployment/kube-vip-cloud-provider --replicas=1 -n kube-system
