#!/bin/bash

# This script returns the installed version of super to Jamf inventory as reported by super 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2023/09/19

# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"

# Report if the super preference file exists.
if [[ -f "${SUPER_FOLDER}/super" ]]; then
	if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
		super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
		[[ $(echo "${super_version_local}" | cut -c 1) -lt 4 ]] && super_version_local=$(grep -m1 -e 'superVERSION=' -e '  Version ' "${SUPER_FOLDER}/super" | cut -d '"' -f 2 | cut -d " " -f 4)
		[[ -n "${super_version_local}" ]] && echo "<result>${super_version_local}</result>"
		[[ -z "${super_version_local}" ]] && echo "<result>No super version number found.</result>"
	else
		echo "<result>No super preference file.</result>"
	fi
else
	echo "<result>Not installed.</result>"
fi

exit 0
