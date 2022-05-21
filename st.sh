terminal=st

$terminal -e tmux a

if [ $? = 1 ]; then
	$terminal -e tmux
fi
