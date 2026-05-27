#!/bin/bash
set $laptop = 'eDP-1'
MONITOR_CONNECTED=$(cat /sys/class/drm/card0-DP-1/status)
MONITOR_CONNECTED2=$(cat /sys/class/drm/card0-DP-2/status)
if [ "$MONITOR_CONNECTED" == "connected" ]; then
  swaymsg output eDP-1 disable
fi
if [ "$MONITOR_CONNECTED2" == "connected" ]; then
  swaymsg output eDP-1 disable
fi
