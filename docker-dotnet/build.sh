#!/bin/sh

docker build -t dotnet:0.1 .
docker tag dotnet:0.1 dotnet:latest
