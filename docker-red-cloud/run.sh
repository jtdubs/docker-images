#!/bin/sh

docker run \
  --rm \
  -h red-cloud \
  --network bridge \
  red-cloud:latest \
