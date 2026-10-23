#!/bin/bash

# This script returns the installed version of super to Jamf inventory as reported by super 3.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2026/10/23

if [[ -d "/Library/Application Support/super" ]]; then
	readonly SUPER_FOLDER="/Library/Application Support/super"
	readonly SUPER_LOCAL_PLIST="/Library/Preferences/com.macjutsu.super" # No trailing ".plist"
elif [[ -d "/Library/Management/super" ]]; then
	readonly SUPER_FOLDER="/Library/Management/super"
	readonly SUPER_LOCAL_PLIST="/Library/Management/super/com.macjutsu.super" # No trailing ".plist"
else
	echo "<result>Not installed.</result>"
	exit 0
fi
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	[[ $(echo "${super_version_local}" | cut -c 1) -lt 4 ]] && super_version_local=$(grep -m1 -e 'superVERSION=' -e '  Version ' "${SUPER_FOLDER}/super" | cut -d '"' -f 2 | cut -d " " -f 4)
	[[ -n "${super_version_local}" ]] && echo "<result>${super_version_local}</result>"
	[[ -z "${super_version_local}" ]] && echo "<result>No super version number found.</result>"
else
	echo "<result>No super preference file.</result>"
fi
exit 0
