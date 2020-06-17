#!/bin/sh

# create correct file permissions
sudo chmod 644 "${DOTFILES}/mosh/mosh.sh"
sudo chmod 644 "${DOTFILES}/mosh/com.mosh.plist"

# create correct file ownerships
sudo chown root:wheel "${DOTFILES}/mosh/mosh.sh"
sudo chown root:wheel "${DOTFILES}/mosh/com.mosh.plist"

# create target destination
mkdir -p "/Users/Shared/.startup"

# put files in correct locations for LaunchDaemon
sudo ln -s "${DOTFILES}/mosh/mosh.sh" "/Users/Shared/.startup/mosh.sh"
sudo ln -s "${DOTFILES}/mosh/com.mosh.plist" "/Library/LaunchDaemons/com.mosh.plist"

# add mosh launch daemon
sudo launchctl load -w "/Library/LaunchDaemons/com.mosh.plist"
