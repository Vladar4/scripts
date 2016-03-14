#!/bin/sh
#
# Nvidia video card fan speed control script
#
# Requirements: nvidia-settings
#
# Run this script in autostart

interval=10     # run script each $interval seconds
safe_temp=40    # if temperature <= $safe_temp set fan speed to $normal_speed
normal_speed=50 # default fan speed
plus_speed=10   # if temperature > $safe_temp set fan speed to
                #   $plus_speed + temperature

while true; do
    current_temp=`nvidia-settings -t -q [GPU:0]/GPUCoreTemp`
    if [ "$current_temp" -le $safe_temp ]; then
        nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=$normal_speed
    else
        speed=$(( $plus_speed + $current_temp ))
        if [ "$speed" -gt 100 ]; then speed=100; fi
        nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=$speed
    fi
    sleep "$interval"
done
