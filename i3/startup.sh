#!/bin/bash
MONITOR_CONNECTED=$(cat /sys/class/drm/card0-DP-1/status)
MONITOR_CONNECTED2=$(cat /sys/class/drm/card0-DP-2/status)
if [ "$MONITOR_CONNECTED" == "connected" ]; then
  echo 'Dual monitor setup'
  xrandr --output eDP --off --output DisplayPort-0 --auto --primary
  #xrandr --output DisplayPort-0 --auto --right-of eDP --primary
fi
if [ "$MONITOR_CONNECTED2" == "connected" ]; then
  echo 'Dual monitor setup'
  xrandr --output eDP --off --output DisplayPort-1 --auto --primary
  #xrandr --off --output DisplayPort-1 --auto --right-of eDP--primary
fi
sleep 1
nitrogen --restore
flatpak run com.github.hluk.copyq
picom
