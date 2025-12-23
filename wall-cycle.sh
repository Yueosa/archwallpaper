#!/bin/bash

WALLPAPER_DIR="$HOME/Videos/background"
INTERVAL=600 # 10分钟，单位为秒

change_wallpaper() {
    SELECTED_WALL=$(find "$WALLPAPER_DIR" -name "*.mp4" | shuf -n 1)

    if [ -n "$SELECTED_WALL" ]; then
        pkill mpvpaper
        mpvpaper -o "--loop --no-audio --hwdec=auto" '*' "$SELECTED_WALL" &
    fi
}

case "$1" in
    change)
        change_wallpaper
        ;;
    loop)
        while true; do
            change_wallpaper
            sleep $INTERVAL
        done
        ;;
    *)
        echo "用法："
        echo "  wall-cycle.sh change  # 切换一次壁纸"
        echo "  wall-cycle.sh loop    # 开启后台自动定时切换"
        ;;
esac
