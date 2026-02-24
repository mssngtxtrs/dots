#!/bin/bash

# This script acts as a rofi mode to pick and set wallpapers.
# Invoke with: rofi -show wallpaper -modi "wallpaper:/path/to/this.sh"

wall_dir="${HOME}/Pictures/хуйня/фон"
cacheDir="${HOME}/.cache/wallpapers"

# Create cache directory if missing
mkdir -p "${cacheDir}"
mkdir -p "${cacheDir}/overview"

# Pre-cache thumbnails
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
    if [ -f "$imagen" ]; then
        nombre_archivo=$(basename "$imagen")
        if [ ! -f "${cacheDir}/${nombre_archivo}" ] ; then
            magick convert -strip "$imagen" \
                -thumbnail 500x500^ -gravity center -extent 500x500 \
                "${cacheDir}/${nombre_archivo}"
        fi
    fi
done

# If rofi sends us a selection, apply wallpaper
if [ "$ROFI_RETV" -eq 1 ]; then
    swww img "${wall_dir}/$@" \
        -t wipe --transition-step 30 --transition-duration 1 \
        --transition-fps 120 --transition-angle 30
    overview_img_path="${cacheDir}/overview/$@"
    if [ ! -f "${overview_img_path}" ]; then
        magick "${wall_dir}/$@" \
            -fill black -colorize "70" \
            -blur 0x8 \
            "${overview_img_path}"
    fi
    killall swaybg
    swaybg --image ${overview_img_path} --mode fill > /dev/null 2>&1 & disown
    exit 0
fi

# Otherwise, we print entries so rofi can display the mode
# for img in "${wall_dir}"/*.{jpg,jpeg,png,webp}; do
for img in "${wall_dir}"/*; do
    [ -f "$img" ] || continue
    base=$(basename "$img")
    printf "%s\x00icon\x1f%s\x00info\x1f%s\n" \
        "$base" "${cacheDir}/${base}" "$base"
done

