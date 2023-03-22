#!/bin/bash

# This script returns the super downloaded macOS information to Jamf inventory as reported by super 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# This script must be run as root or via Jamf Pro.

# Path to a local property list file:
superPLIST="/Library/Management/super/com.macjutsu.super" # No trailing ".plist"

# Report if the file exists.
if [[ -f "$superPLIST.plist" ]]; then
	macOSInstallerDownloadNAME=$(defaults read "$superPLIST" macOSInstallerDownloadName 2> /dev/null)
	macOSInstallerDownloadVERSION=$(defaults read "$superPLIST" macOSInstallerDownloadVersion 2> /dev/null)
	macOSSoftwareUpdateDownloadLABEL=$(defaults read "$superPLIST" macOSSoftwareUpdateDownloadLabel 2> /dev/null)
	# Report if the file has a value.
	if [[ -n $macOSInstallerDownloadNAME ]] && [[ -n $macOSInstallerDownloadVERSION ]]; then
		echo "<result>$macOSInstallerDownloadNAME $macOSInstallerDownloadVERSION</result>"
	elif [[ -n $macOSSoftwareUpdateDownloadLABEL ]]; then
		echo "<result>$macOSSoftwareUpdateDownloadLABEL</result>"
	else
		echo "<result>No downloaded macOS update or upgrade.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
