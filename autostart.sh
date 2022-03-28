#!/bin/bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

function set_random_wallpaper {
    for x in ~/Pictures/wallpapers/*; do
	var=$RANDOM
	var=$[ 0 + $var % (1 + 1 - 0) ]
	if [ "$var" = "1" ]; then
	    feh --bg-fill $x &
	    break
	fi
    done
}

run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
run nm-applet
#run caffeine
run pamac-tray
#run variety
run xfce4-power-manager
run blueberry-tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
run volumeicon
#run nitrogen --restore
#run conky -c $HOME/.config/awesome/system-overview
picom --config ~/.config/awesome/picom.conf

set_random_wallpaper

#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop