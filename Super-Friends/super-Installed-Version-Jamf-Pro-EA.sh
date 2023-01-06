#!/bin/bash

# This script returns the installed super version reported by super 3.0 or later.
# This script must be run as root or via Jamf Pro.

# Path to a local super script:
superSCRIPT="/Library/Management/super/super"

# Report if the file exists.
if [[ -f "$superSCRIPT" ]]; then
	superVERSION=$(grep 'superVERSION=' "$superSCRIPT" | sed -e 's/superVERSION=//' -e 's/"//g')
	# Report if the file has a value.
	if [[ -n $superVERSION ]]; then
		echo "<result>$superVERSION</result>"
	else
		echo "<result>No Version Number Found.</result>"
	fi
else
	echo "<result>Not Installed.</result>"
fi

exit 0
