#!/usr/bin/env bash

# `rc.xml`, `menu.xml`, `autostart`, and `environment`.
# env
# This allows xdg-desktop-portal-wlr to function (e.g. for screen-recording)
export XDG_CURRENT_DESKTOP=wlroots
export XKB_DEFAULT_OPTIONS=ctrl:swapcaps
# Force firefox to use wayland backend
export MOZ_ENABLE_WAYLAND=1
# For Java applications such as JetBrains/Intellij Idea, set this variable
# to avoid menus with incorrect offset and blank windows
# See https://github.com/swaywm/sway/issues/595
export _JAVA_AWT_WM_NONREPARENTING=1


# autostart
# Example autostart file
Set background color.
swaybg -c '#113344' >/dev/null 2>&1 &
#eww kill
#eww daemon
#eww open labwc -c ~/.config/eww


# https://gist.github.com/DrSensor/4e0187813a9511b6e879570a1dd31aca

#topbar: waybar

#dock: sfwbar
waybar >/dev/null 2>&1 &
sfwbar >/dev/null 2>&1 &
mako >/dev/null 2>&1 &
swayidle
# source .bashrc