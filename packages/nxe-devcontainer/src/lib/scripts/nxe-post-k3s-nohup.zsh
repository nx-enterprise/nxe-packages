#!/bin/zsh

nohup zsh -c "repeat 20 {
  echo 'If there are any orphaned k3s nodes, we will clean them up...'
  kubectl get nodes -o wide
  kubectl delete nodes $(kubectl get nodes -n kube-system | grep NotReady | awk '{print $1}' | paste -s -d' ' -)
  echo 'Here are the nodes after cleanup:'
  kubectl get nodes -o wide
  # delete the ebpf container after it has done its job of making the volume
  docker rm $(docker ps -a --filter 'status=exited' | grep k3s-ebpf | awk '{print $1}')
  echo 'Ran Cilium scripts at $(date +%H:%M:%S)'; sleep 30; }
" > /tmp/nxe-k3s-nohup.log 2>&1 &
