#!/bin/sh

CONTAINER_ID=$(docker container ls -qf "label=sdr")

# if not running
if [ -z "$CONTAINER_ID" ]
then
    # start it
    docker run \
      --rm \
      -e DISPLAY=$DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v ~/.config/nvim:/home/user/.config/nvim:ro \
      -v ~/.config/fish:/home/user/.config/fish:ro \
      -v ~/.config/coc:/home/user/.config/coc \
      -v ~/.fzf:/home/user/.fzf:ro \
      -v /dev/bus/usb:/dev/bus/usb \
      -v $PWD:/mnt \
      --device /dev/snd \
      --network host \
      -l sdr \
      -h sdr \
      -it sdr:latest \
      $*
# otherwise
else
    if [ -z "$*" ]
    then
        docker container exec -it $CONTAINER_ID /usr/bin/fish
    else
        docker container exec -it $CONTAINER_ID $*
    fi
fi
