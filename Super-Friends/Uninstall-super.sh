#!/bin/bash
# S.U.P.E.R.M.A.N. Uninstall
# Software Update/Upgrade Policy Enforcement (with) Recursive Messaging And Notification
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2026/09/14

# This script stops any active super instance and removes all super items.

# Set default parameters (constants) that are used throughout the script.
# Path to the super working folder:
readonly SUPER_FOLDER="/Library/Application Support/super"

# Path to the LEGACY super working folder:
readonly SUPER_LEGACY_FOLDER="/Library/Management/super"

# Path to the super symbolic link in default command line binary folder:
readonly SUPER_LINK="/usr/local/bin/super"

# Label name for the super LaunchDaemon:
readonly SUPER_LAUNCH_DAEMON_LABEL="com.macjutsu.super" # No trailing ".plist"

# Path to the main property list file in the default computer preference domain folder:
readonly SUPER_MAIN_PLIST="/Library/Preferences/com.macjutsu.super" # No trailing ".plist"

# Path to the main super workflow log file in the default computer log folder:
readonly SUPER_LOG="/var/log/super.log"

# Append input to stout only.
log_echo() {
	echo -e "$(date +"%a %b %d %T") $(hostname -s) super-preinstall[$$]: $*"
}

# Make sure this script is running as root.
if [[ $(id -u) -ne 0 ]]; then
	log_echo "Exit: This script must run with root privileges."
	exit 1
fi

# Unload and remove the super LaunchDaemon.
if [[ -e "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" ]]; then
	log_echo "Unloading and removing the super LaunchDaemon /Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist."
	launchctl bootout "system/${SUPER_LAUNCH_DAEMON_LABEL}" > /dev/null 2>&1
	rm -f "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" > /dev/null 2>&1
fi

# Check for any previous super processes and kill them.
killall -9 "softwareupdate" "mist" > /dev/null 2>&1
[[ -e "${SWIFT_DIALOG_COMMAND_FILE}" ]] && echo "quit:" >> "${SWIFT_DIALOG_COMMAND_FILE}" && sleep 0.1
killall -9 "dialog" "Dialog" > /dev/null 2>&1
killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
super_previous_pid=$(pgrep -F "${SUPER_PID_FILE}" 2> /dev/null)
if [[ -n "${super_previous_pid}" ]]; then
	log_echo "Found previous super instance running with PID ${super_previous_pid}, killing processes."
	kill -9 "${super_previous_pid}" > /dev/null 2>&1
fi

# If super is still installed, use it to reset all settings and delete accounts.
if [[ -e "${SUPER_FOLDER}" ]]; then
	super_installed_version=$("${SUPER_FOLDER}/super" --version)
	echo "Running super v${super_installed_version} one last time to clean up and delete accounts..."
	"${SUPER_FOLDER}/super" --reset-super --workflow-disable-update-check --workflow-disable-relaunch --auth-delete-all
	rm -Rf "${SUPER_FOLDER}" > /dev/null 2>&1
	rm -Rf "${SUPER_LINK}" > /dev/null 2>&1
	rm -Rf "${SUPER_MAIN_PLIST}.plist" > /dev/null 2>&1
	rm -Rf "${SUPER_LOG}" > /dev/null 2>&1
elif [[ -e "${SUPER_LEGACY_FOLDER}" ]]; then
	super_installed_version=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	if [[ $(echo "${super_installed_version}" | cut -c 1) -ge 4 ]]; then
		echo "Running super v${super_installed_version} one last time to clean up and delete accounts..."
		"${SUPER_LEGACY_FOLDER}/super" --reset-super --workflow-disable-update-check --workflow-disable-relaunch --auth-delete-all
	else # super version 3 or older.
		super_installed_version=$(grep -m1 -e 'superVERSION=' -e '  Version ' "${SUPER_LEGACY_FOLDER}/super" | cut -d '"' -f 2 | cut -d " " -f 4)
		echo "Running super v${super_installed_version} one last time to clean up and delete accounts..."
		"${SUPER_LEGACY_FOLDER}/super" --reset-super --skip-updates --delete-accounts
	fi
	rm -Rf "${SUPER_LEGACY_FOLDER}" > /dev/null 2>&1
	rm -Rf "${SUPER_LINK}" > /dev/null 2>&1
else
	echo "Exit: super is not installed."
fi

echo "Exit: $(basename "$0") complete."
exit 0
