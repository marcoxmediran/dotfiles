#!/bin/env bash

# Send desktop screenshot to clipboard
maim | xclip -sel clipboard -t image/png

# Notify if successful
if [ $? == 0 ]; then
  notify-send -h int:transient:1 "Screenshot copied to clipboard."
fi
