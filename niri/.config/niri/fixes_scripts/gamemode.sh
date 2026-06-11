#! /bin/bash
GAMEMODE_FILE="$HOME/.config/gamemode"
GAMEMODE=$(cat $GAMEMODE_FILE)
if [[ $GAMEMODE == 0 ]]; then
    echo 1 > $GAMEMODE_FILE
    qs -c noctalia-shell ipc call powerProfile enableNoctaliaPerformance
    niri msg output eDP-1 off
    notify-send "Game mode" "Game mode enabled"
else 
    echo 0 > $GAMEMODE_FILE
    qs -c noctalia-shell ipc call powerProfile disableNoctaliaPerformance
    niri msg output eDP-1 on 
    notify-send "Game mode" "Game mode disabled"
fi
