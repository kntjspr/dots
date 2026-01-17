#!/bin/bash
# takes screenshot, saves to file, and copies to clipboard

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

FILENAME="$SCREENSHOT_DIR/$(date +'%Y%m%d_%H%M%S').png"

grim -g "$(slurp)" "$FILENAME" && wl-copy < "$FILENAME" && notify-send "Screenshot saved" "$FILENAME"
