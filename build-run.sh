#!/bin/bash 

cd "$(dirname $0)"

set -xe 

bash build.sh
bash run.sh 
bash logs-tail.sh

