#!/bin/bash
# build image 

image="ollama-agent"

cd "$(dirname $0)"
set -xe

docker pull ollama/ollama

docker build "$@" --no-cache -t $image:latest -f Dockerfile .

docker images | grep $image
