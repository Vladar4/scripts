#!/bin/sh
#
# Screenshot taking script
#
# Requirements: scrot
#
# Usage: screenshot.sh [-w]
# -w    take screenshot of active window

save_path='images/screenshots/' # Saving path in home directory
fmt='%F_%T'                     # Scrot naming format
fmt_w='%F_%T_$wx$h'             # Scrot naming format for -w option
suffix='_scrot'                 # File suffix
extension='png'                 # File extension

arg=`getopt w $*`
if [[ $arg == *-w* ]]
then
    `scrot -u ${save_path}${fmt_w}${suffix}.${extension}`
else
    `scrot ${save_path}${fmt}${suffix}.${extension}`
fi
exit 0
