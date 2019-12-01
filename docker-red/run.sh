#!/bin/sh

CONTAINER_ID=$(docker container ls -qf "label=red")

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
    -l red \
    -h red \
    -it red:0.1 \
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
