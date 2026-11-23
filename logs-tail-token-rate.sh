#!/bin/bash 
# show only the token generation rates

set -xe

docker logs -f ollama-agent 2>&1 | grep n_gen

