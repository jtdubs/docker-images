#!/bin/sh

docker build -t red:0.2 .
docker tag red:0.2 red:latest
