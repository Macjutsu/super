#!/bin/bash

# This script returns the next auto launch date to Jamf inventory as reported by super 3.0 or later.
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
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 4 ]]; then
		next_auto_launch_local=$(defaults read "${SUPER_LOCAL_PLIST}" NextAutoLaunch 2> /dev/null)
		if [[ "${next_auto_launch_local}" == "FALSE" ]]; then
			echo "<result>The super workflow auto launch is inactive.</result>"
		elif [[ -n "${next_auto_launch_local}" ]]; then
			next_auto_launch=$(date -j -f "%Y-%m-%d:%H:%M:%S" "${next_auto_launch_local}" "+%F %T" | xargs)
			echo "<result>${next_auto_launch}</result>"
		else
			echo "<result>Unable to resolve super next auto launch date.</result>"
		fi
	else # super version 3.0 or older.
		next_auto_launch=$(defaults read "${SUPER_LOCAL_PLIST}" SuperPending)
		if [[ -n "${next_auto_launch}" ]]; then
			echo "<result>${next_auto_launch}</result>"
		else
			echo "<result>No super pending date reported.</result>"
		fi
	fi
else
	echo "<result>No super preference file.</result>"
fi
exit 0
