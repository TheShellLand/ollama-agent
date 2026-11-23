#!/bin/bash 
# show ollama logs

set -xe

docker logs -f ollama-agent

