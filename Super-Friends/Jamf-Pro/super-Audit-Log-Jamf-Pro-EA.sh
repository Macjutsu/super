#!/bin/bash

# This script returns the last ${LOG_LINES} number of lines from the super-audit.log as reported by super 5.1 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2025/03/15

# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"

# Path to the super log folder:
SUPER_LOG_FOLDER="${SUPER_FOLDER}/logs"

# Path to the log for the super audit log:
SUPER_AUDIT_LOG="${SUPER_LOG_FOLDER}/super-audit.log"

# Number of log lines to return:
LOG_LINES=10

# Report if the super preference file exists.
if [[ -f "${SUPER_AUDIT_LOG}" ]]; then
	tail_result=$(tail -n ${LOG_LINES} "${SUPER_AUDIT_LOG}")
	echo "<result>${tail_result}</result>"
else
	echo "<result>No super-audit.log file found.</result>"
fi

exit 0
