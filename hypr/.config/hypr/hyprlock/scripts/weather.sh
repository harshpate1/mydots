#!/bin/bash

TIMEZONE="auto"

# -----------------------------
# Auto-location (GeoClue → IP → fallback)
# -----------------------------
get_location() {
  if command -v geocluectl >/dev/null 2>&1; then
    geocluectl location 2>/dev/null |
      awk '/Latitude/ {lat=$2} /Longitude/ {lon=$2} END {print lat, lon}'
  else
    curl -s https://ipinfo.io/loc 2>/dev/null | tr ',' ' '
  fi
}

read LAT LON <<< "$(get_location)"
LAT=${LAT:-23.2599}
LON=${LON:-77.4126}

# -----------------------------
# Icons
# -----------------------------
get_icon() {
  case "$1" in
    0) [[ "$2" == "1" ]] && echo "󰖙" || echo "󰖔" ;;
    1|2) echo "󰖕" ;;
    3) echo "󰖐" ;;
    45|48) echo "󰖑" ;;
    51|53|55) echo "󰖖" ;;
    61|63|65) echo "󰖗" ;;
    71|73|75|77) echo "󰖘" ;;
    80|81|82) echo "󰖗" ;;
    95|96|99) echo "󰖓" ;;
    *) echo "󰖜" ;;
  esac
}

get_desc() {
  case "$1" in
    0) echo "Clear sky" ;;
    1) echo "Mainly clear" ;;
    2) echo "Partly cloudy" ;;
    3) echo "Overcast" ;;
    45|48) echo "Fog" ;;
    51|53|55) echo "Drizzle" ;;
    61|63|65) echo "Rain" ;;
    71|73|75|77) echo "Snow" ;;
    80|81|82) echo "Rain showers" ;;
    95|96|99) echo "Thunderstorm" ;;
    *) echo "Unknown" ;;
  esac
}

# -----------------------------
# Fetch Weather
# -----------------------------
WEATHER=$(curl -s \
"https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current=temperature_2m,apparent_temperature,weather_code,is_day,wind_speed_10m,relative_humidity_2m&daily=temperature_2m_min,temperature_2m_max&timezone=$TIMEZONE") || exit 0

TEMP=$(jq -r '.current.temperature_2m' <<<"$WEATHER")
CODE=$(jq -r '.current.weather_code' <<<"$WEATHER")
IS_DAY=$(jq -r '.current.is_day' <<<"$WEATHER")
WIND=$(jq -r '.current.wind_speed_10m' <<<"$WEATHER")
HUM=$(jq -r '.current.relative_humidity_2m' <<<"$WEATHER")
MIN=$(jq -r '.daily.temperature_2m_min[0]' <<<"$WEATHER")
MAX=$(jq -r '.daily.temperature_2m_max[0]' <<<"$WEATHER")

[[ "$TEMP" == "null" ]] && exit 0

TEMP=${TEMP%.*}
MIN=${MIN%.*}
MAX=${MAX%.*}

ICON=$(get_icon "$CODE" "$IS_DAY")
DESC=$(get_desc "$CODE")

# -----------------------------
# Final Output (Hyprlock-friendly)
# -----------------------------
echo "$ICON  $TEMP°C | $DESC"
