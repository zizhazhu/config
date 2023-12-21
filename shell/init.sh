shell=$(ps |  grep $$  |  awk '{print $4}')

# prevent from loading this script twice
if [ -z "$_INIT_SH_LOADED" ]; then
	_INIT_SH_LOADED=1
else
	return
fi

alias ls='ls --color=auto'
alias ll='ls -al'
alias dc='docker-compose'

# put local bin into PATH
if [ -d "$HOME/local" ]; then
    export MY_LOCAL="$HOME/local"
    export PATH="$HOME/local/bin:$PATH"
    export C_INCLUDE_PATH="$HOME/local/include:$C_INCLUDE_PATH"
    export CPP_INCLUDE_PATH="$HOME/local/include:$CPP_INCLUDE_PATH"
    export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"
fi

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

if [ $shell = "zsh" ]; then
    bindkey -s '^T' 'task -i\n'
fi

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

# kubectl alias
kubectl_alias() {
    alias k='kubectl'
    alias kug='kubectl get'
    alias kud='kubectl describe'
}

type kubectl > /dev/null 2>&1
exists=$?
if [ $exists = 0 ]; then
    kubectl_alias
fi

type asynctask > /dev/null 2>&1
exists=$?
if [ $exists = 0 ]; then
    alias task="asynctask -f"
fi

