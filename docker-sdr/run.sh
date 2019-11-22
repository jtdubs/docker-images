#!/bin/sh

docker run \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.config:/home/user/.config:ro \
  -v /dev/bus/usb:/dev/bus/usb \
  -v $PWD:/mnt \
  --device /dev/snd \
  --privileged \
  --network host \
  -h sdr \
  -it sdr:0.1 \
  $*
