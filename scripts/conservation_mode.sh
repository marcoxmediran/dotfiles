#!/usr/bin/env bash

if [[ $# != 1 ]]; then
  echo "Usage: conserve [status|on|off]"
elif [[ $1 == "status" ]]; then
  status=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode)
  if [[ status == 1 ]]; then
    echo "[CONSERVATION_MODE]: ON"
  else
    echo "[CONSERVATION_MODE]: OFF"
  fi
elif [[ $1 == 'on' ]]; then
  echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode > /dev/null
  echo "[CONSERVATION_MODE]: TURNED ON"
elif [[ $1 == 'off' ]]; then
  echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode > /dev/null
  echo "[CONSERVATION_MODE]: TURNED OFF"
fi
