
if [[ $UID -ge 1000 && -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]]
then
    export PATH="${PATH}:$HOME/.local/bin"
fi

export PATH=${PATH}:~/.cargo/bin

export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

export CHROOT=$HOME/chroot
