#!/bin/bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
run nm-applet
#run caffeine
#run pamac-tray
#run variety
#run xfce4-power-manager
#run blueberry-tray
#run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
#run numlockx on
run volumeicon
#run nitrogen --restore
#run conky -c $HOME/.config/awesome/system-overview
run picom --config ~/.config/awesome/picom.conf
run pulseaudio --start

#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop

pgrep -x sxhkd > /dev/null || sxhkd &

python3 ~/.config/autostart.py &
