#!/bin/bash
# temperature sensors

while true; do
  free -h 
  echo ---
  sleep 3
  sensors
  echo ---
  sleep 3
  nvidia-smi
  echo ---
  sleep 3
  docker exec ollama ollama ps
  echo ---

done
