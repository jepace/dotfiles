#!/bin/sh -e

/bin/rm -f /tmp/screen_locked.png

# Take a screenshot
/usr/local/bin/scrot /tmp/screen_locked.png

# Pixellate it 10x
/usr/local/bin/mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
#/usr/local/bin/mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image.
/usr/local/bin/i3lock -i /tmp/screen_locked.png

# Turn the screen off after a delay.
sleep 180
/bin/pgrep i3lock && /usr/local/bin/xset dpms force off
