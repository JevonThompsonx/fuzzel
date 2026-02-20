#!/usr/bin/env bash
set -e

THEMES_DIR="$HOME/Downloads/fuzzel"
CONFIG_DIR="$HOME/.config/fuzzel"
CONFIG_FILE="$CONFIG_DIR/fuzzel.ini"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Clone catppuccin fuzzel themes if not already present
if [ ! -d "$THEMES_DIR" ]; then
  echo "Cloning catppuccin/fuzzel themes to $THEMES_DIR..."
  git clone --depth=1 https://github.com/catppuccin/fuzzel "$THEMES_DIR"
else
  echo "Themes already present at $THEMES_DIR"
fi

# Create config dir if needed
mkdir -p "$CONFIG_DIR"

# Copy fuzzel.ini if running from a different location (e.g. fresh clone)
if [ "$SCRIPT_DIR" != "$CONFIG_DIR" ]; then
  echo "Copying fuzzel.ini to $CONFIG_FILE..."
  cp "$SCRIPT_DIR/fuzzel.ini" "$CONFIG_FILE"
else
  echo "fuzzel.ini already in place at $CONFIG_FILE"
fi

echo "Done. Fuzzel is configured with catppuccin-mocha/mauve theme."
