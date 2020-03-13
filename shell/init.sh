# clear up repeated path in PATH
if [ -n "$PATH" ]; then
	old_PATH=$PATH:; PATH=
	while [ -n "$old_PATH" ]; do
		x=${old_PATH%%:*}      
		case $PATH: in
			*:"$x":*) ;;         
			*) PATH=$PATH:$x;;  
		esac
		old_PATH=${old_PATH#*:}
	done
	PATH=${PATH#:}
	unset old_PATH x
fi

# prevent from loading this script twice
if [ -z "$_INIT_SH_LOADED" ]; then
	_INIT_SH_LOADED=1
else
	return
fi

export CONFIG_PATH=$(dirname $0)/../

# $- shows the current set of options in your current shell
# H - histexpand
# m - monitor
# h - hashall
# B - braceexpand
# i - interactive
case "$-" in
	*i*) ;;
	*) return
esac

# put local bin into PATH
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

