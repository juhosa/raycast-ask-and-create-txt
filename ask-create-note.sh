#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Save as a note to the current directory
# @raycast.mode silent
# @raycast.icon 📂

# Optional parameters:
# @raycast.argument1 { "type": "text", "placeholder": "The Thing To Remember" }
#
# Documentation:
# @raycast.author Juho Salli
# @raycast.authorURL https://github.com/juhosa

# Get the frontmost Finder window's directory
DEST_DIR=$(osascript -e 'tell application "Finder" to get POSIX path of (target of front window as alias)')

# If Finder is closed, exit
if [ -z "$DEST_DIR" ]; then
  echo "No Finder window detected."
  exit 1
fi

# Create the file with the contents
echo "$1" >> "$DEST_DIR/note.txt"

echo "Note created"

