#!/bin/bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

function run_without_de {
    if ! pgrep "gnome-shell" ; then
        run $@
    fi
}

#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
#run caffeine
#run pamac-tray
#run variety
#run xfce4-power-manager
#run blueberry-tray
#run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
#run numlockx on
#run nitrogen --restore
#run conky -c $HOME/.config/awesome/system-overview
run pulseaudio --start

run_without_de picom --config ~/.config/awesome/picom.conf
run_without_de volumeicon
run_without_de nm-applet

run emacs --daemon
run python3 ~/.config/autostart.py

#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop

if pgrep "bspwm" ; then
	sxhkd -c ~/.config/sxhkd/sxhkdrc.bspwm
else
	sxhkd -c ~/.config/sxhkd/sxhkdrc
fi
