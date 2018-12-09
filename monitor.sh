#!/bin/sh
#
# Switch monitor layouts
#
# Requirements: xrandr
#
# Usage: monitor.sh [n]
#
# n     layout index (default 0)
#
#   0   M1 : M2
#   1   M1
#   2   M2

M1="DVI-D-0"
M2="HDMI-A-0"

case $1 in
    "1")
        xrandr --output $M1 --auto --output $M2 --off
        ;;
    "2")
        xrandr --output $M1 --off --output $M2 --auto
        ;;
    *)
        xrandr --output $M1 --auto --output $M2 --auto --right-of $M1
        ;;
esac

