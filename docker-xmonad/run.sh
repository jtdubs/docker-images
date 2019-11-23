#!/bin/sh

docker run \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.config:/home/user/.config:ro \
  -v /home/jtdubs/.xmonad:/home/user/.xmonad \
  --network host \
  -h xmonad \
  -it xmonad:0.1 \
  $*
