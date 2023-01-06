#!/bin/bash

# This script stops any active super instance, super helpers, and remove all super items (excluding helpers).

# Installation folder:
superFOLDER="/Library/Management/super"

# Symbolic link in default path for super.
superLINK="/usr/local/bin/super"

# Path to a PID file:
superPIDFILE="/var/run/super.pid"

# This is the name for the LaunchDaemon.
launchDaemonNAME="com.macjutsu.super" # No trailing ".plist"

# Installation folder:
superFOLDER="/Library/Management/super"

# Path to the local erase-install folder:
eraseInstallFOLDER="/Library/Management/erase-install"
# Comment out the previous line if you don't want to remove erase-install.sh.

# Make sure the script is running with root privileges.
if [[ "$(id -u)" -ne 0 ]]; then
	echo "Exit: $(basename "$0") must run with root privileges."
	exit 1
fi

# If super is still installed normally, use it to reset all settings and delete accounts.
if [[ -f "$superFOLDER/super" ]]; then
	echo "Running super one last time to clean up and delete accounts..."
	"$superFOLDER/super" --reset-super --skip-updates --delete-accounts
fi

# Check for any previous super process still running, if so kill it.
if [[ -f "$superPIDFILE" ]]; then
	previousPID=$(cat "$superPIDFILE")
	echo "Found previous super instance running with PID $previousPID, killing..."
	kill -9 "$previousPID" > /dev/null 2>&1
fi

# Kill any already running helper processes.
killall -9 "softwareupdate" > /dev/null 2>&1
killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
killall -9 "jamfHelper" > /dev/null 2>&1

# This unloads and deletes any previous LaunchDaemons.
if [[ -f "/Library/LaunchDaemons/$launchDaemonNAME.plist" ]]; then
	echo "Removing previous LaunchDaemon $launchDaemonNAME.plist."
	launchctl bootout system "/Library/LaunchDaemons/$launchDaemonNAME.plist" 2> /dev/null
	rm -f "/Library/LaunchDaemons/$launchDaemonNAME.plist"
fi

# This removes super folder items.
if [[ -d "$superFOLDER" ]]; then
	echo "Removing super items."
	rm -Rf "$superFOLDER" > /dev/null 2>&1
	rm -f "$superLINK" > /dev/null 2>&1
	rm -f "$superPIDFILE" > /dev/null 2>&1
fi

# This removes erase-install folder items.
if [[ -d "$eraseInstallFOLDER" ]]; then
	echo "Removing erase-install.sh items."
	rm -Rf "$eraseInstallFOLDER" > /dev/null 2>&1
fi

exit 0
