#!/bin/sh -e
BINDIR="/usr/bin"

/bin/rm -f /tmp/screen_locked.png

# Take a screenshot
$BINDIR/scrot /tmp/screen_locked.png

# Pixellate it 10x
$BINDIR/mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
#/usr/local/bin/mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image.
$BINDIR/i3lock -i /tmp/screen_locked.png

# Turn the screen off after a delay.
sleep 180
#/bin/pgrep i3lock && /usr/local/bin/xset dpms force off
/usr/bin/pgrep i3lock && $BINDIR/xset dpms force off
