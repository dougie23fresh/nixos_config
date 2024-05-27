#!/usr/bin/env bash


# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Applications'
mesg="Installed Packages : `pacman -Q | wc -l` (pacman)"

list_col='1'
list_row='6'

# CMDs (add your apps here)
term_cmd='alacritty'
file_cmd='thunar'
text_cmd='geany'
web_cmd='firefox'
music_cmd='alacritty -e ncmpcpp'
setting_cmd='xfce4-settings-manager'

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Terminal <span weight='light' size='small'><i>($term_cmd)</i></span>"
	option_2=" Files <span weight='light' size='small'><i>($file_cmd)</i></span>"
	option_3=" Editor <span weight='light' size='small'><i>($text_cmd)</i></span>"
	option_4=" Browser <span weight='light' size='small'><i>($web_cmd)</i></span>"
	option_5=" Music <span weight='light' size='small'><i>($music_cmd)</i></span>"
	option_6=" Settings <span weight='light' size='small'><i>($setting_cmd)</i></span>"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
	option_6=""
fi
# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}
#killall rofi || rofi -show drun -theme ~/.config/hypr/config.rasi
