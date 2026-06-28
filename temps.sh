#!/bin/bash
# temperature sensors

while true; do
  clear
  free -h 
  echo ---
  sensors
  echo ---
  nvidia-smi
  echo ---
  sleep 5
done
