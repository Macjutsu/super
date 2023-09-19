#!/bin/bash

# This script stops any active super instance and removes all super items including helpers.
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2023/09/19

# Installation folder:
SUPER_FOLDER="/Library/Management/super"

# Symbolic link in default path for super.
SUPER_LINK="/usr/local/bin/super"

# Path to a PID file:
SUPER_PID_FILE="/var/run/super.pid"

# This is the name for the LaunchDaemon.
SUPER_LAUNCH_DAEMON_LABEL="com.macjutsu.super" # No trailing ".plist"

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"

# Path to the local erase-install folder:
MIST_CLI_BINARY="/usr/local/bin/mist"
# NOTE: Comment out the previous line if you don't want to remove mist-cli.

# Path to the local erase-install folder:
ERASE_INSTALL_FOLDER="/Library/Management/erase-install"
# NOTE: Comment out the previous line if you don't want to remove erase-install.sh.

# Make sure the script is running with root privileges.
if [[ $(id -u) -ne 0 ]]; then
	echo "Exit: $(basename "$0") must run with root privileges."
	exit 1
fi

# Kill any running helper processes.
killall -9 "softwareupdate" "mist" "jamfHelper" "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1

# If super is still installed, use it to reset all settings and delete accounts.
if [[ -f "${SUPER_FOLDER}/super" ]]; then
	super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 4 ]]; then
		echo "Running super v${super_version_local} one last time to clean up and delete accounts..."
		"${SUPER_FOLDER}/super" --reset-super --workflow-disable-update-check --workflow-disable-relaunch --auth-delete-all
	else # super version 3 or older.
		super_version_local=$(grep -m1 -e 'superVERSION=' -e '  Version ' "${SUPER_FOLDER}/super" | cut -d '"' -f 2 | cut -d " " -f 4)
		echo "Running super v${super_version_local} one last time to clean up and delete accounts..."
		"${SUPER_FOLDER}/super" --reset-super --skip-updates --delete-accounts
	fi
else
	echo "Not installed."
fi

# This unloads and deletes any super LaunchDaemon.
if [[ -f "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" ]]; then
	launchctl bootout system "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" 2> /dev/null
	rm -f "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"
fi

# This removes super folder items.
if [[ -d "${SUPER_FOLDER}" ]]; then
	echo "Removing all super items..."
	rm -Rf "${SUPER_FOLDER}" > /dev/null 2>&1
	rm -f "${SUPER_LINK}" > /dev/null 2>&1
	rm -f "${SUPER_PID_FILE}" > /dev/null 2>&1
fi

# This removes mist-cli.
if [[ -f "${MIST_CLI_BINARY}" ]]; then
	echo "Removing mist-cli..."
	rm -Rf "${MIST_CLI_BINARY}" > /dev/null 2>&1
fi

# This removes erase-install folder items.
if [[ -d "${ERASE_INSTALL_FOLDER}" ]]; then
	echo "Removing erase-install.sh items..."
	rm -Rf "${ERASE_INSTALL_FOLDER}" > /dev/null 2>&1
fi

echo "Exit: $(basename "$0") complete."
exit 0
