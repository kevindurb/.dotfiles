#!/bin/bash
PLUGIN_DIR="$HOME/.config/tmux/plugins"

for plugin in "$PLUGIN_DIR"/*/; do
    if [ -d "$plugin" ]; then
        # Try common plugin file names
        for file in "plugin.tmux" "main.tmux" "$(basename "$plugin").tmux"; do
            if [ -f "$plugin/$file" ]; then
                tmux source-file "$plugin/$file"
                break
            fi
        done
    fi
done
