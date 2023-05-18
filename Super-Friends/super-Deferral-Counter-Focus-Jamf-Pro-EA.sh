#!/bin/bash

# This script returns the number of times the Focus Deadline had been deferred by super 2.0 or later.
# This script must be run as root or via Jamf Pro.

# Path to a local property list file:
superPLIST="/Library/Management/super/com.macjutsu.super" # No trailing ".plist"

# Report if the file exists.
if [[ -f "$superPLIST.plist" ]]; then
	superCOUNTER=$(defaults read "$superPLIST" FocusCounter)
	# Report if the file has a value.
	if [[ -n $superCOUNTER ]]; then
		echo "<result>$superCOUNTER</result>"
	else
		echo "<result>No Focus Deadline deferrals.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
