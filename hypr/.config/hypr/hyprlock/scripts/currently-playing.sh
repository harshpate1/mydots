#!/bin/bash

# Exit if no player
playerctl status >/dev/null 2>&1 || exit 0

status=$(playerctl status 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# If no title, exit
[[ -z "$title" ]] && exit 0

# Build text
if [[ -n "$artist" ]]; then
    full="$title | $artist"
else
    full="$title"
fi

# Icon
icon=""
[[ "$status" == "Paused" ]] && icon=""

echo "$icon  $full"
