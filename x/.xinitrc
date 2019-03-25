# . /usr/local/etc/xdg/xfce4/xinitrc

### 1/20/2019 - playing with i3
xset -b # disable bell
setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -solid "#333333"

# Enable google calendar notifications
#if [ -x /usr/bin/gcalcli ]; then
#  while true; do
#    /usr/bin/gcalcli --calendar="davis" remind
#    sleep 300
#  done &
#fi

xrandr --output VGA-0 --preferred

# install misc/qt5ct to configure qt5 themes
#export QT_QPA_PLATFORMTHEME="qt5ct"

# load .Xresources configuration
xrdb -merge ~/.Xresources

# set the background image (requires graphics/feh)
# feh --bg-fill /usr/local/share/wallpaper/wallpaper.png &

# I use x11/rxvt-unicode for my terminal emulator - you can run a server
# process to conserve resources.
#urxvtd -q -f -o

# install sysutils/dunst for lightweight OSD notifications
#dunst &

# I use security/keychain for persistent ssh/gpg agent between logins
#export SSH_ASKPASS=/usr/local/bin/ssh-askpass
#eval `keychain --quiet --eval --agents ssh,gpg id_ed25519 id_rsa cullum@c0ffee.net`

# Trying out i3wm
exec /usr/bin/ssh-agent /usr/local/bin/i3

# Trying out bspwm
#sxhkd &
#exec /usr/bin/ssh-agent bspwm
