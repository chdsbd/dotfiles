#!/usr/bin/env bash

if ! [ -d "$HOME/Music/iTunes_backup" ]; then
    mv "$HOME/Music/iTunes" "$HOME/Music/iTunes_backup"
    echo "Original iTunes folder backed up to ~/Music/iTunes_backup."
else
    echo "iTunes folder was already backed up to ~/Music/iTunes_backup."
fi
    echo "Linking Dropbox iTunes folder"
ln -s "$HOME/Dropbox/chris_steve/iTunes" "$HOME/Music/"
