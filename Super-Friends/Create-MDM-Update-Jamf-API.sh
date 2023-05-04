#!/bin/bash
# This script generates a Jamf Pro API post to start the MDM macOS update/upgrade workflows.
# The $jamfJSON API request created in the sendUpdateCommand() function of this script is identical to that created by the super MDM workflow.
#
# INSTRUCTIONS - PLEASE READ ME.
# 1. Fill in the jamfSERVER, jamfACCOUNT, jamfPASSWORD, and jamfProID parameters in the script below.
# 2. If you want to test BETA macOS updates or upgrades, set the betaWORKFLOW parameter below to "TRUE" and enroll the system into a beta seed before continuing to step 3.
# 3A. For testing macOS UPDATE workflows:
#	- On the test client in Terminal use: sudo softwareupdate --list.
#	- On the test client in Terminal copy the * Label: name of the update target.
#	- On the test client in Terminal use: sudo softwareupdate --download "Label Name"; for example: sudo softwareupdate --download "macOS Monterey 12.6.3-21G419"
#	- Wait for the macOS download to complete...
#	- Make sure the "upgradeWORKFLOW" parameter in the script below is set to "FALSE".
#	- If the macOS update is a Rapid Security Response (there will be a letter like "(a)" at the end of the version) make sure the "rsrWORKFLOW" parameter in the script below is set to "TRUE".
# 3B. For testing macOS UPGRADE workflows:
#	- Use a tool like Mist to download the full macOS Installer.app: https://github.com/ninxsoft/Mist
#	- On the test client put the macOS Installer.app in the /Applications folder.
#	- On the test client open the macOS Installer.app to confirm the installer is valid. It takes a few moments to perform the Gatekeeper validation.
#	- Wait for the macOS Installer.app to open (indicating it's valid) and then use Command-Q to quit.
#	- Make sure the "upgradeWORKFLOW" parameter in the script below is set to "TRUE".
#	- Make sure the "rsrWORKFLOW" parameter in the script below is set to "FALSE".
# 4. On the test client computer run the Create-MDM-Logs.sh script to start MDM logging: https://github.com/Macjutsu/super/tree/main/Super-Friends/Generate-MDM-Logs.sh
# 5. From any macOS computer (it doesn't have to be the test client) run this script.

# Hostname for the Jamf Pro Server WITH A TRAILING SLASH. For example: https://myorg.jamfcloud.com/
jamfSERVER=""

# Jamf Pro API account username. This account needs the following Jamf Pro privileges: Jamf Pro Server Objects > Computers Create and Jamf Pro Server Actions > Send Computer Remote Command to Download and Install macOS Update.
jamfACCOUNT=""

# Jamf Pro API account password. Avoid special characters; ${}[]|/\
jamfPASSWORD=""

# Jamf Pro client computer ID to send the macOS update/upgrade MDM command. You can find this on the client computer by running: sudo jamf recon.
jamfProID=""

# For targeting a macOS BETA release use "TRUE" otherwise keep this as "FALSE" for standard macOS update/upgrade version.
betaWORKFLOW="FALSE"

# For targeting a macOS UPGRADE use "TRUE" otherwise keep this as "FALSE" for a macOS UPDATE.
upgradeWORKFLOW="FALSE"

# For targeting a macOS Rapid Security Response use "TRUE" otherwise keep this as "FALSE" for standard macOS update/upgrade version.
rsrWORKFLOW="FALSE"

# No need to edit below this line.
checkParameters() {
exitERROR="FALSE"
if [[ -z $jamfSERVER ]]; then
	echo "Error: You must populate the jamfSERVER parameter."; exitERROR="TRUE"
fi
if [[ -z $jamfACCOUNT ]]; then
	echo "Error: You must populate the jamfACCOUNT parameter."; exitERROR="TRUE"
fi
if [[ -z $jamfPASSWORD ]]; then
	echo "Error: You must populate the jamfPASSWORD parameter."; exitERROR="TRUE"
fi
if [[ -z $jamfProID ]]; then
	echo "Error: You must populate the jamfProID parameter."; exitERROR="TRUE"
fi
if [[ -z $betaWORKFLOW ]] || { [[ "$betaWORKFLOW" != "TRUE" ]] && [[ "$betaWORKFLOW" != "FALSE" ]]; }; then 
	echo "Error: You must populate the betaWORKFLOW parameter with either TRUE or FALSE."; exitERROR="TRUE"
fi
if [[ -z $upgradeWORKFLOW ]] || { [[ "$upgradeWORKFLOW" != "TRUE" ]] && [[ "$upgradeWORKFLOW" != "FALSE" ]]; }; then 
	echo "Error: You must populate the upgradeWORKFLOW parameter with either TRUE or FALSE."; exitERROR="TRUE"
fi
if [[ -z $rsrWORKFLOW ]] || { [[ "$rsrWORKFLOW" != "TRUE" ]] && [[ "$rsrWORKFLOW" != "FALSE" ]]; }; then 
	echo "Error: You must populate the rsrWORKFLOW parameter with either TRUE or FALSE."; exitERROR="TRUE"
fi
[[ "$exitERROR" == "TRUE" ]] && exit 1
}

getJamfProToken() {
macOSMAJOR=$(sw_vers -productVersion | cut -d'.' -f1)
commandRESULT=$(curl -X POST -u "$jamfACCOUNT:$jamfPASSWORD" -s "${jamfSERVER}api/v1/auth/token")
if [[ $(echo "$commandRESULT" | grep -c 'token') -gt 0 ]]; then
	if [[ $macOSMAJOR -ge 12 ]]; then
		jamfProTOKEN=$(echo "$commandRESULT" | plutil -extract token raw -)
	else
		jamfProTOKEN=$(echo "$commandRESULT" | python -c 'import sys, json; print json.load(sys.stdin)["token"]')
	fi
else
	echo -e "Error: Response from Jamf Pro API token request did not contain a token check your Jamf Pro API account/password."
	exit 1
fi
echo -e "Status: The jamfProTOKEN is:\n$jamfProTOKEN"
}

sendUpdateCommand() {
jamfAPIURL="${jamfSERVER}api/v1/macos-managed-software-updates/send-updates"
echo "Status: The jamfAPIURL is: $jamfAPIURL"
if [[ "$upgradeWORKFLOW" == "TRUE" ]]; then
	if [[ "$betaWORKFLOW" == "TRUE" ]]; then
		echo "Status: Requesting macOS UPGRADE BETA..."
		jamfJSON='{ "deviceIds": ["'${jamfProID}'"], "applyMajorUpdate": true, "skipVersionVerification": true, "updateAction": "DOWNLOAD_AND_INSTALL" }'
	else
		echo "Status: Requesting macOS UPGRADE..."
		jamfJSON='{ "deviceIds": ["'${jamfProID}'"], "applyMajorUpdate": true, "updateAction": "DOWNLOAD_AND_INSTALL" }'
	fi
else
	if [[ "$betaWORKFLOW" == "TRUE" ]] || [[ "$rsrWORKFLOW" == "TRUE" ]]; then
		echo "Status: Requesting macOS UPDATE BETA or RSR..."
		jamfJSON='{ "deviceIds": ["'${jamfProID}'"], "applyMajorUpdate": false, "skipVersionVerification": true, "updateAction": "DOWNLOAD_AND_INSTALL", "forceRestart": true }'
	else
		echo "Status: Requesting macOS UDPATE..."
		jamfJSON='{ "deviceIds": ["'${jamfProID}'"], "applyMajorUpdate": false, "updateAction": "DOWNLOAD_AND_INSTALL", "forceRestart": true }'
	fi
fi
echo "Status: The jamfJSON is: $jamfJSON"
commandRESULT=$(curl --header "Authorization: Bearer ${jamfProTOKEN}" --header "Content-Type: application/json" --write-out "%{http_code}" --silent --show-error --request POST --url "${jamfAPIURL}" --data "${jamfJSON}")
if [[ $(echo "$commandRESULT" | grep -c '200') -gt 0 ]] || [[ $(echo "$commandRESULT" | grep -c '201') -gt 0 ]]; then
	echo -e "Exit: Successful macOS update/upgrade command request sent with result:\n$commandRESULT"
else
	echo -e "Error: Failed macOS update/upgrade command request with result:\n$commandRESULT"
	exit 1
fi
}

main() {
checkParameters
getJamfProToken
sendUpdateCommand
}

main
exit 0
