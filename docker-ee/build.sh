#!/bin/sh

docker build -t ee:0.1 .
docker tag ee:0.1 ee:latest
