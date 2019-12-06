#!/bin/sh

docker build -t ubuntu-base:0.3 .
docker tag ubuntu-base:0.3 ubuntu-base:latest
