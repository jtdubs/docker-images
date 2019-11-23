#!/bin/sh

docker run \
  --rm \
  -v $PWD:/mnt \
  -h empire \
  --network host \
  -it empire:0.1
