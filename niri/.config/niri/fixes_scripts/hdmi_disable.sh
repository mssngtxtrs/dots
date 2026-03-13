#! /bin/sh
if [[ $(niri msg outputs | grep Disabled) ]]; then
    niri msg output HDMI-A-1 on 
    notify-send "External monitor" "HDMI-A-1 enabled or cannot be disabled"
else 
    niri msg output HDMI-A-1 off
    notify-send "External monitor" "HDMI-A-1 disabled"
fi
