#!/bin/sh

# delete containers
docker ps -a | grep nxe-packages | awk '{print $1}' | paste -s -d' ' - | xargs docker rm

# delete volumes
volumes=$(docker volume ls  --format '{{.Name}}')
for volume in $volumes
do
  dockerout=$(docker ps -a --filter volume="$volume"  --format '{{.Names}}' | sed 's/^/  /')
  #echo $volume + $dockerout
  echo $volume + $dockerout | grep nxe-packages | awk '{print $1}' | xargs docker volume rm
done

# delete unused volumes
docker volume prune -f

# delete docker network nxe-devnet
docker network rm nxe-devnet
docker network rm nxe-devnet-k3s
