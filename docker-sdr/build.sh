#!/bin/sh

docker build -t sdr:0.1 .
docker tag sdr:0.1 sdr:latest
