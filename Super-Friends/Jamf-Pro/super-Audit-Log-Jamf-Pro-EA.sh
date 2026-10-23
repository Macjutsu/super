#!/bin/bash

# This script returns the last ${LOG_LINES} number of lines from the super-audit.log as reported by super 5.1 or later.
# Make sure to set the Extension Attribute Data Type to "String".
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2025/03/15

# Number of log lines to return:
readonly LOG_LINES=10

if [[ -d "/Library/Application Support/super" ]]; then
	readonly SUPER_AUDIT_LOG="/Library/Application Support/super/logs/super-audit.log"
elif [[ -d "/Library/Management/super" ]]; then
	readonly SUPER_AUDIT_LOG="/Library/Management/super/logs/super-audit.log"
else
	echo "<result>Not installed.</result>"
	exit 0
fi
if [[ -f "${SUPER_AUDIT_LOG}" ]]; then
	tail_result=$(tail -n ${LOG_LINES} "${SUPER_AUDIT_LOG}")
	echo "<result>${tail_result}</result>"
else
	echo "<result>No super-audit.log file found.</result>"
fi
exit 0
