eval $(dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
feh --bg-scale /home/cjwade/Pictures/IMG_6269.JPG &
slstatus &
exec dwm
