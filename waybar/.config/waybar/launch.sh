#!/usr/bin/env bash

CONFIG="$1"
WAYBAR_DIR="$HOME/.config/waybar"
CONFIG_DIR="$WAYBAR_DIR/$CONFIG"

CONFIG_FILE=""
STYLE_FILE="$CONFIG_DIR/style.css"

# Detect config file automatically
if [[ -f "$CONFIG_DIR/config.jsonc" ]]; then
  CONFIG_FILE="$CONFIG_DIR/config.jsonc"
elif [[ -f "$CONFIG_DIR/config" ]]; then
  CONFIG_FILE="$CONFIG_DIR/config"
else
  notify-send "Waybar" "No config file found in $CONFIG"
  exit 1
fi

# Kill running waybar
pkill waybar
sleep 0.3

waybar \
  --config "$CONFIG_FILE" \
  --style "$STYLE_FILE" &
