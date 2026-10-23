#!/bin/bash

# This script returns the super downloaded macOS information to Jamf inventory as reported by super 3.0 or later.
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
	if [[ $(echo "${super_version_local}" | cut -c 1) -ge 5 ]]; then
		downloaded_macos_installer=$(defaults read "${SUPER_LOCAL_PLIST}" MacOSInstallerDownloaded 2> /dev/null)
		downloaded_macos_asu_label=$(defaults read "${SUPER_LOCAL_PLIST}" MacOSMSULabelDownloaded 2> /dev/null)
		if [[ -n "${downloaded_macos_installer}" ]]; then
			echo "<result>${downloaded_macos_installer}</result>"
		elif [[ -n "${downloaded_macos_asu_label}" ]]; then
			echo "<result>${downloaded_macos_asu_label}</result>"
		else
			echo "<result>No downloaded macOS minor update or major upgrade.</result>"
		fi
	elif [[ $(echo "${super_version_local}" | cut -c 1) -eq 4 ]]; then
		downloaded_macos_installer=$(defaults read "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null)
		downloaded_macos_asu_label=$(defaults read "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULabel 2> /dev/null)
		if [[ -n "${downloaded_macos_installer}" ]]; then
			echo "<result>${downloaded_macos_installer}</result>"
		elif [[ -n "${downloaded_macos_asu_label}" ]]; then
			echo "<result>${downloaded_macos_asu_label}</result>"
		else
			echo "<result>No downloaded macOS minor update or major upgrade.</result>"
		fi
	else # super version 3 or older.
		macos_installer_download_name=$(defaults read "${SUPER_LOCAL_PLIST}" macOSInstallerDownloadName 2> /dev/null)
		macos_installer_download_version=$(defaults read "${SUPER_LOCAL_PLIST}" macOSInstallerDownloadVersion 2> /dev/null)
		macos_installer_download_label=$(defaults read "${SUPER_LOCAL_PLIST}" macOSSoftwareUpdateDownloadLabel 2> /dev/null)
		if [[ -n "${macos_installer_download_name}" ]] && [[ -n "${macos_installer_download_version}" ]]; then
			echo "<result>${macos_installer_download_name} ${macos_installer_download_version}</result>"
		elif [[ -n "${macos_installer_download_label}" ]]; then
			echo "<result>${macos_installer_download_label}</result>"
		else
			echo "<result>No downloaded macOS minor update or major upgrade.</result>"
		fi
	fi
else
	echo "<result>No super preference file.</result>"
fi
exit 0
