#!/bin/sh

docker run \
  --rm \
  -v $PWD:/mnt \
  -h empire \
  --network host \
  -it empire:latest
