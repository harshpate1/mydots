#!/bin/bash

# check if hyprsunset is already running
if pgrep -x "hyprsunset" > /dev/null; then
    #kill hyprsunset if it's running (switch to day mode)
    killall -9 hyprsunset
    notify-send "Night Light" "Off" -u "low"
else
    #start hyprsunset for night mode
    hyprsunset --temperature 3500 &
    notify-send "Night Light" "On" -u "low"
fi