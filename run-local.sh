#!/bin/bash

cd "$(dirname $0)"
set -xe 

ollama create gemma4:12b -f Modelfile-gemam4:12b
ollama list

