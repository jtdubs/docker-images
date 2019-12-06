#!/bin/sh

docker build -t empire:0.1 .
docker tag empire:0.1 empire:latest
