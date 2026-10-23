#!/bin/bash

# This script returns the current workflow scheduled installation date and time as reported by super version 5.0.0 or later.
# Make sure to set the Extension Attribute Data Type to "Date".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2026/10/23

if [[ -d "/Library/Application Support/super" ]]; then
	readonly SUPER_LOCAL_PLIST="/Library/Preferences/com.macjutsu.super" # No trailing ".plist"
elif [[ -d "/Library/Management/super" ]]; then
	readonly SUPER_LOCAL_PLIST="/Library/Management/super/com.macjutsu.super" # No trailing ".plist"
else
	echo "<result>Not installed.</result>"
	exit 0
fi
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 5 ]]; then
		workflow_scheduled_install_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowScheduledInstall 2> /dev/null)
		[[ -n "${workflow_scheduled_install_local}" ]] && workflow_scheduled_install=$(date -j -f "%Y-%m-%d:%H:%M:%S" "${workflow_scheduled_install_local}:00" "+%F %T" | xargs)
	else
		echo "<result>Installed super is older than version 5.0.0.</result>"
	fi
	if [[ -n "${workflow_scheduled_install}" ]]; then
		echo "<result>${workflow_scheduled_install}</result>"
	else
		echo "<result>No current super workflow scheduled install.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi
exit 0
