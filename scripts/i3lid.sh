#!/bin/bash
connected=$(xrandr | grep " connected" | wc -l)
open=$(cat /proc/acpi/button/lid/LID/state)
if [ $connected -eq 1 ]; then
	systemctl suspend
else
	while [ "$open" -eq "closed" && $connected -gt 1 ]
	do
		xrandr --output eDP --off
		sleep 1
		open=$open
		connected=$connected
	done
	if [ "$open" -eq "open" && $connected -gt 1 ]; then
		xrandr --output eDP --auto
	elif [ "$open" -eq "closed" && $connected -eq 1 ]; then
		xrandr --output eDP --auto
		systemctl suspend
	else
		xrandr --output eDP --auto
	fi
fi
