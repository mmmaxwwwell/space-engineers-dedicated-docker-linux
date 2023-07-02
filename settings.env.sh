#!/usr/bin/env sh
echo 'WORLD_VOLUME_NAME=space-engineers-dedicated-docker-linux_world'
echo 'PLUGINS_VOLUME_NAME=space-engineers-dedicated-docker-linux_plugins'

if which podman > /dev/null; then
    echo 'DOCKER_COMMAND=podman'
    #echo "found podman installed, using podman"
elif which docker > /dev/null; then
    #echo "found docker installed, using docker"
    echo 'DOCKER_COMMAND=docker'
else
    echo 'echo "Podman or docker not found, exiting. please install docker or podman"; exit 1'
fi

if which zip > /dev/null; then
    #zip found
    echo 'ZIP_FOUND=true'
else
    echo 'echo "zip not found, exiting. please install zip."; exit 1'
fi

