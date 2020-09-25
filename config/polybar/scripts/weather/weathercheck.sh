#!/bin/sh
checkloc=$(cat ~/.config/polybar/scripts/content/location | sed 's/+/ /g')
if [ -z "$checkloc" ] 
then
	loc=$(rofi -dmenu -theme prompt -p "Enter a location for the weather widget" | sed 's/ /+/g')
	echo $loc > ~/.config/polybar/scripts/content/
	curl -s wttr.in/${loc}?format=j1 > ~/.config/polybar/scripts/content/shortreport
else
	newloc=$(rofi -dmenu -theme prompt -p "Current location is $checkloc. Change location? Esc to cancel" | sed 's/ /+/g')
	[ -z "$newloc" ] && exit 0
	echo $newloc > ~/.config/polybar/scripts/content/location
	curl -s wttr.in/${newloc}?format=j1 > ~/.config/polybar/scripts/content/shortreport
fi
