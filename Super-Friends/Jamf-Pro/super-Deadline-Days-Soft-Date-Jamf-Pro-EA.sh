#!/bin/bash

# This script returns the current workflow deadline days soft date as reported by super version 5.0.0 or later.
# Make sure to set the Extension Attribute Data Type to "Date".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2024/10/02

# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"

# Report if the super preference file exists.
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 5 ]]; then
		deadline_days_soft_date_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDaysSoftDate 2> /dev/null)
		[[ -n "${deadline_days_soft_date_local}" ]] && deadline_days_soft_date=$(date -j -f "%Y-%m-%d:%H:%M:%S" "${deadline_days_soft_date_local}:00:00:00" "+%F %T" | xargs)
	else
		echo "<result>Installed super is older than version 5.0.0.</result>"
	fi
	
	# Report if the ${deadline_days_soft_date} has a value.
	if [[ -n "${deadline_days_soft_date}" ]]; then
		echo "<result>${deadline_days_soft_date}</result>"
	else
		echo "<result>No current super workflow deadline days soft date.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
