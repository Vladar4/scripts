#!/bin/sh
#
# Nvidia video card fan speed control script
#
# Requirements: nvidia-settings
# and add
#   Option "Coolbits" "4"
# to your Xorg configuration in the "Device" section.
#
# Run this script in autostart

interval=10     # run script each $interval seconds
safe_temp=50    # if temperature <= $safe_temp set fan speed to $normal_speed
normal_speed=50 # default fan speed
plus_speed=0    # if temperature > $safe_temp set fan speed to
                #   $plus_speed + temperature

nvidia-settings -a [gpu:0]/GPUFanControlState=1

while true; do
    current_temp=`nvidia-settings -t -q [gpu:0]/GPUCoreTemp`
    if [ "$current_temp" -le $safe_temp ]; then
        nvidia-settings -a [fan:0]/GPUTargetFanSpeed=$normal_speed
        #nvidia-settings -a [fan:0]/GPUCurrentFanSpeed=$normal_speed
    else
        speed=$(( $plus_speed + $current_temp ))
        if [ "$speed" -gt 100 ]; then speed=100; fi
        nvidia-settings -a [fan:0]/GPUTargetFanSpeed=$speed
        #nvidia-settings -a [fan:0]/GPUCurrentFanSpeed=$speed
    fi
    sleep "$interval"
done
