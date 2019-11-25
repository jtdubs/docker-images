#!/bin/sh

docker run \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.config:/home/user/.config:ro \
  -v $PWD:/mnt \
  --network host \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  -h rust \
  -it rust:0.1 \
  $*
