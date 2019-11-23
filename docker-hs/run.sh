#!/bin/sh

docker run \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.config:/home/user/.config:ro \
  -v $PWD:/mnt \
  --network host \
  -h hs \
  -it hs:0.1 \
  $*
