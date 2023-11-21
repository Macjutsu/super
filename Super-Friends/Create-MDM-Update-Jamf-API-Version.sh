#!/bin/bash
# This script generates a Jamf Pro API post call to start the MDM update workflow via a specific version of macOS.
# The Jamf Pro API calls made by this script ARE NOT the same as in super v4.0.x.
# https://github.com/Macjutsu/super
# by Kevin M. White
# 2023/11/15
#
# INSTRUCTIONS - PLEASE READ ME!
#
# TESTING macOS update or upgrade workflows:
# 1. Fill in the CAPITALIZED parameter values in the script below.
# 2. Make sure the "MACOS_TARGET_VERSION" parameter in the script below is set to the full target macOS version number.
# 3. If you want to test BETA macOS updates or upgrades make sure to enroll the system into a beta seed before continuing to step 4.
# 4A. Pre-download macOS UPDATE for any version of macOS or macOS UPGRADE for macOS 13.x -> macOS 14.x only:
#	- On the test client in Terminal use: sudo softwareupdate --list.
#	- On the test client in Terminal copy the * Label: name of the update target.
#	- On the test client in Terminal use: sudo softwareupdate --download "Label Name"; for example: sudo softwareupdate --download "macOS Sonoma 14.1.1-23B81"
#	- Wait for the macOS download to complete...
# 4B. Pre-download macOS UPGRADE for macOS 11.x & 12.x -> macOS 14.x:
#	- Use a tool like Mist to download the LATEST COMPATIBLE macOS Installer.app: https://github.com/ninxsoft/Mist
#	- On the test client put the macOS Installer.app in the /Applications folder.
#	- On the test client open the macOS Installer.app to confirm the installer is valid. It may take a few minutes to perform the Gatekeeper validation.
#	- Wait for the macOS Installer.app to open (indicating it's valid) and then use Command-Q to quit.
# 5. On the test client computer run the Create-MDM-Logs.sh script to start MDM logging: https://github.com/Macjutsu/super/tree/main/Super-Friends/Generate-MDM-Logs.sh
# 6. From any macOS computer (it doesn't have to be the test client) run this script.

# Hostname for the Jamf Pro Server WITH A TRAILING SLASH. For example: https://myorg.jamfcloud.com/
JAMF_API_URL=""

# Jamf Pro client computer ID to send the macOS update/upgrade MDM command. You can find this on the client computer by running: sudo jamf recon.
JAMF_COMPUTER_ID=""

# You mus specify a full macOS version target. For example: 14.1.1
MACOS_TARGET_VERSION=""

# Jamf Pro API client ID and client secret (recommended method).
# See the super Wiki for the required privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-required-privileges
JAMF_API_CLIENT_ID=""
JAMF_API_CLIENT_SECRET=""

# Jamf Pro API account username and password (legacy method). Avoid special characters; ${}[]|/\
# See the super Wiki for the required privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-required-privileges
JAMF_API_ACCOUNT=""
JAMF_API_PASSWORD=""

# No need to edit below this line.
manage_parameters() {
exit_error="FALSE"
if [[ -z "${JAMF_API_URL}" ]]; then
	echo "Error: You must populate the JAMF_API_URL parameter."; exit_error="TRUE"
fi
if [[ -z "${JAMF_COMPUTER_ID}" ]]; then
	echo "Error: You must populate the JAMF_COMPUTER_ID parameter."; exit_error="TRUE"
fi
if [[ -z "${MACOS_TARGET_VERSION}" ]]; then
	echo "Error: You must populate the MACOS_TARGET_VERSION parameter."; exit_error="TRUE"
fi
if { [[ -z "${JAMF_API_CLIENT_ID}" ]] && [[ -z "${JAMF_API_ACCOUNT}" ]]; } || { [[ -n "${JAMF_API_CLIENT_ID}" ]] && [[ -n "${JAMF_API_ACCOUNT}" ]]; }; then
	echo "Error: You must populate an authantication combination of either the JAMF_API_CLIENT_ID and JAMF_API_CLIENT_SECRET or the JAMF_API_ACCOUNT and JAMF_API_PASSWORD parameters."; exit_error="TRUE"
fi
[[ "${exit_error}" == "TRUE" ]] && exit 1
if { [[ -n "${JAMF_API_CLIENT_ID}" ]] && [[ -z "${JAMF_API_CLIENT_SECRET}" ]]; } || { [[ -z "${JAMF_API_CLIENT_ID}" ]] && [[ -n "${JAMF_API_CLIENT_SECRET}" ]]; }; then
	echo "Error: You must populate both the JAMF_API_CLIENT_ID and the JAMF_API_CLIENT_SECRET parameters for authentication."; exit_error="TRUE"
fi
if { [[ -n "${JAMF_API_ACCOUNT}" ]] && [[ -z "${JAMF_API_PASSWORD}" ]]; } || { [[ -z "${JAMF_API_ACCOUNT}" ]] && [[ -n "${JAMF_API_PASSWORD}" ]]; }; then
	echo "Error: You must populate both the JAMF_API_ACCOUNT and the JAMF_API_PASSWORD parameters for authentication."; exit_error="TRUE"
fi
[[ "${exit_error}" == "TRUE" ]] && exit 1
macos_version_major=$(sw_vers -productVersion | cut -d'.' -f1)
verbose_mode_option="TRUE"
jamf_api_url="${JAMF_API_URL}"
jamf_computer_id="${JAMF_COMPUTER_ID}"
[[ -n "${JAMF_API_CLIENT_ID}" ]] && auth_jamf_client="${JAMF_API_CLIENT_ID}"
[[ -n "${JAMF_API_CLIENT_SECRET}" ]] && auth_jamf_secret="${JAMF_API_CLIENT_SECRET}"
[[ -n "${JAMF_API_ACCOUNT}" ]] && auth_jamf_account="${JAMF_API_ACCOUNT}"
[[ -n "${JAMF_API_PASSWORD}" ]] && auth_jamf_password="${JAMF_API_PASSWORD}"
}

# This function is similar to the one found in super.
log_echo() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*"
}

# This function is similar to the one found in super.
log_super() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*"
}

# This function is identical to the one found in super.
get_jamf_api_access_token() {
local curl_response
if [[ -n "${auth_jamf_client}" ]]; then
	curl_response=$(curl --silent --location --request POST "${jamf_api_url}api/oauth/token" --header "Content-Type: application/x-www-form-urlencoded" --data-urlencode "client_id=${auth_jamf_client}" --data-urlencode "grant_type=client_credentials" --data-urlencode "client_secret=${auth_jamf_secret}")
else # Legacy ${auth_jamf_account} authentication.
	curl_response=$(curl --silent --location --request POST "${jamf_api_url}api/v1/auth/token" --user "${auth_jamf_account}:${auth_jamf_password}")
fi
if [[ $(echo "${curl_response}" | grep -c 'token') -gt 0 ]]; then
	if [[ -n "${auth_jamf_client}" ]]; then
		if [[ "${macos_version_major}" -ge 12 ]]; then
			jamf_access_token=$(echo "${curl_response}" | plutil -extract access_token raw -)
		else # macOS 11.
			jamf_access_token=$(echo "${curl_response}" | awk -F '"' '{print $4;}' | xargs)
		fi
	else # Legacy ${auth_jamf_account} authentication.
		if [[ "${macos_version_major}" -ge 12 ]]; then
			jamf_access_token=$(echo "${curl_response}" | plutil -extract token raw -)
		else # macOS 11.
			jamf_access_token=$(echo "${curl_response}" | grep 'token' | awk -F '"' '{print $4;}' | xargs)
		fi
	fi
else # There was no access token.
	if [[ -n "${auth_jamf_client}" ]]; then
		log_super "Auth Error: Response from Jamf Pro API access token request did not contain a token. Verify the --auth-jamf-client=ClientID and --auth-jamf-secret=ClientSecret values."; auth_error_jamf="TRUE"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client is: ${auth_jamf_client}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_secret is: ${auth_jamf_secret}"
	else # Legacy ${auth_jamf_account} authentication.
		log_super "Auth Error: Response from Jamf Pro API access token request did not contain a token. Verify the --auth-jamf-account=AccountName and --auth-jamf-password=Password values."; auth_error_jamf="TRUE"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account is: ${auth_jamf_account}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_password is: ${auth_jamf_password}"
	fi
	auth_error_jamf="TRUE"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_url is: ${jamf_api_url}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is:\n${curl_response}"
fi
}

# This function is identical to the one found in super.
send_jamf_api_blank_push() {
jamf_blank_push_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request POST "${jamf_api_url}JSSResource/computercommands/command/BlankPush/id/${jamf_computer_id}" --header "Authorization: Bearer ${jamf_access_token}")
}

# This function calls a mix of similar and different Jamf API commands to that of super.
create_mdm_command() {
# First check to make sure that Jamf Pro is configured for the "beta" managed macOS update workflow. This code is identical that found in super.
local curl_response
curl_response=$(curl --silent --write-out "%{http_code}" --location --request GET "${jamf_api_url}api/v1/managed-software-updates/plans/feature-toggle" --header "Authorization: Bearer ${jamf_access_token}" --header "Content-Type: application/json")
if [[ $(echo "${curl_response}" | grep -c '200') -gt 0 ]]; then
	if [[ $(echo "${curl_response}" | grep -e 'toggle' | grep -c 'true') -gt 0 ]]; then
		jamf_api_update_workflow="NEW"
	fi
else
	log_super "Error: Unable to validate Jamf Pro API software update workflow type. Verify that the provided Jamf Pro credentials has appropriate privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-account-privileges"; auth_error_jamf="TRUE"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is: ${curl_response}"
fi

# This code block is unique to this script for error handling.
if [[ "${jamf_api_update_workflow}" != "NEW" ]] || [[ "${auth_error_jamf}" == "TRUE" ]]; then
	[[ "${jamf_api_update_workflow}" != "NEW" ]] && log_echo "Error: This script only supports the Jamf Pro the \"beta\" managed macOS update workflow."
	exit 1
fi

# Create an MDM update command via the Jamf Pro API. This code is different than that found in super.
jamf_api_update_url="${jamf_api_url}api/v1/managed-software-updates/plans"
jamf_api_update_json='{ "devices": [ { "objectType": "COMPUTER",  "deviceId": "'${jamf_computer_id}'" } ], "config": { "updateAction": "DOWNLOAD_INSTALL_RESTART", "versionType": "SPECIFIC_VERSION", "specificVersion": "'${MACOS_TARGET_VERSION}'" } }'
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_update_url is: ${jamf_api_update_url}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_update_json is: ${jamf_api_update_json}"
local curl_response
curl_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request POST "${jamf_api_update_url}" --header "Authorization: Bearer ${jamf_access_token}" --header 'accept: application/json' --header 'content-type: application/json' --data "${jamf_api_update_json}")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is:\n${curl_response}"

# This code block is unique to this script for error handling.
if [[ $(echo "${curl_response}" | grep -c '200') -gt 0 ]] || [[ $(echo "${curl_response}" | grep -c '201') -gt 0 ]]; then
	log_super "Status: Successful macOS update/upgrade command request."
	send_jamf_api_blank_push
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_blank_push_response is:\n${jamf_blank_push_response}"
else
	log_super "Status: Failed to send macOS update/upgrade command request."
fi
}

# This function is identical to the one found in super.
delete_jamf_api_access_token() {
local curl_response
curl_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request POST --url "${jamf_api_url}api/v1/auth/invalidate-token" --header "Authorization: Bearer ${jamf_access_token}")
if [[ "${curl_response}" -eq 204 ]]; then
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Jamf Pro API access token successfully invalidated."
	unset jamf_access_token
elif [[ "${curl_response}" -eq 401 ]]; then
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Jamf Pro API access token already invalid."
	unset jamf_access_token
else
	log_super "Error: Invalidating Jamf Pro API access token."
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is:\n${curl_response}"
fi
}

main() {
manage_parameters
get_jamf_api_access_token
if [[ "${auth_error_jamf}" != "TRUE" ]]; then
	if [[ -n "${auth_jamf_client}" ]]; then
		log_echo "Status: Jamf Pro API client ID and client secret authentication successful."
	else
		log_echo "Status: Jamf Pro API account username and password authentication successful."
	fi
else
	exit 1
fi
[[ -n "${jamf_access_token}" ]] && create_mdm_command
[[ -n "${jamf_access_token}" ]] && delete_jamf_api_access_token
}

main
exit 0
