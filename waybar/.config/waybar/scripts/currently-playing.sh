#!/usr/bin/env bash

WIDTH=30          # visible characters
DELAY=0.08        # smaller = smoother
GAP="     "       # gap between loops

offset=0
last=""

while true; do
  if ! playerctl metadata --format '{{title}}' >/dev/null 2>&1; then
    printf '{"text":"","alt":""}\n'
    sleep 1
    continue
  fi

  status=$(playerctl status 2>/dev/null)
  title=$(playerctl metadata title 2>/dev/null)
  artist=$(playerctl metadata artist 2>/dev/null)

  [[ -z "$title" ]] && sleep 0.5 && continue

  if [[ -n "$artist" ]]; then
    full="$title | $artist"
  else
    full="$title"
  fi

  # reset scroll if song changed
  if [[ "$full" != "$last" ]]; then
    offset=0
    last="$full"
  fi

  scroll="$full$GAP"
  len=${#scroll}

  if (( len <= WIDTH )); then
    slice="$scroll"
  else
    slice="${scroll:offset:WIDTH}"
    offset=$(( (offset + 1) % len ))
  fi

  icon=" "
  [[ "$status" == "Paused" ]] && icon="  "

  printf '{"text":"%s","alt":"%s"}\n' "$slice" "$icon"
  sleep "$DELAY"
done
