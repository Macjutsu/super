#!/bin/bash

# This script returns the current workflow zero date and time as reported by super version 5.0.0 or later.
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
		schedule_zero_date_manual_local=$(defaults read "${SUPER_LOCAL_PLIST}" ScheduleZeroDateManual 2> /dev/null)
		schedule_zero_date_automatic_local=$(defaults read "${SUPER_LOCAL_PLIST}" ScheduleZeroDateAutomaticStart 2> /dev/null)
		schedule_zero_date_release_local=$(defaults read "${SUPER_LOCAL_PLIST}" ScheduleZeroDateAutomaticRelease 2> /dev/null)
		[[ -n "${schedule_zero_date_manual_local}" ]] && schedule_zero_date=$(date -j -f "%Y-%m-%d:%H:%M:%S" "${schedule_zero_date_manual_local}:00" "+%F %T" | xargs)
		[[ -n "${schedule_zero_date_automatic_local}" ]] && schedule_zero_date=$(date -j -f "%Y-%m-%d:%H:%M:%S" "${schedule_zero_date_automatic_local}:00" "+%F %T" | xargs)
		[[ -n "${schedule_zero_date_release_local}" ]] && schedule_zero_date=$(date -j -f "%Y-%m-%d:%H:%M:%S" "${schedule_zero_date_release_local}:00" "+%F %T" | xargs)
	else
		echo "<result>Installed super is older than version 5.0.0.</result>"
	fi
	
	# Report if the ${schedule_zero_date} has a value.
	if [[ -n "${schedule_zero_date}" ]]; then
		echo "<result>${schedule_zero_date}</result>"
	else
		echo "<result>No current super workflow zero date.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
