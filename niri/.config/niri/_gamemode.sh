#! /bin/bash
if [[ $(pgrep swww-daemon) ]] && [[ $(pgrep swaybg) ]]; then
    killall swww-daemon
    killall swaybg
    notify-send "Game mode" "Game mode enabled"
else 
    swww-daemon >/dev/null 2>&1 & disown
    swww restore
    swaybg --image "/home/mssngtxtrs/.cache/wallpapers/overview/$(swww query | grep -o '[^/]*$')" --mode fill >/dev/null 2>&1 & disown
    notify-send "Game mode" "Game mode disabled"
fi
