#!/bin/sh
~/.config/polybar/scripts/weather/weather.sh &
while true
do
	temp=$(grep "temp_C" ~/.config/polybar/scripts/content/shortreport | head -n 1| sed 's/.*: \"//' | sed 's/",//')
	prec=$(grep "precipMM" ~/.config/polybar/scripts/content/shortreport | head -n 1| sed 's/.*: \"//' | sed 's/",//')
	code=$(grep "weatherCode" ~/.config/polybar/scripts/content/shortreport | head -n 1| sed 's/.*: \"//' | sed 's/",//')
	emoji=$(grep "${code}" ~/.config/polybar/scripts/content/wicon | sed 's/ -.*//')
	report="%{F#81a1c1}${emoji}%{F-} ${temp}°C   %{F#81a1c1}%{F-} ${prec}mm"
if	[ -z "$temp" ] 
then
	echo ""
	sleep 20
else
	echo $report
	sleep 10
fi
done
