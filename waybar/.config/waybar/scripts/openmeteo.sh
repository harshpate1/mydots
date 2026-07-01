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
LOCATION="Local"

# -----------------------------
# Icons & descriptions
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
# AQI helpers (EAQI)
# -----------------------------
aqi_label() {
  local aqi=$1
  if (( aqi <= 20 )); then echo "Good"
  elif (( aqi <= 40 )); then echo "Fair"
  elif (( aqi <= 60 )); then echo "Moderate"
  elif (( aqi <= 80 )); then echo "Poor"
  else echo "Very Poor"
  fi
}

aqi_class() {
  local aqi=$1
  if (( aqi <= 20 )); then echo "aqi-good"
  elif (( aqi <= 40 )); then echo "aqi-fair"
  elif (( aqi <= 60 )); then echo "aqi-moderate"
  elif (( aqi <= 80 )); then echo "aqi-poor"
  else echo "aqi-verypoor"
  fi
}

# -----------------------------
# Weather data
# -----------------------------
WEATHER=$(curl -s \
"https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current=temperature_2m,apparent_temperature,weather_code,is_day,wind_speed_10m,relative_humidity_2m&daily=temperature_2m_min,temperature_2m_max,sunrise,sunset&timezone=$TIMEZONE") || exit 1

# -----------------------------
# AQI data
# -----------------------------
AQI=$(curl -s \
"https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$LAT&longitude=$LON&current=european_aqi") || exit 1

# ---- Current
TEMP=$(jq -r '.current.temperature_2m' <<<"$WEATHER")
FEELS=$(jq -r '.current.apparent_temperature' <<<"$WEATHER")
CODE=$(jq -r '.current.weather_code' <<<"$WEATHER")
IS_DAY=$(jq -r '.current.is_day' <<<"$WEATHER")
WIND=$(jq -r '.current.wind_speed_10m' <<<"$WEATHER")
HUM=$(jq -r '.current.relative_humidity_2m' <<<"$WEATHER")

# ---- Daily (today)
MIN=$(jq -r '.daily.temperature_2m_min[0]' <<<"$WEATHER")
MAX=$(jq -r '.daily.temperature_2m_max[0]' <<<"$WEATHER")
SUNRISE=$(jq -r '.daily.sunrise[0]' <<<"$WEATHER")
SUNSET=$(jq -r '.daily.sunset[0]' <<<"$WEATHER")

# ---- AQI
EAQI=$(jq -r '.current.european_aqi' <<<"$AQI")

TEMP=${TEMP%.*}
FEELS=${FEELS%.*}
MIN=${MIN%.*}
MAX=${MAX%.*}

SUNRISE=$(date -d "$SUNRISE" +"%I:%M %p")
SUNSET=$(date -d "$SUNSET" +"%I:%M %p")

ICON=$(get_icon "$CODE" "$IS_DAY")
DESC=$(get_desc "$CODE")

AQI_TEXT=$(aqi_label "$EAQI")
AQI_CLASS=$(aqi_class "$EAQI")

# -----------------------------
# Temp → CSS class
# -----------------------------
if (( TEMP < 15 )); then TEMP_CLASS="cold"
elif (( TEMP < 25 )); then TEMP_CLASS="mild"
elif (( TEMP < 35 )); then TEMP_CLASS="warm"
else TEMP_CLASS="hot"
fi

CLASS="$TEMP_CLASS $AQI_CLASS"

TOOLTIP="<tt>\
<span size='x-large'>$ICON</span>  <b>$DESC</b>\n\
────────────────────────────\n\
󰔏  Now        :  $TEMP°C  (Feels $FEELS°C)\n\
󰖜  Min / Max  :  $MIN°C / $MAX°C\n\
󰖝  Wind       :  ${WIND} km/h\n\
  Humidity   :  ${HUM}%\n\
  Sunrise    :  $SUNRISE\n\
  Sunset     :  $SUNSET\n\
󰵃  AQI        :  $EAQI  ($AQI_TEXT)\
</tt>"

printf '{"text":"%s %s°C","tooltip":"%s","class":"%s"}\n' \
"$ICON" "$TEMP" "$TOOLTIP" "$CLASS"
