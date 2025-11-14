#!/bin/env bash

HAS_MONITOR=`xrandr --listmonitors | grep HDMI-A-0`

if [ $? == 0 ]; then
  xrandr --output HDMI-A-0 --mode 1920x1080 --rate 100 --pos 0x0 --rotate normal --output eDP --auto --same-as HDMI-A-0
fi
