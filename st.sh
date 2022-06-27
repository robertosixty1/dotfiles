terminal=st

if pgrep "tmux" ; then
	$terminal -e tmux a
else
	$terminal -e tmux
fi
