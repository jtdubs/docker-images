#!/bin/sh

CONTAINER_ID=$(docker container ls -qf "label=ee")

# if not running
if [ -z "$CONTAINER_ID" ]
then
    # start it
    docker run \
      --rm \
      -e DISPLAY=$DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /etc/localtime:/etc/localtime:ro \
      -v /etc/timezone:/etc/timezone:ro \
      -v ~/.config/nvim:/home/user/.config/nvim:ro \
      -v ~/.config/fish:/home/user/.config/fish:ro \
      -v ~/.config/coc:/home/user/.config/coc \
      -v ~/.fzf:/home/user/.fzf:ro \
      -v $PWD:/mnt \
      --network host \
      -l ee \
      -h ee \
      -it ee:latest \
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
