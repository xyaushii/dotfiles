#!/usr/bin/env bash
uptime="$(uptime -p | sed -e 's/up //g')"

shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout=' Logout'
yes='Yes'
no='No'

rofi_cmd() {
    rofi -dmenu \
        -p "Power" \
        -mesg " " \
        -no-fixed-num-lines \
        -theme-str 'window {width: 280px; location: center; anchor: center; border-radius: 16px; border-width: 1px; border-color: #1e2a23; background-color: #0d1210;}' \
        -theme-str 'inputbar {enabled: false;}' \
        -theme-str 'listview {lines: 5; columns: 1; padding: 8px; spacing: 2px;}' \
        -theme-str 'element {padding: 10px 14px; border-radius: 10px; text-color: #5a7a66; font: "JetBrainsMono Nerd Font 13";}' \
        -theme-str 'element selected {background-color: #4a7a5a; text-color: #0d1210;}' \
        -theme-str 'textbox-prompt-colon {enabled: false;}'
}

confirm_cmd() {
    rofi -dmenu \
        -p "Confirm" \
        -mesg "Are you sure?" \
        -theme-str 'window {width: 300px; location: center; anchor: center;}' \
        -theme-str 'textbox {text-color: #deeae3; font: "JetBrainsMono Nerd Font 13";}' \
        -theme-str 'listview {lines: 1; columns: 2;}' \
        -theme-str 'inputbar {enabled: false;}' \
        -theme-str 'mainbox {children: [message, listview];}'
}

confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

run_rofi() {
    echo -e "$shutdown\n$reboot\n$logout\n$suspend\n$lock" | rofi_cmd
}

run_cmd() {
    selected="$(confirm_exit)"
    [[ "$selected" != "$yes" ]] && exit 0
    case "$1" in
        shutdown) systemctl poweroff ;;
        reboot)   systemctl reboot ;;
        suspend)  systemctl suspend ;;
        logout)   hyprctl dispatch exit ;;
    esac
}

chosen="$(run_rofi)"
case "$chosen" in
    *Shutdown) run_cmd shutdown ;;
    *Reboot)   run_cmd reboot ;;
    *Suspend)  run_cmd suspend; hyprlock ;;
    *Logout)   run_cmd logout ;;
    *Lock)     hyprlock ;;
esac