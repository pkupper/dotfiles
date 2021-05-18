if [ "$(tty)" = "/dev/tty1" ]; then
    export QT_QPA_PLATFORM=wayland
	export MOZ_ENABLE_WAYLAND=1
	export XDG_CURRENT_DESKTOP=sway
	export WLR_XWAYLAND=/home/paul/.local/bin/Xwayland
	systemd-cat --identifier=sway sway
    systemctl --user stop sway-session.target
fi
