# configure oh-my-zsh
export ZSH="/home/paul/.oh-my-zsh"

if [[ $UID -ge 1000 && -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]]
then
    export PATH="${PATH}:$HOME/.local/bin"
fi


alias sway="sway > ~/.log/sway/sway.log 2>&1"

case $(tty) in 
	(/dev/tty[1-9]) 
		autoload -Uz promptinit
		promptinit
		prompt fade blue
  		;; 
  	(*)
  		ZSH_THEME="agnoster"
  		plugins=(git zsh-autosuggestions)
		source $ZSH/oh-my-zsh.sh
  		;; 
esac

if [ "$(tty)" = "/dev/tty1" ]; then
	export QT_QPA_PLATFORM=wayland
	export MOZ_ENABLE_WAYLAND=1
	# export GDK_BACKEND=wayland
	export XDG_CURRENT_DESKTOP=sway
	exec sway
fi

# configure aliases
# source $PWD/../.alias

export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"


