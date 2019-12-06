#!/bin/sh

CONTAINER_ID=$(docker container ls -qf "label=ubuntu-base")

# if not running
if [ -z "$CONTAINER_ID" ]
then
    # start it
    docker run \
    --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.config/nvim:/home/user/.config/nvim:ro \
    -v $PWD:/mnt \
    --network host \
    -l ubuntu-base \
    -h ubuntu-base \
    -it ubuntu-base:0.3 \
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
