#!/bin/bash
rofi -show drun \
    -modi "drun,run,window" \
    -show-icons \
    -drun-show-actions \
    -drun-display-format "{name}" \
    -drun-categories "Network;System;Utility;Development;Graphics;AudioVideo;Settings"