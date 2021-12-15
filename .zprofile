if [ "$XDG_SESSION_DESKTOP" = "sway-in-shell" ] ; then
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=qt5ct
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_DBUS_REMOTE=1
    export XDG_CURRENT_DESKTOP=sway
fi
