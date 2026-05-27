#!/bin/bash

MONITOR_CONNECTED=$(cat /sys/class/drm/card0-DP-1/status)
MONITOR_CONNECTED2=$(cat /sys/class/drm/card0-DP-2/status)

if [ "$MONITOR_CONNECTED" == "connected" ]; then
  swaymsg output eDP-1 disable
elif [ "$MONITOR_CONNECTED2" == "connected" ]; then
  swaymsg output eDP-1 disable
else
  echo 'Single monitor setup'
  swaymsg output eDP-1 enable 
fi

killall -SIGUSR2 waybar
