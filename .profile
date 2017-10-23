if [ "$DESKTOP_SESSION" = "i3" ]; then
    export XMODIFIERS=@im=fcitx
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
fi

if [ "$DESKTOP_SESSION" = "budgie-desktop" ]; then
    export XMODIFIERS=@im=fcitx
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    /usr/bin/fcitx&
fi
