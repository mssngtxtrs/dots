#!/bin/sh

killall swww-daemon
awww-daemon >/dev/null 2>&1 & disown
notify-send "Wallpaper restart" "awww restarted succesfully! Waiting for swaybg..."


while true; do
    OUTPUT=$(awww query | grep -o '[^/]*$' 2>/dev/null | head -n 1)

    if [[ -z "$OUTPUT" ]]; then
        echo "OUTPUT is empty, waiting..."
        sleep 1
    elif [[ $OUTPUT =~ ^[^/]+\.[a-zA-Z0-9]+$ ]]; then
        killall swaybg
        swaybg --image "/home/mssngtxtrs/.cache/wallpapers/overview/$OUTPUT" --mode fill >/dev/null 2>&1 & disown
        notify-send "Wallpaper restart" "swaybg restarted succesfully!"

        break
    else
        echo "OUTPUT is not matching, waiting..."
        sleep 1
    fi
done
