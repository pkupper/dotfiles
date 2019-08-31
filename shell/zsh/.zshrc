# configure oh-my-zsh
export ZSH="/home/paul/.oh-my-zsh"

case $(tty) in 
  (/dev/tty[1-9]) ZSH_THEME="robbyrussell";; 
              (*) ZSH_THEME="agnoster";; 
esac

plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# configure aliases
# source $PWD/../.alias

export SUDO_EDITOR=/usr/bin/gedit
