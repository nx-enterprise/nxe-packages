# Options: base, kitchen-sink
ARG VARIANT=base
FROM nx-enterprise/nxe-devcontainer:${VARIANT}


# Setting the ENTRYPOINT to docker-init.sh will configure non-root access
# to the Docker socket. The script will also execute CMD as needed.
ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
CMD [ "sleep", "infinity" ]
