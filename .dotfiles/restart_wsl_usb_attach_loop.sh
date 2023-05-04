#!/bin/sh

SCREEN_SESSION_NAME=$1
HARDWARE_ID=$2

# If given, the provided script will be used like sudo to elevate permissions of the attach loop process.
# For dummies: set `ELEVATION_SCRIPT` to "wudo" each time you connect to a device for the first time.
ELEVATION_SCRIPT=$3

screen -S $SCREEN_SESSION_NAME -X quit > /dev/null
screen -dmS $SCREEN_SESSION_NAME $ELEVATION_SCRIPT cmd.exe /c "usbipd wsl attach --hardware-id $HARDWARE_ID --auto-attach"
