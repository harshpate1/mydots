#!/bin/bash

pkill waybar
pkill swaync

sleep 0.3

waybar &
swaync &
