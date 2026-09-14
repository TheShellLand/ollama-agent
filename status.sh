#!/bin/bash 
# run ollama in docker

container="ollama-agent"

set -xe

docker logs $container
echo
docker ps | grep $container
echo
docker exec -it $container ollama list
echo
docker exec -it $container ollama ps
echo
docker exec -it $container bash

