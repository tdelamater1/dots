#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $USER -x polybar; do sleep 0.1; done

# Launch bars
polybar main &
polybar external &
polybar external2 &
