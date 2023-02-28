#!/bin/zsh

# run this script to make sure cilium can run
source $NXE_SCRIPTS/nxe-post-k3s-cilium-nohup.zsh

kubectl apply -f $NXE_CONFIG/k3s-kuberouter.yaml
#kubectl apply -f https://raw.githubusercontent.com/kube-vip/kube-vip-cloud-provider/main/manifest/kube-vip-cloud-controller.yaml
#kubectl create configmap -n kube-system kubevip --from-literal cidr-global=244.0.0.0/12

tmux new -d 'exec $NXE_SCRIPTS/nxe-post-k3s-cilium.zsh |& tee /tmp/nxe-k3s-cilium.log'

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
