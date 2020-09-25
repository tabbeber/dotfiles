#!/bin/sh
loc=$(head -n 1 ~/.config/polybar/scripts/content/location)

while true
do	
	wget -q --spider archlinux.org
	if [ $? -eq 0 ]; then
		curl -s 'wttr.in/'${loc}'?format=j1' > ~/.config/polybar/scripts/content/shortreport
		sleep 3600
		loc=$(head -n 1 ~/.config/polybar/scripts/content/location)
	else
		sleep 10
	fi
done
