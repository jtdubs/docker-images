#!/bin/sh

docker build -t hs:0.1 .
docker tag hs:0.1 hs:latest
