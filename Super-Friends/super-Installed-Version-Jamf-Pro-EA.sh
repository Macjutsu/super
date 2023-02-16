#!/bin/bash

# This script returns the installed version of S.U.P.E.R.M.A.N.
# This script must be run as root or via Jamf Pro.

# Path to a local super script:
superSCRIPT="/Library/Management/super/super"

# Report if the file exists.
if [[ -f "$superSCRIPT" ]]; then
	superVERSION=$(grep -m1 -e 'superVERSION=' -e '  Version ' "$superSCRIPT" | cut -d '"' -f 2 | cut -d " " -f 4)
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
