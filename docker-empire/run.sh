#!/bin/sh

docker run \
  --rm \
  -v $PWD:/mnt \
  --privileged \
  -h empire \
  --network host \
  -it empire:0.1
