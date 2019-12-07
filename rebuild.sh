#!/bin/bash

set -e
set -x

pushd docker-ubuntu-base && ./build.sh && popd

pushd docker-powershell  && ./build.sh && popd
pushd docker-dotnet      && ./build.sh && popd
pushd docker-rust        && ./build.sh && popd
pushd docker-python      && ./build.sh && popd
pushd docker-hs          && ./build.sh && popd
pushd docker-ee          && ./build.sh && popd
pushd docker-sdr         && ./build.sh && popd
pushd docker-red         && ./build.sh && popd
pushd docker-red-cloud   && ./build.sh && popd
