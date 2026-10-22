#!/bin/bash

cd "$(dirname $0)"
set -xe 

ollama create local -f Modelfile
ollama list

