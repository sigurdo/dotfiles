#!/bin/sh
set -e
cd $(dirname $0)/

# Utility script for abraunegg's linux onedrive client
# https://github.com/abraunegg/onedrive

# Command line arguments (in addition to all other docker run arguments):
# -d --detach               Run container in background and print container ID

# Configurable environment variables:
# ONEDRIVE_DATA_DIR         Path to (already existing) directory on host machine to sync files to. Default is $HOME/onedrive/
# ONEDRIVE_RESYNC           When set to 1, the container will start with a resync. This must be done when specific config options or sync_list is changed. When set to 0 (as by default), the container starts normally.

if [ "$ONEDRIVE_DATA_DIR" = "" ]
then
    export ONEDRIVE_DATA_DIR=$HOME/onedrive/
fi
if [ "$ONEDRIVE_RESYNC" = "" ]
then
    export ONEDRIVE_RESYNC=0
fi
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
docker run --name onedrive --rm -v onedrive_conf:/onedrive/conf -v $ONEDRIVE_DATA_DIR:/onedrive/data -e "ONEDRIVE_UID=${ONEDRIVE_UID}" -e "ONEDRIVE_GID=${ONEDRIVE_GID}" -e "ONEDRIVE_RESYNC=$ONEDRIVE_RESYNC" $@ driveone/onedrive:latest

# Other useful commands:

# Stop onedrive monitor:
# docker stop onedrive

# See onedrive monitor logs:
# docker logs onedrive
