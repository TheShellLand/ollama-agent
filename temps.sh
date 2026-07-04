#!/bin/bash
# temperature sensors

while true; do
  free -h 
  echo ---
  sleep 1
  sensors
  echo ---
  sleep 1
  nvidia-smi
  echo ---
  sleep 1
done
