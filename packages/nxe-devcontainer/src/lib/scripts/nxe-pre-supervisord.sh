#!/bin/bash
#set -e

pushd /tmp # safely execute scripts from /tmp/scripts

git clone https://github.com/ochinchina/supervisord.git supervisord
cd supervisord
sed -i 's/Go-Supervisor/NXE Devcontainer Supervisor/g' webgui/index.html webgui/index.html.modify
go generate && GOOS=linux go build -tags release -a -ldflags "-linkmode external -extldflags -static" -o /usr/local/bin/supervisord
rm -Rf /tmp/supervisord

popd
