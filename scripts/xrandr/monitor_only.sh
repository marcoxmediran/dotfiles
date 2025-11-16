#!/bin/env bash

HAS_MONITOR=`xrandr --listmonitors | grep HDMI-A-0`

if [ $? == 0 ]; then
  # Get highest monitor refresh rate
  rate=$(xrandr \
    | sed -n '/^HDMI-A-0 connected/,/connected/p' \
    | grep -E '^\s+1920x1080' \
    | grep -oE '[0-9]+\.[0-9]+' \
    | sort -nr \
    | head -1
  )

  xrandr --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --rate $rate --pos 0x0 --rotate normal
fi
