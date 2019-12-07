#!/bin/sh

docker build -t ubuntu-base:0.4 .
docker tag ubuntu-base:0.4 ubuntu-base:latest
