#!/bin/sh

docker build -t red-cloud:0.1 .
docker tag red-cloud:0.1 red-cloud:latest
