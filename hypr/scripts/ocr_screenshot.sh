#!/bin/bash
# Select region and take a temporary screenshot
# Slurp handles your multi-monitor layout natively
grim -g "$(slurp)" /tmp/ocr_snapshot.png

# Run OCR on the snapshot
# 'stdout' tells tesseract to output text to the terminal
# 'wl-copy' puts that output into your clipboard
tesseract /tmp/ocr_snapshot.png stdout -l eng | wl-copy

# Optional: Send a notification so you know it worked
notify-send "OCR Complete" "Text copied to clipboard"

# Clean up
rm /tmp/ocr_snapshot.png
