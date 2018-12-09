#!/bin/sh
#
# Set wacom tablet drawing area on the screen
#
# Requirements: xsetwacom
#

# width x height + x_offset + y_offset
output="1680x1050+0+0"

xsetwacom --list devices | grep -o 'id:\ [0-9]\{1,\}' | while read -r line
do
    id=$(echo $line | grep -o '[0-9]\{,\}')
    xsetwacom --set $id MapToOutput $output
done

