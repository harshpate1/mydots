#!/usr/bin/env bash

THEME="$HOME/.config/rofi/powermenu.rasi"
CONFIRM_THEME="$HOME/.config/rofi/confirm.rasi"
INFO_THEME="$HOME/.config/rofi/info.rasi"
ICON_DIR="$HOME/.config/rofi/icons"
# -------- System info --------
host="$(hostname)"
uptime="$(uptime -p | sed 's/up //')"
login_time="$(last $user | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7)"


# -------- Menu options (PNG icons) --------
options=(
  "Shutdown\0icon\x1f$ICON_DIR/power.png"
  "Reboot\0icon\x1f$ICON_DIR/restart.png"
  "Lock\0icon\x1f$ICON_DIR/lock.png"
  "Suspend\0icon\x1f$ICON_DIR/suspend.png"
  "Logout\0icon\x1f$ICON_DIR/logout.png"
  "Hibernate\0icon\x1f$ICON_DIR/hibernate.png"
)

# -------- Rofi menus --------
main_menu() {
  printf '%b\n' "${options[@]}" | rofi -dmenu \
    -show-icons \
    -theme "$THEME" \
    -p "󰣇 $USER@$host" \
    -mesg " Uptime: $uptime  |  󰌢 Last login: $login_time"
}

confirm_menu() {
  printf "Yes\nNo" | rofi -dmenu \
    -theme "$CONFIRM_THEME" \
    -p "Confirmation" \
    -mesg "Are you sure?"
}

# -------- Run --------
chosen="$(main_menu)"
[[ -z "$chosen" ]] && exit 0

case "$chosen" in
  Shutdown)
    [[ "$(confirm_menu)" == "Yes" ]] && systemctl poweroff
    ;;
  Reboot)
    [[ "$(confirm_menu)" == "Yes" ]] && systemctl reboot
    ;;
  Hibernate)
    [[ "$(confirm_menu)" == "Yes" ]] && systemctl hibernate
    ;;
  Suspend)
    systemctl suspend
    ;;
  Lock)
    hyprlock 2>/dev/null || swaylock
    ;;
  Logout)
    [[ "$(confirm_menu)" == "Yes" ]] && hyprctl dispatch exit
    ;;
esac
