#!/bin/env bash

HAS_MONITOR=`xrandr --listmonitors | grep HDMI-A-0`

if [ $? == 0 ]; then
  xrandr --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --rate 100 --pos 0x0 --rotate normal
fi
