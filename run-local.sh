#!/bin/bash

cd "$(dirname $0)"
set -xe 

ollama create igorls/gemma-4-12B-it-heretic-GGUF -f Modelfile
ollama list

