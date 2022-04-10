if [ ! -d "~/.config/bspwm" ]; then
	ln -sf "`pwd`/bspwm" ~/.config/bspwm
fi

if [ ! -d "~/.config/dunst" ]; then
	ln -sf "`pwd`/dunst" ~/.config/dunst
fi

if [ ! -d "~/.config/polybar" ]; then
	ln -sf "`pwd`/polybar" ~/.config/polybar
fi

if [ ! -d "~/.config/sxhkd" ]; then
	ln -sf "`pwd`/sxhkd" ~/.config/sxhkd
fi
