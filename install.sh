if [ ! -d "~/.config/autostart.sh" ]; then
	ln -sf "`pwd`/autostart.sh" ~/.config/autostart.sh
	if [ ! -d "~/.config/autostart.py" ]; then
		ln -sf "`pwd`/autostart.py" ~/.config/autostart.py
	fi
fi

if [ ! -d "~/.config/awesome" ]; then
	ln -sf "`pwd`/awesome" ~/.config/awesome 
fi

if [ ! -d "~/.config/alacritty" ]; then
	ln -sf "`pwd`/alacritty" ~/.config/alacritty
fi

if [ ! -f "~/.bashrc" ]; then
	ln -sf "`pwd`/bash/.bashrc" ~/.bashrc
fi

if [ ! -f "~/.bashrc-personal" ]; then
	ln -sf "`pwd`/bash/.bashrc-personal" ~/.bashrc-personal
fi

if [ ! -f "~/.zshrc" ]; then
	ln -sf "`pwd`/zsh/.zshrc" ~/.zshrc
fi

if [ ! -f "~/.zshrc-personal" ]; then
	ln -sf "`pwd`/zsh/.zshrc-personal" ~/.zshrc-personal
fi

if [ -d "`pwd`/st" ]; then
	cd "`pwd`/st"
	sudo make clean install
	cd ..
fi

if [ ! -d "~/.emacs.d" ]; then
	ln -sf "`pwd`/emacs/.emacs.d" ~/.emacs.d
fi

if [ ! -f "~/.emacs" ]; then
	ln -sf "`pwd`/emacs/.emacs" ~/.emacs
fi

if [ ! -d "~/.config/nvim" ]; then
	ln -sf "`pwd`/nvim" ~/.config/nvim
fi

if [ -d "`pwd`/bspwm" ]; then
	cd "`pwd`/bspwm"
	chmod +x install.sh
	./install.sh
	cd  ..
fi

if [ ! -d "~/.config/rofi" ]; then
	ln -sf "`pwd`/rofi" ~/.config/rofi
fi
