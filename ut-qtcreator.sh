#!/bin/bash
#set -ex

#SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

IMAGE="ut-qtcreator:base"
CONTAINER_NAME=ut-qtcreator
FAKE_HOME=/home/dev/ubuntutouch


xhost +
docker run --rm --net=host \
    -e QML_IMPORT_PATH=/usr/lib/x86_64-linux-gnu/qt5/qml \
    -u `id -u`:`id -g` -e DISPLAY -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/$(id -un):$FAKE_HOME" \
$IMAGE
