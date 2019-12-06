#!/bin/sh

docker build -t py:0.1 .
docker tag py:0.1 py:latest
