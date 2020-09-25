#!/bin/bash

timestamp() {
    date +"%s"
}
eval "maim ~/Pictures/screenshots/$(timestamp).png"

OP=$(python $HOME/.local/bin/notify-send.py 'Screenshot of screen saved' --action folder:'Open in Folder' gimp:'Open in Gimp')
if [[ $OP == f* ]]
then
    xdg-open ~/Pictures/screenshots/
elif [[ $OP == g* ]]
then
    gimp ~/Pictures/screenshots/$(timestamp).png
else
    exit 0
fi
