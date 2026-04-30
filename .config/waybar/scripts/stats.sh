#!/bin/bash
cpu=$(top -bn2 -d0.3 | grep "Cpu(s)" | tail -1 | awk '{print $2}' | cut -d. -f1)
ram=$(free -g | awk '/Mem:/ {print $3}')
gpu=$(cat /sys/class/drm/card1/device/gpu_busy_percent 2>/dev/null || echo "0")

printf "CPU %s%%  GPU %s%%  RAM %sG" "$cpu" "$gpu" "$ram"
