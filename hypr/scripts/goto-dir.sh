#!/bin/bash
# quick directory navigator - type a path, hit enter, boom you're there

dir=$(rofi -dmenu -p "goto" -theme-str 'entry { placeholder: "~/path/to/dir"; }' -l 0)

# bail if cancelled
[[ -z "$dir" ]] && exit 0

# shortcut keywords
case "${dir,,}" in
    veracrypt|vera|a)
        dir="/media/veracrypt1/" ;;
    download|downloads|dl)
        dir="$HOME/Downloads" ;;
    desktop|ds)
        dir="$HOME/Desktop" ;;
    d:|d:/|d)
        dir="/run/media/xo/Local Disk/" ;;
    *)
        # expand ~ to home for regular paths
        dir="${dir/#\~/$HOME}" ;;
esac

# check if it exists
if [[ -d "$dir" ]]; then
    thunar "$dir" &
elif [[ -f "$dir" ]]; then
    # if it's a file, open the parent dir and select the file
    thunar --select "$dir" &
else
    notify-send "Directory not found" "$dir"
fi
