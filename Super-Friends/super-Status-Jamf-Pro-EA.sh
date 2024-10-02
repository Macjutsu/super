#!/bin/bash

# This script returns the super status to Jamf inventory as reported by super version 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2023/09/19

# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"

# Report if the super preference file exists.
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	super_status=$(defaults read "${SUPER_LOCAL_PLIST}" SuperStatus)
	# Report if the file has a value.
	if [[ -n "${super_status}" ]]; then
		echo "<result>${super_status}</result>"
	else
		echo "<result>No super status found.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
