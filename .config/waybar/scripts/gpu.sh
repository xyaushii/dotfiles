#!/bin/bash
radeontop -d - -l 1 2>/dev/null | grep -oP 'gpu \K[0-9.]+' | head -1 | awk '{printf "%.0f%%", $1}'
