#!/bin/bash
# rofi script mode - pure input, no dropdown list

if [[ -n "$1" ]]; then
    # user submitted something
    input="${1,,}"
    case "$input" in
        veracrypt|vera|a) coproc (thunar "/media/veracrypt1/" &) ;;
        download|downloads|dl) coproc (thunar "$HOME/Downloads" &) ;;
        desktop|ds) coproc (thunar "$HOME/Desktop" &) ;;
        d:|d:/|d) coproc (thunar "/run/media/xo/Local Disk/" &) ;;
        ~*) 
            dir="${1/#\~/$HOME}"
            [[ -d "$dir" ]] && coproc (thunar "$dir" &) ;;
        /*)
            [[ -d "$1" ]] && coproc (thunar "$1" &) ;;
    esac
fi
# output nothing = no dropdown list
