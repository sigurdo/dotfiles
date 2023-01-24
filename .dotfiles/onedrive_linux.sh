#!/bin/sh
set -e
cd $(dirname $0)/

# Utility script for abraunegg's linux onedrive client
# https://github.com/abraunegg/onedrive

# Command line arguments (in addition to all other docker run arguments):
# -d --detach               Run container in background and print container ID
# -e "ONEDRIVE_RESYNC=1"    Run in resync mode

export ONEDRIVE_DATA_DIR=$HOME/onedrive/
export ONEDRIVE_UID=$(id -u)
export ONEDRIVE_GID=$(id -g)

if ! which docker > /dev/null 2>&1
then
    echo "docker is not installed" >&2
    exit 1
fi

if [ "$(docker container ls -f name=onedrive --format {{.Names}})" != "" ]
then
    echo "onedrive container is already running" >&2
    exit 2
fi

# Start onedrive monitor
docker run --name onedrive --rm -v onedrive_conf:/onedrive/conf -v $ONEDRIVE_DATA_DIR:/onedrive/data -e "ONEDRIVE_UID=${ONEDRIVE_UID}" -e "ONEDRIVE_GID=${ONEDRIVE_GID}" -e "ONEDRIVE_RESYNC=0" $@ driveone/onedrive:latest

# Other useful commands:

# Stop onedrive monitor:
# docker stop onedrive

# See onedrive monitor logs:
# docker logs onedrive
