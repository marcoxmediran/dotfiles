#!/bin/env bash

disabled_workspaces=("6" "7" "8" "9" "down" "last" "left" "right" "up")
disabled_count=${#disabled_workspaces[@]}

for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
for (( i = 0; i < disabled_count; i++ )); do
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-${disabled_workspaces[i]} "[]"
done

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
for (( i = 0; i < disabled_count; i++ )); do
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-${disabled_workspaces[i]} "[]"
done

gsettings set org.gnome.shell.keybindings screenshot "['<Control><Super>3']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Control><Super>4']"
gsettings set org.gnome.shell.keybindings show-screen-recording-ui "['<Control><Super>5']"

gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['<Super>8']"
gsettings set org.gnome.settings-daemon.plugins.media-keys play "['<Super>9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Super>0']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Super>minus']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Super>equal']"

gsettings set org.gnome.desktop.wm.keybindings close "['<Super>Q']"
