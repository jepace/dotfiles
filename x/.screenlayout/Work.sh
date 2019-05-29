#!/bin/sh
xrandr > /dev/null 2>&1
xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --output eDP1 --mode 1920x1080 --pos 0x1080
