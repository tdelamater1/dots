#!/usr/bin/env bash

## Sway-native power menu for Waybar.
## Reuses the adi1090x rofi "type-3" theme for a consistent look.

dir="$HOME/.config/rofi/powermenu/type-3"
theme='style-1'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host="$(hostname)"

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-select "$lock" \
		-theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-select "$yes" \
		-theme "${dir}/shared/confirm.rasi"
}

confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" && -n "$yes" ]]; then
		case "$1" in
			--shutdown) systemctl poweroff ;;
			--reboot)   systemctl reboot ;;
			--suspend)  systemctl suspend ;;
			--logout)   swaymsg exit ;;
		esac
	else
		exit 0
	fi
}

chosen="$(run_rofi)"
# Escape / no selection returns an empty string — bail out before the case
# statement, otherwise an empty $chosen would match an empty option variable.
[[ -z "$chosen" ]] && exit 0
case "${chosen}" in
	"$shutdown") run_cmd --shutdown ;;
	"$reboot")   run_cmd --reboot ;;
	"$lock")     swaylock -c 1a1a1a ;;
	"$suspend")  run_cmd --suspend ;;
	"$logout")   run_cmd --logout ;;
esac
