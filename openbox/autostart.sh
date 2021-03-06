# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

#!/bin/sh

setxkbmap pt

eval `cat $HOME/.fehbg` &

tint2 &

keytouchd &
xfce-mcs-manager &

sleep 1 &
volwheel &

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV=""
if which /usr/lib/openbox/xdg-autostart >/dev/null; then
  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi



sleep 2 &
#conky -c /home/jlc/.config/openbox/conky/topbar &
pytyle &

