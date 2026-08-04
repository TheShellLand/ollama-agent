#!/bin/bash 
# run ollama in docker

image="ollama-agent"
container="ollama-agent"
OLLAMA_CONTEXT_LENGTH_DEEPSEEK=131072
OLLAMA_CONTEXT_LENGTH_DEEPSEEK_5070fe=20000
OLLAMA_CONTEXT_LENGTH_GEMMA=262144

OLLAMA_CONTEXT_LENGTH=20000

OLLAMA_HOST="0.0.0.0"
GPU="None"

set -xe

cat run.sh

docker network create agents >/dev/null 2>&1 || :
docker rm -f ollama >/dev/null || :

docker run -d \
  --name $container \
  --network agents \
  --restart always \
  --gpus=all \
  -v ollama:/root/.ollama \
  -p 11434:11434 \
  -e OLLAMA_HOST=$OLLAMA_HOST \
  -e OLLAMA_CONTEXT_LENGTH=$OLLAMA_CONTEXT_LENGTH \
  $image >/dev/null || GPU="false"

if [[ $GPU == "false" ]]; then
  docker rm -f ollama && \
    docker run -d \
    --name $container \
    --network agents \
    --restart always \
    -v ollama:/root/.ollama \
    -p 11434:11434 \
    -e OLLAMA_HOST=$OLLAMA_HOST \
    -e OLLAMA_CONTEXT_LENGTH=$OLLAMA_CONTEXT_LENGTH \
    $image >/dev/null
fi 

 docker exec $container ollama pull igorls/gemma-4-12B-it-heretic-GGUF
#docker exec $container ollama pull gemma4:12b 
#docker exec $container ollama pull deepseek-r1:14b
#docker exec $container ollama pull qwen2.5:14b

docker ps | grep ollama
echo
docker logs ollama
