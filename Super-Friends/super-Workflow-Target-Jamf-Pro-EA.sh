#!/bin/bash

# This script returns the current workflow target as reported by super version 5.0.0 or later.
# Make sure to set the Extension Attribute Data Type to "String".
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
		workflow_target_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowTarget 2> /dev/null)
	else
		echo "<result>Installed super is older than version 5.0.0.</result>"
	fi
	
	# Report if the ${workflow_target_local} has a value.
	if [[ -n "${workflow_target_local}" ]]; then
		echo "<result>${workflow_target_local}</result>"
	else
		echo "<result>No current super workflow workflow target.</result>"
	fi
else
	echo "<result>No super preference file.</result>"
fi

exit 0
