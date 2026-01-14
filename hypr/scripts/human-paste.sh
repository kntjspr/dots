#!/bin/bash
# Human-like paste script for Wayland (Hyprland)
# Pastes clipboard content character by character with random delays

MAX_DELAY=0.5  # Maximum delay in seconds

# Get clipboard content
CLIPBOARD=$(wl-paste 2>/dev/null)

if [[ -z "$CLIPBOARD" ]]; then
    notify-send "Clipboard Empty" "Nothing to paste" -t 2000
    exit 1
fi

# Type each character with a random delay
while IFS= read -r -n1 char; do
    if [[ -n "$char" ]]; then
        # Handle special characters for wtype
        case "$char" in
            $'\t') wtype -k Tab ;;
            ' ') wtype -k space ;;
            *) wtype -- "$char" ;;
        esac
    elif [[ -z "$char" ]]; then
        # Handle newline
        wtype -k Return
    fi
    
    # Random delay between 0 and MAX_DELAY seconds (in milliseconds for better precision)
    delay=$(awk -v max="$MAX_DELAY" 'BEGIN{srand(); printf "%.3f", rand()*max}')
    sleep "$delay"
done <<< "$CLIPBOARD"
