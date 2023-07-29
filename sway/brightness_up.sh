#!/bin/bash
CURRENT_BRIGHTNESS=$(brightnessctl -l | grep --after-context=1 backlight | awk '/brightness/ {print $3}')
if [ "$CURRENT_BRIGHTNESS" -lt 230 ]; then 
  brightnessctl -d amdgpu_bl0 set $(($CURRENT_BRIGHTNESS + 20)) 
fi
