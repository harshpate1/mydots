#!/bin/bash

DEVICE=$(kdeconnect-cli -l | grep -m1 "paired")

if [ -z "$DEVICE" ]; then
  echo "󰌺"
  exit 0
fi

BATTERY=$(kdeconnect-cli --battery 2>/dev/null | grep -o '[0-9]\+%')

if [ -z "$BATTERY" ]; then
  echo "󰄜"
else
  echo "󰏤 $BATTERY"
fi
