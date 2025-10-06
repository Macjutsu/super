#!/bin/bash

# This script returns the number of times the user has deferred the Deadline Focus via super 2.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2023/09/19

# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"

# Report if the super preference file exists.
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	super_version_local=$(defaults read "${SUPER_LOCAL_PLIST}" SuperVersion 2> /dev/null)
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 4 ]]; then
		super_count=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCountFocus 2> /dev/null)
		super_counter=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus 2> /dev/null)
	else # super version 3 or older.
		super_count=$(defaults read "${SUPER_LOCAL_PLIST}" FocusCount 2> /dev/null)
		super_counter=$(defaults read "${SUPER_LOCAL_PLIST}" FocusCounter 2> /dev/null)
	fi
	
	# Report if the ${super_counter} has a value.
	if [[ -n "${super_counter}" ]]; then
		if [[ $((super_counter + 1)) -le ${super_count} ]]; then
			echo "<result>$((super_counter + 1))</result>"
		else
			echo "<result>Deadline Count Focus of ${super_count} has passed.</result>"
		fi
	else
		[[ -n "${super_count}" ]] && echo "<result>0</result>"
		[[ -z "${super_count}" ]] && echo "<result>Deadline Count Focus is not enabled.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
