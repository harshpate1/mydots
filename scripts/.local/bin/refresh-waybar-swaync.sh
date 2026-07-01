#!/bin/bash

# Kill existing instances
pkill -x waybar
pkill -x swaync

# Wait until fully closed
while pgrep -x waybar >/dev/null; do sleep 0.1; done
while pgrep -x swaync >/dev/null; do sleep 0.1; done

# Restart
waybar &
swaync &
