#!/usr/bin/env bash

interval=20

#extract the brightness
brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)



# the argument ($1) can be up/down

if [ $1 == 'up' ]
then
    brightness=$((brightness + interval))
elif [ $1 == 'down' ]
then
    brightness=$((brightness - interval))
else
    exit 1
fi

echo "$brightness" | sudo tee /sys/class/backlight/amdgpu_bl1/brightness
