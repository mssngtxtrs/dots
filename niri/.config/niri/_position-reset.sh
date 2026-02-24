#! /bin/bash
if [[ $(niri msg outputs | awk '/Output.*\(eDP-1\)/ {flag=1} /Output/ && !/\(eDP-1\)/ {flag=0} flag && /Logical position/ {print $3, $4; exit}') == "0, 0" ]]; then 
    niri msg output eDP-1 position set 0 1080
    notify-send "Position reset" "Position of eDP-1 is set to 0, 1080"
else
    niri msg output eDP-1 position set 0 0
    notify-send "Position reset" "Position of eDP-1 is set to 0, 0"
fi
