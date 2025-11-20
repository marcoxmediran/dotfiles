#!/bin/env bash

# Save selection screenshot
FILENAME="Screenshot From $(date +'%F %T')"
FILEPATH="Pictures/Screenshots"
maim -s ~/"${FILEPATH}/${FILENAME}.png"

# Notify if successful
if [ $? == 0 ]; then
  notify-send -h int:transient:1 "$FILENAME saved to ~/$FILEPATH"
fi
