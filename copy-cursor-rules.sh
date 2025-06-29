#!/bin/bash

# Script to copy cursor rules from $CURSOR_RULES_DIR to .cursor/rules in current directory

set -e

# Check if CURSOR_RULES_DIR is defined
if [ -z "$CURSOR_RULES_DIR" ]; then
    echo "Error: CURSOR_RULES_DIR environment variable is not defined" >&2
    exit 1
fi

# Check if source directory exists
if [ ! -d "$CURSOR_RULES_DIR" ]; then
    echo "Error: Source directory '$CURSOR_RULES_DIR' does not exist" >&2
    exit 1
fi

# Create destination directory if it doesn't exist
DEST_DIR=".cursor/rules"
mkdir -p "$DEST_DIR"

# Copy all files from source to destination recursively, overwriting existing ones
echo "Copying cursor rules from '$CURSOR_RULES_DIR' to '$DEST_DIR'..."
cp -rf "$CURSOR_RULES_DIR"/* "$DEST_DIR/"

echo "Successfully copied cursor rules to '$DEST_DIR'" 
