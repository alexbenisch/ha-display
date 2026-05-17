#!/usr/bin/env bash
set -euo pipefail

DEVICE_IP="192.168.178.101"
TIMESTAMP=$(date +"%Y%m%d_%H%M")
BMP="/tmp/ha-display_${TIMESTAMP}.bmp"
JPG="$(dirname "$0")/${TIMESTAMP}_screenshot.jpg"

echo "Downloading screenshot from ${DEVICE_IP}..."
curl -s -m 120 "http://${DEVICE_IP}/screenshot" -o "$BMP"

echo "Converting and rotating..."
magick "$BMP" -rotate -90 "$JPG"
rm "$BMP"

echo "Saved: $JPG"
xdg-open "$JPG" 2>/dev/null &
