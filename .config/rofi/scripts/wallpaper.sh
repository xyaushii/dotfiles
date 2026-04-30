#!/bin/bash

WALLPAPER_DIR="/home/yaushi/tapety"
CACHE_DIR="/home/yaushi/.cache/wallpaper-thumbs"
mkdir -p "$CACHE_DIR"


for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
    [ -f "$img" ] || continue
    name=$(basename "$img")
    thumb="$CACHE_DIR/$name"
    if [ ! -f "$thumb" ]; then
magick "$img" -thumbnail 300x200^ -gravity center -extent 300x200 "$thumb"
    fi
done


chosen=$(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png} 2>/dev/null | while read -r img; do
    name=$(basename "$img")
    display="${name%.*}"
    echo -en "$display\0icon\x1f$CACHE_DIR/$name\n"
done | rofi -dmenu \
    -p "tapeta" \
    -show-icons \
    -icon-size 100 \
    -no-config \
    -theme /home/yaushi/.config/rofi/wallpaper.rasi)
[ -z "$chosen" ] && exit

actual=$(ls "$WALLPAPER_DIR/$chosen".{jpg,jpeg,png} 2>/dev/null | head -1)
awww img "$actual" \
    --transition-type fade \
    --transition-duration 1


wal -i "$actual" -n -q --backend haishoku


pkill waybar
source ~/.cache/wal/colors.sh
waybar &


if [ -f ~/.cache/wal/colors-kitty.conf ]; then
    cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors-wal.conf
    kitty @ set-colors --all ~/.config/kitty/colors-wal.conf 2>/dev/null
fi
