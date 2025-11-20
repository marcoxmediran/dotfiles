#!/usr/bin/env bash

CONSERVATION_MODE_STATUS=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode)
echo $CONSERVATION_MODE_STATUS

if [ "$CONSERVATION_MODE_STATUS" == "1" ]; then
  # Turn off conservation mode
  echo 0 | doas tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode > /dev/null
  # Notify if successful
  if [ $? == 0 ]; then
    notify-send -h int:transient:1 "Conservation Mode turned off."
  fi
else
  # Turn on conservation mode
  echo 1 | doas tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode > /dev/null
  # Notify if successful
  if [ $? == 0 ]; then
    notify-send -h int:transient:1 "Conservation Mode turned on."
  fi
fi
