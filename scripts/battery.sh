#!/bin/bash
POWER=$(cat /sys/class/power_supply/AC/online)
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
PBAT=$BAT

while true
do

while [ $POWER -eq 1 ]
do

#echo "$POWER (connected) and $BAT% current, $PBAT% before"
if [[ $BAT -gt 79 ]] && [[ $PBAT -lt 80 ]]
then
	notify-send "Battery at 80%" "Consider unplugging"
	PBAT=$BAT
	sleep 60
elif [[ $BAT -gt 99 ]] && [[ $PBAT -lt 100 ]]
then
	notify-send "Battery at 100%" "Unplug? 🙃"
	PBAT=$BAT
	sleep 60
else
	PBAT=$BAT
	sleep 60
fi
POWER=$(cat /sys/class/power_supply/AC/online)
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
done

while [ $POWER -eq 0 ]
do

#echo "$POWER (disconnected) and $BAT% current, $PBAT% before"
if [[ $PBAT -gt 40 ]] && [[ $BAT -lt 41 ]]
then
	notify-send "Battery at 40%" "Consider charging"
	PBAT=$BAT
	sleep 60
elif [[ $PBAT -gt 10 ]] && [[ $BAT -lt 11 ]]
then
	notify-send "Battery at 10%" "Charge or shut down"
	PBAT=$BAT
	sleep 60
else
	PBAT=$BAT
	sleep 60
fi
POWER=$(cat /sys/class/power_supply/AC/online)
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
done
done
