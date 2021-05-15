# configure oh-my-zsh
export ZSH="/home/paul/.oh-my-zsh"

if [[ $UID -ge 1000 && -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]]
then
    export PATH="${PATH}:$HOME/.local/bin"
fi


alias sway="sway > ~/.log/sway/sway.log 2>&1"

case $(tty) in 
	(/dev/tty[1-9]) 
  		ZSH_THEME="alanpeabody"
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6,bg=0"
  		DISABLE_AUTO_UPDATE="true"
  		plugins=(git zsh-autosuggestions)
		source $ZSH/oh-my-zsh.sh
		echo -e '\033[?17;0;64c'
  		;; 
  	(*)
  		ZSH_THEME="agnoster"
  		DISABLE_AUTO_UPDATE="true"
  		plugins=(git zsh-autosuggestions)
		source $ZSH/oh-my-zsh.sh
  		;; 
esac

if [ "$(tty)" = "/dev/tty1" ]; then
	# export QT_QPA_PLATFORM=wayland
	export MOZ_ENABLE_WAYLAND=1
	# export GDK_BACKEND=wayland
	export XDG_CURRENT_DESKTOP=sway
	export WLR_XWAYLAND=/home/paul/.local/bin/Xwayland
	exec systemd-cat --identifier=sway sway
fi

# configure aliases
# source $PWD/../.alias

export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="/usr/bin/gedit"

export CHROOT=$HOME/chroot


