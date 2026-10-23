#!/bin/bash

# This script returns the super status to Jamf inventory as reported by super version 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
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
	super_status=$(defaults read "${SUPER_LOCAL_PLIST}" SuperStatus)
	if [[ -n "${super_status}" ]]; then
		echo "<result>${super_status}</result>"
	else
		echo "<result>No super status found.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi
exit 0
