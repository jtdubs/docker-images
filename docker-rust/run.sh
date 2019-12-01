#!/bin/sh

CONTAINER_ID=$(docker container ls -qf "label=rust")

# if not running
if [ -z "$CONTAINER_ID" ]
then
    # start it
    docker run \
    --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.config:/home/user/.config \
    -v $PWD:/mnt \
    --network host \
    --cap-add=NET_ADMIN \
    --cap-add=NET_RAW \
    -l rust \
    -h rust \
    -it rust:0.1 \
    $*
# otherwise
else
    if [ -z "$*" ]
    then
        docker container exec -it $CONTAINER_ID /bin/bash
    else
        docker container exec -it $CONTAINER_ID $*
    fi
fi
