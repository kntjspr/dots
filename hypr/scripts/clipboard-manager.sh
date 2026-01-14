#!/bin/bash
# Clipboard manager using cliphist with rofi/wofi

# Show clipboard history with rofi
selected=$(cliphist list | rofi -dmenu -p "Clipboard" -i -theme-str 'window {width: 50%;} listview {lines: 15;}')

if [[ -n "$selected" ]]; then
    # Put the selected item back to clipboard
    echo "$selected" | cliphist decode | wl-copy
fi
