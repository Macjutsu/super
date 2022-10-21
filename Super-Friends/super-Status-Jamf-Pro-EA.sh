#!/bin/bash

# This script returns the super status to Jamf inventory as reported by super 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# This script must be run as root or via Jamf Pro.

# Path to a local property list file:
superPLIST="/Library/Management/super/com.macjutsu.super" # No trailing ".plist"

# Report if the file exists.
if [[ -f "$superPLIST.plist" ]]; then
	superSTATUS=$(defaults read "$superPLIST" SuperStatus)
	# Report if the file has a value.
	if [[ -n $superSTATUS ]]; then
		echo "<result>$superSTATUS</result>"
	else
		echo "<result>No super status reported.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
