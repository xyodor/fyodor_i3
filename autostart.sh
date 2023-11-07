#!/bin/bash

get_desktop_command() {
    command=$(cat $1 | grep ^Exec | sed "s/Exec=//g")
    $command &
}

AUTOSTARTDIR="$HOME/.config/autostart"
FILES=$(ls $AUTOSTARTDIR)
for file in $FILES; do
    file="$AUTOSTARTDIR/$file"
    if [ -f $file ]; then
        get_desktop_command $file
    fi
done