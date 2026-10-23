#!/bin/bash

# This script returns the number of times the user has deferred the Deadline Soft via super 2.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2026/10/23

if [[ -d "/Library/Application Support/super" ]]; then
	readonly SUPER_LOCAL_PLIST="/Library/Preferences/com.macjutsu.super" # No trailing ".plist"
elif [[ -d "/Library/Management/super" ]]; then
	readonly SUPER_LOCAL_PLIST="/Library/Management/super/com.macjutsu.super" # No trailing ".plist"
else
	echo "<result>Not installed.</result>"
	exit 0
fi
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 4 ]]; then
		super_count=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCountSoft 2> /dev/null)
		super_counter=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft 2> /dev/null)
	else # super version 3 or older.
		super_count=$(defaults read "${SUPER_LOCAL_PLIST}" SoftCount 2> /dev/null)
		super_counter=$(defaults read "${SUPER_LOCAL_PLIST}" SoftCounter 2> /dev/null)
	fi
	if [[ -n "${super_counter}" ]]; then
		if [[ $((super_counter + 1)) -le ${super_count} ]]; then
			echo "<result>$((super_counter + 1))</result>"
		else
			echo "<result>Deadline Count Soft of ${super_count} has passed.</result>"
		fi
	else
		[[ -n "${super_count}" ]] && echo "<result>0</result>"
		[[ -z "${super_count}" ]] && echo "<result>Deadline Count Soft is not enabled.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi
exit 0
