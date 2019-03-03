# . /usr/local/etc/xdg/xfce4/xinitrc


### 1/20/2019 - playing with i3
xset -b # disable bell
setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -solid "#333333"

xrandr --output VGA-0 --preferred
exec /usr/bin/ssh-agent /usr/local/bin/i3
