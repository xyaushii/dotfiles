#!/bin/bash

prev=""

while true; do
    current=$(playerctl -p spotify metadata --format "{{title}} - {{artist}}" 2>/dev/null)
    
    if [[ -n "$current" && "$current" != "$prev" ]]; then
        title=$(playerctl -p spotify metadata title 2>/dev/null)
        artist=$(playerctl -p spotify metadata artist 2>/dev/null)
        art=$(playerctl -p spotify metadata mpris:artUrl 2>/dev/null)
        
notify-send -u normal -t 5000 -i "$art" "Now Playing" "$title\n$artist"
        prev="$current"
    fi
    
    sleep 2
done
