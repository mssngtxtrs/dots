#! /bin/bash
if [[ $(niri msg outputs | grep Disabled) ]]; then
    niri msg output eDP-1 on
    niri msg output HDMI-A-1 position set 1920 0
    notify-send "Internal monitor" "eDP-1 enabled or cannot be disabled"
else
    niri msg output eDP-1 off
    niri msg output HDMI-A-1 position set 0 0
    notify-send "Internal monitor" "eDP-1 disabled"
fi
