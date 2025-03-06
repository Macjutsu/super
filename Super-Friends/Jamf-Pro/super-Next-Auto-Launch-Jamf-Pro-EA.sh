#!/bin/bash

# This script returns the next auto launch date to Jamf inventory as reported by super 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "Date".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2023/10/02

# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"

# Report if the super preference file exists.
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
