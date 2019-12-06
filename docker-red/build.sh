#!/bin/sh

docker build -t red:0.1 .
docker tag red:0.1 red:latest
