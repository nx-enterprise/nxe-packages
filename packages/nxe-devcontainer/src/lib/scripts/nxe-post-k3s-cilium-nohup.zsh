#!/bin/zsh

# We moved this block into the docker-composer yml file:

nohup zsh -c 'repeat 20 {
  for con in `docker ps --format "{{.Names}}" | grep "nxe-k3s-server"`; do

    if [ -z "$(docker exec -u 0 $con cat /proc/mounts | grep bpffs)" ]; then
      docker exec -u 0 $con /bin/aux/mount bpffs /sys/fs/bpf -t bpf && docker exec -u 0 $con /bin/aux/mount --make-shared /sys/fs/bpf
    else
      echo "exists"
    fi
  done

  for con in `docker ps --format "{{.Names}}" | grep "nxe-k3s-agent"`; do

    if [ -z "$(docker exec -u 0 $con cat /proc/mounts | grep bpffs)" ]; then
      docker exec -u 0 $con /bin/aux/mount bpffs /sys/fs/bpf -t bpf && docker exec -u 0 $con /bin/aux/mount --make-shared /sys/fs/bpf
    else
      echo "exists"
    fi
  done

  for con in `docker ps --format "{{.Names}}" | grep "nxe-k3s-server"`; do
    docker exec -u 0 $con  /bin/aux/mount --make-shared /run/cilium/cgroupv2;
  done
  for con in `docker ps --format "{{.Names}}" | grep "nxe-k3s-agent"`; do
    docker exec -u 0 $con  /bin/aux/mount --make-shared /run/cilium/cgroupv2;
  done

  echo "Ran Cilium scripts at $(date +%H:%M:%S)"; sleep 5; }
' > /tmp/nxe-cilium.log 2>&1 &
