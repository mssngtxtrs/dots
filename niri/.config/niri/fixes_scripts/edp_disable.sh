#! /bin/bash
if [[ $(niri msg outputs | grep Disabled) ]]; then
    niri msg output eDP-1 on 
    notify-send "Internal monitor" "eDP-1 enabled or cannot be disabled"
else 
    niri msg output eDP-1 off
    notify-send "Internal monitor" "eDP-1 disabled"
fi
