#!/bin/sh

docker build -t rust:0.1 .
docker tag rust:0.1 rust:latest
