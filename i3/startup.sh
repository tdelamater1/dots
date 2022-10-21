#!/bin/bash
MONITOR_CONNECTED=$(cat /sys/class/drm/card0-DP-2/status)
if [ "$MONITOR_CONNECTED" == "connected" ]; then
  echo 'Dual monitor setup'
  xrandr --output eDP --off --output DisplayPort-1 --auto --primary
fi
sleep 1
nitrogen --restore
flatpak run com.github.hluk.copyq
picom
xmodmap /home/td/.Xmodmap
