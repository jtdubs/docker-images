#!/bin/sh

docker build -t pwsh:0.1 .
docker tag pwsh:0.1 pwsh:latest
