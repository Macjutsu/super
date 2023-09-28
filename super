#!/bin/bash
# S.U.P.E.R.M.A.N.
# Software Update/Upgrade Policy Enforcement (with) Recursive Messaging And Notification
# https://github.com/Macjutsu/super
# by Kevin M. White

# The next line disables specific ShellCheck codes (https://github.com/koalaman/shellcheck) for the entire script.
# shellcheck disable=SC2024,SC2207

SUPER_VERSION="4.0.0-beta3"
SUPER_DATE="2023/09/27"

# MARK: *** Documentation ***
################################################################################

# Show usage documentation. 
show_usage() {
echo "
  S.U.P.E.R.M.A.N.
  Software Update/Upgrade Policy Enforcement (with) Recursive
  Messaging And Notification
  
  Version ${SUPER_VERSION}
  ${SUPER_DATE}
  https://github.com/Macjutsu/super
  
  Usage:
  sudo ./super
  
  Update/Upgrade Installation Options:
  [--install-macos-major-upgrades]  [--install-macos-major-upgrades-off]
  [--install-macos-major-version-target=number]
  [--install-rapid-security-responses]  [--install-rapid-security-responses-off]
  [--install-non-system-updates-without-restarting]
  [--install-non-system-updates-without-restarting-off]
  
  Workflow Options:
  [--workflow-install-now]  [--workflow-only-download]
  [--workflow-only-download-off]  [--workflow-zero-date-manual=YYYY-MM-DD:hh:mm]
  [--workflow-disable-update-check]  [--workflow-disable-update-check-off]
  [--workflow-disable-relaunch]  [--workflow-disable-relaunch-off]
  [--workflow-jamf-policy-triggers=PolicyTrigger,PolicyTrigger,etc...]
  [--workflow-restart-without-updates]  [--workflow-restart-without-updates-off]
  
  Deferral Timer Options:
  [--deferral-timer-default=minutes]
  [--deferral-timer-menu=minutes,minutes,etc...]
  [--deferral-timer-focus=minutes]  [--deferral-timer-error=minutes]
  [--deferral-timer-workflow-relaunch=minutes]  [--deferral-timer-reset-all]
  
  Deferral Deadline COUNT Options:
  [--deadline-count-focus=number]  [--deadline-count-soft=number]
  [--deadline-count-hard=number]  [--deadline-count-restart-all]
  [--deadline-count-delete-all]
  
  Deferral Deadline DAYS Options:
  [--deadline-days-focus=number]  [--deadline-days-soft=number]
  [--deadline-days-hard=number]  [--deadline-days-restart-all]
  [--deadline-days-delete-all]
  
  Deferral Deadline DATE Options:
  [--deadline-date-focus=YYYY-MM-DD:hh:mm]
  [--deadline-date-soft=YYYY-MM-DD:hh:mm]
  [--deadline-date-hard=YYYY-MM-DD:hh:mm]  [--deadline-date-delete-all]
  
  Display Behavior Options:
  [--dialog-timeout-default=seconds]
  [--dialog-timeout-restart-or-defer=seconds]
  [--dialog-timeout-soft-deadline=seconds]  [--dialog-timeout-user-auth=seconds]
  [--dialog-timeout-insufficient-storage=seconds]
  [--dialog-timeout-power-required=seconds]  [--dialog-timeout-delete-all]
  [--display-unmovable=ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER,STORAGE]
  [--display-hide-background=ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER]
  [--display-silently=ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER,STORAGE]
  
  Display Interface Options:
  [--display-icon-file=/local/path or URL]  [--display-icon-size=pixels]
  [--display-accessory-type=TEXTBOX|HTMLBOX|HTML|IMAGE|VIDEO|VIDEOAUTO]
  [--display-accessory-default-file=/local/path or URL]
  [--display-accessory-update-file=/local/path or URL]
  [--display-accessory-upgrade-file=/local/path or URL]
  [--display-accessory-user-auth-file=/local/path or URL]
  [--display-help-button-string=plain text or URL]
  [--display-warning-button-string=plain text or URL]
  
  Apple Silicon Authentication Options:
  [--auth-ask-user-to-save-password]  [--auth-ask-user-to-save-password-off]
  [--auth-local-account=AccountName]  [--auth-local-password=Password]
  [--auth-service-add-via-admin-account=AccountName]
  [--auth-service-add-via-admin-password=Password]
  [--auth-service-account=AccountName]  [--auth-service-password=Password]
  [--auth-jamf-client=ClientID]  [--auth-jamf-secret=ClientSecret]
  [--auth-jamf-account=AccountName]  [--auth-jamf-password=Password]
  [--auth-delete-all]  [--auth-jamf-custom-url=URL]
  [--auth-credential-failover-to-user]  [--auth-credential-failover-to-user-off]
  [--auth-mdm-failover-to-user=ALWAYS,NOSERVICE,SOFT,HARD,INSTALLNOW,BOOTSTRAP]
  
  Test Mode Options:
  [--test-mode]  [--test-mode-off]  [--test-mode-timeout=seconds]
  [--test-storage-update=gigabytes]  [--test-storage-upgrade=gigabytes]
  [--test-battery-level=percentage]
  
  Troubleshooting and Documentation Options:
  [--open-logs]  [--reset-super]  [--verbose-mode]  [--verbose-mode-off]
  [--usage]  [--help]
  
  ** Managed preferences override local options via domain: com.macjutsu.super
  
  <key>InstallMacOSMajorUpgrades</key> <true/> | <false/>
  <key>InstallMacOSMajorVersionTarget</key> <string>version</string>
  <key>InstallRapidSecurityResponses</key> <true/> | <false/>
  <key>InstallNonSystemUpdatesWithoutRestarting</key> <true/> | <false/>
  <key>WorkflowOnlyDownload</key> <true/> | <false/>
  <key>WorkflowZeroDateManual</key> <string>YYYY-MM-DD:hh:mm</string>
  <key>WorkflowDisableUpdateCheck</key> <true/> | <false/>
  <key>WorkflowDisableRelaunch</key> <true/> | <false/>
  <key>WorkflowJamfPolicyTriggers</key>
  <string>PolicyTrigger,PolicyTrigger,etc...</string>  
  <key>WorkflowRestartWithoutUpdates</key> <true/> | <false/>
  <key>DeferralTimerDefault</key> <string>minutes</string>
  <key>DeferralTimerMenu</key> <string>minutes,minutes,etc...</string>
  <key>DeferralTimerFocus</key> <string>minutes</string>
  <key>DeferralTimerError</key> <string>minutes</string>
  <key>DeferralTimerWorkflowRelaunch</key> <string>minutes</string>
  <key>DeadlineCountFocus</key> <string>number</string>
  <key>DeadlineCountSoft</key> <string>number</string>
  <key>DeadlineCountHard</key> <string>number</string>
  <key>DeadlineDaysFocus</key> <string>number</string>
  <key>DeadlineDaysSoft</key> <string>number</string>
  <key>DeadlineDaysHard</key> <string>number</string>
  <key>DeadlineDateFocus</key> <string>YYYY-MM-DD:hh:mm</string>
  <key>DeadlineDateSoft</key> <string>YYYY-MM-DD:hh:mm</string>
  <key>DeadlineDateHard</key> <string>YYYY-MM-DD:hh:mm</string>
  <key>DialogTimeoutDefault</key> <string>seconds</string>
  <key>DialogTimeoutRestartOrDefer</key> <string>seconds</string>
  <key>DialogTimeoutSoftDeadline</key> <string>seconds</string>
  <key>DialogTimeoutUserAuth</key> <string>seconds</string>
  <key>DialogTimeoutInsufficientStorage</key> <string>seconds</string>
  <key>DialogTimeoutPowerRequired</key> <string>seconds</string>
  <key>DisplayUnmovable</key>
  <string>ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER,STORAGE</string>
  <key>DisplayHideBackground</key>
  <string>ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER</string>
  <key>DisplaySilently</key>
  <string>ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER,STORAGE</string>
  <key>DisplayIconFile</key> <string>path</string>
  <key>DisplayIconSize</key> <string>pixels</string>
  <key>DisplayAccessoryType</key>
  <string>TEXTBOX|HTMLBOX|HTML|IMAGE|VIDEO|VIDEOAUTO</string>
  <key>DisplayAccessoryDefaultFile</key> <string>path or URL</string>
  <key>DisplayAccessoryUpdateFile</key> <string>path or URL</string>
  <key>DisplayAccessoryUpgradeFile</key> <string>path or URL</string>
  <key>DisplayAccessoryUserAuthFile</key> <string>path or URL</string>
  <key>DisplayHelpButtonString</key> <string>plain text or URL</string>
  <key>DisplayWarningButtonString</key> <string>plain text or URL</string>
  <key>AuthAskUserToSavePassword</key> <true/> | <false/>
  <key>AuthJamfCustomURL</key> <string>URL</string>
  <key>AuthCredentialFailoverToUser</key> <true/> | <false/>
  <key>AuthMDMFailoverToUser</key>
  <string>ALWAYS,NOSERVICE,SOFT,HARD,INSTALLNOW,BOOTSTRAP</string>
  <key>TestMode</key> <true/> | <false/>
  <key>TestModeTimeout</key> <string>seconds</string>
  <key>TestStorageUpdate</key> <string>gigabytes</string>
  <key>TestStorageUpgrade</key> <string>gigabytes</string>
  <key>TestBatteryLevel</key> <string>percentage</string>
  <key>VerboseMode</key> <true/> | <false/>
  
  ** For detailed documentation visit: https://github.com/Macjutsu/super/wiki
  ** Or use --help to automatically open the S.U.P.E.R.M.A.N. Wiki.
"

# Error log any unrecognized options.
if [[ -n "${unrecognized_options_array[*]}" ]]; then
	if [[ $(id -u) -eq 0 ]] && [[ -d "${SUPER_LOG_FOLDER}" ]]; then
		log_super "Parameter Error: Unrecognized Options: ${unrecognized_options_array[*]%%=*}"
		[[ "${parent_process_is_jamf}" == "TRUE" ]] && log_super "Warning: Note that each Jamf Pro Policy Parameter can only contain a single option."
		log_status "Inactive Error: Unrecognized Options: ${unrecognized_options_array[*]%%=*}"
	else # super is not running as root or not installed yet.
		log_echo "Parameter Error: Unrecognized Options: ${unrecognized_options_array[*]%%=*}"
		[[ "${parent_process_is_jamf}" == "TRUE" ]] && log_echo "Warning: Note that each Jamf Pro Policy Parameter can only contain a single option."
	fi
fi
log_echo "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - USAGE EXIT ****"
exit 0
}

# If there is a real current user then open the S.U.P.E.R.M.A.N. Wiki, otherwise run the show_usage() function.
show_help() {
check_current_user
if [[ "${current_user_account_name}" != "FALSE" ]]; then
	log_echo "Status: Opening S.U.P.E.R.M.A.N. Wiki for user account: ${current_user_account_name}."
	sudo -u "${current_user_account_name}" open "https://github.com/Macjutsu/super/wiki" &
	log_echo "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - HELP EXIT ****"
else # No current GUI user.
	log_echo "Warning: Unable to open S.U.P.E.R.M.A.N. Wiki because there is no GUI user."
	show_usage
fi
exit 0
}

# MARK: *** Parameters ***
################################################################################

# Set default parameters that are used throughout the script.
set_defaults() {
# Path to the super working folder:
SUPER_FOLDER="/Library/Management/super"
readonly SUPER_FOLDER

# Path to the super Symbolic link in default binary folder.
SUPER_LINK="/usr/local/bin/super"
readonly SUPER_LINK
# IMPORTANT DETAIL: Changing this path provides no benefit as this is the default location for most non-system command line tools.

# Path to the super PID file:
SUPER_PID_FILE="/var/run/super.pid"
readonly SUPER_PID_FILE
# IMPORTANT DETAIL: Changing this path provides no benefit as this is the default location for PID files.

# Path to the super log folder:
SUPER_LOG_FOLDER="${SUPER_FOLDER}/logs"
readonly SUPER_LOG_FOLDER

# Path to the log for the main super workflow:
SUPER_LOG="${SUPER_LOG_FOLDER}/super.log"
readonly SUPER_LOG

# Path to the log for the current "softwareupdate --list" command result:
ASU_LIST_LOG="${SUPER_LOG_FOLDER}/asu-list.log"
readonly ASU_LIST_LOG

# Path to the log for the current "mist list" command result:
INSTALLER_LIST_LOG="${SUPER_LOG_FOLDER}/installer-list.log"
readonly INSTALLER_LIST_LOG

# Path to the log for all softwareupdate download/install workflows:
ASU_WORKFLOW_LOG="${SUPER_LOG_FOLDER}/asu-worfklow.log"
readonly ASU_WORKFLOW_LOG

# Path to the log for all macOS installer application download/install workflows:
INSTALLER_WORKFLOW_LOG="${SUPER_LOG_FOLDER}/installer-workflow.log"
readonly INSTALLER_WORKFLOW_LOG

# Path to the log for filtered MDM client command progress:
MDM_COMMAND_LOG="${SUPER_LOG_FOLDER}/mdm-command.log"
readonly MDM_COMMAND_LOG

# Path to the log for debug MDM client command progress:
MDM_COMMAND_DEBUG_LOG="${SUPER_LOG_FOLDER}/mdm-command-debug.log"
readonly MDM_COMMAND_DEBUG_LOG

# Path to the log for filtered MDM update/upgrade workflow progress:
MDM_WORKFLOW_LOG="${SUPER_LOG_FOLDER}/mdm-workflow.log"
readonly MDM_WORKFLOW_LOG

# Path to the log for debug MDM update/upgrade workflow progress:
MDM_WORKFLOW_DEBUG_LOG="${SUPER_LOG_FOLDER}/mdm-workflow-debug.log"
readonly MDM_WORKFLOW_DEBUG_LOG

# Label name for the super LaunchDaemon.
SUPER_LAUNCH_DAEMON_LABEL="com.macjutsu.super" # No trailing ".plist"
readonly SUPER_LAUNCH_DAEMON_LABEL

# Path to the local property list file:
SUPER_LOCAL_PLIST="${SUPER_FOLDER}/com.macjutsu.super" # No trailing ".plist"
readonly SUPER_LOCAL_PLIST

# Path to the managed property list file:
SUPER_MANAGED_PLIST="/Library/Managed Preferences/com.macjutsu.super" # No trailing ".plist"
readonly SUPER_MANAGED_PLIST
# IMPORTANT DETAIL: While you can customize the identifier "com.macjutsu.super", you must keep the "/Library/Managed Preferences/" folder path intact.

# Path to the "hidden" file that triggers the macOS update/upgrade restart validation workflow (This method is used because the defaults command is unreliable when the system is about to restart):
WORKFLOW_INSTALL_NOW_FILE="${SUPER_FOLDER}/.WorkflowInstallNow"

# Path to the "hidden" file that triggers the macOS update/upgrade install now workflow (This method is used because the defaults command is unreliable when the system is about to restart):
WORKFLOW_RESTART_VALIDATE_FILE="${SUPER_FOLDER}/.WorkflowRestartValidate"

# Path to the jamf binary:
JAMF_PRO_BINARY="/usr/local/bin/jamf"
readonly JAMF_PRO_BINARY
# IMPORTANT DETAIL: Changing this path provides no benefit as this is the default location for the jamf binary.

# URL to the IBM Notifier.app download:
IBM_NOTIFIER_DOWNLOAD_URL="https://github.com/IBM/mac-ibm-notifications/releases/download/v-3.0.2-b-107/IBM.Notifier.zip"
readonly IBM_NOTIFIER_DOWNLOAD_URL

# Target version for IBM Notifier.app:
IBM_NOTIFIER_TARGET_VERSION="3.0.2"
readonly IBM_NOTIFIER_TARGET_VERSION

# Path to the local IBM Notifier.app:
IBM_NOTIFIER_APP="${SUPER_FOLDER}/IBM Notifier.app"
readonly IBM_NOTIFIER_APP
# IMPORTANT DETAIL: super does NOT move the IBM Notifier.app to another custom location.
# Changing this folder path to anything besides "${SUPER_FOLDER}/IBM Notifier.app" requires that you must also deploy the IBM Notifier.app to the custom location prior to using super.

# Path to the local IBM Notifier.app binary:
IBM_NOTIFIER_BINARY="${IBM_NOTIFIER_APP}/Contents/MacOS/IBM Notifier"
readonly IBM_NOTIFIER_BINARY

# URL to the mist-cli package installer:
MIST_CLI_DOWNLOAD_URL="https://github.com/ninxsoft/mist-cli/releases/download/v2.0/mist-cli.2.0.pkg"
readonly MIST_CLI_DOWNLOAD_URL

# Target version for mist-cli:
MIST_CLI_TARGET_VERSION="2.0"
readonly MIST_CLI_DOWNLOAD_URL

# Path to the local mist-cli binary:
MIST_CLI_BINARY="/usr/local/bin/mist"
readonly MIST_CLI_BINARY
# IMPORTANT DETAIL: super does NOT move the mist-cli binary to another custom location.
# Changing this folder path to anything besides "/usr/local/bin/mist" requires that you must also deploy the mist-cli binary to the custom location prior to using super.

# Path to a local softwareupdate property list file:
ASU_PLIST="/Library/Preferences/com.apple.SoftwareUpdate" # No trailing ".plist"
readonly ASU_PLIST
# IMPORTANT DETAIL: Changing this path provides no benefit as this is the default location for the softwareupdate property list file.

# The default number of minutes to defer the super workflow (except for the relaunch workflow deferral timer).
DEFERAL_TIMER_DEFAULT_MINUTES=60
readonly DEFERAL_TIMER_DEFAULT_MINUTES

# The default number of minutes to defer once the super workflow is complete (aka. automatically relaunch the super workflow).
DEFERRAL_TIMER_WORKFLOW_RELAUNCH_DEFAULT_MINUTES=360
readonly DEFERRAL_TIMER_WORKFLOW_RELAUNCH_DEFAULT_MINUTES

# Path to for the local cached display icon:
DISPLAY_ICON_FILE_CACHE="${SUPER_FOLDER}/icon.png"
readonly DISPLAY_ICON_FILE_CACHE

# The default icon in the if no ${display_icon_file_option} is specified or found.
DISPLAY_ICON_DEFAULT_FILE="/System/Library/PrivateFrameworks/SoftwareUpdate.framework/Versions/A/Resources/SoftwareUpdate.icns"
readonly DISPLAY_ICON_DEFAULT_FILE

# Default icon size for dialogs and notifications.
DISPLAY_ICON_DEFAULT_SIZE=96
readonly DISPLAY_ICON_DEFAULT_SIZE

# Deadline date display format.
DISPLAY_STRING_FORMAT_DATE="+%B %d, %Y" # Formatting options can be found in the man page for the date command.
readonly DISPLAY_STRING_FORMAT_DATE

# Deadline time display format.
DISPLAY_STRING_FORMAT_TIME="+%l:%M %p" # Formatting options can be found in the man page for the date command.
readonly DISPLAY_STRING_FORMAT_TIME

# The default minium storage space in gigabytes required for a macOS update.
STORAGE_REQUIRED_UPDATE_DEFAULT_GB=15
readonly STORAGE_REQUIRED_UPDATE_DEFAULT_GB

# The default minium storage space in gigabytes required for a macOS upgrade.
STORAGE_REQUIRED_UPGRADE_DEFAULT_GB=35
readonly STORAGE_REQUIRED_UPGRADE_DEFAULT_GB

# The number of seconds between storage checks when displaying the insufficient storage notification via the notification_insufficient_storage() function.
STORAGE_REQUIRED_RECHECK_SECONDS=5
readonly STORAGE_REQUIRED_RECHECK_SECONDS

# The default battery level percentage required for a macOS software update/upgrade on Mac computers with Apple Silicon.
POWER_REQUIRED_BATTERY_APPLE_SILICON_PERCENT=20
readonly POWER_REQUIRED_BATTERY_APPLE_SILICON_PERCENT

# The default battery level percentage required for a macOS software update/upgrade on Mac computers with Intel.
POWER_REQUIRED_BATTERY_INTEL_PERCENT=50
readonly POWER_REQUIRED_BATTERY_INTEL_PERCENT

# The number of seconds between AC power checks when displaying the insufficient battery notification via the notification_insufficient_storage() function.
POWER_REQUIRED_RECHECK_SECONDS=1
readonly POWER_REQUIRED_RECHECK_SECONDS

# The number of seconds to timeout various workflow startup processes if no progress is reported.
TIMEOUT_START_SECONDS=120
readonly TIMEOUT_START_SECONDS

# The number of seconds to timeout the macOS 11+ softwareupdate download/prepare workflow if no progress is reported.
TIMEOUT_ASU_SYSTEM_SECONDS=1200
readonly TIMEOUT_ASU_SYSTEM_SECONDS

# The number of seconds to timeout the softwareupdate non-system update workflow if no progress is reported.
TIMEOUT_NON_SYSTEM_ASU_SECONDS=600
readonly TIMEOUT_NON_SYSTEM_ASU_SECONDS

# The number of seconds to timeout the macOS installer download workflow if no progress is reported.
TIMEOUT_INSTALLER_DOWNLOAD_SECONDS=300
readonly TIMEOUT_INSTALLER_DOWNLOAD_SECONDS

# The number of seconds to timeout the macOS installation workflow if no progress is reported.
TIMEOUT_INSTALLER_WORKFLOW_SECONDS=600
readonly TIMEOUT_INSTALLER_DOWNLOAD_SECONDS

# The number of seconds to timeout MDM commands if no response is reported.
TIMEOUT_MDM_COMMAND_SECONDS=300
readonly TIMEOUT_MDM_COMMAND_SECONDS

# The number of seconds to timeout the MDM download/prepare workflow if no progress is reported.
TIMEOUT_MDM_WORKFLOW_SECONDS=600
readonly TIMEOUT_MDM_WORKFLOW_SECONDS

# The default amount of time in seconds to leave test notifications and dialogs open before moving on with the test mode workflow.
TEST_MODE_DEFAULT_TIMEOUT=10
readonly TEST_MODE_DEFAULT_TIMEOUT

# Various regular expressions used for parameter validation.
REGEX_MACOS_MAJOR_VERSION="^([1][1-9])$"
readonly REGEX_MACOS_MAJOR_VERSION
REGEX_ANY_WHOLE_NUMBER="^[0-9]+$"
readonly REGEX_ANY_WHOLE_NUMBER
REGEX_DEFERRAL_TIMER_MENU="^[0-9*,]+$"
readonly REGEX_DEFERRAL_TIMER_MENU
REGEX_FULL_DATE="^[0-9][0-9][0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$"
readonly REGEX_FULL_DATE
REGEX_HOURS_MINUTES="^(2[0-3]|[01][0-9]):[0-5][0-9]$"
readonly REGEX_HOURS_MINUTES
REGEX_FULL_DATE_HOURS_MINUTES="^[0-9][0-9][0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1]):(2[0-3]|[01][0-9]):[0-5][0-9]$"
readonly REGEX_FULL_DATE_HOURS_MINUTES
REGEX_HTML_URL="^http:\/\/|^https:\/\/"
readonly REGEX_HTML_URL
REGEX_HTTPS="^https:\/\/.*"
readonly REGEX_HTTPS
}

# Collect input options and set associated parameters.
get_options() {
# If super is running via Jamf Policy installation then the first 3 input parameters are skipped.
if [[ "$1" == "/" ]] || [[ $(ps -p "${PPID}" | grep -c -e 'bin/jamf' -e 'jamf/bin' -e '\sjamf\s') -gt 0 ]]; then
	shift 3
	parent_process_is_jamf="TRUE"
fi

# get_options debug mode.
# log_super "Debug Mode: Function ${FUNCNAME[0]}: @ is:\n$@"

# This is a standard while/case loop to collect all the input parameters.
while [[ -n "$1" ]]; do
	case "$1" in
		-u|-U|--usage)
			show_usage
			;;
		-h|-H|--help)
			show_help
			;;
		--install-macos-major-upgrades)
			install_macos_major_upgrades_option="TRUE"
			;;
		--install-macos-major-upgrades-off)
			install_macos_major_upgrades_option="FALSE"
			;;
		--install-macos-major-version-target=*)
			install_macos_major_version_target_option="${1##*=}"
			;;
		--install-rapid-security-responses)
			install_rapid_security_responses_option="TRUE"
			;;
		--install-rapid-security-responses-off)
			install_rapid_security_responses_option="FALSE"
			;;
		--install-non-system-updates-without-restarting)
			install_non_system_updates_without_restarting_option="TRUE"
			;;
		--install-non-system-updates-without-restarting-off)
			install_non_system_updates_without_restarting_option="FALSE"
			;;
		--workflow-install-now)
			workflow_install_now_option="TRUE"
			;;
		--workflow-only-download)
			workflow_only_download_option="TRUE"
			;;
		--workflow-only-download-off)
			workflow_only_download_option="FALSE"
			;;
		--workflow-zero-date-manual=*)
			workflow_zero_date_manual_option="${1##*=}"
			;;
		--workflow-disable-update-check)
			workflow_disable_update_check_option="TRUE"
			;;
		--workflow-disable-update-check-off)
			workflow_disable_update_check_option="FALSE"
			;;
		--workflow-disable-relaunch)
			workflow_disable_relaunch_option="TRUE"
			;;
		--workflow-disable-relaunch-off)
			workflow_disable_relaunch_option="FALSE"
			;;
		--workflow-jamf-policy-triggers=*)
			workflow_jamf_policy_triggers_option="${1##*=}"
			;;
		--workflow-restart-without-updates)
			workflow_restart_without_updates_option="TRUE"
			;;
		--workflow-restart-without-updates-off)
			workflow_restart_without_updates_option="FALSE"
			;;
		--deferral-timer-default=*)
			deferral_timer_default_option="${1##*=}"
			;;
		--deferral-timer-menu=*)
			deferral_timer_menu_option="${1##*=}"
			;;
		--deferral-timer-focus=*)
			deferral_timer_focus_option="${1##*=}"
			;;
		--deferral-timer-error=*)
			deferral_timer_error_option="${1##*=}"
			;;
		--deferral-timer-workflow-relaunch=*)
			deferral_timer_workflow_relaunch_option="${1##*=}"
			;;
		--deferral-timer-reset-all)
			deferral_timer_reset_all_option="TRUE"
			;;
		--deadline-count-focus=*)
			deadline_count_focus_option="${1##*=}"
			;;
		--deadline-count-soft=*)
			deadline_count_soft_option="${1##*=}"
			;;
		--deadline-count-hard=*)
			deadline_count_hard_option="${1##*=}"
			;;
		--deadline-count-restart-all)
			deadline_count_restart_all_option="TRUE"
			;;
		--deadline-count-delete-all)
			deadline_count_delete_all_option="TRUE"
			;;
		--deadline-days-focus=*)
			deadline_days_focus_option="${1##*=}"
			;;
		--deadline-days-soft=*)
			deadline_days_soft_option="${1##*=}"
			;;
		--deadline-days-hard=*)
			deadline_days_hard_option="${1##*=}"
			;;
		--deadline-days-restart-all)
			deadline_days_restart_all_option="TRUE"
			;;
		--deadline-days-delete-all)
			deadline_days_delete_all_option="TRUE"
			;;
		--deadline-date-focus=*)
			deadline_date_focus_option="${1##*=}"
			;;
		--deadline-date-soft=*)
			deadline_date_soft_option="${1##*=}"
			;;
		--deadline-date-hard=*)
			deadline_date_hard_option="${1##*=}"
			;;
		--deadline-date-delete-all)
			deadline_date_delete_all_option="TRUE"
			;;
		--dialog-timeout-default=*)
			dialog_timeout_default_option="${1##*=}"
			;;
		--dialog-timeout-restart-or-defer=*)
			dialog_timeout_restart_or_defer_option="${1##*=}"
			;;
		--dialog-timeout-soft-deadline=*)
			dialog_timeout_soft_deadline_option="${1##*=}"
			;;
		--dialog-timeout-user-auth=*)
			dialog_timeout_user_auth_option="${1##*=}"
			;;
		--dialog-timeout-insufficient-storage=*)
			dialog_timeout_insufficient_storage_option="${1##*=}"
			;;
		--dialog-timeout-power-required=*)
			dialog_timeout_power_required_option="${1##*=}"
			;;
		--dialog-timeout-delete-all)
			dialog_timeout_delete_all_option="TRUE"
			;;
		--display-unmovable=*)
			display_unmovable_option="${1##*=}"
			;;
		--display-hide-background=*)
			display_hide_background_option="${1##*=}"
			;;
		--display-silently=*)
			display_silently_option="${1##*=}"
			;;
		--display-icon-file=*)
			display_icon_file_option="${1##*=}"
			;;
		--display-icon-size=*)
			display_icon_size_option="${1##*=}"
			;;
		--display-accessory-type=*)
			display_accessory_type_option="${1##*=}"
			;;
		--display-accessory-default-file=*)
			display_accessory_default_file_option="${1##*=}"
			;;
		--display-accessory-update-file=*)
			display_accessory_update_file_option="${1##*=}"
			;;
		--display-accessory-upgrade-file=*)
			display_accessory_upgrade_file_option="${1##*=}"
			;;
		--display-accessory-user-auth-file=*)
			display_accessory_user_auth_file_option="${1##*=}"
			;;
		--display-help-button-string=*)
			display_help_button_string_option="${1##*=}"
			;;
		--display-warning-button-string=*)
			display_warning_button_string_option="${1##*=}"
			;;
		--auth-ask-user-to-save-password)
			auth_ask_user_to_save_password="TRUE"
			;;
		--auth-ask-user-to-save-password-off)
			auth_ask_user_to_save_password="FALSE"
			;;
		--auth-local-account=*)
			auth_local_account_option="${1##*=}"
			;;
		--auth-local-password=*)
			auth_local_password_option="${1##*=}"
			;;
		--auth-service-add-via-admin-account=*)
			auth_service_add_via_admin_account_option="${1##*=}"
			;;
		--auth-service-add-via-admin-password=*)
			auth_service_add_via_admin_password_option="${1##*=}"
			;;
		--auth-service-account=*)
			auth_service_account_option="${1##*=}"
			;;
		--auth-service-password=*)
			auth_service_password_option="${1##*=}"
			;;
		--auth-jamf-client=*)
			auth_jamf_client_option="${1##*=}"
			;;
		--auth-jamf-secret=*)
			auth_jamf_secret_option="${1##*=}"
			;;
		--auth-jamf-account=*)
			auth_jamf_account_option="${1##*=}"
			;;
		--auth-jamf-password=*)
			auth_jamf_password_option="${1##*=}"
			;;
		--auth-delete-all)
			auth_delete_all_option="TRUE"
			;;
		--auth-jamf-custom-url=*)
			auth_jamf_custom_url_option="${1##*=}"
			;;
		--auth-credential-failover-to-user)
			auth_credential_failover_to_user_option="TRUE"
			;;
		--auth-credential-failover-to-user-off)
			auth_credential_failover_to_user_option="FALSE"
			;;
		--auth-mdm-failover-to-user=*)
			auth_mdm_failover_to_user_option="${1##*=}"
			;;
		-T|--test-mode)
			test_mode_option="TRUE"
			;;
		-t|--test-mode-off)
			test_mode_option="FALSE"
			;;
		--test-mode-timeout=*)
			test_mode_timeout_option="${1##*=}"
			;;
		--test-storage-update=*)
			test_storage_update_option="${1##*=}"
			;;
		--test-storage-upgrade=*)
			test_storage_upgrade_option="${1##*=}"
			;;
		--test-battery-level=*)
			test_battery_level_option="${1##*=}"
			;;
		-l|-L|--open-logs)
			open_logs_option="TRUE"
			;;
		-x|-X|--reset-super)
			reset_super_option="TRUE"
			;;
		-V|--verbose-mode)
			verbose_mode_option="TRUE"
			;;
		-v|--verbose-mode-off)
			verbose_mode_option="FALSE"
			;;
		*)
			unrecognized_options_array+=("$1")
			;;
	esac
	shift
done

# Error log any unrecognized options.
[[ -n "${unrecognized_options_array[*]}" ]] && show_usage
}

# Collect any parameters stored in ${SUPER_MANAGED_PLIST} and/or ${SUPER_LOCAL_PLIST}.
get_preferences() {
# First handle any preference deletion requests.
if [[ "${reset_super_option}" == "TRUE" ]]; then
	log_super "Status: Deleting all local (non-authentication) preferences."
	
	# Backup any preferences made before this function and saved authentication preferences first.
	local auth_ask_user_to_save_password_backup
	auth_ask_user_to_save_password_backup=$(defaults read "${SUPER_LOCAL_PLIST}" AuthAskUserToSavePassword 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_ask_user_to_save_password_backup: ${auth_ask_user_to_save_password_backup}"
	local auth_local_account_backup
	auth_local_account_backup=$(defaults read "${SUPER_LOCAL_PLIST}" AuthLocalAccount 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_backup: ${auth_local_account_backup}"
	local auth_service_account_backup
	auth_service_account_backup=$(defaults read "${SUPER_LOCAL_PLIST}" AuthServiceAccount 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_account_backup: ${auth_service_account_backup}"
	local auth_jamf_client_backup
	auth_jamf_client_backup=$(defaults read "${SUPER_LOCAL_PLIST}" AuthJamfClient 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_backup: ${auth_jamf_client_backup}"
	local auth_jamf_account_backup
	auth_jamf_account_backup=$(defaults read "${SUPER_LOCAL_PLIST}" AuthJamfAccount 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_backup: ${auth_jamf_account_backup}"
	local auth_legacy_local_account_backup
	auth_legacy_local_account_backup=$(defaults read "${SUPER_LOCAL_PLIST}" LocalAccount 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_legacy_local_account_backup: ${auth_legacy_local_account_backup}"
	local auth_legacy_super_account_backup
	auth_legacy_super_account_backup=$(defaults read "${SUPER_LOCAL_PLIST}" SuperAccount 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_legacy_super_account_backup: ${auth_legacy_super_account_backup}"
	local auth_legacy_jamf_account_backup
	auth_legacy_jamf_account_backup=$(defaults read "${SUPER_LOCAL_PLIST}" JamfAccount 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_legacy_jamf_account_backup: ${auth_legacy_jamf_account_backup}"
	
	# Delete and/or reset locally saved items.
	defaults delete "${SUPER_LOCAL_PLIST}"
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	rm -f "${WORKFLOW_RESTART_VALIDATE_FILE}" 2> /dev/null
	rm -r "${DISPLAY_ICON_FILE_CACHE}" > /dev/null 2>&1
	rm -f "${ASU_LIST_LOG}" 2> /dev/null
	touch "${ASU_LIST_LOG}"
	rm -f "${INSTALLER_LIST_LOG}" 2> /dev/null
	touch "${INSTALLER_LIST_LOG}"
	workflow_software_full_check_required="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" SuperVersion -string "${SUPER_VERSION}"
	defaults write "${SUPER_LOCAL_PLIST}" MacLastStartup -string "${mac_last_startup}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && defaults write "${SUPER_LOCAL_PLIST}" VerboseMode -bool true
	
	# Restore any saved preferences from backup.
	[[ "${auth_ask_user_to_save_password_backup}" -eq 1 ]] && defaults write "${SUPER_LOCAL_PLIST}" AuthAskUserToSavePassword -bool true
	[[ "${auth_local_account_backup}" -eq 1 ]] && defaults write "${SUPER_LOCAL_PLIST}" AuthLocalAccount -bool true
	[[ "${auth_service_account_backup}" -eq 1 ]] && defaults write "${SUPER_LOCAL_PLIST}" AuthServiceAccount -bool true
	[[ "${auth_jamf_client_backup}" -eq 1 ]] && defaults write "${SUPER_LOCAL_PLIST}" AuthJamfClient -bool true
	[[ "${auth_jamf_account_backup}" -eq 1 ]] && defaults write "${SUPER_LOCAL_PLIST}" AuthJamfAccount -bool true
	[[ -n "${auth_legacy_local_account_backup}" ]] && defaults write "${SUPER_LOCAL_PLIST}" LocalAccount -string "${auth_legacy_local_account_backup}"
	[[ -n "${auth_legacy_super_account_backup}" ]] && defaults write "${SUPER_LOCAL_PLIST}" SuperAccount -string "${auth_legacy_super_account_backup}"
	[[ -n "${auth_legacy_jamf_account_backup}" ]] && defaults write "${SUPER_LOCAL_PLIST}" JamfAccount -string "${auth_legacy_jamf_account_backup}"
else # Lesser delete options.
	if [[ "${deferral_timer_reset_all_option}" == "TRUE" ]]; then
		log_super "Status: Resetting all local deferral timer preferences."
		defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerDefault 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerMenu 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerFocus 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerError 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerWorkflowRelaunch 2> /dev/null
	fi
	if [[ "${deadline_count_delete_all_option}" == "TRUE" ]]; then
		log_super "Status: Deleting all local deadline count preferences."
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCountFocus 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCountSoft 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCountHard 2> /dev/null
	fi
	if [[ "${deadline_days_delete_all_option}" == "TRUE" ]]; then
		log_super "Status: Deleting all local deadline days preferences."
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDaysFocus 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDaysSoft 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDaysHard 2> /dev/null
	fi
	if [[ "${deadline_date_delete_all_option}" == "TRUE" ]]; then
		log_super "Status: Deleting all local deadline date preferences."
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDateFocus 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDateSoft 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDateHard 2> /dev/null
	fi
	if [[ "${dialog_timeout_delete_all_option}" == "TRUE" ]]; then
		log_super "Status: Deleting all local dialog timeout preferences."
		defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutDefault 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutRestartOrDefer 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutSoftDeadline 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutUserAuth 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutInsufficientStorage 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutPowerRequired 2> /dev/null
	fi
fi

# Collect any managed preferences from ${SUPER_MANAGED_PLIST}.
if [[ -f "${SUPER_MANAGED_PLIST}.plist" ]]; then
	local install_macos_major_upgrades_managed
	install_macos_major_upgrades_managed=$(defaults read "${SUPER_MANAGED_PLIST}" InstallMacOSMajorUpgrades 2> /dev/null)
	local install_macos_major_version_target_managed
	install_macos_major_version_target_managed=$(defaults read "${SUPER_MANAGED_PLIST}" InstallMacOSMajorVersionTarget 2> /dev/null)
	local install_rapid_security_responses_managed
	install_rapid_security_responses_managed=$(defaults read "${SUPER_MANAGED_PLIST}" InstallRapidSecurityResponses 2> /dev/null)
	local install_non_system_updates_without_restarting_managed
	install_non_system_updates_without_restarting_managed=$(defaults read "${SUPER_MANAGED_PLIST}" InstallNonSystemUpdatesWithoutRestarting 2> /dev/null)
	local workflow_only_download_managed
	workflow_only_download_managed=$(defaults read "${SUPER_MANAGED_PLIST}" WorkflowOnlyDownload 2> /dev/null)
	local workflow_zero_date_manual_managed
	workflow_zero_date_manual_managed=$(defaults read "${SUPER_MANAGED_PLIST}" WorkflowZeroDateManual 2> /dev/null)
	local workflow_disable_update_check_managed
	workflow_disable_update_check_managed=$(defaults read "${SUPER_MANAGED_PLIST}" WorkflowDisableUpdateCheck 2> /dev/null)
	local workflow_disable_relaunch_managed
	workflow_disable_relaunch_managed=$(defaults read "${SUPER_MANAGED_PLIST}" WorkflowDisableRelaunch 2> /dev/null)
	local workflow_jamf_policy_triggers_managed
	workflow_jamf_policy_triggers_managed=$(defaults read "${SUPER_MANAGED_PLIST}" WorkflowJamfPolicyTriggers 2> /dev/null)
	local workflow_restart_without_updates_managed
	workflow_restart_without_updates_managed=$(defaults read "${SUPER_MANAGED_PLIST}" WorkflowRestartWithoutUpdates 2> /dev/null)
	local deferral_timer_default_managed
	deferral_timer_default_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeferralTimerDefault 2> /dev/null)
	local deferral_timer_menu_managed
	deferral_timer_menu_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeferralTimerMenu 2> /dev/null)
	local deferral_timer_focus_managed
	deferral_timer_focus_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeferralTimerFocus 2> /dev/null)
	local deferral_timer_error_managed
	deferral_timer_error_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeferralTimerError 2> /dev/null)
	local deferral_timer_workflow_relaunch_managed
	deferral_timer_workflow_relaunch_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeferralTimerWorkflowRelaunch 2> /dev/null)
	local deadline_count_focus_managed
	deadline_count_focus_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineCountFocus 2> /dev/null)
	local deadline_count_soft_managed
	deadline_count_soft_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineCountSoft 2> /dev/null)
	local deadline_count_hard_managed
	deadline_count_hard_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineCountHard 2> /dev/null)
	local deadline_days_focus_managed
	deadline_days_focus_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineDaysFocus 2> /dev/null)
	local deadline_days_soft_managed
	deadline_days_soft_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineDaysSoft 2> /dev/null)
	local deadline_days_hard_managed
	deadline_days_hard_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineDaysHard 2> /dev/null)
	local deadline_date_focus_managed
	deadline_date_focus_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineDateFocus 2> /dev/null)
	local deadline_date_soft_managed
	deadline_date_soft_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineDateSoft 2> /dev/null)
	local deadline_date_hard_managed
	deadline_date_hard_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DeadlineDateHard 2> /dev/null)
	local dialog_timeout_default_managed
	dialog_timeout_default_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DialogTimeoutDefault 2> /dev/null)
	local dialog_timeout_restart_or_defer_managed
	dialog_timeout_restart_or_defer_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DialogTimeoutRestartOrDefer 2> /dev/null)
	local dialog_timeout_soft_deadline_managed
	dialog_timeout_soft_deadline_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DialogTimeoutSoftDeadline 2> /dev/null)
	local dialog_timeout_user_auth_managed
	dialog_timeout_user_auth_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DialogTimeoutUserAuth 2> /dev/null)
	local dialog_timeout_insufficient_storage_managed
	dialog_timeout_insufficient_storage_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DialogTimeoutInsufficientStorage 2> /dev/null)
	local dialog_timeout_power_required_managed
	dialog_timeout_power_required_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DialogTimeoutPowerRequired 2> /dev/null)
	local display_unmovable_managed
	display_unmovable_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayUnmovable 2> /dev/null)
	local display_hide_background_managed
	display_hide_background_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayHideBackground 2> /dev/null)
	local display_silently_managed
	display_silently_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplaySilently 2> /dev/null)
	local display_icon_file_managed
	display_icon_file_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayIconFile 2> /dev/null)
	local display_icon_size_managed
	display_icon_size_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayIconSize 2> /dev/null)
	local display_accessory_type_managed
	display_accessory_type_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayAccessoryType 2> /dev/null)
	local display_accessory_default_file_managed
	display_accessory_default_file_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayAccessoryDefaultFile 2> /dev/null)
	local display_accessory_update_file_managed
	display_accessory_update_file_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayAccessoryUpdateFile 2> /dev/null)
	local display_accessory_update_file_managed
	display_accessory_upgrade_file_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayAccessoryUpgradeFile 2> /dev/null)
	local display_accessory_user_auth_file_managed
	display_accessory_user_auth_file_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayAccessoryUserAuthFile 2> /dev/null)
	local display_help_button_string_managed
	display_help_button_string_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayHelpButtonString 2> /dev/null)
	local display_warning_button_string_managed
	display_warning_button_string_managed=$(defaults read "${SUPER_MANAGED_PLIST}" DisplayWarningButtonString 2> /dev/null)
	local auth_user_save_password_managed
	auth_user_save_password_managed=$(defaults read "${SUPER_MANAGED_PLIST}" AuthAskUserToSavePassword 2> /dev/null)
	local auth_jamf_computer_id_managed
	auth_jamf_computer_id_managed=$(defaults read "${SUPER_MANAGED_PLIST}" AuthJamfComputerID 2> /dev/null)
	local auth_jamf_custom_url_managed
	auth_jamf_custom_url_managed=$(defaults read "${SUPER_MANAGED_PLIST}" AuthJamfCustomURL 2> /dev/null)
	local auth_credential_failover_to_user_managed
	auth_credential_failover_to_user_managed=$(defaults read "${SUPER_MANAGED_PLIST}" AuthCredentialFailoverToUser 2> /dev/null)
	local auth_mdm_failover_to_user_managed
	auth_mdm_failover_to_user_managed=$(defaults read "${SUPER_MANAGED_PLIST}" AuthMDMFailoverToUser 2> /dev/null)
	local test_mode_managed
	test_mode_managed=$(defaults read "${SUPER_MANAGED_PLIST}" TestMode 2> /dev/null)
	local test_mode_timeout_managed
	test_mode_timeout_managed=$(defaults read "${SUPER_MANAGED_PLIST}" TestModeTimeout 2> /dev/null)
	local test_storage_update_managed
	test_storage_update_managed=$(defaults read "${SUPER_MANAGED_PLIST}" TestStorageUpdate 2> /dev/null)
	local test_storage_upgrade_managed
	test_storage_upgrade_managed=$(defaults read "${SUPER_MANAGED_PLIST}" TestStorageUpgrade 2> /dev/null)
	local test_battery_level_managed
	test_battery_level_managed=$(defaults read "${SUPER_MANAGED_PLIST}" TestBatteryLevel 2> /dev/null)
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Managed preference file: ${SUPER_MANAGED_PLIST}:\n$(defaults read "${SUPER_MANAGED_PLIST}" 2> /dev/null)"

# Collect any local preferences from ${SUPER_LOCAL_PLIST}.
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	local install_macos_major_upgrades_local
	install_macos_major_upgrades_local=$(defaults read "${SUPER_LOCAL_PLIST}" InstallMacOSMajorUpgrades 2> /dev/null)
	local install_macos_major_version_target_local
	install_macos_major_version_target_local=$(defaults read "${SUPER_LOCAL_PLIST}" InstallMacOSMajorVersionTarget 2> /dev/null)
	local install_rapid_security_responses_local
	install_rapid_security_responses_local=$(defaults read "${SUPER_LOCAL_PLIST}" InstallRapidSecurityResponses 2> /dev/null)
	local install_non_system_updates_without_restarting_local
	install_non_system_updates_without_restarting_local=$(defaults read "${SUPER_LOCAL_PLIST}" InstallNonSystemUpdatesWithoutRestarting 2> /dev/null)
	local workflow_only_download_local
	workflow_only_download_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowOnlyDownload 2> /dev/null)
	local workflow_zero_date_manual_local
	workflow_zero_date_manual_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowZeroDateManual 2> /dev/null)
	local workflow_disable_update_check_local
	workflow_disable_update_check_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowDisableUpdateCheck 2> /dev/null)
	local workflow_disable_relaunch_local
	workflow_disable_relaunch_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowDisableRelaunch 2> /dev/null)
	local workflow_jamf_policy_triggers_local
	workflow_jamf_policy_triggers_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowJamfPolicyTriggers 2> /dev/null)
	local workflow_restart_without_updates_local
	workflow_restart_without_updates_local=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowRestartWithoutUpdates 2> /dev/null)
	local deferral_timer_default_local
	deferral_timer_default_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeferralTimerDefault 2> /dev/null)
	local deferral_timer_menu_local
	deferral_timer_menu_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeferralTimerMenu 2> /dev/null)
	local deferral_timer_focus_local
	deferral_timer_focus_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeferralTimerFocus 2> /dev/null)
	local deferral_timer_error_local
	deferral_timer_error_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeferralTimerError 2> /dev/null)
	local deferral_timer_workflow_relaunch_local
	deferral_timer_workflow_relaunch_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeferralTimerWorkflowRelaunch 2> /dev/null)
	local deadline_count_focus_local
	deadline_count_focus_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCountFocus 2> /dev/null)
	local deadline_count_soft_local
	deadline_count_soft_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCountSoft 2> /dev/null)
	local deadline_count_hard_local
	deadline_count_hard_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCountHard 2> /dev/null)
	local deadline_days_focus_local
	deadline_days_focus_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDaysFocus 2> /dev/null)
	local deadline_days_soft_local
	deadline_days_soft_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDaysSoft 2> /dev/null)
	local deadline_days_hard_local
	deadline_days_hard_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDaysHard 2> /dev/null)
	local deadline_date_focus_local
	deadline_date_focus_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDateFocus 2> /dev/null)
	local deadline_date_soft_local
	deadline_date_soft_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDateSoft 2> /dev/null)
	local deadline_date_hard_local
	deadline_date_hard_local=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineDateHard 2> /dev/null)
	local dialog_timeout_default_local
	dialog_timeout_default_local=$(defaults read "${SUPER_LOCAL_PLIST}" DialogTimeoutDefault 2> /dev/null)
	local dialog_timeout_restart_or_defer_local
	dialog_timeout_restart_or_defer_local=$(defaults read "${SUPER_LOCAL_PLIST}" DialogTimeoutRestartOrDefer 2> /dev/null)
	local dialog_timeout_soft_deadline_local
	dialog_timeout_soft_deadline_local=$(defaults read "${SUPER_LOCAL_PLIST}" DialogTimeoutSoftDeadline 2> /dev/null)
	local dialog_timeout_user_auth_local
	dialog_timeout_user_auth_local=$(defaults read "${SUPER_LOCAL_PLIST}" DialogTimeoutUserAuth 2> /dev/null)
	local dialog_timeout_insufficient_storage_local
	dialog_timeout_insufficient_storage_local=$(defaults read "${SUPER_LOCAL_PLIST}" DialogTimeoutInsufficientStorage 2> /dev/null)
	local dialog_timeout_power_required_local
	dialog_timeout_power_required_local=$(defaults read "${SUPER_LOCAL_PLIST}" DialogTimeoutPowerRequired 2> /dev/null)
	local display_unmovable_local
	display_unmovable_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayUnmovable 2> /dev/null)
	local display_hide_background_local
	display_hide_background_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayHideBackground 2> /dev/null)
	local display_silently_local
	display_silently_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplaySilently 2> /dev/null)
	local display_icon_file_local
	display_icon_file_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayIconFile 2> /dev/null)
	local display_icon_size_local
	display_icon_size_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayIconSize 2> /dev/null)
	local display_accessory_type_local
	display_accessory_type_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayAccessoryType 2> /dev/null)
	local display_accessory_default_file_local
	display_accessory_default_file_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayAccessoryDefaultFile 2> /dev/null)
	local display_accessory_update_file_local
	display_accessory_update_file_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayAccessoryUpdateFile 2> /dev/null)
	local display_accessory_update_file_local
	display_accessory_upgrade_file_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayAccessoryUpgradeFile 2> /dev/null)
	local display_accessory_user_auth_file_local
	display_accessory_user_auth_file_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayAccessoryUserAuthFile 2> /dev/null)
	local display_help_button_string_local
	display_help_button_string_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayHelpButtonString 2> /dev/null)
	local display_warning_button_string_local
	display_warning_button_string_local=$(defaults read "${SUPER_LOCAL_PLIST}" DisplayWarningButtonString 2> /dev/null)
	local auth_user_save_password_local
	auth_user_save_password_local=$(defaults read "${SUPER_LOCAL_PLIST}" AuthAskUserToSavePassword 2> /dev/null)
	local auth_jamf_computer_id_local
	auth_jamf_computer_id_local=$(defaults read "${SUPER_LOCAL_PLIST}" AuthJamfComputerID 2> /dev/null)
	local auth_jamf_custom_url_local
	auth_jamf_custom_url_local=$(defaults read "${SUPER_LOCAL_PLIST}" AuthJamfCustomURL 2> /dev/null)
	local auth_credential_failover_to_user_local
	auth_credential_failover_to_user_local=$(defaults read "${SUPER_LOCAL_PLIST}" AuthCredentialFailoverToUser 2> /dev/null)
	local auth_mdm_failover_to_user_local
	auth_mdm_failover_to_user_local=$(defaults read "${SUPER_LOCAL_PLIST}" AuthMDMFailoverToUser 2> /dev/null)
	local test_mode_local
	test_mode_local=$(defaults read "${SUPER_LOCAL_PLIST}" TestMode 2> /dev/null)
	local test_mode_timeout_local
	test_mode_timeout_local=$(defaults read "${SUPER_LOCAL_PLIST}" TestModeTimeout 2> /dev/null)
	local test_storage_update_local
	test_storage_update_local=$(defaults read "${SUPER_LOCAL_PLIST}" TestStorageUpdate 2> /dev/null)
	local test_storage_upgrade_local
	test_storage_upgrade_local=$(defaults read "${SUPER_LOCAL_PLIST}" TestStorageUpgrade 2> /dev/null)
	local test_battery_level_local
	test_battery_level_local=$(defaults read "${SUPER_LOCAL_PLIST}" TestBatteryLevel 2> /dev/null)
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Local preference file before startup validation: ${SUPER_LOCAL_PLIST}:\n$(defaults read "${SUPER_LOCAL_PLIST}" 2> /dev/null)"

# This logic ensures the priority order of managed preference overrides the new input option which overrides the saved local preference.
[[ -n "${install_macos_major_upgrades_managed}" ]] && install_macos_major_upgrades_option="${install_macos_major_upgrades_managed}"
{ [[ -z "${install_macos_major_upgrades_managed}" ]] && [[ -z "${install_macos_major_upgrades_option}" ]] && [[ -n "${install_macos_major_upgrades_local}" ]]; } && install_macos_major_upgrades_option="${install_macos_major_upgrades_local}"
[[ -n "${install_macos_major_version_target_managed}" ]] && install_macos_major_version_target_option="${install_macos_major_version_target_managed}"
{ [[ -z "${install_macos_major_version_target_managed}" ]] && [[ -z "${install_macos_major_version_target_option}" ]] && [[ -n "${install_macos_major_version_target_local}" ]]; } && install_macos_major_version_target_option="${install_macos_major_version_target_local}"
[[ -n "${install_rapid_security_responses_managed}" ]] && install_rapid_security_responses_option="${install_rapid_security_responses_managed}"
{ [[ -z "${install_rapid_security_responses_managed}" ]] && [[ -z "${install_rapid_security_responses_option}" ]] && [[ -n "${install_rapid_security_responses_local}" ]]; } && install_rapid_security_responses_option="${install_rapid_security_responses_local}"
[[ -n "${install_non_system_updates_without_restarting_managed}" ]] && install_non_system_updates_without_restarting_option="${install_non_system_updates_without_restarting_managed}"
{ [[ -z "${install_non_system_updates_without_restarting_managed}" ]] && [[ -z "${install_non_system_updates_without_restarting_option}" ]] && [[ -n "${install_non_system_updates_without_restarting_local}" ]]; } && install_non_system_updates_without_restarting_option="${install_non_system_updates_without_restarting_local}"
[[ -n "${workflow_only_download_managed}" ]] && workflow_only_download_option="${workflow_only_download_managed}"
{ [[ -z "${workflow_only_download_managed}" ]] && [[ -z "${workflow_only_download_option}" ]] && [[ -n "${workflow_only_download_local}" ]]; } && workflow_only_download_option="${workflow_only_download_local}"
[[ -n "${workflow_zero_date_manual_managed}" ]] && workflow_zero_date_manual_option="${workflow_zero_date_manual_managed}"
{ [[ -z "${workflow_zero_date_manual_managed}" ]] && [[ -z "${workflow_zero_date_manual_option}" ]] && [[ -n "${workflow_zero_date_manual_local}" ]]; } && workflow_zero_date_manual_option="${workflow_zero_date_manual_local}"
[[ -n "${workflow_disable_update_check_managed}" ]] && workflow_disable_update_check_option="${workflow_disable_update_check_managed}"
{ [[ -z "${workflow_disable_update_check_managed}" ]] && [[ -z "${workflow_disable_update_check_option}" ]] && [[ -n "${workflow_disable_update_check_local}" ]]; } && workflow_disable_update_check_option="${workflow_disable_update_check_local}"
[[ -n "${workflow_disable_relaunch_managed}" ]] && workflow_disable_relaunch_option="${workflow_disable_relaunch_managed}"
{ [[ -z "${workflow_disable_relaunch_managed}" ]] && [[ -z "${workflow_disable_relaunch_option}" ]] && [[ -n "${workflow_disable_relaunch_local}" ]]; } && workflow_disable_relaunch_option="${workflow_disable_relaunch_local}"
[[ -n "${workflow_jamf_policy_triggers_managed}" ]] && workflow_jamf_policy_triggers_option="${workflow_jamf_policy_triggers_managed}"
{ [[ -z "${workflow_jamf_policy_triggers_managed}" ]] && [[ -z "${workflow_jamf_policy_triggers_option}" ]] && [[ -n "${workflow_jamf_policy_triggers_local}" ]]; } && workflow_jamf_policy_triggers_option="${workflow_jamf_policy_triggers_local}"
[[ -n "${workflow_restart_without_updates_managed}" ]] && workflow_restart_without_updates_option="${workflow_restart_without_updates_managed}"
{ [[ -z "${workflow_restart_without_updates_managed}" ]] && [[ -z "${workflow_restart_without_updates_option}" ]] && [[ -n "${workflow_restart_without_updates_local}" ]]; } && workflow_restart_without_updates_option="${workflow_restart_without_updates_local}"
[[ -n "${deferral_timer_default_managed}" ]] && deferral_timer_default_option="${deferral_timer_default_managed}"
{ [[ -z "${deferral_timer_default_managed}" ]] && [[ -z "${deferral_timer_default_option}" ]] && [[ -n "${deferral_timer_default_local}" ]]; } && deferral_timer_default_option="${deferral_timer_default_local}"
[[ -n "${deferral_timer_menu_managed}" ]] && deferral_timer_menu_option="${deferral_timer_menu_managed}"
{ [[ -z "${deferral_timer_menu_managed}" ]] && [[ -z "${deferral_timer_menu_option}" ]] && [[ -n "${deferral_timer_menu_local}" ]]; } && deferral_timer_menu_option="${deferral_timer_menu_local}"
[[ -n "${deferral_timer_focus_managed}" ]] && deferral_timer_focus_option="${deferral_timer_focus_managed}"
{ [[ -z "${deferral_timer_focus_managed}" ]] && [[ -z "${deferral_timer_focus_option}" ]] && [[ -n "${deferral_timer_focus_local}" ]]; } && deferral_timer_focus_option="${deferral_timer_focus_local}"
[[ -n "${deferral_timer_error_managed}" ]] && deferral_timer_error_option="${deferral_timer_error_managed}"
{ [[ -z "${deferral_timer_error_managed}" ]] && [[ -z "${deferral_timer_error_option}" ]] && [[ -n "${deferral_timer_error_local}" ]]; } && deferral_timer_error_option="${deferral_timer_error_local}"
[[ -n "${deferral_timer_workflow_relaunch_managed}" ]] && deferral_timer_workflow_relaunch_option="${deferral_timer_workflow_relaunch_managed}"
{ [[ -z "${deferral_timer_workflow_relaunch_managed}" ]] && [[ -z "${deferral_timer_workflow_relaunch_option}" ]] && [[ -n "${deferral_timer_workflow_relaunch_local}" ]]; } && deferral_timer_workflow_relaunch_option="${deferral_timer_workflow_relaunch_local}"
[[ -n "${deadline_count_focus_managed}" ]] && deadline_count_focus_option="${deadline_count_focus_managed}"
{ [[ -z "${deadline_count_focus_managed}" ]] && [[ -z "${deadline_count_focus_option}" ]] && [[ -n "${deadline_count_focus_local}" ]]; } && deadline_count_focus_option="${deadline_count_focus_local}"
[[ -n "${deadline_count_soft_managed}" ]] && deadline_count_soft_option="${deadline_count_soft_managed}"
{ [[ -z "${deadline_count_soft_managed}" ]] && [[ -z "${deadline_count_soft_option}" ]] && [[ -n "${deadline_count_soft_local}" ]]; } && deadline_count_soft_option="${deadline_count_soft_local}"
[[ -n "${deadline_count_hard_managed}" ]] && deadline_count_hard_option="${deadline_count_hard_managed}"
{ [[ -z "${deadline_count_hard_managed}" ]] && [[ -z "${deadline_count_hard_option}" ]] && [[ -n "${deadline_count_hard_local}" ]]; } && deadline_count_hard_option="${deadline_count_hard_local}"
[[ -n "${deadline_days_focus_managed}" ]] && deadline_days_focus_option="${deadline_days_focus_managed}"
{ [[ -z "${deadline_days_focus_managed}" ]] && [[ -z "${deadline_days_focus_option}" ]] && [[ -n "${deadline_days_focus_local}" ]]; } && deadline_days_focus_option="${deadline_days_focus_local}"
[[ -n "${deadline_days_soft_managed}" ]] && deadline_days_soft_option="${deadline_days_soft_managed}"
{ [[ -z "${deadline_days_soft_managed}" ]] && [[ -z "${deadline_days_soft_option}" ]] && [[ -n "${deadline_days_soft_local}" ]]; } && deadline_days_soft_option="${deadline_days_soft_local}"
[[ -n "${deadline_days_hard_managed}" ]] && deadline_days_hard_option="${deadline_days_hard_managed}"
{ [[ -z "${deadline_days_hard_managed}" ]] && [[ -z "${deadline_days_hard_option}" ]] && [[ -n "${deadline_days_hard_local}" ]]; } && deadline_days_hard_option="${deadline_days_hard_local}"
[[ -n "${deadline_date_focus_managed}" ]] && deadline_date_focus_option="${deadline_date_focus_managed}"
{ [[ -z "${deadline_date_focus_managed}" ]] && [[ -z "${deadline_date_focus_option}" ]] && [[ -n "${deadline_date_focus_local}" ]]; } && deadline_date_focus_option="${deadline_date_focus_local}"
[[ -n "${deadline_date_soft_managed}" ]] && deadline_date_soft_option="${deadline_date_soft_managed}"
{ [[ -z "${deadline_date_soft_managed}" ]] && [[ -z "${deadline_date_soft_option}" ]] && [[ -n "${deadline_date_soft_local}" ]]; } && deadline_date_soft_option="${deadline_date_soft_local}"
[[ -n "${deadline_date_hard_managed}" ]] && deadline_date_hard_option="${deadline_date_hard_managed}"
{ [[ -z "${deadline_date_hard_managed}" ]] && [[ -z "${deadline_date_hard_option}" ]] && [[ -n "${deadline_date_hard_local}" ]]; } && deadline_date_hard_option="${deadline_date_hard_local}"
[[ -n "${dialog_timeout_default_managed}" ]] && dialog_timeout_default_option="${dialog_timeout_default_managed}"
{ [[ -z "${dialog_timeout_default_managed}" ]] && [[ -z "${dialog_timeout_default_option}" ]] && [[ -n "${dialog_timeout_default_local}" ]]; } && dialog_timeout_default_option="${dialog_timeout_default_local}"
[[ -n "${dialog_timeout_restart_or_defer_managed}" ]] && dialog_timeout_restart_or_defer_option="${dialog_timeout_restart_or_defer_managed}"
{ [[ -z "${dialog_timeout_restart_or_defer_managed}" ]] && [[ -z "${dialog_timeout_restart_or_defer_option}" ]] && [[ -n "${dialog_timeout_restart_or_defer_local}" ]]; } && dialog_timeout_restart_or_defer_option="${dialog_timeout_restart_or_defer_local}"
[[ -n "${dialog_timeout_soft_deadline_managed}" ]] && dialog_timeout_soft_deadline_option="${dialog_timeout_soft_deadline_managed}"
{ [[ -z "${dialog_timeout_soft_deadline_managed}" ]] && [[ -z "${dialog_timeout_soft_deadline_option}" ]] && [[ -n "${dialog_timeout_soft_deadline_local}" ]]; } && dialog_timeout_soft_deadline_option="${dialog_timeout_soft_deadline_local}"
[[ -n "${dialog_timeout_user_auth_managed}" ]] && dialog_timeout_user_auth_option="${dialog_timeout_user_auth_managed}"
{ [[ -z "${dialog_timeout_user_auth_managed}" ]] && [[ -z "${dialog_timeout_user_auth_option}" ]] && [[ -n "${dialog_timeout_user_auth_local}" ]]; } && dialog_timeout_user_auth_option="${dialog_timeout_user_auth_local}"
[[ -n "${dialog_timeout_insufficient_storage_managed}" ]] && dialog_timeout_insufficient_storage_option="${dialog_timeout_insufficient_storage_managed}"
{ [[ -z "${dialog_timeout_insufficient_storage_managed}" ]] && [[ -z "${dialog_timeout_insufficient_storage_option}" ]] && [[ -n "${dialog_timeout_insufficient_storage_local}" ]]; } && dialog_timeout_insufficient_storage_option="${dialog_timeout_insufficient_storage_local}"
[[ -n "${dialog_timeout_power_required_managed}" ]] && dialog_timeout_power_required_option="${dialog_timeout_power_required_managed}"
{ [[ -z "${dialog_timeout_power_required_managed}" ]] && [[ -z "${dialog_timeout_power_required_option}" ]] && [[ -n "${dialog_timeout_power_required_local}" ]]; } && dialog_timeout_power_required_option="${dialog_timeout_power_required_local}"
[[ -n "${display_unmovable_managed}" ]] && display_unmovable_option="${display_unmovable_managed}"
{ [[ -z "${display_unmovable_managed}" ]] && [[ -z "${display_unmovable_option}" ]] && [[ -n "${display_unmovable_local}" ]]; } && display_unmovable_option="${display_unmovable_local}"
[[ -n "${display_hide_background_managed}" ]] && display_hide_background_option="${display_hide_background_managed}"
{ [[ -z "${display_hide_background_managed}" ]] && [[ -z "${display_hide_background_option}" ]] && [[ -n "${display_hide_background_local}" ]]; } && display_hide_background_option="${display_hide_background_local}"
[[ -n "${display_silently_managed}" ]] && display_silently_option="${display_silently_managed}"
{ [[ -z "${display_silently_managed}" ]] && [[ -z "${display_silently_option}" ]] && [[ -n "${display_silently_local}" ]]; } && display_silently_option="${display_silently_local}"
[[ -n "${display_icon_file_managed}" ]] && display_icon_file_option="${display_icon_file_managed}"
{ [[ -z "${display_icon_file_managed}" ]] && [[ -z "${display_icon_file_option}" ]] && [[ -n "${display_icon_file_local}" ]]; } && display_icon_file_option="${display_icon_file_local}"
[[ -n "${display_icon_size_managed}" ]] && display_icon_size_option="${display_icon_size_managed}"
{ [[ -z "${display_icon_size_managed}" ]] && [[ -z "${display_icon_size_option}" ]] && [[ -n "${display_icon_size_local}" ]]; } && display_icon_size_option="${display_icon_size_local}"
[[ -n "${display_accessory_type_managed}" ]] && display_accessory_type_option="${display_accessory_type_managed}"
{ [[ -z "${display_accessory_type_managed}" ]] && [[ -z "${display_accessory_type_option}" ]] && [[ -n "${display_accessory_type_local}" ]]; } && display_accessory_type_option="${display_accessory_type_local}"
[[ -n "${display_accessory_default_file_managed}" ]] && display_accessory_default_file_option="${display_accessory_default_file_managed}"
{ [[ -z "${display_accessory_default_file_managed}" ]] && [[ -z "${display_accessory_default_file_option}" ]] && [[ -n "${display_accessory_default_file_local}" ]]; } && display_accessory_default_file_option="${display_accessory_default_file_local}"
[[ -n "${display_accessory_update_file_managed}" ]] && display_accessory_update_file_option="${display_accessory_update_file_managed}"
{ [[ -z "${display_accessory_update_file_managed}" ]] && [[ -z "${display_accessory_update_file_option}" ]] && [[ -n "${display_accessory_update_file_local}" ]]; } && display_accessory_update_file_option="${display_accessory_update_file_local}"
[[ -n "${display_accessory_upgrade_file_managed}" ]] && display_accessory_upgrade_file_option="${display_accessory_upgrade_file_managed}"
{ [[ -z "${display_accessory_upgrade_file_managed}" ]] && [[ -z "${display_accessory_upgrade_file_option}" ]] && [[ -n "${display_accessory_upgrade_file_local}" ]]; } && display_accessory_upgrade_file_option="${display_accessory_upgrade_file_local}"
[[ -n "${display_accessory_user_auth_file_managed}" ]] && display_accessory_user_auth_file_option="${display_accessory_user_auth_file_managed}"
{ [[ -z "${display_accessory_user_auth_file_managed}" ]] && [[ -z "${display_accessory_user_auth_file_option}" ]] && [[ -n "${display_accessory_user_auth_file_local}" ]]; } && display_accessory_user_auth_file_option="${display_accessory_user_auth_file_local}"
[[ -n "${display_help_button_string_managed}" ]] && display_help_button_string_option="${display_help_button_string_managed}"
{ [[ -z "${display_help_button_string_managed}" ]] && [[ -z "${display_help_button_string_option}" ]] && [[ -n "${display_help_button_string_local}" ]]; } && display_help_button_string_option="${display_help_button_string_local}"
[[ -n "${display_warning_button_string_managed}" ]] && display_warning_button_string_option="${display_warning_button_string_managed}"
{ [[ -z "${display_warning_button_string_managed}" ]] && [[ -z "${display_warning_button_string_option}" ]] && [[ -n "${display_warning_button_string_local}" ]]; } && display_warning_button_string_option="${display_warning_button_string_local}"
[[ -n "${auth_user_save_password_managed}" ]] && auth_ask_user_to_save_password="${auth_user_save_password_managed}"
{ [[ -z "${auth_user_save_password_managed}" ]] && [[ -z "${auth_ask_user_to_save_password}" ]] && [[ -n "${auth_user_save_password_local}" ]]; } && auth_ask_user_to_save_password="${auth_user_save_password_local}"
[[ -n "${auth_jamf_computer_id_managed}" ]] && auth_jamf_computer_id_option="${auth_jamf_computer_id_managed}"
{ [[ -z "${auth_jamf_computer_id_managed}" ]] && [[ -z "${auth_jamf_computer_id_option}" ]] && [[ -n "${auth_jamf_computer_id_local}" ]]; } && auth_jamf_computer_id_option="${auth_jamf_computer_id_local}"
[[ -n "${auth_jamf_custom_url_managed}" ]] && auth_jamf_custom_url_option="${auth_jamf_custom_url_managed}"
{ [[ -z "${auth_jamf_custom_url_managed}" ]] && [[ -z "${auth_jamf_custom_url_option}" ]] && [[ -n "${auth_jamf_custom_url_local}" ]]; } && auth_jamf_custom_url_option="${auth_jamf_custom_url_local}"
[[ -n "${auth_credential_failover_to_user_managed}" ]] && auth_credential_failover_to_user_option="${auth_credential_failover_to_user_managed}"
{ [[ -z "${auth_credential_failover_to_user_managed}" ]] && [[ -z "${auth_credential_failover_to_user_option}" ]] && [[ -n "${auth_credential_failover_to_user_local}" ]]; } && auth_credential_failover_to_user_option="${auth_credential_failover_to_user_local}"
[[ -n "${auth_mdm_failover_to_user_managed}" ]] && auth_mdm_failover_to_user_option="${auth_mdm_failover_to_user_managed}"
{ [[ -z "${auth_mdm_failover_to_user_managed}" ]] && [[ -z "${auth_mdm_failover_to_user_option}" ]] && [[ -n "${auth_mdm_failover_to_user_local}" ]]; } && auth_mdm_failover_to_user_option="${auth_mdm_failover_to_user_local}"
[[ -n "${test_mode_managed}" ]] && test_mode_option="${test_mode_managed}"
{ [[ -z "${test_mode_managed}" ]] && [[ -z "${test_mode_option}" ]] && [[ -n "${test_mode_local}" ]]; } && test_mode_option="${test_mode_local}"
[[ -n "${test_mode_timeout_managed}" ]] && test_mode_timeout_option="${test_mode_timeout_managed}"
{ [[ -z "${test_mode_timeout_managed}" ]] && [[ -z "${test_mode_timeout_option}" ]] && [[ -n "${test_mode_timeout_local}" ]]; } && test_mode_timeout_option="${test_mode_timeout_local}"
[[ -n "${test_storage_update_managed}" ]] && test_storage_update_option="${test_storage_update_managed}"
{ [[ -z "${test_storage_update_managed}" ]] && [[ -z "${test_storage_update_option}" ]] && [[ -n "${test_storage_update_local}" ]]; } && test_storage_update_option="${test_storage_update_local}"
[[ -n "${test_storage_upgrade_managed}" ]] && test_storage_upgrade_option="${test_storage_upgrade_managed}"
{ [[ -z "${test_storage_upgrade_managed}" ]] && [[ -z "${test_storage_upgrade_option}" ]] && [[ -n "${test_storage_upgrade_local}" ]]; } && test_storage_upgrade_option="${test_storage_upgrade_local}"
[[ -n "${test_battery_level_managed}" ]] && test_battery_level_option="${test_battery_level_managed}"
{ [[ -z "${test_battery_level_managed}" ]] && [[ -z "${test_battery_level_option}" ]] && [[ -n "${test_battery_level_local}" ]]; } && test_battery_level_option="${test_battery_level_local}"
}

# Validate non-authentication parameters and manage ${SUPER_LOCAL_PLIST}. Any errors set ${option_error}.
manage_parameter_options() {
option_error="FALSE"

# Manage ${install_macos_major_upgrades_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${install_macos_major_upgrades_option}" -eq 1 ]] || [[ "${install_macos_major_upgrades_option}" == "TRUE" ]]; then
	install_macos_major_upgrades_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" InstallMacOSMajorUpgrades -bool true
else
	install_macos_major_upgrades_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" InstallMacOSMajorUpgrades 2> /dev/null
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${install_macos_major_upgrades_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_major_upgrades_option is: ${install_macos_major_upgrades_option}"

# Validate ${install_macos_major_version_target_option} and if a valid set ${install_major_system_target} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${install_macos_major_version_target_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --install-macos-major-version-target option, defaulting to the newest compatible major macOS version."
	defaults delete "${SUPER_LOCAL_PLIST}" InstallMacOSMajorVersionTarget 2> /dev/null
	unset install_macos_major_version_target_option
elif [[ -n "${install_macos_major_version_target_option}" ]] && ! [[ "${install_macos_major_version_target_option}" =~ ${REGEX_MACOS_MAJOR_VERSION} ]]; then
	log_super "Parameter Error: The --install-macos-major-version-target=number value must be a contemporary macOS major version number (12,13,etc.)."; option_error="TRUE"
elif [[ -n "${install_macos_major_version_target_option}" ]] && [[ "${install_macos_major_version_target_option}" =~ ${REGEX_MACOS_MAJOR_VERSION} ]]; then
	if [[ "${install_macos_major_upgrades_option}" == "TRUE" ]]; then
		install_major_system_target="${install_macos_major_version_target_option}"
		defaults write "${SUPER_LOCAL_PLIST}" InstallMacOSMajorVersionTarget -string "${install_macos_major_version_target_option}"
	else
		log_super "Parameter Error: To use the --install-macos-major-version-target option you must also use the --install-macos-major-upgrades option."; option_error="TRUE"
		defaults delete "${SUPER_LOCAL_PLIST}" InstallMacOSMajorVersionTarget 2> /dev/null
	fi
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${install_major_system_target}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_major_system_target is: ${install_major_system_target}"

# Manage ${install_rapid_security_responses_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${install_rapid_security_responses_option}" -eq 1 ]] || [[ "${install_rapid_security_responses_option}" == "TRUE" ]]; then
	install_rapid_security_responses_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" InstallRapidSecurityResponses -bool true
else
	install_rapid_security_responses_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" InstallRapidSecurityResponses 2> /dev/null
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${install_rapid_security_responses_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_rapid_security_responses_option is: ${install_rapid_security_responses_option}"

# Manage ${install_non_system_updates_without_restarting_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${install_non_system_updates_without_restarting_option}" -eq 1 ]] || [[ "${install_non_system_updates_without_restarting_option}" == "TRUE" ]]; then
	install_non_system_updates_without_restarting_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" InstallNonSystemUpdatesWithoutRestarting -bool true
else
	install_non_system_updates_without_restarting_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" InstallNonSystemUpdatesWithoutRestarting 2> /dev/null
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${install_non_system_updates_without_restarting_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_non_system_updates_without_restarting_option is: ${install_non_system_updates_without_restarting_option}"

# Manage ${workflow_only_download_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${workflow_only_download_option}" -eq 1 ]] || [[ "${workflow_only_download_option}" == "TRUE" ]]; then
	workflow_only_download_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" WorkflowOnlyDownload -bool true
else
	workflow_only_download_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" WorkflowOnlyDownload 2> /dev/null
fi
if [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${workflow_only_download_option}" == "TRUE" ]]; then
	log_super "Warning: When both the --workflow-install-now and the --workflow-only-download options are enabled the --workflow-install-now option takes priority."
	workflow_only_download_option="FALSE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${workflow_only_download_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_only_download_option is: ${workflow_only_download_option}"

# Validate ${workflow_zero_date_manual_option} and if valid set ${workflow_zero_date_manual} and save to ${SUPER_LOCAL_PLIST}.
local extract_date
local extract_time
local extract_hours
local extract_minutes
local calculated_deadline
if [[ "${workflow_zero_date_manual_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --workflow-zero-date-manual option, defaulting to an automatic zero date."
	defaults delete "${SUPER_LOCAL_PLIST}" WorkflowZeroDateManual 2> /dev/null
elif [[ -n "${workflow_zero_date_manual_option}" ]]; then
	extract_date="${workflow_zero_date_manual_option:0:10}"
	if [[ "${extract_date}" =~ ${REGEX_FULL_DATE} ]]; then
		extract_time="${workflow_zero_date_manual_option:11:5}"
		if [[ -n "${extract_time}" ]]; then
			extract_hours="${extract_time:0:2}"
			[[ -z "${extract_hours}" ]] && extract_hours="00"
			extract_minutes="${extract_time:3:2}"
			[[ -z "${extract_minutes}" ]] && extract_minutes="00"
			extract_time="${extract_hours}:${extract_minutes}"
		else
			extract_time="00:00"
		fi
		if [[ "${extract_time}" =~ ${REGEX_HOURS_MINUTES} ]]; then
			calculated_deadline="${extract_date}:${extract_time}"
		else
			log_super "Parameter Error: The --workflow-zero-date-manual value for time must be formated in 24-hour time as hh:mm."; option_error="TRUE"
		fi
	else
		log_super "Parameter Error: The --workflow-zero-date-manual value for date must be formated as YYYY-MM-DD."; option_error="TRUE"
	fi
	if [[ "${calculated_deadline}" =~ ${REGEX_FULL_DATE_HOURS_MINUTES} ]]; then
		workflow_zero_date_manual="${calculated_deadline}"
		defaults write "${SUPER_LOCAL_PLIST}" WorkflowZeroDateManual -string "${workflow_zero_date_manual}"
	else
		log_super "Parameter Error: The --workflow-zero-date-manual value must be formatted as YYYY-MM-DD:hh:mm."; option_error="TRUE"
	fi
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${workflow_zero_date_manual}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_zero_date_manual is: ${workflow_zero_date_manual}"

# Manage ${workflow_disable_update_check_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${workflow_disable_update_check_option}" -eq 1 ]] || [[ "${workflow_disable_update_check_option}" == "TRUE" ]]; then
	workflow_disable_update_check_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" WorkflowDisableUpdateCheck -bool true
else
	workflow_disable_update_check_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" WorkflowDisableUpdateCheck 2> /dev/null
fi
if [[ "${workflow_only_download_option}" == "TRUE" ]] && [[ "${workflow_disable_update_check_option}" == "TRUE" ]]; then
	log_super "Parameter Error: The --workflow-disable-update-check option can not be used with the --only-download option."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${workflow_disable_update_check_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_disable_update_check_option is: ${workflow_disable_update_check_option}"

# Manage ${workflow_disable_relaunch_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${workflow_disable_relaunch_option}" -eq 1 ]] || [[ "${workflow_disable_relaunch_option}" == "TRUE" ]]; then
	workflow_disable_relaunch_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" WorkflowDisableRelaunch -bool true
else
	workflow_disable_relaunch_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" WorkflowDisableRelaunch 2> /dev/null
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${workflow_disable_relaunch_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_disable_relaunch_option is: ${workflow_disable_relaunch_option}"

# Validate ${workflow_jamf_policy_triggers_option} input and save to ${SUPER_LOCAL_PLIST}.
if [[ "${workflow_jamf_policy_triggers_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --workflow-jamf-policy-triggers option."
	defaults delete "${SUPER_LOCAL_PLIST}" WorkflowJamfPolicyTriggers 2> /dev/null
elif [[ -n "${workflow_jamf_policy_triggers_option}" ]]; then
	defaults write "${SUPER_LOCAL_PLIST}" WorkflowJamfPolicyTriggers -string "${workflow_jamf_policy_triggers_option}"
fi
if [[ ! -f "${JAMF_PRO_BINARY}" ]] && [[ -n "${workflow_jamf_policy_triggers_option}" ]]; then
	log_super "Parameter Error: Unable to use the --workflow-jamf-policy-triggers option due to missing Jamf binary."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${workflow_jamf_policy_triggers_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_jamf_policy_triggers_option is: ${workflow_jamf_policy_triggers_option}"

# Manage ${workflow_restart_without_updates_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${workflow_restart_without_updates_option}" -eq 1 ]] || [[ "${workflow_restart_without_updates_option}" == "TRUE" ]]; then
	workflow_restart_without_updates_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" WorkflowRestartWithoutUpdates -bool true
else
	workflow_restart_without_updates_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" WorkflowRestartWithoutUpdates 2> /dev/null
fi
if [[ "${workflow_only_download_option}" == "TRUE" ]] && [[ "${workflow_restart_without_updates_option}" == "TRUE" ]]; then
	log_super "Parameter Error: The --workflow-restart-without-updates option can not be used with the --only-download option."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${workflow_restart_without_updates_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_restart_without_updates_option is: ${workflow_restart_without_updates_option}"

# Validate ${deferral_timer_default_option} input and if valid set ${deferral_timer_minutes} and save to ${SUPER_LOCAL_PLIST}. If there is no ${deferral_timer_minutes} then set it to ${DEFERAL_TIMER_DEFAULT_MINUTES}.
if [[ "${deferral_timer_default_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deferral-timer-default option, defaulting to ${DEFERAL_TIMER_DEFAULT_MINUTES} minutes."
	defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerDefault 2> /dev/null
elif [[ -n "${deferral_timer_default_option}" ]] && [[ "${deferral_timer_default_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${deferral_timer_default_option}" -lt 2 ]]; then
		log_super "Warning: Specified --deferral-timer-default=minutes value of ${deferral_timer_default_option} is too low, rounding up to 2 minutes."
		deferral_timer_minutes=2
	elif [[ "${deferral_timer_default_option}" -gt 10080 ]]; then
		log_super "Warning: Specified --deferral-timer-default=minutes value of ${deferral_timer_default_option} is too high, rounding down to 10080 minutes (1 week)."
		deferral_timer_minutes=10080
	else
		deferral_timer_minutes="${deferral_timer_default_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DeferralTimerDefault -string "${deferral_timer_minutes}"
elif [[ -n "${deferral_timer_default_option}" ]] && ! [[ "${deferral_timer_default_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deferral-timer-default=minutes value must only be a number."; option_error="TRUE"
fi
[[ -z "${deferral_timer_minutes}" ]] && deferral_timer_minutes="${DEFERAL_TIMER_DEFAULT_MINUTES}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deferral_timer_minutes is: ${deferral_timer_minutes}"

# Validate ${deferral_timer_menu_option} input and if valid set ${deferral_timer_menu_minutes} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${deferral_timer_menu_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deferral-timer-menu option, defaulting to ${deferral_timer_minutes} minutes."
	defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerMenu 2> /dev/null
elif [[ -n "${deferral_timer_menu_option}" ]] && [[ "${deferral_timer_menu_option}" =~ ${REGEX_DEFERRAL_TIMER_MENU} ]]; then
	local previous_ifs
	previous_ifs="${IFS}"; IFS=','
	local deferral_timer_menu_array
	read -r -a deferral_timer_menu_array <<< "${deferral_timer_menu_option}"
	for array_index in "${!deferral_timer_menu_array[@]}"; do
		if [[ "${deferral_timer_menu_array[array_index]}" -lt 2 ]]; then
			log_super "Warning: Specified --deferral-timer-menu=minutes value of ${deferral_timer_menu_array[array_index]} minutes is too low, rounding up to 2 minutes."
			deferral_timer_menu_array[array_index]=2
		elif [[ "${deferral_timer_menu_array[array_index]}" -gt 10080 ]]; then
			log_super "Warning: Specified --deferral-timer-menu=minutes value of ${deferral_timer_menu_array[array_index]} minutes is too high, rounding down to 10080 minutes (1 week)."
			deferral_timer_menu_array[array_index]=10080
		fi
	done
	deferral_timer_menu_minutes="${deferral_timer_menu_array[*]}"
	defaults write "${SUPER_LOCAL_PLIST}" DeferralTimerMenu -string "${deferral_timer_menu_minutes}"
	IFS="${previous_ifs}"
elif [[ -n "${deferral_timer_menu_option}" ]] && ! [[ "${deferral_timer_menu_option}" =~ ${REGEX_DEFERRAL_TIMER_MENU} ]]; then
	log_super "Parameter Error: The --deferral-timer-menu=minutes,minutes,etc... value must only contain numbers and commas (no spaces)."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deferral_timer_menu_minutes}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deferral_timer_menu_minutes is: ${deferral_timer_menu_minutes}"

# Validate ${deferral_timer_focus_option} input and if valid set ${deferal_timer_focus_minutes} and save to ${SUPER_LOCAL_PLIST}. If there is no ${deferal_timer_focus_minutes} then set it to ${deferral_timer_minutes}.
if [[ "${deferral_timer_focus_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deferral-timer-focus option, defaulting to ${deferral_timer_minutes} minutes."
	defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerFocus 2> /dev/null
elif [[ -n "${deferral_timer_focus_option}" ]] && [[ "${deferral_timer_focus_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${deferral_timer_focus_option}" -lt 2 ]]; then
		log_super "Warning: Specified --deferral-timer-focus=minutes value of ${deferral_timer_focus_option} minutes is too low, rounding up to 2 minutes."
		deferal_timer_focus_minutes=2
	elif [[ "${deferral_timer_focus_option}" -gt 10080 ]]; then
		log_super "Warning: Specified --deferral-timer-focus=minutes value of ${deferral_timer_focus_option} minutes is too high, rounding down to 1440 minutes (1 week)."
		deferal_timer_focus_minutes=10080
	else
		deferal_timer_focus_minutes="${deferral_timer_focus_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DeferralTimerFocus -string "${deferal_timer_focus_minutes}"
elif [[ -n "${deferral_timer_focus_option}" ]] && ! [[ "${deferral_timer_focus_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deferral-timer-focus=minutes value must only be a number."; option_error="TRUE"
fi
[[ -z "${deferal_timer_focus_minutes}" ]] && deferal_timer_focus_minutes="${deferral_timer_minutes}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deferal_timer_focus_minutes is: ${deferal_timer_focus_minutes}"

# Validate ${deferral_timer_error_option} input and if valid set ${deferral_timer_error_minutes} and save to ${SUPER_LOCAL_PLIST}. If there is no ${deferral_timer_error_minutes} then set it to ${deferral_timer_minutes}.
if [[ "${deferral_timer_error_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deferral-timer-error option, defaulting to ${deferral_timer_minutes} minutes."
	defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerError 2> /dev/null
elif [[ -n "${deferral_timer_error_option}" ]] && [[ "${deferral_timer_error_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${deferral_timer_error_option}" -lt 2 ]]; then
		log_super "Warning: Specified --deferral-timer-error=minutes value of ${deferral_timer_error_option} minutes is too low, rounding up to 2 minutes."
		deferral_timer_error_minutes=2
	elif [[ "${deferral_timer_error_option}" -gt 10080 ]]; then
		log_super "Warning: Specified --deferral-timer-error=minutes value of ${deferral_timer_error_option} minutes is too high, rounding down to 1440 minutes (1 week)."
		deferral_timer_error_minutes=10080
	else
		deferral_timer_error_minutes="${deferral_timer_error_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DeferralTimerError -string "${deferral_timer_error_minutes}"
elif [[ -n "${deferral_timer_error_option}" ]] && ! [[ "${deferral_timer_error_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deferral-timer-error=minutes value must only be a number."; option_error="TRUE"
fi
[[ -z "${deferral_timer_error_minutes}" ]] && deferral_timer_error_minutes="${deferral_timer_minutes}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deferral_timer_error_minutes is: ${deferral_timer_error_minutes}"

# Validate ${deferral_timer_workflow_relaunch_option} input and if valid set ${deferral_timer_workflow_relaunch_minutes} and save to ${SUPER_LOCAL_PLIST}. If there is no ${deferral_timer_workflow_relaunch_minutes} then set it to ${DEFERRAL_TIMER_WORKFLOW_RELAUNCH_DEFAULT_MINUTES}.
if [[ "${deferral_timer_workflow_relaunch_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deferral-timer-workflow-relaunch option, defaulting to ${DEFERRAL_TIMER_WORKFLOW_RELAUNCH_DEFAULT_MINUTES} minutes."
	defaults delete "${SUPER_LOCAL_PLIST}" DeferralTimerWorkflowRelaunch 2> /dev/null
elif [[ -n "${deferral_timer_workflow_relaunch_option}" ]] && [[ "${deferral_timer_workflow_relaunch_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${deferral_timer_workflow_relaunch_option}" -lt 2 ]]; then
		log_super "Warning: Specified --deferral-timer-workflow-relaunch=minutes value of ${deferral_timer_workflow_relaunch_option} minutes is too low, rounding up to 2 minutes."
		deferral_timer_workflow_relaunch_minutes=2
	elif [[ "${deferral_timer_workflow_relaunch_option}" -gt 43200 ]]; then
		log_super "Warning: Specified --deferral-timer-workflow-relaunch=minutes value of ${deferral_timer_workflow_relaunch_option} minutes is too high, rounding down to 43200 minutes (30 days)."
		deferral_timer_workflow_relaunch_minutes=43200
	else
		deferral_timer_workflow_relaunch_minutes="${deferral_timer_workflow_relaunch_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DeferralTimerWorkflowRelaunch -string "${deferral_timer_workflow_relaunch_minutes}"
elif [[ -n "${deferral_timer_workflow_relaunch_option}" ]] && ! [[ "${deferral_timer_workflow_relaunch_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deferral-timer-workflow-relaunch=minutes value must only be a number."; option_error="TRUE"
fi
[[ -z "${deferral_timer_workflow_relaunch_minutes}" ]] && deferral_timer_workflow_relaunch_minutes="${DEFERRAL_TIMER_WORKFLOW_RELAUNCH_DEFAULT_MINUTES}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deferral_timer_workflow_relaunch_minutes is: ${deferral_timer_workflow_relaunch_minutes}"

# Validate ${deadline_count_focus_option} input and if valid set ${deadline_count_focus} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${deadline_count_focus_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-count-focus option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCountFocus 2> /dev/null
elif [[ -n "${deadline_count_focus_option}" ]] && [[ "${deadline_count_focus_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	deadline_count_focus="${deadline_count_focus_option}"
	defaults write "${SUPER_LOCAL_PLIST}" DeadlineCountFocus -string "${deadline_count_focus}"
elif [[ -n "${deadline_count_focus_option}" ]] && ! [[ "${deadline_count_focus_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deadline-count-focus=number value must only be a number."; option_error="TRUE"
fi

# Validate ${deadline_count_soft_option} input and if valid set ${deadline_count_soft}.
if [[ "${deadline_count_soft_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-count-soft option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCountSoft 2> /dev/null
elif [[ -n "${deadline_count_soft_option}" ]] && [[ "${deadline_count_soft_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	deadline_count_soft="${deadline_count_soft_option}"
elif [[ -n "${deadline_count_soft_option}" ]] && ! [[ "${deadline_count_soft_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deadline-count-soft=number value must only be a number."; option_error="TRUE"
fi

# Validate ${deadline_count_hard_option} input and if valid set ${deadline_count_hard}.
if [[ "${deadline_count_hard_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-count-hard option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCountHard 2> /dev/null
elif [[ -n "${deadline_count_hard_option}" ]] && [[ "${deadline_count_hard_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	deadline_count_hard="${deadline_count_hard_option}"
elif [[ -n "${deadline_count_hard_option}" ]] && ! [[ "${deadline_count_hard_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deadline-count-hard=number value must only be a number."; option_error="TRUE"
fi

# Validated that ${deadline_count_soft} and ${deadline_count_hard} are not both active, if not then save ${deadline_count_soft} or ${deadline_count_hard} to ${SUPER_LOCAL_PLIST}.
if [[ -n "${deadline_count_soft}" ]] && [[ -n "${deadline_count_hard}" ]]; then
	log_super "Parameter Error: You can not use both the --deadline-count-soft and --deadline-count-hard options at the same time. You must pick one deadline count behavior."; option_error="TRUE"
else
	[[ -n "${deadline_count_soft}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineCountSoft -string "${deadline_count_soft}"
	[[ -n "${deadline_count_hard}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineCountHard -string "${deadline_count_hard}"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_count_focus}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_count_focus is: ${deadline_count_focus}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_count_soft}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_count_soft is: ${deadline_count_soft}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_count_hard}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_count_hard is: ${deadline_count_hard}"

# Validate ${deadline_days_focus_option} input and if valid set ${deadline_days_focus} and ${deadline_days_focus_seconds}.
if [[ "${deadline_days_focus_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-days-focus option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDaysFocus 2> /dev/null
elif [[ -n "${deadline_days_focus_option}" ]] && [[ "${deadline_days_focus_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	deadline_days_focus="${deadline_days_focus_option}"
	deadline_days_focus_seconds=$((deadline_days_focus*86400))
elif [[ -n "${deadline_days_focus_option}" ]] && ! [[ "${deadline_days_focus_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deadline-days-focus=number value must only be a number."; option_error="TRUE"
fi

# Validate ${deadline_days_soft_option} input and if valid set ${deadline_days_soft} and ${deadline_days_soft_seconds}.
if [[ "${deadline_days_soft_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-days-soft option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDaysSoft 2> /dev/null
elif [[ -n "${deadline_days_soft_option}" ]] && [[ "${deadline_days_soft_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	deadline_days_soft="${deadline_days_soft_option}"
	deadline_days_soft_seconds=$((deadline_days_soft*86400))
elif [[ -n "${deadline_days_soft_option}" ]] && ! [[ "${deadline_days_soft_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deadline-days-soft=number value must only be a number."; option_error="TRUE"
fi

# Validate ${deadline_days_hard_option} input and if valid set ${deadline_days_hard} and ${deadline_days_hard_seconds}.
if [[ "${deadline_days_hard_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-days-hard option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDaysHard 2> /dev/null
elif [[ -n "${deadline_days_hard_option}" ]] && [[ "${deadline_days_hard_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	deadline_days_hard="${deadline_days_hard_option}"
	deadline_days_hard_seconds=$((deadline_days_hard*86400))
elif [[ -n "${deadline_days_hard_option}" ]] && ! [[ "${deadline_days_hard_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --deadline-days-hard=number value must only be a number."; option_error="TRUE"
fi

# Validate ${deadline_days_focus}, ${deadline_days_soft}, and ${deadline_days_hard} in relation to each other, and if valid save to ${SUPER_LOCAL_PLIST}.
if [[ -n "${deadline_days_hard}" ]] && [[ -n "${deadline_days_soft}" ]] && [[ "${deadline_days_hard}" -le "${deadline_days_soft}" ]]; then
	log_super "Parameter Error: The --deadline-days-hard=number value of ${deadline_days_hard} day(s) must be more than the --deadline-days-soft=number value of ${deadline_days_soft} day(s)."; option_error="TRUE"
fi
if [[ -n "${deadline_days_hard}" ]] && [[ -n "${deadline_days_focus}" ]] && [[ "${deadline_days_hard}" -le "${deadline_days_focus}" ]]; then
	log_super "Parameter Error: The --deadline-days-hard=number value of ${deadline_days_hard} day(s) must be more than the --deadline-days-focus=number value of ${deadline_days_focus} day(s)."; option_error="TRUE"
fi
if [[ -n "${deadline_days_soft}" ]] && [[ -n "${deadline_days_focus}" ]] && [[ "${deadline_days_soft}" -le "${deadline_days_focus}" ]]; then
	log_super "Parameter Error: The --deadline-days-soft=number value of ${deadline_days_soft} day(s) must be more than the --deadline-days-focus=number value of ${deadline_days_focus} day(s)."; option_error="TRUE"
fi
if [[ "${option_error}" != "TRUE" ]]; then
	[[ -n "${deadline_days_focus}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineDaysFocus -string "${deadline_days_focus}"
	[[ -n "${deadline_days_soft}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineDaysSoft -string "${deadline_days_soft}"
	[[ -n "${deadline_days_hard}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineDaysHard -string "${deadline_days_hard}"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_days_focus}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_focus is: ${deadline_days_focus}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_days_soft}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_soft is: ${deadline_days_soft}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_days_hard}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_hard is: ${deadline_days_hard}"


# Validate ${deadline_date_focus_option}, if valid set ${deadline_date_focus} and ${deadline_date_focus_epoch}.
if [[ "${deadline_date_focus_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-date-focus option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDateFocus 2> /dev/null
elif [[ -n "${deadline_date_focus_option}" ]]; then
	extract_date="${deadline_date_focus_option:0:10}"
	if [[ "${extract_date}" =~ ${REGEX_FULL_DATE} ]]; then
		extract_time="${deadline_date_focus_option:11:5}"
		if [[ -n "${extract_time}" ]]; then
			extract_hours="${extract_time:0:2}"
			[[ -z "${extract_hours}" ]] && extract_hours="00"
			extract_minutes="${extract_time:3:2}"
			[[ -z "${extract_minutes}" ]] && extract_minutes="00"
			extract_time="${extract_hours}:${extract_minutes}"
		else
			extract_time="00:00"
		fi
		if [[ "${extract_time}" =~ ${REGEX_HOURS_MINUTES} ]]; then
			calculated_deadline="${extract_date}:${extract_time}"
		else
			log_super "Parameter Error: The --deadline-date-focus value for time must be formated in 24-hour time as hh:mm."; option_error="TRUE"
		fi
	else
		log_super "Parameter Error: The --deadline-date-focus value for date must be formated as YYYY-MM-DD."; option_error="TRUE"
	fi
	if [[ "${calculated_deadline}" =~ ${REGEX_FULL_DATE_HOURS_MINUTES} ]]; then
		deadline_date_focus="${calculated_deadline}"
		deadline_date_focus_epoch=$(date -j -f "%Y-%m-%d:%H:%M" "${calculated_deadline}" +"%s")
	else
		log_super "Parameter Error: The --deadline-date-focus value must be formatted as YYYY-MM-DD:hh:mm."; option_error="TRUE"
	fi
fi

# Validate ${deadline_date_soft_option}, if valid set ${deadline_date_soft} and ${deadline_date_soft_epoch}.
if [[ "${deadline_date_soft_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-date-soft option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDateSoft 2> /dev/null
elif [[ -n "${deadline_date_soft_option}" ]]; then
	extract_date="${deadline_date_soft_option:0:10}"
	if [[ "${extract_date}" =~ ${REGEX_FULL_DATE} ]]; then
		extract_time="${deadline_date_soft_option:11:5}"
		if [[ -n "${extract_time}" ]]; then
			extract_hours="${extract_time:0:2}"
			[[ -z "${extract_hours}" ]] && extract_hours="00"
			extract_minutes="${extract_time:3:2}"
			[[ -z "${extract_minutes}" ]] && extract_minutes="00"
			extract_time="${extract_hours}:${extract_minutes}"
		else
			extract_time="00:00"
		fi
		if [[ "${extract_time}" =~ ${REGEX_HOURS_MINUTES} ]]; then
			calculated_deadline="${extract_date}:${extract_time}"
		else
			log_super "Parameter Error: The --deadline-date-soft value for time must be formated in 24-hour time as hh:mm."; option_error="TRUE"
		fi
	else
		log_super "Parameter Error: The --deadline-date-soft value for date must be formated as YYYY-MM-DD."; option_error="TRUE"
	fi
	if [[ "${calculated_deadline}" =~ ${REGEX_FULL_DATE_HOURS_MINUTES} ]]; then
		deadline_date_soft="${calculated_deadline}"
		deadline_date_soft_epoch=$(date -j -f "%Y-%m-%d:%H:%M" "${calculated_deadline}" +"%s")
	else
		log_super "Parameter Error: The --deadline-date-soft value must be formatted as YYYY-MM-DD:hh:mm."; option_error="TRUE"
	fi
fi

# Validate ${deadline_date_hard_option}, if valid set ${deadline_date_hard} and ${deadline_date_hard_epoch}.
if [[ "${deadline_date_hard_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --deadline-date-hard option."
	defaults delete "${SUPER_LOCAL_PLIST}" DeadlineDateHard 2> /dev/null
elif [[ -n "${deadline_date_hard_option}" ]]; then
	extract_date="${deadline_date_hard_option:0:10}"
	if [[ "${extract_date}" =~ ${REGEX_FULL_DATE} ]]; then
		extract_time="${deadline_date_hard_option:11:5}"
		if [[ -n "${extract_time}" ]]; then
			extract_hours="${extract_time:0:2}"
			[[ -z "${extract_hours}" ]] && extract_hours="00"
			extract_minutes="${extract_time:3:2}"
			[[ -z "${extract_minutes}" ]] && extract_minutes="00"
			extract_time="${extract_hours}:${extract_minutes}"
		else
			extract_time="00:00"
		fi
		if [[ "${extract_time}" =~ ${REGEX_HOURS_MINUTES} ]]; then
			calculated_deadline="${extract_date}:${extract_time}"
		else
			log_super "Parameter Error: The --deadline-date-hard value for time must be formated in 24-hour time as hh:mm."; option_error="TRUE"
		fi
	else
		log_super "Parameter Error: The --deadline-date-hard value for date must be formated as YYYY-MM-DD."; option_error="TRUE"
	fi
	if [[ "${calculated_deadline}" =~ ${REGEX_FULL_DATE_HOURS_MINUTES} ]]; then
		deadline_date_hard="${calculated_deadline}"
		deadline_date_hard_epoch=$(date -j -f "%Y-%m-%d:%H:%M" "${calculated_deadline}" +"%s")
	else
		log_super "Parameter Error: The --deadline-date-hard value must be formatted as YYYY-MM-DD:hh:mm."; option_error="TRUE"
	fi
fi

# Validate ${deadline_date_focus_epoch}, ${deadline_date_soft_epoch}, and ${deadline_date_hard_epoch} in relation to each other. If valid then save date deadlines to ${SUPER_LOCAL_PLIST}.
if [[ -n "${deadline_date_hard_epoch}" ]] && [[ -n "${deadline_date_soft_epoch}" ]] && [[ "${deadline_date_hard_epoch}" -le "${deadline_date_soft_epoch}" ]]; then
	log_super "Parameter Error: The --deadline-date-hard value of ${deadline_date_hard} must be later than the --deadline-date-soft value of ${deadline_date_soft}."; option_error="TRUE"
fi
if [[ -n "${deadline_date_hard_epoch}" ]] && [[ -n "${deadline_date_focus_epoch}" ]] && [[ "${deadline_date_hard_epoch}" -le "${deadline_date_focus_epoch}" ]]; then
	log_super "Parameter Error: The --deadline-date-hard value of ${deadline_date_hard} must be later than --deadline-date-focus value of ${deadline_date_focus}."; option_error="TRUE"
fi
if [[ -n "${deadline_date_soft_epoch}" ]] && [[ -n "${deadline_date_focus_epoch}" ]] && [[ "${deadline_date_soft_epoch}" -le "${deadline_date_focus_epoch}" ]]; then
	log_super "Parameter Error: The --deadline-date-soft value of ${deadline_date_soft} must be later than than --deadline-date-focus value of ${deadline_date_focus}."; option_error="TRUE"
fi
if [[ "${option_error}" != "TRUE" ]]; then
	[[ -n "${deadline_date_focus}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineDateFocus -string "${deadline_date_focus}"
	[[ -n "${deadline_date_soft}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineDateSoft -string "${deadline_date_soft}"
	[[ -n "${deadline_date_hard}" ]] && defaults write "${SUPER_LOCAL_PLIST}" DeadlineDateHard -string "${deadline_date_hard}"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_date_focus}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_date_focus is: ${deadline_date_focus}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_date_soft}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_date_soft is: ${deadline_date_soft}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${deadline_date_hard}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_date_hard is: ${deadline_date_hard}"

# Validate ${dialog_timeout_default_option} and if valid set ${dialog_timeout_default_seconds} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${dialog_timeout_default_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --dialog-timeout-default option."
	defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutDefault 2> /dev/null
elif [[ -n "${dialog_timeout_default_option}" ]] && [[ "${dialog_timeout_default_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${dialog_timeout_default_option}" -lt 60 ]]; then
		log_super "Warning: Specified --dialog-timeout-default=seconds value of ${dialog_timeout_default_option} seconds is too low, rounding up to 60 seconds."
		dialog_timeout_default_seconds=60
	elif [[ "${dialog_timeout_default_option}" -gt 86400 ]]; then
		log_super "Warning: Specified --dialog-timeout-default=seconds value of ${dialog_timeout_default_option} seconds is too high, rounding down to 86400 seconds (1 day)."
		dialog_timeout_default_seconds=86400
	else
		dialog_timeout_default_seconds="${dialog_timeout_default_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DialogTimeoutDefault -string "${dialog_timeout_default_seconds}"
elif [[ -n "${dialog_timeout_default_option}" ]] && ! [[ "${dialog_timeout_default_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --dialog-timeout-default=seconds value must only be a number."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${dialog_timeout_default_seconds}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_timeout_default_seconds is: ${dialog_timeout_default_seconds}"

# Validate ${dialog_timeout_restart_or_defer_option} and if valid set ${dialog_timeout_restart_or_defer_seconds} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${dialog_timeout_restart_or_defer_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --dialog-timeout-restart-or-defer option."
	defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutRestartOrDefer 2> /dev/null
elif [[ -n "${dialog_timeout_restart_or_defer_option}" ]] && [[ "${dialog_timeout_restart_or_defer_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${dialog_timeout_restart_or_defer_option}" -lt 60 ]]; then
		log_super "Warning: Specified --dialog-timeout-restart-or-defer=seconds value of ${dialog_timeout_restart_or_defer_option} seconds is too low, rounding up to 60 seconds."
		dialog_timeout_restart_or_defer_seconds=60
	elif [[ "${dialog_timeout_restart_or_defer_option}" -gt 86400 ]]; then
		log_super "Warning: Specified --dialog-timeout-restart-or-defer=seconds value of ${dialog_timeout_restart_or_defer_option} seconds is too high, rounding down to 86400 seconds (1 day)."
		dialog_timeout_restart_or_defer_seconds=86400
	else
		dialog_timeout_restart_or_defer_seconds="${dialog_timeout_restart_or_defer_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DialogTimeoutRestartOrDefer -string "${dialog_timeout_restart_or_defer_seconds}"
elif [[ -n "${dialog_timeout_restart_or_defer_option}" ]] && ! [[ "${dialog_timeout_restart_or_defer_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --dialog-timeout-restart-or-defer=seconds value must only be a number."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${dialog_timeout_restart_or_defer_seconds}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_timeout_restart_or_defer_seconds is: ${dialog_timeout_restart_or_defer_seconds}"

# Validate ${dialog_timeout_soft_deadline_option} and if valid set ${dialog_timeout_soft_deadline_seconds} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${dialog_timeout_soft_deadline_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --dialog-timeout-soft-deadline option."
	defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutSoftDeadline 2> /dev/null
elif [[ -n "${dialog_timeout_soft_deadline_option}" ]] && [[ "${dialog_timeout_soft_deadline_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${dialog_timeout_soft_deadline_option}" -lt 60 ]]; then
		log_super "Warning: Specified --dialog-timeout-soft-deadline=seconds value of ${dialog_timeout_soft_deadline_option} seconds is too low, rounding up to 60 seconds."
		dialog_timeout_soft_deadline_seconds=60
	elif [[ "${dialog_timeout_soft_deadline_option}" -gt 86400 ]]; then
		log_super "Warning: Specified --dialog-timeout-soft-deadline=seconds value of ${dialog_timeout_soft_deadline_option} seconds is too high, rounding down to 86400 seconds (1 day)."
		dialog_timeout_soft_deadline_seconds=86400
	else
		dialog_timeout_soft_deadline_seconds="${dialog_timeout_soft_deadline_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DialogTimeoutSoftDeadline -string "${dialog_timeout_soft_deadline_seconds}"
elif [[ -n "${dialog_timeout_soft_deadline_option}" ]] && ! [[ "${dialog_timeout_soft_deadline_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --dialog-timeout-soft-deadline=seconds value must only be a number."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${dialog_timeout_soft_deadline_seconds}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_timeout_soft_deadline_seconds is: ${dialog_timeout_soft_deadline_seconds}"

# Validate ${dialog_timeout_user_auth_option} and if valid set ${dialog_timeout_user_auth_seconds} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${dialog_timeout_user_auth_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --dialog-timeout-user-auth option."
	defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutUserAuth 2> /dev/null
elif [[ -n "${dialog_timeout_user_auth_option}" ]] && [[ "${dialog_timeout_user_auth_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${dialog_timeout_user_auth_option}" -lt 60 ]]; then
		log_super "Warning: Specified --dialog-timeout-user-auth=seconds value of ${dialog_timeout_user_auth_option} seconds is too low, rounding up to 60 seconds."
		dialog_timeout_user_auth_seconds=60
	elif [[ "${dialog_timeout_user_auth_option}" -gt 86400 ]]; then
		log_super "Warning: Specified --dialog-timeout-user-auth=seconds value of ${dialog_timeout_user_auth_option} seconds is too high, rounding down to 86400 seconds (1 day)."
		dialog_timeout_user_auth_seconds=86400
	else
		dialog_timeout_user_auth_seconds="${dialog_timeout_user_auth_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DialogTimeoutUserAuth -string "${dialog_timeout_user_auth_seconds}"
elif [[ -n "${dialog_timeout_user_auth_option}" ]] && ! [[ "${dialog_timeout_user_auth_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --dialog-timeout-user-auth=seconds value must only be a number."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${dialog_timeout_user_auth_seconds}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_timeout_user_auth_seconds is: ${dialog_timeout_user_auth_seconds}"

# Validate ${dialog_timeout_insufficient_storage_option} and if valid set ${dialog_timeout_insufficient_storage_seconds} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${dialog_timeout_insufficient_storage_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --dialog-timeout-insufficient-storage option."
	defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutInsufficientStorage 2> /dev/null
elif [[ -n "${dialog_timeout_insufficient_storage_option}" ]] && [[ "${dialog_timeout_insufficient_storage_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${dialog_timeout_insufficient_storage_option}" -lt 60 ]]; then
		log_super "Warning: Specified --dialog-timeout-insufficient-storage=seconds value of ${dialog_timeout_insufficient_storage_option} seconds is too low, rounding up to 60 seconds."
		dialog_timeout_insufficient_storage_seconds=60
	elif [[ "${dialog_timeout_insufficient_storage_option}" -gt 86400 ]]; then
		log_super "Warning: Specified --dialog-timeout-insufficient-storage=seconds value of ${dialog_timeout_insufficient_storage_option} seconds is too high, rounding down to 86400 seconds (1 day)."
		dialog_timeout_insufficient_storage_seconds=86400
	else
		dialog_timeout_insufficient_storage_seconds="${dialog_timeout_insufficient_storage_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DialogTimeoutInsufficientStorage -string "${dialog_timeout_insufficient_storage_seconds}"
elif [[ -n "${dialog_timeout_insufficient_storage_option}" ]] && ! [[ "${dialog_timeout_insufficient_storage_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --dialog-timeout-insufficient-storage=seconds value must only be a number."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${dialog_timeout_insufficient_storage_seconds}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_timeout_insufficient_storage_seconds is: ${dialog_timeout_insufficient_storage_seconds}"

# Validate ${dialog_timeout_power_required_option} and if valid set ${dialog_timeout_power_required_seconds} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${dialog_timeout_power_required_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --dialog-timeout-power-required option."
	defaults delete "${SUPER_LOCAL_PLIST}" DialogTimeoutPowerRequired 2> /dev/null
elif [[ -n "${dialog_timeout_power_required_option}" ]] && [[ "${dialog_timeout_power_required_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${dialog_timeout_power_required_option}" -lt 60 ]]; then
		log_super "Warning: Specified --dialog-timeout-power-required=seconds value of ${dialog_timeout_power_required_option} seconds is too low, rounding up to 60 seconds."
		dialog_timeout_power_required_seconds=60
	elif [[ "${dialog_timeout_power_required_option}" -gt 86400 ]]; then
		log_super "Warning: Specified --dialog-timeout-power-required=seconds value of ${dialog_timeout_power_required_option} seconds is too high, rounding down to 86400 seconds (1 day)."
		dialog_timeout_power_required_seconds=86400
	else
		dialog_timeout_power_required_seconds="${dialog_timeout_power_required_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DialogTimeoutPowerRequired -string "${dialog_timeout_power_required_seconds}"
elif [[ -n "${dialog_timeout_power_required_option}" ]] && ! [[ "${dialog_timeout_power_required_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --dialog-timeout-power-required=seconds value must only be a number."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${dialog_timeout_power_required_seconds}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_timeout_power_required_seconds is: ${dialog_timeout_power_required_seconds}"

# Validate ${display_unmovable_option} and if valid save to ${SUPER_LOCAL_PLIST}.
if [[ "${display_unmovable_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-unmovable option, defaulting to movable dialogs and notifications."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayUnmovable 2> /dev/null
elif [[ -n "${display_unmovable_option}" ]]; then
	local previous_ifs
	previous_ifs="${IFS}"; IFS=','
	local display_unmovable_array
	read -r -a display_unmovable_array <<< "${display_unmovable_option}"
	for option_type in "${display_unmovable_array[@]}"; do
		if ! [[ "${option_type}" =~ ^ALWAYS$|^SOFT$|^HARD$|^INSTALLNOW$|^DEFER$|^USERAUTH$|^POWER$|^STORAGE$ ]]; then
			log_super "Parameter Error: Unrecognized --display-unmovable type of ${option_type}. You can only specify the following types separated by commas (no spaces): ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER,STORAGE"; option_error="TRUE"
		fi
	done
	IFS="${previous_ifs}"
	if [[ "${option_error}" != "TRUE" ]]; then
		defaults write "${SUPER_LOCAL_PLIST}" DisplayUnmovable -string "${display_unmovable_option}"
	fi
	[[ $(echo "${display_unmovable_option}" | grep -c 'ALWAYS') -gt 0 ]] && display_unmovable_status="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_unmovable_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_unmovable_option is: ${display_unmovable_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_unmovable_status}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_unmovable_status is: ${display_unmovable_status}"

# Validate ${display_hide_background_option} and if valid save to ${SUPER_LOCAL_PLIST}.
if [[ "${display_hide_background_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-hide-background option, defaulting to visible background behind dialogs and notifications."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayUnmovable 2> /dev/null
elif [[ -n "${display_hide_background_option}" ]]; then
	local previous_ifs
	previous_ifs="${IFS}"; IFS=','
	local display_hide_background_array
	read -r -a display_hide_background_array <<< "${display_hide_background_option}"
	for option_type in "${display_hide_background_array[@]}"; do
		if ! [[ "${option_type}" =~ ^ALWAYS$|^SOFT$|^HARD$|^INSTALLNOW$|^DEFER$|^USERAUTH$|^POWER$ ]]; then
			log_super "Parameter Error: Unrecognized --display-hide-background type of ${option_type}. You can only specify the following types separated by commas (no spaces): ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER"; option_error="TRUE"
		fi
	done
	IFS="${previous_ifs}"
	if [[ "${option_error}" != "TRUE" ]]; then
		defaults write "${SUPER_LOCAL_PLIST}" DisplayHideBackground -string "${display_hide_background_option}"
	fi
	[[ $(echo "${display_hide_background_option}" | grep -c 'ALWAYS') -gt 0 ]] && display_hide_background_status="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_hide_background_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_hide_background_option is: ${display_hide_background_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_hide_background_status}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_hide_background_status is: ${display_hide_background_status}"

# Validate ${display_silently_option} and if valid save to ${SUPER_LOCAL_PLIST}.
if [[ "${display_silently_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-silently option, defaulting to audible alert for dialogs and notifications."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayUnmovable 2> /dev/null
elif [[ -n "${display_silently_option}" ]]; then
	previous_ifs="${IFS}"; IFS=','
	local display_silently_array
	read -r -a display_silently_array <<< "${display_silently_option}"
	for option_type in "${display_silently_array[@]}"; do
		if ! [[ "${option_type}" =~ ^ALWAYS$|^SOFT$|^HARD$|^INSTALLNOW$|^DEFER$|^USERAUTH$|^POWER$|^STORAGE$ ]]; then
			log_super "Parameter Error: Unrecognized --display-silently type of ${option_type}. You can only specify the following types separated by commas (no spaces): ALWAYS,SOFT,HARD,INSTALLNOW,DEFER,USERAUTH,POWER,STORAGE"; option_error="TRUE"
		fi
	done
	IFS="${previous_ifs}"
	if [[ "${option_error}" != "TRUE" ]]; then
		defaults write "${SUPER_LOCAL_PLIST}" DisplaySilently -string "${display_silently_option}"
	fi
	[[ $(echo "${display_silently_option}" | grep -c 'ALWAYS') -gt 0 ]] && display_silently_status="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_silently_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_silently_option is: ${display_silently_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_silently_status}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_silently_status is: ${display_silently_status}"

# Verify the ${display_icon_file_option} and if valid copy it to the path at ${DISPLAY_ICON_FILE_CACHE} and save to ${SUPER_LOCAL_PLIST}. If there is no file at ${DISPLAY_ICON_FILE_CACHE} then copy the file at path ${DISPLAY_ICON_DEFAULT_FILE}.
local sips_response
if [[ "${display_icon_file_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-icon-file option, defaulting to ${DISPLAY_ICON_DEFAULT_FILE}."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayIconFile 2> /dev/null
	[[ -f "${DISPLAY_ICON_FILE_CACHE}" ]] && rm -f "${DISPLAY_ICON_FILE_CACHE}"
elif [[ -n "${display_icon_file_option}" ]] && [[ "${display_icon_file_option}" != $(defaults read "${SUPER_LOCAL_PLIST}" DisplayIconFileCachedOrigin 2> /dev/null) ]]; then
	if [[ "${display_icon_file_option}" =~ ${REGEX_HTML_URL} ]]; then
		log_super "Status: Attempting to download requested display icon from: ${display_icon_file_option}"
		local previous_umask
		previous_umask=$(umask)
		umask 077
		local temp_file
		temp_file=$(mktemp)
		local download_response
		download_response=$(curl --location "${display_icon_file_option}" --output "${temp_file}" 2>&1)
		if [[ -f "${temp_file}" ]]; then
			sips_response=$(sips --setProperty format png "${temp_file}" --out "${DISPLAY_ICON_FILE_CACHE}" 2>&1)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: sips_response is:\n${sips_response}"
			defaults write "${SUPER_LOCAL_PLIST}" DisplayIconFileCachedOrigin -string "${display_icon_file_option}"
		else
			log_super "Warning: Unable to download --display-icon-file from: ${display_icon_file_option}"
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_response is:\n${download_response}"
		fi
		rm -Rf "${temp_file}" > /dev/null 2>&1
		umask "${previous_umask}"
	elif [[ -e "${display_icon_file_option}" ]]; then
		log_super "Status: Copying requested --display-icon-file from: ${display_icon_file_option}"
		sips_response=$(sips --setProperty format png "${display_icon_file_option}" --out "${DISPLAY_ICON_FILE_CACHE}" 2>&1)
		chmod a+r "${DISPLAY_ICON_FILE_CACHE}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: sips_response is:\n${sips_response}"
		defaults write "${SUPER_LOCAL_PLIST}" DisplayIconFileCachedOrigin -string "${display_icon_file_option}"
	else
		log_super "Warning: Unable to locate specified requested --display-icon-file from: ${display_icon_file_option}"
	fi
fi
if [[ ! -f "${DISPLAY_ICON_FILE_CACHE}" ]]; then
	log_super "Status: No --display-icon-file icon found, copying default display icon from: ${DISPLAY_ICON_DEFAULT_FILE}"
	sips_response=$(sips --setProperty format png "${DISPLAY_ICON_DEFAULT_FILE}" --out "${DISPLAY_ICON_FILE_CACHE}" 2>&1)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: sips_response is:\n${sips_response}"
	defaults write "${SUPER_LOCAL_PLIST}" DisplayIconFileCachedOrigin -string "${DISPLAY_ICON_DEFAULT_FILE}"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_icon_file_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_icon_file_option is: ${display_icon_file_option}"

# Validate ${display_icon_size_option} input and if valid override default ${display_icon_size} parameter and save to ${SUPER_LOCAL_PLIST}. If there is no ${display_icon_size} then set it to ${DISPLAY_ICON_DEFAULT_SIZE}.
if [[ "${display_icon_size_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-icon-size option, defaulting to ${DISPLAY_ICON_DEFAULT_SIZE} pixels."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayIconSize 2> /dev/null
elif [[ -n "${display_icon_size_option}" ]] && [[ "${display_icon_size_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${display_icon_size_option}" -lt 32 ]]; then
		log_super "Warning: Specified --display-icon-size=pixels value of ${display_icon_size_option} pixels is too low, rounding up to 32 pixels."
		display_icon_size=32
	elif [[ "${display_icon_size_option}" -gt 150 ]]; then
		log_super "Warning: Specified --display-icon-size=pixels value of ${display_icon_size_option} pixels is too high, rounding down to 150 pixels."
		display_icon_size=150
	else
		display_icon_size="${display_icon_size_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" DisplayIconSize -string "${display_icon_size}"
elif [[ -n "${display_icon_size_option}" ]] && ! [[ "${display_icon_size_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --display-icon-size=pixels value must only be a number."; option_error="TRUE"
fi
[[ -z "${display_icon_size}" ]] && display_icon_size="${DISPLAY_ICON_DEFAULT_SIZE}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_icon_size is: ${display_icon_size}"

# Validate ${display_accessory_type_option}, ${display_accessory_default_file_option}, ${display_accessory_update_file_option}, ${display_accessory_upgrade_file_option}, and ${display_accessory_user_auth_file_option}.
if [[ "${display_accessory_type_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-accessory-type option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayAccessoryType 2> /dev/null
	unset display_accessory_type_option
fi
if [[ "${display_accessory_default_file_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-accessory-default-file option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayAccessoryDefaultFile 2> /dev/null
	unset display_accessory_default_file_option
fi
if [[ "${display_accessory_update_file_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-accessory-update-file option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayAccessoryUpdateFile 2> /dev/null
	unset display_accessory_update_file_option
fi
if [[ "${display_accessory_upgrade_file_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-accessory-upgrade-file option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayAccessoryUpgradeFile 2> /dev/null
	unset display_accessory_upgrade_file_option
fi
if [[ "${display_accessory_user_auth_file_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-accessory-user-auth-file option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayAccessoryUserAuthFile 2> /dev/null
	unset display_accessory_user_auth_file_option
fi
if [[ -n "${display_accessory_type_option}" ]] && [[ -z "${display_accessory_default_file_option}" ]] && [[ -z "${display_accessory_update_file_option}" ]] && [[ -z "${display_accessory_upgrade_file_option}" ]] && [[ -z "${display_accessory_user_auth_file_option}" ]]; then
	log_super "Parameter Error: To use the --display-accessory-type option you must also specify one of the display accessory file options."; option_error="TRUE"
fi
if [[ -z "${display_accessory_type_option}" ]] && { [[ -n "${display_accessory_default_file_option}" ]] || [[ -n "${display_accessory_update_file_option}" ]] || [[ -n "${display_accessory_upgrade_file_option}" ]] || [[ -n "${display_accessory_user_auth_file_option}" ]]; }; then
	log_super "Parameter Error: To use any of the display accessory file options you must also specify the --display-accessory-type option."; option_error="TRUE"
fi
if [[ "${option_error}" != "TRUE" ]] && [[ -n "${display_accessory_type_option}" ]]; then
	if [[ "${display_accessory_type_option}" =~ ^TEXTBOX$|^HTMLBOX$|^HTML$|^IMAGE$|^VIDEO$|^VIDEOAUTO$ ]]; then
		display_accessory_type="${display_accessory_type_option}"
		defaults write "${SUPER_LOCAL_PLIST}" DisplayAccessoryType -string "${display_accessory_type_option}"
	else
		log_super "Parameter Error: Unrecognized --display-accessory-type value of: ${display_accessory_type_option}. You must specify one of the following; TEXTBOX, HTMLBOX, HTML, IMAGE, VIDEO, or VIDEOAUTO."; option_error="TRUE"
	fi
fi
if [[ "${option_error}" != "TRUE" ]] && { [[ -n "${display_accessory_default_file_option}" ]] || [[ -n "${display_accessory_update_file_option}" ]] || [[ -n "${display_accessory_upgrade_file_option}" ]] || [[ -n "${display_accessory_user_auth_file_option}" ]]; }; then
	if [[ -n "${display_accessory_default_file_option}" ]]; then
		display_accessory_default="${display_accessory_default_file_option}"
		defaults write "${SUPER_LOCAL_PLIST}" DisplayAccessoryDefaultFile -string "${display_accessory_default_file_option}"
	fi
	if [[ -n "${display_accessory_update_file_option}" ]]; then
		display_accessory_update="${display_accessory_update_file_option}"
		defaults write "${SUPER_LOCAL_PLIST}" DisplayAccessoryUpdateFile -string "${display_accessory_update_file_option}"
	fi
	if [[ -n "${display_accessory_upgrade_file_option}" ]]; then
		display_accessory_upgrade="${display_accessory_upgrade_file_option}"
		defaults write "${SUPER_LOCAL_PLIST}" DisplayAccessoryUpgradeFile -string "${display_accessory_upgrade_file_option}"
	fi
	if [[ -n "${display_accessory_user_auth_file_option}" ]]; then
		display_accessory_user_auth="${display_accessory_user_auth_file_option}"
		defaults write "${SUPER_LOCAL_PLIST}" DisplayAccessoryUserAuthFile -string "${display_accessory_user_auth_file_option}"
	fi
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_accessory_type_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_type_option is: ${display_accessory_type_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_accessory_default_file_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_default_file_option is: ${display_accessory_default_file_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_accessory_update_file_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_update_file_option is: ${display_accessory_update_file_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_accessory_upgrade_file_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_upgrade_file_option is: ${display_accessory_upgrade_file_option}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_accessory_user_auth_file_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_user_auth_file_option is: ${display_accessory_user_auth_file_option}"

# Validate ${display_help_button_string_option} and set ${display_help_button_string} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${display_help_button_string_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-help-button-string option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayHelpButtonString 2> /dev/null
elif [[ -n "${display_help_button_string_option}" ]]; then
	display_help_button_string="${display_help_button_string_option}"
	defaults write "${SUPER_LOCAL_PLIST}" DisplayHelpButtonString -string "${display_help_button_string_option}"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_help_button_string}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_help_button_string is: ${display_help_button_string}"

# Validate ${display_warning_button_string_option} and set ${display_warning_button_string} and save to ${SUPER_LOCAL_PLIST}.
if [[ "${display_warning_button_string_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --display-warning-button-string option."
	defaults delete "${SUPER_LOCAL_PLIST}" DisplayWarningButtonString 2> /dev/null
elif [[ -n "${display_warning_button_string_option}" ]]; then
	display_warning_button_string="${display_warning_button_string_option}"
	defaults write "${SUPER_LOCAL_PLIST}" DisplayWarningButtonString -string "${display_warning_button_string_option}"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${display_warning_button_string}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_warning_button_string is: ${display_warning_button_string}"

# This initial round of authentication option validation simply checks to make sure the user entered logicially correct option combinations.
# Additional authentication validation is handled by the manage_authentication_options() function.
if [[ "${mac_cpu_architecture}" == "arm64" ]]; then
	if [[ "${auth_ask_user_to_save_password}" -eq 1 ]] || [[ "${auth_ask_user_to_save_password}" == "TRUE" ]] && [[ "${auth_delete_all_option}" != "TRUE" ]]; then
		auth_ask_user_to_save_password="TRUE"
		defaults write "${SUPER_LOCAL_PLIST}" AuthAskUserToSavePassword -bool true
	else
		auth_ask_user_to_save_password="FALSE"
		defaults delete "${SUPER_LOCAL_PLIST}" AuthAskUserToSavePassword 2> /dev/null
	fi
	
	if [[ -n "${auth_local_account_option}" ]] && [[ -z "${auth_local_password_option}" ]]; then
		log_super "Auth Error: The --auth-local-account option requires that you also use the --auth-local-password option."; option_error="TRUE"
	fi
	if [[ -z "${auth_local_account_option}" ]] && [[ -n "${auth_local_password_option}" ]]; then
		log_super "Auth Error: The --auth-local-password option requires that you also set the --auth-local-account option."; option_error="TRUE"
	fi
	
	if [[ -n "${auth_service_add_via_admin_account_option}" ]] && [[ -z "${auth_service_add_via_admin_password_option}" ]]; then
		log_super "Auth Error: The --auth-service_add_via_admin-account option requires that you also use the --auth-service_add_via_admin-password option."; option_error="TRUE"
	fi
	if [[ -z "${auth_service_add_via_admin_account_option}" ]] && [[ -n "${auth_service_add_via_admin_password_option}" ]]; then
		log_super "Auth Error: The --auth-service_add_via_admin-password option requires that you also set the --auth-service_add_via_admin-account option."; option_error="TRUE"
	fi
	
	if [[ -n "${auth_service_account_option}" ]] && { [[ -z "${auth_service_add_via_admin_account_option}" ]] || [[ -z "${auth_service_add_via_admin_password_option}" ]]; }; then
		log_super "Auth Error: The --auth-service-account option requires that you also set the ---auth-service-add-via-admin-account and --auth-service-add-via-admin-password options."; option_error="TRUE"
	fi
	if [[ -n "${auth_service_password_option}" ]] && { [[ -z "${auth_service_add_via_admin_account_option}" ]] || [[ -z "${auth_service_add_via_admin_password_option}" ]]; }; then
		log_super "Auth Error: The --auth-service-password option requires that you also set the ---auth-service-add-via-admin-account and --auth-service-add-via-admin-password options."; option_error="TRUE"
	fi
	
	if [[ -n "${auth_jamf_client_option}" ]] && [[ -z "${auth_jamf_secret_option}" ]]; then
		log_super "Auth Error: The --auth-jamf-client option requires that you also set the --auth-jamf-secret option."; option_error="TRUE"
	fi
	if [[ -z "${auth_jamf_client_option}" ]] && [[ -n "${auth_jamf_secret_option}" ]]; then
		log_super "Auth Error: The --auth-jamf-secret option option requires that you also set the --auth-jamf-client."; option_error="TRUE"
	fi
	if [[ -n "${auth_jamf_client_option}" ]] && [[ "${jamf_version}" -lt 1049 ]]; then
		log_super "Auth Error: The --auth-jamf-client option requires Jamf Pro version 10.49 or later, the currently installed version of Jamf Pro ${jamf_version_major}.${jamf_version_minor} does not support this option."; option_error="TRUE"
	fi
	
	if [[ -n "${auth_jamf_account_option}" ]] && [[ -z "${auth_jamf_password_option}" ]]; then
		log_super "Auth Error: The --auth-jamf-account option requires that you also set the --auth-jamf-password option."; option_error="TRUE"
	fi
	if [[ -z "${auth_jamf_account_option}" ]] && [[ -n "${auth_jamf_password_option}" ]]; then
		log_super "Auth Error: The --auth-jamf-password option option requires that you also set the --auth-jamf-account."; option_error="TRUE"
	fi
	if [[ -n "${auth_jamf_account_option}" ]] && [[ "${jamf_version}" -ge 1049 ]]; then
		log_super "Warning: The --auth-jamf-account option is not recommended for Jamf Pro version 10.49 or later. The recommended implementation is the more secure --auth-jamf-client option."
	fi
	
	# Validate ${auth_jamf_custom_url_option} input and save to ${SUPER_LOCAL_PLIST}.
	if [[ "${auth_jamf_custom_url_option}" == "X" ]]; then
		log_super "Status: Deleting local preference for the --auth-jamf-custom-url option, defaulting to Jamf Pro management URL."
		defaults delete "${SUPER_LOCAL_PLIST}" AuthJamfCustomURL 2> /dev/null
	elif [[ -n "${auth_jamf_custom_url_option}" ]] && [[ "${auth_jamf_custom_url_option}" =~ ${REGEX_HTTPS} ]]; then
		if ! [[ "${auth_jamf_custom_url_option}" =~ .*\/$ ]]; then
			auth_jamf_custom_url_option="${auth_jamf_custom_url_option}/"
			log_super "Warning: Adding a trailing slash to the --auth-jamf-custom-url value: ${auth_jamf_custom_url_option}"
		fi
		defaults write "${SUPER_LOCAL_PLIST}" AuthJamfCustomURL -string "${auth_jamf_custom_url_option}"
		auth_jamf_custom_url="${auth_jamf_custom_url_option}"
	elif [[ -n "${auth_jamf_custom_url_option}" ]] && ! [[ "${auth_jamf_custom_url_option}" =~ ${REGEX_HTTPS} ]]; then
		log_super "Parameter Error: Invalid --auth-jamf-custom-url=URL VALUE must start with 'https://': ${auth_jamf_custom_url_option}"; option_error="TRUE"
	fi
	{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${auth_jamf_custom_url}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_custom_url is: ${auth_jamf_custom_url}"

	# Manage ${auth_credential_failover_to_user_option} and save to ${SUPER_LOCAL_PLIST}.
	if [[ "${auth_credential_failover_to_user_option}" -eq 1 ]] || [[ "${auth_credential_failover_to_user_option}" == "TRUE" ]]; then
		auth_credential_failover_to_user_option="TRUE"
		defaults write "${SUPER_LOCAL_PLIST}" AuthCredentialFailoverToUser -bool true
	else
		auth_credential_failover_to_user_option="FALSE"
		defaults delete "${SUPER_LOCAL_PLIST}" AuthCredentialFailoverToUser 2> /dev/null
	fi
	{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${auth_credential_failover_to_user_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_credential_failover_to_user_option is: ${auth_credential_failover_to_user_option}"

	# Validate ${auth_mdm_failover_to_user_option} and set initial various ${auth_mdm_failover_*} parameters.
	auth_mdm_failover="FALSE"
	if [[ "${auth_mdm_failover_to_user_option}" == "X" ]]; then
		log_super "Status: Deleting local preference for the --auth-mdm-failover-to-user option, defaulting to error deferral for any MDM failure."
		defaults delete "${SUPER_LOCAL_PLIST}" AuthMDMFailoverToUser 2> /dev/null
	elif [[ -n "${auth_mdm_failover_to_user_option}" ]]; then
		local previous_ifs
		previous_ifs="${IFS}"; IFS=','
		local auth_mdm_failover_to_user_array
		read -r -a auth_mdm_failover_to_user_array <<< "${auth_mdm_failover_to_user_option}"
		for option_type in "${auth_mdm_failover_to_user_array[@]}"; do
			if [[ "${option_type}" =~ ^ALWAYS$ ]]; then
				auth_mdm_failover_always="TRUE"
			elif [[ "${option_type}" =~ ^NOSERVICE$ ]]; then
				auth_mdm_failover_no_service="TRUE"
			elif [[ "${option_type}" =~ ^SOFT$ ]]; then
				auth_mdm_failover_soft="TRUE"
			elif [[ "${option_type}" =~ ^HARD$ ]]; then
				auth_mdm_failover_hard="TRUE"
			elif [[ "${option_type}" =~ ^INSTALLNOW$ ]]; then
				auth_mdm_failover_install_now="TRUE"
			elif [[ "${option_type}" =~ ^BOOTSTRAP$ ]]; then
				auth_mdm_failover_bootstrap="TRUE"
			else
				log_super "Parameter Error: Unrecognized --auth-mdm-failover-to-user value of: ${option_type}. You can specify any of the following types separated by commas (no spaces); ALWAYS,SOFT,HARD,INSTALLNOW,BOOTSTRAP."; option_error="TRUE"
			fi
		done
		IFS="${previous_ifs}"
		[[ "${option_error}" != "TRUE" ]] && defaults write "${SUPER_LOCAL_PLIST}" AuthMDMFailoverToUser -string "${auth_mdm_failover_to_user_option}"
	fi
	{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${auth_mdm_failover_to_user_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_mdm_failover_to_user_option is: ${auth_mdm_failover_to_user_option}"
else # Mac computer with Intel.
	[[ -n "${auth_ask_user_to_save_password}" ]] && log_super "Warning: The --auth-ask-user-to-save-password option is ignored on Mac computers with Intel."
	[[ -n "${auth_local_account_option}" ]] && log_super "Warning: The --auth-local-account option is ignored on Mac computers with Intel."
	[[ -n "${auth_service_add_via_admin_account_option}" ]] && log_super "Warning: The --auth-service-add-via-admin-account option is ignored on Mac computers with Intel."
	[[ -n "${auth_service_account_option}" ]] && log_super "Warning: The --auth-service-account option is ignored on Mac computers with Intel."
	[[ -n "${auth_jamf_client_option}" ]] && log_super "Warning: The --auth-jamf-client option is ignored on Mac computers with Intel."
	[[ -n "${auth_jamf_account_option}" ]] && log_super "Warning: The --auth-jamf-account option is ignored on Mac computers with Intel."
	[[ -n "${auth_jamf_custom_url_option}" ]] && log_super "Warning: The --auth-jamf-custom-url option is ignored on Mac computers with Intel."
	[[ -n "${auth_credential_failover_to_user_option}" ]] && log_super "Warning: The --auth-credential-failover-to-user option is ignored on Mac computers with Intel."
	[[ -n "${auth_mdm_failover_to_user_option}" ]] && log_super "Warning: The --auth-mdm-failover-to-user option is ignored on Mac computers with Intel."
fi

# Manage ${test_mode_option} and save to ${SUPER_LOCAL_PLIST}.
if [[ ${test_mode_option} -eq 1 ]] || [[ "${test_mode_option}" == "TRUE" ]]; then
	test_mode_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" TestMode -bool true
else
	test_mode_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" TestMode 2> /dev/null
fi
if [[ "${test_mode_option}" == "TRUE" ]] && [[ "${current_user_account_name}" == "FALSE" ]]; then
	log_super "Parameter Error: Test mode requires that a valid user is logged in."; option_error="TRUE"
fi
if [[ "${test_mode_option}" == "TRUE" ]] && [[ "${workflow_only_download_option}" == "TRUE" ]]; then
	log_super "Parameter Error: The --test-mode option can not be used with the --workflow-only-download."; option_error="TRUE"
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${test_mode_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: test_mode_option is: ${test_mode_option}"

# Validate ${test_mode_timeout_option} input and if valid set ${test_mode_timeout_seconds} and save to ${SUPER_LOCAL_PLIST}. If there is no ${test_mode_timeout_seconds} then set it to ${TEST_MODE_DEFAULT_TIMEOUT}.
if [[ "${test_mode_timeout_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --test-mode-timeout option, defaulting to ${TEST_MODE_DEFAULT_TIMEOUT} seconds."
	defaults delete "${SUPER_LOCAL_PLIST}" TestModeTimeout 2> /dev/null
elif [[ -n "${test_mode_timeout_option}" ]] && [[ "${test_mode_timeout_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	if [[ "${test_mode_timeout_option}" -lt 10 ]]; then
		log_super "Warning: Specified --test-mode-timeout=seconds value of ${test_mode_timeout_option} seconds is too low, rounding up to 10 seconds."
		test_mode_timeout_seconds=10
	elif [[ "${test_mode_timeout_option}" -gt 120 ]]; then
		log_super "Warning: Specified --test-mode-timeout=seconds value of ${test_mode_timeout_option} seconds is too high, rounding down to 120 seconds (2 minutes)."
		test_mode_timeout_seconds=120
	else
		test_mode_timeout_seconds="${test_mode_timeout_option}"
	fi
	defaults write "${SUPER_LOCAL_PLIST}" TestModeTimeout -string "${test_mode_timeout_seconds}"
elif [[ -n "${test_mode_timeout_option}" ]] && ! [[ "${test_mode_timeout_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --test-mode-timeout=seconds value must only be a number."; option_error="TRUE"
fi
[[ -z "${test_mode_timeout_seconds}" ]] && test_mode_timeout_seconds="${TEST_MODE_DEFAULT_TIMEOUT}"
if [[ "${test_mode_option}" == "TRUE" ]]; then
	if [[ -n "${dialog_timeout_default_seconds}" ]] && [[ "${dialog_timeout_default_seconds}" -gt "${test_mode_timeout_seconds}" ]]; then
			log_super "Warning: Test mode requires temporary adjustment of the --dialog-timeout-default=seconds value from ${dialog_timeout_default_seconds} seconds to ${test_mode_timeout_seconds} seconds. This adjustment is not saved."
			dialog_timeout_default_seconds="${test_mode_timeout_seconds}"
	fi
	if [[ -n "${dialog_timeout_restart_or_defer_seconds}" ]] && [[ "${dialog_timeout_restart_or_defer_seconds}" -gt "${test_mode_timeout_seconds}" ]]; then
			log_super "Warning: Test mode requires temporary adjustment of the --dialog-timeout-restart-or-defer=seconds value from ${dialog_timeout_restart_or_defer_seconds} seconds to ${test_mode_timeout_seconds} seconds. This adjustment is not saved."
			dialog_timeout_restart_or_defer_seconds="${test_mode_timeout_seconds}"
	fi
	if [[ -n "${dialog_timeout_soft_deadline_seconds}" ]] && [[ "${dialog_timeout_soft_deadline_seconds}" -gt "${test_mode_timeout_seconds}" ]]; then
			log_super "Warning: Test mode requires temporary adjustment of the --dialog-timeout-soft-deadline=seconds value from ${dialog_timeout_soft_deadline_seconds} seconds to ${test_mode_timeout_seconds} seconds. This adjustment is not saved."
			dialog_timeout_soft_deadline_seconds="${test_mode_timeout_seconds}"
	fi
	if [[ -n "${dialog_timeout_user_auth_seconds}" ]] && [[ "${dialog_timeout_user_auth_seconds}" -gt "${test_mode_timeout_seconds}" ]]; then
			log_super "Warning: Test mode requires temporary adjustment of the --dialog-timeout-user-auth=seconds value from ${dialog_timeout_user_auth_seconds} seconds to ${test_mode_timeout_seconds} seconds. This adjustment is not saved."
			dialog_timeout_user_auth_seconds="${test_mode_timeout_seconds}"
	fi
	if [[ -n "${dialog_timeout_insufficient_storage_seconds}" ]] && [[ "${dialog_timeout_insufficient_storage_seconds}" -gt "${test_mode_timeout_seconds}" ]]; then
			log_super "Warning: Test mode requires temporary adjustment of the --dialog-timeout-insufficient-storage=seconds value from ${dialog_timeout_insufficient_storage_seconds} seconds to ${test_mode_timeout_seconds} seconds. This adjustment is not saved."
			dialog_timeout_insufficient_storage_seconds="${test_mode_timeout_seconds}"
	fi
	if [[ -n "${dialog_timeout_power_required_seconds}" ]] && [[ "${dialog_timeout_power_required_seconds}" -gt "${test_mode_timeout_seconds}" ]]; then
			log_super "Warning: Test mode requires temporary adjustment of the --dialog-timeout-power-required=seconds value from ${dialog_timeout_power_required_seconds} seconds to ${test_mode_timeout_seconds} seconds. This adjustment is not saved."
			dialog_timeout_power_required_seconds="${test_mode_timeout_seconds}"
	fi
fi
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ -n "${test_mode_timeout_option}" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: test_mode_timeout_option is: ${test_mode_timeout_option}"

# Validate ${test_storage_update_option} input and if valid set ${storage_required_update_gb} and save to ${SUPER_LOCAL_PLIST}. If there is no ${storage_required_update_gb} then set it to ${STORAGE_REQUIRED_UPDATE_DEFAULT_GB}.
if [[ "${test_storage_update_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --test-storage-update option, defaulting to ${STORAGE_REQUIRED_UPDATE_DEFAULT_GB} GBs."
	defaults delete "${SUPER_LOCAL_PLIST}" TestStorageUpdate 2> /dev/null
elif [[ -n "${test_storage_update_option}" ]] && [[ "${test_storage_update_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	[[ "${test_storage_update_option}" -ne "${storage_required_update_gb}" ]] && log_super "Warning: Specifying the --test-storage-update option should only be used for testing purposes."
	storage_required_update_gb="${test_storage_update_option}"
	defaults write "${SUPER_LOCAL_PLIST}" TestStorageUpdate -string "${storage_required_update_gb}"
elif [[ -n "${test_storage_update_option}" ]] && ! [[ "${test_storage_update_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --test-storage-update=gigabytes value must only be a number."; option_error="TRUE"
fi
[[ -z "${storage_required_update_gb}" ]] && storage_required_update_gb="${STORAGE_REQUIRED_UPDATE_DEFAULT_GB}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_required_update_gb is: ${storage_required_update_gb}"

# Validate ${test_storage_upgrade_option} input and if valid set ${storage_required_upgrade_gb} and save to ${SUPER_LOCAL_PLIST}. If there is no ${storage_required_upgrade_gb} then set it to ${STORAGE_REQUIRED_UPGRADE_DEFAULT_GB}.
if [[ "${test_storage_upgrade_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --test-storage-upgrade option, defaulting to ${STORAGE_REQUIRED_UPGRADE_DEFAULT_GB} GBs."
	defaults delete "${SUPER_LOCAL_PLIST}" TestStorageUpdate 2> /dev/null
elif [[ -n "${test_storage_upgrade_option}" ]] && [[ "${test_storage_upgrade_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	[[ "${test_storage_upgrade_option}" -ne "${storage_required_upgrade_gb}" ]] && log_super "Warning: Specifying the --test-storage-upgrade option should only be used for testing purposes."
	storage_required_upgrade_gb="${test_storage_upgrade_option}"
	defaults write "${SUPER_LOCAL_PLIST}" TestStorageUpdate -string "${storage_required_upgrade_gb}"
elif [[ -n "${test_storage_upgrade_option}" ]] && ! [[ "${test_storage_upgrade_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --test-storage-upgrade=gigabytes value must only be a number."; option_error="TRUE"
fi
[[ -z "${storage_required_upgrade_gb}" ]] && storage_required_upgrade_gb="${STORAGE_REQUIRED_UPGRADE_DEFAULT_GB}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_required_upgrade_gb is: ${storage_required_upgrade_gb}"

# Validate ${test_battery_level_option} input and if valid set ${power_required_battery_percent} and save to ${SUPER_LOCAL_PLIST}. If there is no ${power_required_battery_percent} then set it to ${POWER_REQUIRED_BATTERY_APPLE_SILICON_PERCENT} or ${POWER_REQUIRED_BATTERY_INTEL_PERCENT}.
if [[ "${test_battery_level_option}" == "X" ]]; then
	log_super "Status: Deleting local preference for the --test-battery-level option, defaulting to ${power_required_battery_percent}%."
	defaults delete "${SUPER_LOCAL_PLIST}" TestBatteryLevel 2> /dev/null
elif [[ -n "${test_battery_level_option}" ]] && [[ "${test_battery_level_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	[[ "${test_battery_level_option}" -ne "${power_required_battery_percent}" ]] && log_super "Warning: Specifying the --test-battery-level option should only be used for testing purposes."
	power_required_battery_percent="${test_battery_level_option}"
	defaults write "${SUPER_LOCAL_PLIST}" TestBatteryLevel -string "${power_required_battery_percent}"
elif [[ -n "${test_battery_level_option}" ]] && ! [[ "${test_battery_level_option}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Parameter Error: The --test-battery-level=percentage value must only be a number."; option_error="TRUE"
fi
if [[ -z "${power_required_battery_percent}" ]]; then
	if [[ "${mac_cpu_architecture}" == "arm64" ]]; then
		power_required_battery_percent="${POWER_REQUIRED_BATTERY_APPLE_SILICON_PERCENT}"
	else # Intel.
		power_required_battery_percent="${POWER_REQUIRED_BATTERY_INTEL_PERCENT}"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_required_battery_percent is: ${power_required_battery_percent}"
}

# For Apple Silicon computers this function manages update/upgrade credentials given the various --auth_* options. Any error will set ${auth_error_new}.
manage_authentication_options () {
auth_error_new="FALSE"

# Collect any previously saved credential states (including legacy methods) from ${SUPER_LOCAL_PLIST}.
auth_user_account_saved="FALSE"
if [[ "${current_user_account_name}" != "FALSE" ]]; then
	auth_user_password_keychain=$(sudo -u "${current_user_account_name}" security find-generic-password -w -a "super_auth_user_password" 2>&1)
	if [[ $(echo "${auth_user_password_keychain}" | grep -c 'The specified item could not be found in the keychain.') -eq 0 ]]; then
		auth_user_account_saved="TRUE"
	else
		unset auth_user_password_keychain
	fi
else # No ${current_user_account_name}
	log_super "Warning: No currently logged in user, cannot check status of the --auth-ask-user-to-save-password option."
fi
auth_local_account_saved=$(defaults read "${SUPER_LOCAL_PLIST}" AuthLocalAccount 2> /dev/null)
[[ "${auth_local_account_saved}" -eq 1 ]] && auth_local_account_saved="TRUE"
auth_service_account_saved=$(defaults read "${SUPER_LOCAL_PLIST}" AuthServiceAccount 2> /dev/null)
[[ "${auth_service_account_saved}" -eq 1 ]] && auth_service_account_saved="TRUE"
auth_jamf_client_saved=$(defaults read "${SUPER_LOCAL_PLIST}" AuthJamfClient 2> /dev/null)
[[ "${auth_jamf_client_saved}" -eq 1 ]] && auth_jamf_client_saved="TRUE"
auth_jamf_account_saved=$(defaults read "${SUPER_LOCAL_PLIST}" AuthJamfAccount 2> /dev/null)
[[ "${auth_jamf_account_saved}" -eq 1 ]] && auth_jamf_account_saved="TRUE"
local auth_legacy_local_account_saved
auth_legacy_local_account_saved=$(defaults read "${SUPER_LOCAL_PLIST}" LocalAccount 2> /dev/null)
local auth_legacy_super_account_saved
auth_legacy_super_account_saved=$(defaults read "${SUPER_LOCAL_PLIST}" SuperAccount 2> /dev/null)
local auth_legacy_jamf_account_saved
auth_legacy_jamf_account_saved=$(defaults read "${SUPER_LOCAL_PLIST}" JamfAccount 2> /dev/null)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_ask_user_to_save_password: ${auth_ask_user_to_save_password}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_user_account_saved: ${auth_user_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_saved: ${auth_local_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_account_saved: ${auth_service_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_saved: ${auth_jamf_client_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_saved: ${auth_jamf_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_legacy_local_account_saved: ${auth_legacy_local_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_legacy_super_account_saved: ${auth_legacy_super_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_legacy_jamf_account_saved: ${auth_legacy_jamf_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_option: ${auth_local_account_option}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_add_via_admin_account_option: ${auth_service_add_via_admin_account_option}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_option: ${auth_jamf_client_option}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_option: ${auth_jamf_account_option}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_delete_all_option: ${auth_delete_all_option}"

# Logging to indicate if there are no saved accounts when a delete is requested.
{ [[ "${auth_ask_user_to_save_password}" == "FALSE" ]] && [[ "${auth_user_account_saved}" == "FALSE" ]] && [[ -z "${auth_local_account_saved}" ]] && [[ -z "${auth_service_account_saved}" ]] && [[ -z "${auth_jamf_client_saved}" ]] && [[ -z "${auth_jamf_account_saved}" ]] && [[ -z "${auth_legacy_local_account_saved}" ]] && [[ -z "${auth_legacy_super_account_saved}" ]] && [[ -z "${auth_legacy_jamf_account_saved}" ]] && [[ -n "${auth_delete_all_option}" ]]; } && log_super "Status: No saved authentication credentials to delete."

# If the user specified any new Apple silicon authentication option or the ${auth_delete_all_option} then delete any previously saved credentials.
if [[ "${auth_user_account_saved}" == "TRUE" ]] && { [[ "${auth_ask_user_to_save_password}" == "FALSE" ]] || [[ -n "${auth_local_account_option}" ]] || [[ -n "${auth_service_add_via_admin_account_option}" ]] || [[ -n "${auth_jamf_client_option}" ]] || [[ -n "${auth_jamf_account_option}" ]] || [[ "${auth_delete_all_option}" == "TRUE" ]]; }; then
	log_super "Status: Deleting saved credentials for the --auth-ask-user-to-save-password option."
	sudo -u "${current_user_account_name}" security delete-generic-password -a "super_auth_user_password" > /dev/null 2>&1
	defaults delete "${SUPER_LOCAL_PLIST}" AuthAskUserToSavePassword > /dev/null 2>&1
	auth_ask_user_to_save_password="FALSE"
	auth_user_account_saved="FALSE"
fi
if [[ "${auth_ask_user_to_save_password}" == "TRUE" ]] || [[ -n "${auth_local_account_option}" ]] || [[ -n "${auth_service_add_via_admin_account_option}" ]] || [[ -n "${auth_jamf_client_option}" ]] || [[ -n "${auth_jamf_account_option}" ]] || [[ "${auth_delete_all_option}" == "TRUE" ]]; then
	if [[ "${auth_local_account_saved}" == "TRUE" ]]; then
		log_super "Status: Deleting saved credentials for the --auth-local-account option."
		security delete-generic-password -a "super_auth_local_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_local_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		defaults delete "${SUPER_LOCAL_PLIST}" AuthLocalAccount > /dev/null 2>&1
		auth_local_account_saved="FALSE"
	fi
	if [[ "${auth_service_account_saved}" == "TRUE" ]]; then
		log_super "Status: Deleting the super service account and saved credentials."
		auth_service_account_keychain=$(security find-generic-password -w -a "super_auth_service_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		sysadminctl -deleteUser "${auth_service_account_keychain}" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_service_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_service_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		defaults delete "${SUPER_LOCAL_PLIST}" AuthServiceAccount > /dev/null 2>&1
		auth_service_account_saved="FALSE"
	fi
	if [[ "${auth_jamf_client_saved}" == "TRUE" ]]; then
		log_super "Status: Deleting saved credentials for the --auth-jamf-client option."
		security delete-generic-password -a "super_auth_jamf_client" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_jamf_secret" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		defaults delete "${SUPER_LOCAL_PLIST}" AuthJamfClient > /dev/null 2>&1
		auth_jamf_client_saved="FALSE"
	fi
	if [[ "${auth_jamf_account_saved}" == "TRUE" ]]; then
		log_super "Status: Deleting saved credentials for the --auth-jamf-account option."
		security delete-generic-password -a "super_auth_jamf_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_jamf_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		defaults delete "${SUPER_LOCAL_PLIST}" AuthJamfAccount > /dev/null 2>&1
		auth_jamf_account_saved="FALSE"
	fi
	if [[ -n "${auth_legacy_local_account_saved}" ]]; then
		sendToLog "Status: Deleting saved credentials for legacy local account."
		defaults delete "${SUPER_LOCAL_PLIST}" LocalAccount > /dev/null 2>&1
		security delete-generic-password -a "${auth_legacy_local_account_saved}" -s "Super Local Account" /Library/Keychains/System.keychain > /dev/null 2>&1
		unset auth_legacy_local_account_saved
	fi
	if [[ -n "${auth_legacy_super_account_saved}" ]]; then
		sendToLog "Status: Deleting local account and saved credentials for legacy super service account."
		sysadminctl -deleteUser "${auth_legacy_super_account_saved}" > /dev/null 2>&1
		defaults delete "${SUPER_LOCAL_PLIST}" SuperAccount > /dev/null 2>&1
		security delete-generic-password -a "${auth_legacy_super_account_saved}" -s "Super Service Account" /Library/Keychains/System.keychain > /dev/null 2>&1
		unset auth_legacy_super_account_saved
	fi
	if [[ -n "${auth_legacy_jamf_account_saved}" ]]; then
		sendToLog "Status: Deleting saved credentials for legacy Jamf Pro API account."
		defaults delete "${SUPER_LOCAL_PLIST}" JamfAccount > /dev/null 2>&1
		security delete-generic-password -a "${auth_legacy_jamf_account_saved}" -s "Super MDM Account" /Library/Keychains/System.keychain > /dev/null 2>&1
		unset auth_legacy_jamf_account_saved
	fi
fi
[[ "${auth_delete_all_option}" == "TRUE" ]] && return 0

# Start migration of any legacy authentication items new keychain storage method.
if [[ -n "${auth_legacy_local_account_saved}" ]]; then
	sendToLog "Status: Migrating saved legacy local account credentials..."
	local auth_legacy_local_password_saved
	auth_legacy_local_password_saved=$(security find-generic-password -w -a "${auth_legacy_local_account_saved}" -s "Super Local Account" /Library/Keychains/System.keychain 2> /dev/null)
	if [[ -n "${auth_legacy_local_password_saved}" ]]; then
		auth_local_account_option="${auth_legacy_local_account_saved}"
		auth_local_password_option="${auth_legacy_local_password_saved}"
		local auth_legacy_local_migrate
		auth_legacy_local_migrate="TRUE"
	else
		log_super "Auth Error: Unable to retrieve legacy local account password."; auth_error_new="TRUE"
	fi
fi
if [[ -n "${auth_legacy_super_account_saved}" ]]; then
	sendToLog "Status: Migrating saved legacy super service account credentials..."
	local auth_legacy_super_password_saved
	auth_legacy_super_password_saved=$(security find-generic-password -w -a "${auth_legacy_super_account_saved}" -s "Super Service Account" /Library/Keychains/System.keychain 2> /dev/null)
	if [[ -n "${auth_legacy_super_password_saved}" ]]; then
		auth_service_account="${auth_legacy_super_account_saved}"
		auth_service_password="${auth_legacy_super_password_saved}"
		local auth_legacy_service_migrate
		auth_legacy_service_migrate="TRUE"
	else
		log_super "Auth Error: Unable to retrieve legacy super service account password."; auth_error_new="TRUE"
	fi
fi
if [[ -n "${auth_legacy_jamf_account_saved}" ]]; then
	sendToLog "Status: Migrating saved legacy Jamf Pro API account credentials..."
	local auth_legacy_jamf_password_saved
	auth_legacy_jamf_password_saved=$(security find-generic-password -w -a "${auth_legacy_jamf_account_saved}" -s "Super MDM Account" /Library/Keychains/System.keychain 2> /dev/null)
	if [[ -n "${auth_legacy_jamf_password_saved}" ]]; then
		auth_jamf_account_option="${auth_legacy_jamf_account_saved}"
		auth_jamf_password_option="${auth_legacy_jamf_password_saved}"
		local auth_legacy_jamf_migrate
		auth_legacy_jamf_migrate="TRUE"
	else
		log_super "Auth Error: Unable to retrieve legacy Jamf Pro API account password."; auth_error_new="TRUE"
	fi
fi

# This validates and saves to the keychain a single (non-end-user) Apple silicon authentication option. If multiple options are specified, only one is saved via the following priority order:
# ${auth_ask_user_to_save_password} > ${auth_local_account_option} > ${auth_service_add_via_admin_account_option} > ${auth_jamf_client_option} > ${auth_jamf_account_option}
if [[ "${auth_ask_user_to_save_password}" -eq 1 ]] || [[ "${auth_ask_user_to_save_password}" == "TRUE" ]]; then
	{ [[ -n "${auth_local_account_option}" ]] || [[ -n "${auth_service_add_via_admin_account_option}" ]] || [[ -n "${auth_jamf_client_option}" ]] || [[ -n "${auth_jamf_account_option}" ]]; } && log_super "Warning: The --auth-ask-user-to-save-password option overrides all other Apple silicon authentication methods."
	[[ -n "${auth_local_account_option}" ]] && log_super "Warning: Ignoring the --auth-local-account option."
	[[ -n "${auth_service_add_via_admin_account_option}" ]] && log_super "Warning: Ignoring the --auth-service-add-via-admin-account option."
	[[ -n "${auth_jamf_client_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-client option."
	[[ -n "${auth_jamf_account_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-account option."
	[[ "${auth_user_account_saved}" == "FALSE" ]] && log_super "Status: A new automatic authentication password will be saved the next time a valid user succesfully authenticates a macOS update/upgrade."
	# The ${auth_ask_user_to_save_password} option is saved later via the dialog_user_auth() function.
elif [[ -n "${auth_local_account_option}" ]]; then
	{ [[ -n "${auth_service_add_via_admin_account_option}" ]] || [[ -n "${auth_jamf_client_option}" ]] || [[ -n "${auth_jamf_account_option}" ]]; } && log_super "Warning: The --auth-local-account option overrides the --auth-service-add-via-admin-account option and any other Apple silicon MDM authentication methods."
	[[ -n "${auth_service_add_via_admin_account_option}" ]] && log_super "Warning: Ignoring the --auth-service-add-via-admin-account option."
	[[ -n "${auth_jamf_client_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-client option."
	[[ -n "${auth_jamf_account_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-account option."
	[[ "${auth_legacy_local_migrate}" != "TRUE" ]] && log_super "Status: Validating new --auth-local-account credentials..."
	[[ "${auth_legacy_local_migrate}" == "TRUE" ]] && log_super "Status: Validating migrated --auth-local-account credentials..."
	
	# Validate that ${auth_local_account_option} exists, is a volume owner, and that ${auth_local_password_option} is correct.
	auth_local_account="${auth_local_account_option}"
	auth_local_password="${auth_local_password_option}"
	check_auth_local_account
	unset auth_local_account
	unset auth_local_password
	[[ "${auth_error_local}" == "TRUE" ]] && auth_error_new="TRUE"
	
	# If the ${auth_local_account_option} and ${auth_local_password_option} are valid then save credentials to keychain and then validate retrieval by setting ${auth_local_account_keychain} and ${auth_local_password_keychain}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		security add-generic-password -a "super_auth_local_account" -s "Super Update Service" -w "$(echo "${auth_local_account_option}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_local_account_keychain=$(security find-generic-password -w -a "super_auth_local_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_local_account_option}" != "${auth_local_account_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for --auth-local-account, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_local_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
		security add-generic-password -a "super_auth_local_password" -s "Super Update Service" -w "$(echo "${auth_local_password_option}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_local_password_keychain=$(security find-generic-password -w -a "super_auth_local_password" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_local_password_option}" != "${auth_local_password_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for --auth-local-password, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_local_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
	fi
	
	# If the saved credentials are valid then update ${SUPER_LOCAL_PLIST}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		[[ "${auth_legacy_local_migrate}" != "TRUE" ]] && log_super "Status: Saved new credentials for the --auth-local-account option."
		[[ "${auth_legacy_local_migrate}" == "TRUE" ]] && log_super "Status: Saved migrated credentials for the --auth-local-account option."
		defaults write "${SUPER_LOCAL_PLIST}" AuthLocalAccount -bool true
		auth_local_account_saved="TRUE"
	else
		[[ "${auth_legacy_local_migrate}" != "TRUE" ]] && log_super "Auth Error: The new --auth-local-account credentials will not be saved due to validation errors."
		[[ "${auth_legacy_local_migrate}" == "TRUE" ]] && log_super "Auth Error: The migrated --auth-local-account and credentials will not be saved due to validation errors."
		auth_local_account_saved="FALSE"
		unset auth_local_account_keychain
		unset auth_local_password_keychain
	fi
elif [[ -n "${auth_service_add_via_admin_account_option}" ]] || [[ "${auth_legacy_service_migrate}" == "TRUE" ]]; then
	{ [[ -n "${auth_jamf_client_option}" ]] || [[ -n "${auth_jamf_account_option}" ]]; } && log_super "Warning: The --auth-service-add-via-admin-account option overrides any other Apple silicon MDM authentication methods."
	[[ -n "${auth_jamf_client_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-client option."
	[[ -n "${auth_jamf_account_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-account option."
	[[ "${auth_legacy_service_migrate}" != "TRUE" ]] && log_super "Status: Creating and validating new super service account..."
	[[ "${auth_legacy_service_migrate}" == "TRUE" ]] && log_super "Status: Validating migratred super service account..."
	
	# Validate that ${auth_service_add_via_admin_account_option} exists, is a volume owner, a local admin, and that ${auth_service_add_via_admin_password_option} is correct.
	if [[ "${auth_legacy_service_migrate}" != "TRUE" ]]; then # If migrating a legacy sevice account, then the ${auth_service_add_via_admin_account_option} doesn't have to be validated.
		if [[ $(groups "${auth_service_add_via_admin_account_option}" 2> /dev/null | grep -c 'admin') -eq 0 ]]; then
			log_super "Auth Error: The account \"${auth_service_add_via_admin_account_option}\" is not a local administrator."; auth_error_new="TRUE"
		fi
		if [[ "${auth_error_new}" != "TRUE" ]]; then
			auth_local_account="${auth_service_add_via_admin_account_option}"
			auth_local_password="${auth_service_add_via_admin_password_option}"
			check_auth_local_account
			unset auth_local_account
			unset auth_local_password
			[[ "${auth_error_local}" == "TRUE" ]] && auth_error_new="TRUE"
		fi
	fi
	
	# Set the ${auth_service_account}, ${auth_service_real_name}, and ${auth_service_password} in preparation to create the super service account.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		if [[ "${auth_legacy_service_migrate}" != "TRUE" ]]; then # If migrating a legacy sevice account, then a new service account doesn't have to be created.
			local auth_service_account
			local auth_service_real_name
			if [[ -n "${auth_service_account_option}" ]]; then
				auth_service_account="${auth_service_account_option}"
				auth_service_real_name="${auth_service_account_option}"
			else
				auth_service_account="super"
				auth_service_real_name="Super Update Service"
			fi
	
			local auth_service_password
			if [[ -n "${auth_service_password_option}" ]]; then
				auth_service_password="${auth_service_password_option}"
			else
				auth_service_password=$(uuidgen)
			fi
		fi
	
		# Save ${auth_service_account} and ${auth_service_password} credentials to keychain and then validate retrieval by setting ${auth_service_account_keychain} and ${auth_service_password_keychain}.
		security add-generic-password -a "super_auth_service_account" -s "Super Update Service" -w "$(echo "${auth_service_account}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_service_account_keychain=$(security find-generic-password -w -a "super_auth_service_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_service_account}" != "${auth_service_account_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for the super service account, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_service_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
		security add-generic-password -a "super_auth_service_password" -s "Super Update Service" -w "$(echo "${auth_service_password}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_service_password_keychain=$(security find-generic-password -w -a "super_auth_service_password" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_service_password}" != "${auth_service_password_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for the super service password, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_service_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
	fi
	
	# If the saved credentials are valid then create the new super service account.
	if [[ "${auth_error_new}" != "TRUE" ]] && [[ "${auth_legacy_service_migrate}" != "TRUE" ]]; then # If migrating a legacy sevice account, then a new service account doesn't have to be created.
		local auth_service_uid
		auth_service_uid=501
		while [[ $(id "${auth_service_uid}" 2>&1 | grep -c 'no such user') -eq 0 ]]; do
			auth_service_uid=$((auth_service_uid + 1))
		done
		local sysadminctl_response
		sysadminctl_response=$(sysadminctl -addUser "${auth_service_account}" -fullName "${auth_service_real_name}" -password "${auth_service_password}" -UID "${auth_service_uid}" -GID 20 -shell "/dev/null" -home "/dev/null" -picture "${DISPLAY_ICON_FILE_CACHE}" -adminUser "${auth_service_add_via_admin_account_option}" -adminPassword "${auth_service_add_via_admin_password_option}" 2>&1)
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: sysadminctl_response is:\n${sysadminctl_response}"
		dscl . create /Users/"${auth_service_account}" IsHidden 1
	fi
	
	# Validate the super service account locally.
	auth_local_account="${auth_service_account}"
	auth_local_password="${auth_service_password}"
	check_auth_local_account
	unset auth_local_account
	unset auth_local_password
	[[ "${auth_error_local}" == "TRUE" ]] && auth_error_new="TRUE"
		
	# If the super service account is valid then update ${SUPER_LOCAL_PLIST}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		[[ "${auth_legacy_service_migrate}" != "TRUE" ]] && log_super "Status: Created new super serivce account."
		[[ "${auth_legacy_service_migrate}" == "TRUE" ]] && log_super "Status: Validated migrated super serivce account."
		defaults write "${SUPER_LOCAL_PLIST}" AuthServiceAccount -bool true
		auth_service_account_saved="TRUE"
	else
		[[ "${auth_legacy_service_migrate}" != "TRUE" ]] && log_super "Auth Error: Unable to validate newly created super service account, deleting account"; auth_error_new="TRUE"
		[[ "${auth_legacy_service_migrate}" == "TRUE" ]] && log_super "Auth Error: Unable to validate migrated super service account, deleting account."; auth_error_new="TRUE"
		sysadminctl -deleteUser "${auth_service_account}" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_service_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		security delete-generic-password -a "super_auth_service_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_service_account_saved="FALSE"
		unset auth_service_account_keychain
		unset auth_service_password_keychain
	fi
elif [[ -n "${auth_jamf_client_option}" ]]; then
	[[ -n "${auth_jamf_account_option}" ]] && log_super "Warning: The --auth-jamf-client option overrides the --auth-jamf-account option."
	[[ -n "${auth_jamf_account_option}" ]] && log_super "Warning: Ignoring the --auth-jamf-account option."
	log_super "Status: Validating new --auth-jamf-client credentials..."
	
	# Validate that the client ${auth_jamf_client_option} and ${auth_jamf_secret_option} are valid.
	auth_jamf_client="${auth_jamf_client_option}"
	auth_jamf_secret="${auth_jamf_secret_option}"
	check_jamf_api_credentials
	delete_jamf_api_access_token
	unset auth_jamf_client
	unset auth_jamf_secret
	[[ "${auth_error_jamf}" == "TRUE" ]] && auth_error_new="TRUE"
	
	# If the ${auth_jamf_client_option} and ${auth_jamf_secret_option} are valid then save credentials to keychain and then validate retrieval by setting ${auth_jamf_client_keychain} and ${auth_jamf_secret_keychain}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		security add-generic-password -a "super_auth_jamf_client" -s "Super Update Service" -w "$(echo "${auth_jamf_client_option}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_jamf_client_keychain=$(security find-generic-password -w -a "super_auth_jamf_client" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_jamf_client_option}" != "${auth_jamf_client_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for --auth-jamf-client, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_jamf_client" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
		security add-generic-password -a "super_auth_jamf_secret" -s "Super Update Service" -w "$(echo "${auth_jamf_secret_option}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_jamf_secret_keychain=$(security find-generic-password -w -a "super_auth_jamf_secret" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_jamf_secret_option}" != "${auth_jamf_secret_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for --auth-jamf-secret, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_jamf_secret" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
	fi
	
	# If the saved credentials are valid then update ${SUPER_LOCAL_PLIST}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		log_super "Status: Saved new credentials for the --auth-jamf-client option."
		defaults write "${SUPER_LOCAL_PLIST}" AuthJamfClient -bool true
		auth_jamf_client_saved="TRUE"
	else
		log_super "Auth Error: The --auth-jamf-client credentials will not be saved due to validation errors."
		auth_jamf_client_saved="FALSE"
		unset auth_jamf_client_keychain
		unset auth_jamf_secret_keychain
	fi
elif [[ -n "${auth_jamf_account_option}" ]]; then
	[[ "${auth_legacy_jamf_migrate}" != "TRUE" ]] && log_super "Status: Validating new --auth-jamf-account credentials..."
	[[ "${auth_legacy_jamf_migrate}" == "TRUE" ]] && log_super "Status: Validating migrated --auth-jamf-account credentials..."
	
	# Validate that the account ${auth_jamf_account_option} and ${auth_jamf_password_option} are valid.
	auth_jamf_account="${auth_jamf_account_option}"
	auth_jamf_password="${auth_jamf_password_option}"
	check_jamf_api_credentials
	delete_jamf_api_access_token
	unset auth_jamf_account
	unset auth_jamf_password
	[[ "${auth_error_jamf}" == "TRUE" ]] && auth_error_new="TRUE"
	
	# If the ${super_auth_jamf_account} and ${super_auth_jamf_password} are valid then save credentials to keychain and then validate retrieval by setting ${auth_jamf_account_keychain} and ${auth_jamf_password_keychain}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		security add-generic-password -a "super_auth_jamf_account" -s "Super Update Service" -w "$(echo "${auth_jamf_account_option}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_jamf_account_keychain=$(security find-generic-password -w -a "super_auth_jamf_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_jamf_account_option}" != "${auth_jamf_account_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for --auth-jamf-account, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_jamf_account" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
		security add-generic-password -a "super_auth_jamf_password" -s "Super Update Service" -w "$(echo "${auth_jamf_password_option}" | base64)" -T "/usr/bin/security" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		auth_jamf_password_keychain=$(security find-generic-password -w -a "super_auth_jamf_password" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
		if [[ "${auth_jamf_password_option}" != "${auth_jamf_password_keychain}" ]]; then
			log_super "Auth Error: Unable to validate keychain item for --auth-jamf-password, deleting keychain item."; auth_error_new="TRUE"
			security delete-generic-password -a "super_auth_jamf_password" "/Library/Keychains/System.keychain" > /dev/null 2>&1
		fi
	fi
	
	# If the saved credentials are valid then update ${SUPER_LOCAL_PLIST}.
	if [[ "${auth_error_new}" != "TRUE" ]]; then
		[[ "${auth_legacy_jamf_migrate}" != "TRUE" ]] && log_super "Status: Saved new credentials for the --auth-jamf-account option."
		[[ "${auth_legacy_jamf_migrate}" == "TRUE" ]] && log_super "Status: Saved migrated credentials for the --auth-jamf-account option."
		defaults write "${SUPER_LOCAL_PLIST}" AuthJamfAccount -bool true
		auth_jamf_account_saved="TRUE"
	else
		[[ "${auth_legacy_jamf_migrate}" != "TRUE" ]] && log_super "Auth Error: The new --auth-jamf-account credentials will not be saved due to validation errors."
		[[ "${auth_legacy_jamf_migrate}" == "TRUE" ]] && log_super "Auth Error: The migrated --auth-jamf-account credentials will not be saved due to validation errors."
		auth_jamf_account_saved="FALSE"
		unset auth_jamf_account_keychain
		unset auth_jamf_password_keychain
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_user_account_saved: ${auth_user_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_user_password_keychain: ${auth_user_password_keychain}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_saved: ${auth_local_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_account_saved: ${auth_service_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_saved: ${auth_jamf_client_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_saved: ${auth_jamf_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_error_new: ${auth_error_new}"

# Delete any migrated legacy credentials.
if [[ "${auth_error_new}" == "FALSE" ]]; then
	if [[ "${auth_legacy_local_migrate}" == "TRUE" ]]; then
		sendToLog "Status: Deleting saved credentials for legacy local account."
		defaults delete "${SUPER_LOCAL_PLIST}" LocalAccount > /dev/null 2>&1
		security delete-generic-password -a "${auth_legacy_local_account_saved}" -s "Super Local Account" /Library/Keychains/System.keychain > /dev/null 2>&1
	fi
	if [[ "${auth_legacy_service_migrate}" == "TRUE" ]]; then
		sendToLog "Status: Deleting saved credentials for legacy super service account."
		defaults delete "${SUPER_LOCAL_PLIST}" SuperAccount > /dev/null 2>&1
		security delete-generic-password -a "${auth_legacy_super_account_saved}" -s "Super Service Account" /Library/Keychains/System.keychain > /dev/null 2>&1
	fi
	if [[ "${auth_legacy_jamf_migrate}" == "TRUE" ]]; then
		sendToLog "Status: Deleting saved credentials for legacy Jamf Pro API account."
		defaults delete "${SUPER_LOCAL_PLIST}" JamfAccount > /dev/null 2>&1
		security delete-generic-password -a "${auth_legacy_jamf_account_saved}" -s "Super MDM Account" /Library/Keychains/System.keychain > /dev/null 2>&1
	fi
fi
}

# This function determines what ${workflow_auth_macos} workflows are possible given the architecture and authentication options during startup.
manage_workflow_options() {
auth_error_user="FALSE"
workflow_error="FALSE"

# If the ${workflow_disable_update_check_option} is enabled then there is no reason to continue this function.
[[ "${workflow_disable_update_check_option}" == "TRUE" ]] && return 0

# Logic to determine update/upgrade workflow authentication method, assuming no ${auth_error_new}.
if [[ "${auth_error_new}" != "TRUE" ]]; then
	if [[ "${mac_cpu_architecture}" == "i386" ]] || [[ "${workflow_only_download_option}" == "TRUE" ]]; then # Intel and the only download alternate workflow do not need authentication.
		[[ "${workflow_only_download_option}" != "TRUE" ]] && log_super "Status: macOS update/upgrade workflows automatically authenticated via system account (root)."
		workflow_auth_macos="LOCAL"
	else # Standard workflow and computers with Apple silicon.
		if [[ "${auth_user_account_saved}" == "TRUE" ]] || [[ "${auth_local_account_saved}" == "TRUE" ]] || [[ "${auth_service_account_saved}" == "TRUE" ]]; then
			[[ "${auth_user_account_saved}" == "TRUE" ]] && log_super "Status: macOS update/upgrade workflows automatically authenticated via saved password for current user: ${current_user_account_name}"
			[[ "${auth_local_account_saved}" == "TRUE" ]] && log_super "Status: macOS update/upgrade workflows automatically authenticated via saved local account."
			[[ "${auth_service_account_saved}" == "TRUE" ]] && log_super "Status: macOS update/upgrade workflows automatically authenticated via super service account."
			workflow_auth_macos="LOCAL"
		elif [[ "${auth_jamf_client_saved}" == "TRUE" ]] || [[ "${auth_jamf_account_saved}" == "TRUE" ]]; then
			if [[ "${macos_version_number}" -ge 1103 ]]; then
				[[ -n "${auth_mdm_failover_to_user_option}" ]] && log_super "Status: macOS update/upgrade workflows automatically authenticated via Jamf Pro API with --auth-mdm-failover-to-user=${auth_mdm_failover_to_user_option}."
				[[ -z "${auth_mdm_failover_to_user_option}" ]] && log_super "Status: macOS update/upgrade workflows automatically authenticated via Jamf Pro API with no --auth-mdm-failover-to-user options."
				workflow_auth_macos="JAMF"
			else # Systems older than macOS 11.3.
				log_super "Warning: Automatic macOS update/upgrade enforcement via MDM is only available on macOS 11.3 or newer."
				log_super "Status: Manual user authentication is required to perform a macOS update/upgrade."
				if [[ "${current_user_account_name}" != "FALSE" ]] && [[ "${current_user_has_secure_token}" == "TRUE" ]] && [[ "${current_user_is_volume_owner}" == "TRUE" ]]; then
					workflow_auth_macos="USER"
				else # No valid current user to authenticate workflow.
					auth_error_user="TRUE"
				fi
			fi
		else # No Apple silicon authentication options were provided.
			log_super "Warning: Automatic macOS update/upgrade enforcement on Apple Silicon computers requires saved authentication credentials."
			log_super "Status: Manual user authentication is required to perform a macOS update/upgrade."
			if [[ "${current_user_account_name}" != "FALSE" ]] && [[ "${current_user_has_secure_token}" == "TRUE" ]] && [[ "${current_user_is_volume_owner}" == "TRUE" ]]; then
				workflow_auth_macos="USER"
			else # No valid current user to authenticate workflow.
				auth_error_user="TRUE"
			fi
		fi
	fi
else # Authentication validation errors.
	if [[ "${auth_credential_failover_to_user_option}" == "TRUE" ]]; then
		if [[ "${current_user_account_name}" != "FALSE" ]] && [[ "${current_user_has_secure_token}" == "TRUE" ]] && [[ "${current_user_is_volume_owner}" == "TRUE" ]]; then
			[[ "${auth_error_new}" == "TRUE" ]] && log_super "Warning: Apple silicon authentication options could not be validated, failing over to manual user authenticated workflow."
			workflow_auth_macos="FAILOVER"
		else # No valid current user to authenticate workflow.
			if [[ "${auth_error_new}" == "TRUE" ]]; then
				log_super "Auth Error: Apple silicon authentication options could not be validated and manual user authentication failover is not currently possible, workflow can not continue."
				auth_error_user="TRUE"
			fi
		fi
	elif { [[ "${auth_jamf_client_saved}" -eq 1 ]] || [[ "${auth_jamf_account_saved}" -eq 1 ]]; } && { [[ "${auth_mdm_failover_always}" == "TRUE" ]] || [[ "${auth_mdm_failover_no_service}" == "TRUE" ]] || { [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${auth_mdm_failover_install_now}" == "TRUE" ]]; }; }; then
		if [[ "${current_user_account_name}" != "FALSE" ]] && [[ "${current_user_has_secure_token}" == "TRUE" ]] && [[ "${current_user_is_volume_owner}" == "TRUE" ]]; then
			log_super "Warning: Previously saved Apple silicon MDM credentials could not be validated, failing over to manual user authenticated workflow."
			workflow_auth_macos="FAILOVER"
		else # No valid current user to authenticate workflow.
			deferral_timer_minutes="${deferral_timer_error_minutes}"
			log_super "Auth Error: Previously saved Apple silicon MDM credentials could not be validated and manual user authentication failover is not currently possible, trying again in ${deferral_timer_minutes} minutes."
			log_status "Pending: Auth Error: Previously saved Apple silicon MDM credentials could not be validated and manual user authentication failover is not currently possible, trying again in ${deferral_timer_minutes} minutes."
			set_auto_launch_deferral
		fi
	else # No authentication failover options.
		if [[ "${auth_error_new}" == "TRUE" ]]; then
			log_super "Auth Error: Apple silicon authentication options could not be validated and no failover option was specified, workflow can not continue."
			log_status "Inactive Error: Apple silicon authentication option could not be validated and no failover option was specified, workflow can not continue."
			workflow_error="TRUE"
		fi
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_error_user is: ${auth_error_user}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_auth_macos is: ${workflow_auth_macos}"

# Handle the ${auth_error_user} condition, which at this point is a workflow-stopper.
if [[ "${auth_error_user}" == "TRUE" ]]; then
	[[ "${current_user_account_name}" == "FALSE" ]] && log_super "Auth Error: No current user to provide local authentication, workflow can not continue."
	[[ "${current_user_has_secure_token}" == "FALSE" ]] && log_super "Auth Error: The current user \"${current_user_account_name}\" does not have a secure token, workflow can not continue."
	[[ "${current_user_is_volume_owner}" == "TRUE" ]] && log_super "Auth Error: The current user \"${current_user_account_name}\" is not a system volume owner, workflow can not continue."
	workflow_error="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_error is: ${workflow_error}"
}

# For Apple Silicon computers this function validates previously saved update/upgrade credentials given the various --auth_* options. Any error will set ${auth_error_saved}.
get_saved_authentication () {
auth_error_saved="FALSE"
auth_user_saved_password_valid="FALSE"
auth_local_account_valid="FALSE"
auth_service_account_valid="FALSE"
auth_jamf_client_valid="FALSE"
auth_jamf_account_valid="FALSE"

# If there is a previously saved user account then validate the credentials and set ${auth_local_account} and ${auth_local_password}.
if [[ "${auth_ask_user_to_save_password}" -eq 1 ]] || [[ "${auth_ask_user_to_save_password}" == "TRUE" ]]; then
	[[ -z "${auth_user_password_keychain}" ]] && auth_user_password_keychain=$(sudo -u "${current_user_account_name}" security find-generic-password -w -a "super_auth_user_password" 2>&1)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_user_password_keychain: ${auth_user_password_keychain}"
	if [[ $(echo "${auth_user_password_keychain}" | grep -c 'The specified item could not be found in the keychain.') -eq 0 ]]; then
		auth_local_account="${current_user_account_name}"
		auth_local_password="${auth_user_password_keychain}"
		check_auth_local_account
		if [[ "${auth_error_local}" != "TRUE" ]]; then
			log_super "Status: Validated saved credentials for the current user: ${current_user_account_name}"
			auth_user_saved_password_valid="TRUE"
		else
			log_super "Warning: Unable to validate previously saved credentials for the current user: ${current_user_account_name}"
			unset auth_local_account
			unset auth_local_password
			sudo -u "${current_user_account_name}" security delete-generic-password -a "super_auth_user_password" > /dev/null 2>&1
			log_super "Status: A new automatic authentication password will be saved the next time a valid user succesfully authenticates a macOS update/upgrade."
			auth_error_saved="TRUE"
			auth_user_account_saved="FALSE"
		fi
	else
		log_super "Status: The --auth-ask-user-to-save-password option is enabled but a user password is not currently saved."
		log_super "Status: A new automatic authentication password will be saved the next time a valid user succesfully authenticates a macOS update/upgrade."
		auth_error_saved="TRUE"
		auth_user_account_saved="FALSE"
	fi
	unset auth_user_password_keychain
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_ask_user_to_save_password: ${auth_ask_user_to_save_password}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_user_saved_password_valid: ${auth_user_saved_password_valid}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_user_account_saved: ${auth_user_account_saved}"

# If there is a previously saved local account then validate the credentials and set ${auth_local_account} and ${auth_local_password}.
if [[ "${auth_local_account_saved}" -eq 1 ]] || [[ "${auth_local_account_saved}" == "TRUE" ]]; then
	[[ -z "${auth_local_account_keychain}" ]] && auth_local_account_keychain=$(security find-generic-password -w -a "super_auth_local_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ -z "${auth_local_password_keychain}" ]] && auth_local_password_keychain=$(security find-generic-password -w -a "super_auth_local_password" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_keychain: ${auth_local_account_keychain}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_password_keychain: ${auth_local_password_keychain}"
	if [[ -n "${auth_local_account_keychain}" ]] && [[ -n "${auth_local_password_keychain}" ]]; then
		auth_local_account="${auth_local_account_keychain}"
		auth_local_password="${auth_local_password_keychain}"
		check_auth_local_account
		if [[ "${auth_error_local}" != "TRUE" ]]; then
			log_super "Status: Validated saved credentials for the --auth-local-account option."
			auth_local_account_valid="TRUE"
		else
			log_super "Auth Error: Unable to validate the saved --auth-local-account credentials."; auth_error_saved="TRUE"
			unset auth_local_account
			unset auth_local_password
		fi
	else
		log_super "Auth Error: Unable to retrieve keychain items for the saved --auth-local-account credentials."; auth_error_saved="TRUE"
	fi
	unset auth_local_account_keychain
	unset auth_local_password_keychain
else
	auth_local_account_saved="FALSE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_saved: ${auth_local_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account_valid: ${auth_local_account_valid}"

# If there is a previously saved super service account then validate the credentials and set ${auth_local_account} and ${auth_local_password}.
if [[ "${auth_service_account_saved}" -eq 1 ]] || [[ "${auth_service_account_saved}" == "TRUE" ]]; then
	[[ -z "${auth_service_account_keychain}" ]] && auth_service_account_keychain=$(security find-generic-password -w -a "super_auth_service_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ -z "${auth_service_password_keychain}" ]] && auth_service_password_keychain=$(security find-generic-password -w -a "super_auth_service_password" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_account_keychain: ${auth_service_account_keychain}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_password_keychain: ${auth_service_password_keychain}"
	if [[ -n "${auth_service_account_keychain}" ]] && [[ -n "${auth_service_password_keychain}" ]]; then
		auth_local_account="${auth_service_account_keychain}"
		auth_local_password="${auth_service_password_keychain}"
		check_auth_local_account
		if [[ "${auth_error_local}" != "TRUE" ]]; then
			log_super "Status: Validated saved credentials for the super service account."
			auth_service_account_valid="TRUE"
		else
			log_super "Auth Error: Unable to validate the saved super service account credentials."; auth_error_saved="TRUE"
			unset auth_local_account
			unset auth_local_password
		fi
	else
		log_super "Auth Error: Unable to retrieve keychain items for the saved super service account credentials."; auth_error_saved="TRUE"
	fi
	unset auth_service_account_keychain
	unset auth_service_password_keychain
else
	auth_service_account_saved="FALSE"
fi

[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_account_saved: ${auth_service_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_service_account_valid: ${auth_service_account_valid}"

# If there is a previously saved Jamf Pro API client then validate the credentials and set ${auth_jamf_client} and ${auth_jamf_secret}.
if [[ "${auth_jamf_client_saved}" -eq 1 ]] || [[ "${auth_jamf_client_saved}" == "TRUE" ]]; then
	[[ -z "${auth_jamf_client_keychain}" ]] && auth_jamf_client_keychain=$(security find-generic-password -w -a "super_auth_jamf_client" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ -z "${auth_jamf_secret_keychain}" ]] && auth_jamf_secret_keychain=$(security find-generic-password -w -a "super_auth_jamf_secret" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_keychain: ${auth_jamf_client_keychain}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_secret_keychain: ${auth_jamf_secret_keychain}"
	if [[ -n "${auth_jamf_client_keychain}" ]] && [[ -n "${auth_jamf_secret_keychain}" ]]; then
		auth_jamf_client="${auth_jamf_client_keychain}"
		auth_jamf_secret="${auth_jamf_secret_keychain}"
		check_jamf_api_credentials
		if [[ "${auth_error_jamf}" != "TRUE" ]]; then
			log_super "Status: Validated saved credentials for the --auth-jamf-client option."
			auth_jamf_client_valid="TRUE"
		else
			log_super "Auth Error: Unable to validate the saved --auth-jamf-client credentials."; auth_error_saved="TRUE"
			unset auth_jamf_client
			unset auth_jamf_secret
		fi
	else
		log_super "Auth Error: Unable to retrieve keychain items for the saved --auth-jamf-client credentials."; auth_error_saved="TRUE"
	fi
	unset auth_jamf_client_keychain
	unset auth_jamf_secret_keychain
else
	auth_jamf_client_saved="FALSE"
fi

[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_saved: ${auth_jamf_client_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client_valid: ${auth_jamf_client_valid}"

# If there is a previously saved Jamf Pro API account then validate the credentials and set ${auth_jamf_account} and ${auth_jamf_password}.
if [[ "${auth_jamf_account_saved}" -eq 1 ]] || [[ "${auth_jamf_account_saved}" == "TRUE" ]]; then
	[[ -z "${auth_jamf_account_keychain}" ]] && auth_jamf_account_keychain=$(security find-generic-password -w -a "super_auth_jamf_account" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ -z "${auth_jamf_password_keychain}" ]] && auth_jamf_password_keychain=$(security find-generic-password -w -a "super_auth_jamf_password" "/Library/Keychains/System.keychain" 2> /dev/null | base64 --decode)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_keychain: ${auth_jamf_account_keychain}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_password_keychain: ${auth_jamf_password_keychain}"
	if [[ -n "${auth_jamf_account_keychain}" ]] && [[ -n "${auth_jamf_password_keychain}" ]]; then
		auth_jamf_account="${auth_jamf_account_keychain}"
		auth_jamf_password="${auth_jamf_password_keychain}"
		check_jamf_api_credentials
		if [[ "${auth_error_jamf}" != "TRUE" ]]; then
			log_super "Status: Validated saved credentials for the --auth-jamf-account option."
			auth_jamf_account_valid="TRUE"
		else
			log_super "Auth Error: Unable to validate the saved --auth-jamf-account credentials."; auth_error_saved="TRUE"
			unset auth_jamf_account
			unset auth_jamf_password
		fi
	else
		log_super "Auth Error: Unable to retrieve keychain items for the saved --auth-jamf-account credentials."; auth_error_saved="TRUE"
	fi
	unset auth_jamf_account_keychain
	unset auth_jamf_password_keychain
else
	auth_jamf_account_saved="FALSE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_saved: ${auth_jamf_account_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account_valid: ${auth_jamf_account_valid}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_error_saved: ${auth_error_saved}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account: ${auth_local_account}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_password: ${auth_local_password}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_client: ${auth_jamf_client}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_secret: ${auth_jamf_secret}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_account: ${auth_jamf_account}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_jamf_password: ${auth_jamf_password}"
}

# MARK: *** Installation & Startup ***
################################################################################

# Install items required for super.
workflow_installation() {
[[ ! -d "${SUPER_FOLDER}" ]] && mkdir -p "${SUPER_FOLDER}"
[[ ! -d "${SUPER_LOG_FOLDER}" ]] && mkdir -p "${SUPER_LOG_FOLDER}"
log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - SUPER INSTALLATION WORKFLOW ****"
log_status "Running: Installation workflow."

log_super "Installation: Copying super to: ${SUPER_FOLDER}/super"
cp "$0" "${SUPER_FOLDER}/super" > /dev/null 2>&1
if [[ ! -d "/usr/local/bin" ]]; then
	log_super "Installation: Creating local search path folder: /usr/local/bin"
	mkdir -p "/usr/local/bin"
	chmod -R a+rx "/usr/local/bin"
fi

log_super "Installation: Creating super search path link: ${SUPER_LINK}"
ln -s "${SUPER_FOLDER}/super" "${SUPER_LINK}" > /dev/null 2>&1

log_super "Installation: Creating super LaunchDaemon helper: ${SUPER_FOLDER}/super-starter"
/bin/cat <<EOSS > "${SUPER_FOLDER}/super-starter"
#!/bin/bash
# Exit if super is already running.
[[ "\$(pgrep -F "${SUPER_PID_FILE}" 2> /dev/null)" ]] && exit 0

# Exit if the super auto launch workflow is disabled, or deferred until a system restart, or deferred until a later date.
next_auto_launch=\$(defaults read "${SUPER_LOCAL_PLIST}" NextAutoLaunch 2> /dev/null)
if [[ "\${next_auto_launch}" == "FALSE" ]]; then # Exit if auto launch is disabled.
	exit 0
elif [[ -z "\${next_auto_launch}" ]] && [[ -f "${WORKFLOW_RESTART_VALIDATE_FILE}" ]]; then # Exit if deferred until a system restart.
	mac_last_startup_saved_epoch=\$(date -j -f "%Y-%m-%d:%H:%M:%S" "\$(defaults read "${SUPER_LOCAL_PLIST}" MacLastStartup 2> /dev/null)" +"%s" 2> /dev/null)
	mac_last_startup_epoch=\$(date -j -f "%b %d %H:%M:%S" "\$(last reboot | head -1 | cut -c 41- | xargs):00" +"%s" 2> /dev/null)
	[[ -n "\${mac_last_startup_saved_epoch}" ]] && [[ -n "\${mac_last_startup_epoch}" ]] && [[ "\${mac_last_startup_saved_epoch}" -ge "\${mac_last_startup_epoch}" ]] && exit 0
elif [[ \$(date +%s) -lt \$(date -j -f "%Y-%m-%d:%H:%M:%S" "\${next_auto_launch}" +"%s" 2> /dev/null) ]]; then # Exit if deferred until a later date.
	exit 0
fi

# If super-starter has not exited yet, then it's time to start super.
echo "\$(date +"%a %b %d %T") \$(hostname -s) \$(basename "\$0")[\$\$]: **** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - LAUNCHDAEMON ****" | tee -a "${SUPER_LOG}"
"${SUPER_FOLDER}/super" &
disown -a
exit 0
EOSS

touch "${ASU_LIST_LOG}" "${INSTALLER_LIST_LOG}" "${ASU_WORKFLOW_LOG}" "${INSTALLER_WORKFLOW_LOG}" "${MDM_COMMAND_LOG}" "${MDM_WORKFLOW_LOG}"

if [[ -f "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" ]]; then
	log_super "Installation: Removing previous super LaunchDaemon: /Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"
	launchctl bootout system "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" 2> /dev/null
	rm -f "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist" 2> /dev/null
fi

log_super "Installation: Creating super LaunchDaemon: /Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist."
/bin/cat <<EOLDL > "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>${SUPER_LAUNCH_DAEMON_LABEL}</string>
	<key>ProgramArguments</key>
	<array>
		<string>${SUPER_FOLDER}/super-starter</string>
	</array>
	<key>UserName</key>
	<string>root</string>
	<key>AbandonProcessGroup</key>
	<true/>
	<key>RunAtLoad</key>
	<true/>
	<key>StartInterval</key>
	<integer>60</integer>
</dict>
</plist>
EOLDL

log_super "Installation: Setting permissions for installed super items."
chown -R root:wheel "${SUPER_FOLDER}"
chmod -R a+r "${SUPER_FOLDER}"
chmod -R go-w "${SUPER_FOLDER}"
chmod a+x "${SUPER_FOLDER}/super"
chmod a+x "${SUPER_FOLDER}/super-starter"
chown root:wheel "${SUPER_LINK}"
chmod a+rx "${SUPER_LINK}"
chmod go-w "${SUPER_LINK}"
chmod 644 "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"
chown root:wheel "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"
defaults write "${SUPER_LOCAL_PLIST}" SuperVersion -string "${SUPER_VERSION}"
}

# Download and install the IBM Notifier.app.
get_ibm_notifier() {
log_super "Status: Attempting to download and install IBM Notifier.app..."
local previous_umask
previous_umask=$(umask)
umask 077
local temp_file
temp_file="$(mktemp).zip"
local download_response
download_response=$(curl --location "${IBM_NOTIFIER_DOWNLOAD_URL}" --output "${temp_file}" 2>&1)
if [[ -f "${temp_file}" ]]; then
	local unzip_response
	unzip_response=$(unzip "${temp_file}" -d "${SUPER_FOLDER}/" 2>&1)
	if [[ -d "${IBM_NOTIFIER_APP}" ]]; then
		[[ -d "${SUPER_FOLDER}/__MACOSX" ]] && rm -Rf "${SUPER_FOLDER}/__MACOSX" > /dev/null 2>&1
		chmod -R a+rx "${IBM_NOTIFIER_APP}"
	else
		log_super "Error: Unable to install IBM Notifier.app."
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: unzip_response is:\n${unzip_response}"
	fi
else
	log_super "Error: Unable to download IBM Notifier.app from: ${IBM_NOTIFIER_DOWNLOAD_URL}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_response is:\n${download_response}"
fi
rm -Rf "${temp_file}" > /dev/null 2>&1
umask "${previous_umask}"
}

# Check the IBM Notifier.app for validity.
check_ibm_notifier() {
ibm_notifier_valid="FALSE"
local codesign_response
codesign_response=$(codesign --verify --verbose "${IBM_NOTIFIER_APP}" 2>&1)
if [[ $(echo "${codesign_response}" | grep -c 'valid on disk') -gt 0 ]]; then
	local version_result
	version_result=$(defaults read "${IBM_NOTIFIER_APP}/Contents/Info.plist" CFBundleShortVersionString)
	if [[ "${IBM_NOTIFIER_TARGET_VERSION}" == "${version_result}" ]]; then
		ibm_notifier_valid="TRUE"
	else
		log_super "Warning: IBM Notifier at path: ${IBM_NOTIFIER_APP} is version ${version_result}, this does not match target version ${IBM_NOTIFIER_TARGET_VERSION}."
	fi
else
	log_super "Warning: unable validate signature for IBM Notifier at path: ${IBM_NOTIFIER_APP}."
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: codesign_response is:\n${codesign_response}"
fi
}

# Download and install mist-cli.
get_mist_cli() {
log_super "Status: Attempting to download and install mist-cli..."
local previous_umask
previous_umask=$(umask)
umask 077
local temp_file
temp_file="$(mktemp).pkg"
local download_response
download_response=$(curl --location "${MIST_CLI_DOWNLOAD_URL}" --output "${temp_file}" 2>&1)
if [[ -f "${temp_file}" ]]; then
	local install_response
	install_response=$(installer -verboseR -pkg "${temp_file}" -target / 2>&1)
	if ! { [[ $(echo "${install_response}" | grep -c 'The software was successfully installed.') -gt 0 ]] || [[ $(echo "${install_response}" | grep -c 'The install was successful.') -gt 0 ]]; }; then
		log_super "Error: Unable to install mist-cli."
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_response is:\n${install_response}"
	fi
else
	log_super "Error: Unable to download mist-cli.pkg from: ${MIST_CLI_DOWNLOAD_URL}."
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_response is:\n${download_response}"
fi
rm -Rf "${temp_file}" > /dev/null 2>&1
umask "${previous_umask}"
}

# Check mist-cli for validity.
check_mist_cli() {
mist_cli_valid="FALSE"
local codesign_response
codesign_response=$(codesign --verify --verbose "${MIST_CLI_BINARY}" 2>&1)
if [[ $(echo "${codesign_response}" | grep -c 'valid on disk') -gt 0 ]]; then
	local version_result
	version_result=$("${MIST_CLI_BINARY}" --version | head -1 | awk '{print $1;}')
	if [[ "${MIST_CLI_TARGET_VERSION}" == "${version_result}" ]]; then
		mist_cli_valid="TRUE"
	else
		log_super "Warning: mist-cli at path: ${MIST_CLI_BINARY} is version ${version_result}, this does not match target version ${MIST_CLI_TARGET_VERSION}."
	fi
else
	log_super "Warning: unable validate signature for mist-cli at path: ${MIST_CLI_BINARY}."
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: codesign_response is:\n${codesign_response}"
fi
}

# Install and validate helper items that may be used by super.
manage_helpers() {
helper_error="FALSE"
# Validate the IBM Notifier.app, if missing or invalid then install and check again.
if [[ ! -d "${IBM_NOTIFIER_APP}" ]]; then
	get_ibm_notifier
	[[ -d "${IBM_NOTIFIER_APP}" ]] && check_ibm_notifier
	[[ "${ibm_notifier_valid}" == "FALSE" ]] && log_super "Error: Unable to validate IBM Notifier.app after installation."
else # IBM Notifier.app is already installed.
	check_ibm_notifier
	if [[ "${ibm_notifier_valid}" == "FALSE" ]]; then
		log_super "Status: Removing previously installed IBM Notifier.app."
		rm -Rf "${IBM_NOTIFIER_APP}" > /dev/null 2>&1
		[[ -d "${SUPER_FOLDER}/__MACOSX" ]] && rm -Rf "${SUPER_FOLDER}/__MACOSX" > /dev/null 2>&1
		get_ibm_notifier
		[[ -d "${IBM_NOTIFIER_APP}" ]] && check_ibm_notifier
	fi
	[[ "${ibm_notifier_valid}" == "FALSE" ]] && log_super "Error: Unable to validate IBM Notifier.app after re-installation."
fi
[[ "${ibm_notifier_valid}" == "FALSE" ]] && helper_error="TRUE"

# If needed, validate mist-cli and if missing or invalid then install and check again.
if [[ "${macos_version_major}" -lt 13 ]] && [[ "${install_macos_major_upgrades_option}" == "TRUE" ]]; then
	if [[ ! -e "${MIST_CLI_BINARY}" ]]; then
		get_mist_cli
		[[ -e "${MIST_CLI_BINARY}" ]] && check_mist_cli
		[[ "${mist_cli_valid}" == "FALSE" ]] && log_super "Error: Unable to validate mist-cli after installation."
	else
		check_mist_cli
		if [[ "${mist_cli_valid}" == "FALSE" ]]; then
			log_super "Status: Removing previously installed mist-cli."
			rm -Rf "${MIST_CLI_BINARY}" > /dev/null 2>&1
			get_mist_cli
			[[ -e "${MIST_CLI_BINARY}" ]] && check_mist_cli
		fi
		[[ "${mist_cli_valid}" == "FALSE" ]] && log_super "Error: Unable to validate mist-cli after re-installation."
	fi
	[[ "${mist_cli_valid}" == "FALSE" ]] && helper_error="TRUE"
fi
}

# Prepare super by cleaning after previous super runs, record various maintenance modes, validate parameters, and if necessary restart via the super LaunchDaemon.
workflow_startup() {
# Make sure super is running as root.
if [[ $(id -u) -ne 0 ]]; then
	log_echo "Exit: super must run with root privileges."
	exit 1
fi

# Make sure macOS meets the minimum requirement of macOS 11.
macos_version_major=$(sw_vers -productVersion | cut -d'.' -f1) # Expected output: 10, 11, 12
if [[ "${macos_version_major}" -lt 11 ]]; then
	if [[ -d "${SUPER_FOLDER}" ]]; then
		log_super "Exit: This computer is running macOS ${macos_version_major} and super requires macOS 11 Big Sur or newer."
		exit_error
	else # super is not installed yet.
		log_echo "Exit: This computer is running macOS ${macos_version_major} and super requires macOS 11 Big Sur or newer."
		exit 1
	fi
fi

# Check for any previous super processes and kill them.
killall -9 "softwareupdate" "mist" > /dev/null 2>&1
[[ ! -f "${WORKFLOW_INSTALL_NOW_FILE}" ]] && killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
local super_previous_pid
super_previous_pid=$(pgrep -F "${SUPER_PID_FILE}" 2> /dev/null)
if [[ -n "${super_previous_pid}" ]]; then
	[[ -d "${SUPER_LOG_FOLDER}" ]] && log_super "Status: Found previous super instance running with PID ${super_previous_pid}, killing processes..."
	[[ ! -d "${SUPER_LOG_FOLDER}" ]] && log_echo "Status: Found previous super instance running with PID ${super_previous_pid}, killing processes..."
	kill -9 "${super_previous_pid}" > /dev/null 2>&1
fi

# Create new ${SUPER_PID_FILE} for this instance of super.
echo $$ > "${SUPER_PID_FILE}"

# If super crashes or the system restarts unexpectedly before super exits, then automatically launch again.
defaults delete "${SUPER_LOCAL_PLIST}" NextAutoLaunch 2> /dev/null

# Check for super installation.
local super_current_folder
super_current_folder=$(dirname "$0")
! { [[ "${super_current_folder}" == "${SUPER_FOLDER}" ]] || [[ "${super_current_folder}" == $(dirname "${SUPER_LINK}") ]]; } && workflow_installation

# After installation is verified, the startup workflow can begin.
log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - SUPER STARTUP WORKFLOW ****"
log_status "Running: Startup workflow."

# Manage the ${verbose_mode_option} and if enabled start additional logging.
[[ "${reset_super_option}" == "TRUE" ]] && defaults delete "${SUPER_LOCAL_PLIST}" VerboseMode 2> /dev/null
if [[ -f "${SUPER_MANAGED_PLIST}.plist" ]]; then
	local verbose_mode_managed
	verbose_mode_managed=$(defaults read "${SUPER_MANAGED_PLIST}" VerboseMode 2> /dev/null)
fi
if [[ -f "${SUPER_LOCAL_PLIST}.plist" ]]; then
	local verbose_mode_local
	verbose_mode_local=$(defaults read "${SUPER_LOCAL_PLIST}" VerboseMode 2> /dev/null)
fi
[[ -n "${verbose_mode_managed}" ]] && verbose_mode_option="${verbose_mode_managed}"
{ [[ -z "${verbose_mode_managed}" ]] && [[ -z "${verbose_mode_option}" ]] && [[ -n "${verbose_mode_local}" ]]; } && verbose_mode_option="${verbose_mode_local}"
if [[ "${verbose_mode_option}" -eq 1 ]] || [[ "${verbose_mode_option}" == "TRUE" ]]; then
	verbose_mode_option="TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" VerboseMode -bool true
else
	verbose_mode_option="FALSE"
	defaults delete "${SUPER_LOCAL_PLIST}" VerboseMode 2> /dev/null
fi
if [[ "${verbose_mode_option}" == "TRUE" ]]; then
	log_super "Verbose Mode: Function ${FUNCNAME[0]}: Verbose mode enabled."
	log_super "Verbose Mode: Function ${FUNCNAME[0]}: super_current_folder is: ${super_current_folder}"
	log_super "Verbose Mode: Function ${FUNCNAME[0]}: Uptime is: $(uptime)"
fi

# In case super is running at system startup, wait for the loginwindow process befor continuing.
local startup_timeout
startup_timeout=0
while [[ ! $(pgrep "loginwindow") ]] && [[ "${startup_timeout}" -lt 600 ]]; do
	log_super "Status: Waiting for macOS startup to complete..."
	sleep 10
	startup_timeout=$((startup_timeout + 10))
done

# Detailed system and user checks.
check_system
check_current_user

# Workflow for for ${open_logs_option}.
if [[ "${open_logs_option}" == "TRUE" ]]; then
	if [[ "${current_user_account_name}" != "FALSE" ]]; then
		log_super "Status: Opening logs for current user: ${current_user_account_name}."
		if [[ "${mac_cpu_architecture}" == "arm64" ]]; then
			sudo -u "${current_user_account_name}" open "${MDM_WORKFLOW_LOG}"
			sudo -u "${current_user_account_name}" open "${MDM_COMMAND_LOG}"
		fi
		sudo -u "${current_user_account_name}" open "${INSTALLER_WORKFLOW_LOG}"
		sudo -u "${current_user_account_name}" open "${ASU_WORKFLOW_LOG}"
		sudo -u "${current_user_account_name}" open "${INSTALLER_LIST_LOG}"
		sudo -u "${current_user_account_name}" open "${ASU_LIST_LOG}"
		sudo -u "${current_user_account_name}" open "${SUPER_LOG}"
	else # No current GUI user.
		log_super "Warning: Can't open logs because there is currently no local user logged into the GUI."
	fi
fi

# Initial Parameter and helper validation, if any of these fail then it's unsafe for the workflow to continue.
get_preferences
check_jamf_management_framework
manage_parameter_options
manage_helpers
if [[ "${option_error}" == "TRUE" ]] || [[ "${helper_error}" == "TRUE" ]]; then
	log_super "Exit: Initial startup validation failed."
	log_status "Inactive Error: Initial startup validation failed."
	exit_error
fi

# Initial preparation for alternate workflow modes.
[[ "${test_mode_option}" == "TRUE" ]] && log_super "Status: Test mode enabled with ${test_mode_timeout_seconds} second timeout."
if [[ "${workflow_install_now_option}" == "TRUE" ]] || [[ -f "${WORKFLOW_INSTALL_NOW_FILE}" ]]; then
	log_super "Status: Install now alternate workflow enabled."
	workflow_install_now_option="TRUE" # This is re-set in case the script restarts.
	touch "${WORKFLOW_INSTALL_NOW_FILE}" # This is created in case the script restarts.
	[[ $(echo "${display_unmovable_option}" | grep -c 'INSTALLNOW') -gt 0 ]] && display_unmovable_status="TRUE"
	[[ $(echo "${display_hide_background_option}" | grep -c 'INSTALLNOW') -gt 0 ]] && display_hide_background_status="TRUE"
	[[ $(echo "${display_silently_option}" | grep -c 'INSTALLNOW') -gt 0 ]] && display_silently_status="TRUE"
	if [[ "${current_user_account_name}" != "FALSE" ]]; then
		notification_install_now_start
		if [[ "${test_mode_option}" == "TRUE" ]]; then
			log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the install now start notification..."
			sleep "${test_mode_timeout_seconds}"
		fi
	fi
elif [[ "${workflow_only_download_option}" == "TRUE" ]]; then
	log_super "Status: Only download alternate workflow enabled."
	[[ -n "${workflow_jamf_policy_triggers_option}" ]] && log_super "Warning: The --workflow-jamf-policy-triggers option is ignored when used with the --only-download option."
fi
{ [[ "${workflow_only_download_option}" != "TRUE" ]] && [[ -n "${workflow_jamf_policy_triggers_option}" ]]; } && log_super "Status: Jamf Pro Policy triggers: ${workflow_jamf_policy_triggers_option}"
[[ "${workflow_restart_without_updates_option}" == "TRUE" ]] && log_super "Warning: Restart without updates alternate workflow enabled, this computer will restart even if there is no macOS update or upgrade available."

# Apple silicon authentication and workflow validations.
[[ "${mac_cpu_architecture}" == "arm64" ]] && manage_authentication_options
manage_workflow_options
{ [[ "${workflow_error}" != "TRUE" ]] && [[ "${verbose_mode_option}" == "TRUE" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Local preference file after startup validation: ${SUPER_LOCAL_PLIST}:\n$(defaults read "${SUPER_LOCAL_PLIST}" 2> /dev/null)"

# This is the last point where a parent installation process would have a chance to collect log/echo information. If there are any significant workflow issues then exit returning an error.
if [[ "${workflow_error}" == "TRUE" ]]; then
	{ [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; } && notification_install_now_failed
	log_super "Exit: Workflow validation failed."
	log_status "Inactive Error: Workflow validation failed."
	exit_error
fi

# If super is running via Jamf, then restart via LaunchDaemon to release the jamf parent process.
if [[ "${parent_process_is_jamf}" == "TRUE" ]]; then
	log_super "Status: Found that Jamf is installing or is the parent process, restarting via super LaunchDaemon..."
	{ sleep 5; launchctl bootstrap system "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"; } &
	disown -a
	exit_clean
fi

# If super is running from outside the ${SUPER_FOLDER}, then restart via LaunchDaemon to release any parent installer process.
if ! { [[ "${super_current_folder}" == "${SUPER_FOLDER}" ]] || [[ "${super_current_folder}" == $(dirname "${SUPER_LINK}") ]]; }; then
	log_super "Status: Found that super is installing, restarting via super LaunchDaemon..."
	{ sleep 5; launchctl bootstrap system "/Library/LaunchDaemons/${SUPER_LAUNCH_DAEMON_LABEL}.plist"; } &
	disown -a
	exit_clean
fi

# Wait for a valid network connection. If there is still no network after two minutes, an automatic deferral is started.
local network_timeout
network_timeout=0
while [[ $(ifconfig -a inet 2>/dev/null | sed -n -e '/127.0.0.1/d' -e '/0.0.0.0/d' -e '/inet/p' | wc -l) -le 0 ]] && [[ "${network_timeout}" -lt 120 ]]; do
	log_super "Status: Waiting for network..."
	sleep 5
	network_timeout=$((network_timeout + 5))
done
if [[ $(ifconfig -a inet 2>/dev/null | sed -n -e '/127.0.0.1/d' -e '/0.0.0.0/d' -e '/inet/p' | wc -l) -le 0 ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
		log_super "Error: Network unavailable, install now workflow can not continue."
		log_status "Inactive Error: Network unavailable, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: Network unavailable, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Network unavailable, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

# MARK: *** Process Management ***
################################################################################

# Configure super to automatically launch ${deferral_timer_minutes} from now by setting the NextAutoLaunch attribute in the ${SUPER_LOCAL_PLIST}.
set_auto_launch_deferral() {
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deferral_timer_minutes is: ${deferral_timer_minutes}"
local deferral_timer_seconds
deferral_timer_seconds=$((deferral_timer_minutes * 60))
local deferral_timer_epoch
deferral_timer_epoch=$(($(date +%s) + deferral_timer_seconds))
local deferral_timer_year
deferral_timer_year=$(date -j -f "%s" "${deferral_timer_epoch}" "+%Y" | xargs)
local deferral_timer_month
deferral_timer_month=$(date -j -f "%s" "${deferral_timer_epoch}" "+%m" | xargs)
local deferral_timer_day
deferral_timer_day=$(date -j -f "%s" "${deferral_timer_epoch}" "+%d" | xargs)
local deferral_timer_hour
deferral_timer_hour=$(date -j -f "%s" "${deferral_timer_epoch}" "+%H" | xargs)
local deferral_timer_minute
deferral_timer_minute=$(date -j -f "%s" "${deferral_timer_epoch}" "+%M" | xargs)
local deferral_timer_second
deferral_timer_second=$(date -j -f "%s" "${deferral_timer_epoch}" "+%S" | xargs)
local next_auto_launch
next_auto_launch="${deferral_timer_year}-${deferral_timer_month}-${deferral_timer_day}:${deferral_timer_hour}:${deferral_timer_minute}:${deferral_timer_second}"
defaults write "${SUPER_LOCAL_PLIST}" NextAutoLaunch -string "${next_auto_launch}"
log_super "Exit: super is scheduled to automatically relaunch at: ${next_auto_launch}"
exit_clean
}

# This function is used when the super workflow exits with no errors.
exit_clean() {
[[ -n "${jamf_access_token}" ]] && delete_jamf_api_access_token
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Local preference file at clean exit: ${SUPER_LOCAL_PLIST}:\n$(defaults read "${SUPER_LOCAL_PLIST}" 2> /dev/null)"
log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - CLEAN EXIT ****"
rm -f "${SUPER_PID_FILE}" 2> /dev/null
exit 0
}

# This function is used when the super workflow must exit due to an unrecoverable error.
exit_error() {
[[ -n "${jamf_access_token}" ]] && delete_jamf_api_access_token
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Local preference file at error exit: ${SUPER_LOCAL_PLIST}:\n$(defaults read "${SUPER_LOCAL_PLIST}" 2> /dev/null)"
log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - ERROR EXIT ****"
rm -f "${SUPER_PID_FILE}" 2> /dev/null
exit 1
}

# MARK: *** Logging ***
################################################################################

# Append input to the command line and log located at ${SUPER_LOG}.
log_super() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*" | tee -a "${SUPER_LOG}"
}

# Send input to the command line only, so as not to save secrets to the ${SUPER_LOG}.
log_echo() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: Not Logged: $*"
}

# Send input to the command line only replacing the current line, so as not to save save interactive progress updates to the ${SUPER_LOG}.
log_echo_replace_line() {
echo -ne "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: Not Logged: $*\r"
}

# Append input to a log located at ${ASU_WORKFLOW_LOG}.
log_asu() {
echo -e "\n$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*" >> "${ASU_WORKFLOW_LOG}"
}

# Append input to a log located at ${INSTALLER_WORKFLOW_LOG}.
log_installer() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*" >> "${INSTALLER_WORKFLOW_LOG}"
}

# Append input to a log located at ${MDM_COMMAND_LOG}.
log_mdm_command() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*" >> "${MDM_COMMAND_LOG}"
}

# Append input to a log located at ${MDM_WORKFLOW_LOG}.
log_mdm_workflow() {
echo -e "$(date +"%a %b %d %T") $(hostname -s) $(basename "$0")[$$]: $*" >> "${MDM_WORKFLOW_LOG}"
}

# Update the SuperStatus key in the ${SUPER_LOCAL_PLIST}.
log_status() {
defaults write "${SUPER_LOCAL_PLIST}" SuperStatus -string "$(date +"%a %b %d %T"): $*"
}

# MARK: *** Local System Validation ***
################################################################################

# Set ${current_user_account_name} to the currently logged in GUI user or "FALSE" if there is none or a system account.
# If the current user is a normal account then this also sets ${current_user_id}, ${current_user_guid}, ${current_user_real_name}, ${current_user_is_admin}, ${current_user_has_secure_token}, and ${current_user_is_volume_owner}
check_current_user() {
local current_user_account_name_response
current_user_account_name_response=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ { print $3 }')

# If this function was already run earlier then check to see if ${current_user_account_name} and ${current_user_id} are the same as before, if so then it's not necessary to continue this function.
if [[ "${current_user_account_name}" == "${current_user_account_name_response}" ]]; then
	local current_user_id_response
	current_user_id_response=$(id -u "${current_user_account_name_response}" 2> /dev/null)
	[[ "${current_user_id}" == "${current_user_id_response}" ]] && return 0
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_account_name_response is: ${current_user_account_name_response}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_id_response is: ${current_user_id_response}"

if [[ -z "${current_user_account_name_response}" ]]; then
	{ [[ $(id -u) -eq 0 ]] && [[ -d "${SUPER_LOG_FOLDER}" ]]; } && log_super "Status: No GUI user currently logged in."
	{ [[ $(id -u) -ne 0 ]] || [[ ! -d "${SUPER_LOG_FOLDER}" ]]; } && log_echo "Status: No GUI user currently logged in."
	current_user_account_name="FALSE"
	current_user_id="FALSE"
elif [[ "${current_user_account_name_response}" = "root" ]] || [[ "${current_user_account_name_response}" = "_mbsetupuser" ]] || [[ "${current_user_account_name_response}" = "loginwindow" ]]; then
	{ [[ $(id -u) -eq 0 ]] && [[ -d "${SUPER_LOG_FOLDER}" ]]; } && log_super "Status: Current GUI user is system account: ${current_user_account_name_response}"
	{ [[ $(id -u) -ne 0 ]] || [[ ! -d "${SUPER_LOG_FOLDER}" ]]; } && log_echo "Status: Current GUI user is system account: ${current_user_account_name_response}"
	current_user_account_name="FALSE"
	current_user_id="FALSE"
else # Normal locally logged in user.
	current_user_account_name="${current_user_account_name_response}"
	{ [[ $(id -u) -eq 0 ]] && [[ -d "${SUPER_LOG_FOLDER}" ]]; } && log_super "Status: Current GUI user name: ${current_user_account_name}"
	{ [[ $(id -u) -ne 0 ]] || [[ ! -d "${SUPER_LOG_FOLDER}" ]]; } && log_echo "Status: Current GUI user name: ${current_user_account_name}"
fi
if [[ "${current_user_account_name}" != "FALSE" ]] && [[ "${current_user_id}" != "FALSE" ]] && [[ -d "${SUPER_LOG_FOLDER}" ]]; then
	current_user_id=$(id -u "${current_user_account_name}" 2> /dev/null)
	current_user_guid=$(dscl . read "/Users/${current_user_account_name}" GeneratedUID 2> /dev/null | awk '{print $2;}')
	current_user_real_name=$(dscl . read "/Users/${current_user_account_name}" RealName 2> /dev/null | tail -1 | sed -e 's/RealName: //g' | xargs)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_id is: ${current_user_id}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_guid is: ${current_user_guid}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_real_name is: ${current_user_real_name}"
	current_user_is_admin="FALSE"
	current_user_has_secure_token="FALSE"
	current_user_is_volume_owner="FALSE"
	if [[ -n "${current_user_id}" ]] && [[ -n "${current_user_guid}" ]] && [[ -n "${current_user_real_name}" ]]; then
		[[ $(groups "${current_user_account_name}" 2> /dev/null | grep -c 'admin') -gt 0 ]] && current_user_is_admin="TRUE"
		[[ $(dscl . read "/Users/${current_user_account_name}" AuthenticationAuthority 2> /dev/null | grep -c 'SecureToken') -gt 0 ]] && current_user_has_secure_token="TRUE"
		[[ $(diskutil apfs listcryptousers / 2> /dev/null | grep -c "${current_user_guid}") -gt 0 ]] && current_user_is_volume_owner="TRUE"
	else
		log_super "Parameter Error: Unable to determine account details for current user: ${current_user_account_name}"; option_error="TRUE"
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_is_admin is: ${current_user_is_admin}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_has_secure_token is: ${current_user_has_secure_token}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: current_user_is_volume_owner is: ${current_user_is_volume_owner}"
fi
}

# Collect parameters for detailed system information setting a variety of parameters including ${macos_version_minor}, ${macos_version_number}, ${macos_version_extra}, ${macos_build}, ${macos_marketing_name}, ${mac_cpu_architecture}, ${mac_model_name}, ${mac_is_portable}, and ${mac_last_startup}.
check_system() {
macos_version_minor=$(sw_vers -productVersion | cut -d'.' -f2) # Expected output: 14, 15, 06, 01
macos_version_number=${macos_version_major}$(printf "%02d" "${macos_version_minor}") # Expected output: 1014, 1015, 1106, 1203
[[ "${macos_version_major}" -ge 13 ]] && macos_version_extra=$(sw_vers -productVersionExtra | cut -d'.' -f2) # Expected output: (a), (b), (c)
macos_build=$(sw_vers -buildVersion) # Expected output: 22D68
macos_marketing_name="macOS $(awk '/SOFTWARE LICENSE AGREEMENT FOR macOS/' '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf' | awk -F 'macOS ' '{print $NF}' | awk '{print substr($0, 0, length($0)-1)}')" # Expected output: macOS Ventura
mac_cpu_architecture=$(arch) # Expected output: i386, arm64
mac_model_name=$(system_profiler SPHardwareDataType | grep 'Model Name' | awk -F ': ' '{print $2}') # Expected output: MacBook Pro
[[ $(echo "${mac_model_name}" | grep -c 'Book') -gt 0 ]] && mac_is_portable="TRUE" # Expected output: TRUE
local last_reboot_response
if [[ "$macos_version_major" -ge 14 ]]; then
	last_reboot_response=$(last -1 reboot | cut -c 48- | xargs) # Expected output: Aug 25 00:16
else
	last_reboot_response=$(last -1 reboot | cut -c 41- | xargs) # Expected output: Aug 25 00:16
fi
mac_last_startup=$(date -j -f "%b %d %H:%M:%S" "${last_reboot_response}:00" +"%Y-%m-%d:%H:%M:%S") # Expected output: 2023-08-25:00:16:00
defaults write "${SUPER_LOCAL_PLIST}" MacLastStartup -string "${mac_last_startup}"
if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Mac computers with Apple Silicon.
	[[ -z "${macos_version_extra}" ]] && log_super "Status: Mac computer with Apple silicon running: ${macos_marketing_name} ${macos_version_major}.${macos_version_minor}-${macos_build}"
	[[ -n "${macos_version_extra}" ]] && log_super "Status: Mac computer with Apple silicon running: ${macos_marketing_name} ${macos_version_major}.${macos_version_minor}${macos_version_extra}-${macos_build}"
	
else # Mac computers with Intel.
	[[ -z "${macos_version_extra}" ]] && log_super "Status: Mac computer with Intel running: ${macos_marketing_name} ${macos_version_major}.${macos_version_minor}-${macos_build}"
	[[ -n "${macos_version_extra}" ]] && log_super "Status: Mac computer with Intel running: ${macos_marketing_name} ${macos_version_major}.${macos_version_minor}${macos_version_extra}-${macos_build}"
fi
log_super "Status: Last macOS startup was: ${mac_last_startup}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_version_number is: ${macos_version_number}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mac_model_name is: ${mac_model_name}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mac_is_portable is: ${mac_is_portable}"
}

# Validate that the account ${auth_local_account} and ${auth_local_password} are valid credentials to a volume owner. If not set ${auth_error_local}.
check_auth_local_account() {
auth_error_local="FALSE"
local auth_local_guid
auth_local_guid=$(dscl . read "/Users/${auth_local_account}" GeneratedUID 2> /dev/null | awk '{print $2;}')
if [[ -n "${auth_local_guid}" ]]; then
	if ! [[ $(diskutil apfs listcryptousers / | grep -c "${auth_local_guid}") -gt 0 ]]; then
		log_super "Auth Error: The account \"${auth_local_account}\" is not a system volume owner."; auth_error_local="TRUE"
	fi
	if [[ $(dscl /Local/Default -authonly "${auth_local_account}" "${auth_local_password}" 2>&1 | grep -c 'eDSAuthFailed') -gt 0 ]]; then
		log_super "Auth Error: The password for account \"${auth_local_account}\" is not valid."; auth_error_local="TRUE"
	fi
else
	log_super "Auth Error: Could not retrieve GUID for account \"${auth_local_account}\". Verify that account exists locally."; auth_error_local="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_account: ${auth_local_account}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: auth_local_password: ${auth_local_password}"
}

# Collect the available storage and set ${storage_ready} accordingly. This also sets ${storage_available_gigabytes} and ${storage_required_gigabytes}.
check_storage_available() {
check_storage_available_error="FALSE"
storage_ready="FALSE"
[[ -z "${current_user_account_name}" ]] && check_current_user
[[ "${current_user_account_name}" != "FALSE" ]] && storage_available_gigabytes=$(osascript -l 'JavaScript' -e "ObjC.import('Foundation'); var freeSpaceBytesRef=Ref(); $.NSURL.fileURLWithPath('/').getResourceValueForKeyError(freeSpaceBytesRef, 'NSURLVolumeAvailableCapacityForImportantUsageKey', null); Math.round(ObjC.unwrap(freeSpaceBytesRef[0]) / 1000000000)")
[[ "${current_user_account_name}" == "FALSE" ]] && storage_available_gigabytes=$(/usr/libexec/mdmclient QueryDeviceInformation 2> /dev/null | grep 'AvailableDeviceCapacity' | head -n 1 | awk '{print $3}' | sed -e 's/;//g' -e 's/"//g' -e 's/\.[0-9]*//g')
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_available_gigabytes: ${storage_available_gigabytes}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target: ${macos_major_upgrade_version_major_target}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available: ${asu_macos_minor_update_available}"
if [[ -z "${storage_available_gigabytes}" ]] || [[ ! "${storage_available_gigabytes}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	log_super "Error: Unable to determine available storage."
	check_storage_available_error="TRUE"
elif [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]] || [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then
	{ [[ -z "${test_storage_update_option}" ]] && [[ "${asu_macos_minor_update_size}" -lt 5 ]]; } && storage_required_update_gb=$((asu_macos_minor_update_size*2))
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_maocs_asu_required: ${download_maocs_asu_required}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_size: ${asu_macos_minor_update_size}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_required_update_gb: ${storage_required_update_gb}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_required: ${download_macos_installer_required}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_required_upgrade_gb: ${storage_required_upgrade_gb}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_size_target: ${asu_macos_major_upgrade_size_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_size_target: ${macos_installer_size_target}"
	if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # A macOS upgrade is available and option to allow upgrade is enabled.
		if [[ "${workflow_auth_macos}" == "LOCAL" ]] || [[ "${workflow_auth_macos}" == "USER" ]] || [[ "${workflow_auth_macos}" == "FAILOVER" ]]; then
			if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "FAILOVER" ]]; }; then # macOS 13 or newer always upgrades via softwareupdate. macOS 12.3 or newer can as well but not when the MDM workflow fails.
				if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
					storage_required_gigabytes=$((storage_required_upgrade_gb+asu_macos_major_upgrade_size_target))
				else # Download calculation is not required.
					storage_required_gigabytes="${storage_required_upgrade_gb}"
				fi
			else # Systems older than macOS 12.3 upgrade via installer application, or when the MDM workflow fails.
				if [[ "${download_macos_installer_required}" == "TRUE" ]]; then
					storage_required_gigabytes=$((storage_required_upgrade_gb+macos_installer_size_target))
				else # Download calculation is not required.
					storage_required_gigabytes="${storage_required_upgrade_gb}"
				fi
			fi
		elif [[ "${workflow_auth_macos}" == "JAMF" ]]; then
			if [[ "${macos_version_major}" -ge 13 ]]; then
				if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
					storage_required_gigabytes=$((storage_required_upgrade_gb+asu_macos_major_upgrade_size_target))
				else # Download calculation is not required.
					storage_required_gigabytes="${storage_required_upgrade_gb}"
				fi
			else # macOS major upgrade via MDM only possible via installer application.
				if [[ "${download_macos_installer_required}" == "TRUE" ]]; then
					storage_required_gigabytes=$((storage_required_upgrade_gb+macos_installer_size_target))
				else # Download calculation is not required.
					storage_required_gigabytes="${storage_required_upgrade_gb}"
				fi
			fi
		fi
	else # macOS updates are available.
		if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
			storage_required_gigabytes=$((storage_required_update_gb+asu_macos_minor_update_size))
		else # Download calculation is not required.
			storage_required_gigabytes="${storage_required_update_gb}"
		fi
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_required_gigabytes: ${storage_required_gigabytes}"
	[[ "${storage_available_gigabytes}" -ge "${storage_required_gigabytes}" ]] && storage_ready="TRUE"
else # No macOS update/upgrade is available.
	storage_ready="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: check_storage_available_error: ${check_storage_available_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_ready: ${storage_ready}"
}

# Validate if current system power is adequate for performing a macOS update/upgrade and set ${power_ready} accordingly. Desktops, obviously, always return that they are ready.
check_power_required() {
local power_required_charger_connected
power_required_charger_connected="FALSE"
check_power_required_error="FALSE"
power_ready="FALSE"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mac_is_portable: ${mac_is_portable}"
if [[ "${mac_is_portable}" == "TRUE" ]]; then
	[[ $(pmset -g ps | grep -ic 'AC Power') -ne 0 ]] && power_required_charger_connected="TRUE"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_required_charger_connected: ${power_required_charger_connected}"
	if [[ "${power_required_charger_connected}" == "TRUE" ]]; then
		power_ready="TRUE"
	else # Not plugged into AC power.
		power_battery_percent=$(pmset -g ps | grep '%' | awk '{print $3}' | sed -e 's/%;//g')
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_battery_percent: ${power_battery_percent}"
		if [[ -z "${power_battery_percent}" ]] || [[ ! "${power_battery_percent}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
			log_super "Error: Unable to determine battery power level."
			check_power_required_error="TRUE"
		else # Battery level is a real number.
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_required_battery_percent: ${power_required_battery_percent}"
			[[ "${power_battery_percent}" -gt "${power_required_battery_percent}" ]] && power_ready="TRUE"
		fi
	fi
else # Mac desktop.
	power_ready="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: check_power_required_error: ${check_power_required_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_ready: ${power_ready}"
}

# Validate the computer's MDM service status and set ${mdm_enrolled}, ${mdm_automatically_enrolled}, ${mdm_service_url}, and ${auth_error_mdm}.
# Unlike other MDM validation functions, this function is MDM-vednor agnostic.
check_mdm_service() {
mdm_enrolled="FALSE"
mdm_automatically_enrolled="FALSE"
auth_error_mdm="FALSE"
local profiles_response
profiles_response=$(profiles status -type enrollment 2>&1)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: profiles_response:\n${profiles_response}"
if [[ $(echo "${profiles_response}" | grep -c 'MDM server') -gt 0 ]]; then
	mdm_enrolled="TRUE"
	[[ $(echo "${profiles_response}" | grep 'Enrolled via DEP:' | grep -c 'Yes') -gt 0 ]] && mdm_automatically_enrolled="TRUE"
	mdm_service_url="https://$(echo "${profiles_response}" | grep 'MDM server' | awk -F '/' '{print $3}')"
	local curl_response
	curl_response=$(curl -Is "${mdm_service_url}" | head -n 1)
	if [[ $(echo "${curl_response}" | grep -c 'HTTP') -gt 0 ]] && [[ $(echo "${curl_response}" | grep -c -e '400' -e '40[4-9]' -e '4[1-9][0-9]' -e '5[0-9][0-9]') -eq 0 ]]; then
		log_super "Status: MDM service is currently available at: ${mdm_service_url}"
	else
		log_super "Warning: MDM service at ${mdm_service_url} is currently unavailable with stauts: ${curl_response}"; auth_error_mdm="TRUE"
	fi
else
	log_super "Warning: System is not enrolled with a MDM service."; auth_error_mdm="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdm_enrolled: ${mdm_enrolled}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdm_automatically_enrolled: ${mdm_automatically_enrolled}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdm_service_url: ${mdm_service_url}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_error_mdm: ${auth_error_mdm}"
}

# Validate that the computer's bootstrap token is properly escrowed and set ${auth_error_bootstrap_token}.
check_bootstrap_token_escrow() {
auth_error_bootstrap_token="FALSE"
local profiles_response
profiles_response=$(profiles status -type bootstraptoken 2>&1)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: profiles_response:\n${profiles_response}"
if [[ $(echo "${profiles_response}" | grep -c 'YES') -eq 2 ]]; then
	if [[ "${macos_version_number}" -ge 1303 ]]; then
		if [[ "${auth_error_mdm}" == "FALSE" ]]; then
			local mdmclient_response
			mdmclient_response=$(/usr/libexec/mdmclient QueryDeviceInformation 2> /dev/null | grep 'EACSPreflight' | sed -e 's/        EACSPreflight = //g' -e 's/"//g' -e 's/;//g')
			if [[ $(echo "${mdmclient_response}" | grep -c 'success') -gt 0 ]] || [[ $(echo "${mdmclient_response}" | grep -c 'EFI password exists') -gt 0 ]]; then
				log_super "Status: Bootstrap token escrowed and validated with MDM service."
			else
				log_super "Warning: Bootstrap token escrow validation failed with status: ${mdmclient_response}"
				auth_error_bootstrap_token="TRUE"
			fi
		else
			log_super "Warning: Bootstrap token was previously escrowed with MDM service but the service is currently unavailable so it can not be validated."
		fi
	else
		log_super "Status: Bootstrap token escrowed with MDM service."
	fi
else
	log_super "Warning: Bootstrap token is not escrowed with MDM service."
	auth_error_bootstrap_token="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_error_bootstrap_token: ${auth_error_bootstrap_token}"
}

# MARK: *** Deferrals & Deadlines ***
################################################################################

# Delete the deadline counters in ${SUPER_LOCAL_PLIST} to restart the counters.
restart_deadline_counters() {
log_super "Status: Restarting all deadline counters."
defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterHard 2> /dev/null
}

# Delete the workflow automatic zero date in ${SUPER_LOCAL_PLIST} to restart the automatic zero date.
restart_workflow_automatic_zero_date() {
log_super "Status: Restarting workflow automatic zero date."
defaults delete "${SUPER_LOCAL_PLIST}" WorkflowAutomaticZeroDate 2> /dev/null
}

# Evaluate ${workflow_zero_date_manual} and ${workflow_zero_date_previous}, then set ${workflow_zero_date}, ${workflow_zero_date_epoch}, and ${display_string_workflow_zero_date} accordingly.
check_zero_date() {
if [[ -n "${workflow_zero_date_manual}" ]]; then # If there is a ${workflow_zero_date_manual} then use that first.
	workflow_zero_date="${workflow_zero_date_manual}"
	log_super "Status: Using manually set zero date of: ${workflow_zero_date}."
else
	local workflow_zero_date_previous
	workflow_zero_date_previous=$(defaults read "${SUPER_LOCAL_PLIST}" WorkflowAutomaticZeroDate 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_zero_date_previous: ${workflow_zero_date_previous}"
	if [[ -n "${workflow_zero_date_previous}" ]]; then # If there was a previously saved zero day date then use that.
		workflow_zero_date="${workflow_zero_date_previous}"
		log_super "Status: Using previously set automatic zero date of: ${workflow_zero_date}."
	else # Otherwise this is a new zero day date, so save to ${SUPER_LOCAL_PLIST}.
		workflow_zero_date=$(date +"%Y-%m-%d:%H:%M")
		log_super "Status: Setting new automatic zero date to ${workflow_zero_date}."
		defaults write "${SUPER_LOCAL_PLIST}" WorkflowAutomaticZeroDate -string "${workflow_zero_date}"
	fi
fi
workflow_zero_date_epoch=$(date -j -f "%Y-%m-%d:%H:%M" "${workflow_zero_date}" +"%s")
local display_string_workflow_zero_date_only_date
display_string_workflow_zero_date_only_date=$(date -r "${workflow_zero_date_epoch}" "${DISPLAY_STRING_FORMAT_DATE}")
local display_string_workflow_zero_date_only_time
display_string_workflow_zero_date_only_time=$(date -r "${workflow_zero_date_epoch}" "${DISPLAY_STRING_FORMAT_TIME}" | sed 's/^ *//g')
if [[ $(date -r "${workflow_zero_date_epoch}" "+%H:%M") == "00:00" ]]; then
	display_string_workflow_zero_date="${display_string_workflow_zero_date_only_date}"
else
	display_string_workflow_zero_date="${display_string_workflow_zero_date_only_date} - ${display_string_workflow_zero_date_only_time}"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_zero_date_epoch: ${workflow_zero_date_epoch}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_workflow_zero_date_only_date: ${display_string_workflow_zero_date_only_date}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_workflow_zero_date_only_time: ${display_string_workflow_zero_date_only_time}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_workflow_zero_date: ${display_string_workflow_zero_date}"
}

# Evaluate if a process has told the display to not sleep or the user has enabled Focus or Do Not Disturb, and set ${user_focus_active} accordingly.
check_user_focus() {
user_focus_active="FALSE"
if [[ -n "${deadline_count_focus}" ]] || [[ -n "${deadline_days_focus}" ]] || [[ -n "${deadline_date_focus}" ]]; then
	local focus_response
	focus_response=$(plutil -extract data.0.storeAssertionRecords.0.assertionDetails.assertionDetailsModeIdentifier raw -o - "/Users/${current_user_account_name}/Library/DoNotDisturb/DB/Assertions.json" | grep -ic 'com.apple.')
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: focus_response is: ${focus_response}"
	if [[ "${focus_response}" -gt 0 ]]; then
		log_super "Status: Focus or Do Not Disturb enabled for current user: ${current_user_account_name}."
		user_focus_active="TRUE"
	fi
	local previous_ifs
	previous_ifs="${IFS}"; IFS=$'\n'
	local display_assertions_array
	display_assertions_array=($(pmset -g assertions | awk '/NoDisplaySleepAssertion | PreventUserIdleDisplaySleep/ && match($0,/\(.+\)/) && ! /coreaudiod/ {gsub(/^\ +/,"",$0); print};'))
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_assertions_array is:\n${display_assertions_array[*]}"
	if [[ -n "${display_assertions_array[*]}" ]]; then
		for display_assertion in "${display_assertions_array[@]}"; do
			log_super "Status: The following Display Sleep Assertion was found: $(echo "${display_assertion}" | awk -F ':' '{print $1}')"
		done
		user_focus_active="TRUE"
	fi
	IFS="${previous_ifs}"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: user_focus_active is: ${user_focus_active}"
}

# Evaluate ${deadline_date_focus}, ${deadline_date_soft}, and ${deadline_date_hard}, then set ${deadline_date_status}, ${deadline_date_epoch}, and ${display_string_deadline_date} accordingly.
check_deadlines_dates() {
deadline_date_status="FALSE" # Deadline status modes: FALSE, SOFT, or HARD
if [[ -n "${deadline_date_focus}" ]]; then
	if [[ "${deadline_date_focus_epoch}" -lt $(date +%s) ]]; then
		log_super "Status: Focus deadline date of ${deadline_date_focus} HAS passed."
		deadline_date_status="FOCUS"
	else
		log_super "Status: Focus deadline date of ${deadline_date_focus} NOT passed."
	fi
fi
if [[ -n "${deadline_date_soft}" ]]; then
	if [[ "${deadline_date_soft_epoch}" -lt $(date +%s) ]]; then
		log_super "Status: Soft deadline date of ${deadline_date_soft} HAS passed."
		deadline_date_status="SOFT"
	else
		log_super "Status: Soft deadline date of ${deadline_date_soft} NOT passed."
	fi
fi
if [[ -n "${deadline_date_hard}" ]]; then
	if [[ "${deadline_date_hard_epoch}" -lt $(date +%s) ]]; then
		log_super "Status: Hard deadline date of ${deadline_date_hard} HAS passed."
		deadline_date_status="HARD"
	else
		log_super "Status: Hard deadline date of ${deadline_date_hard} NOT passed."
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_date_status is: ${deadline_date_status}"

# For display the ${deadline_date_soft} always results in a sooner date than the ${deadline_date_hard}.
[[ -n "${deadline_date_hard}" ]] && deadline_date_epoch="${deadline_date_hard_epoch}"
[[ -n "${deadline_date_soft}" ]] && deadline_date_epoch="${deadline_date_soft_epoch}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_date_epoch is: ${deadline_date_epoch}"
if [[ -n "${deadline_date_epoch}" ]]; then
	local display_string_deadline_date_only_date
	display_string_deadline_date_only_date=$(date -r "${deadline_date_epoch}" "${DISPLAY_STRING_FORMAT_DATE}")
	local display_string_deadline_date_only_time
	display_string_deadline_date_only_time=$(date -r "${deadline_date_epoch}" "${DISPLAY_STRING_FORMAT_TIME}" | sed 's/^ *//g')
	if [[ $(date -r "${deadline_date_epoch}" "+%H:%M") == "00:00" ]]; then
		display_string_deadline_date="${display_string_deadline_date_only_date}"
	else
		display_string_deadline_date="${display_string_deadline_date_only_date} - ${display_string_deadline_date_only_time}"
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline_date_only_date is: ${display_string_deadline_date_only_date}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline_date_only_time is: ${display_string_deadline_date_only_time}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline_date is: ${display_string_deadline_date}"
fi
}

# Evaluate ${deadline_days_focus}, ${deadline_days_soft}, and ${deadline_days_hard}, then set ${deadline_days_stauts}, ${deadline_days_epoch}, and ${display_string_deadline_days} accordingly.
check_deadlines_days() {
deadline_days_stauts="FALSE" # Deadline status modes: FALSE, SOFT, or HARD
if [[ -n "${deadline_days_focus}" ]]; then
	local deadline_days_focus_epoch
	deadline_days_focus_epoch=$((workflow_zero_date_epoch + deadline_days_focus_seconds))
	local deadline_days_focus_date
	deadline_days_focus_date=$(date -r "${deadline_days_focus_epoch}" +%Y-%m-%d:%H:%M)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_focus_epoch: ${deadline_days_focus_epoch}"
	if [[ "${deadline_days_focus_epoch}" -lt $(date +%s) ]]; then
		log_super "Status: Focus days deadline of ${deadline_days_focus_date} (${deadline_days_focus} day(s) after ${workflow_zero_date}) HAS passed."
		deadline_days_stauts="FOCUS"
	else
		log_super "Status: Focus days deadline of ${deadline_days_focus_date} (${deadline_days_focus} day(s) after ${workflow_zero_date}) NOT passed."
	fi
fi
if [[ -n "${deadline_days_soft}" ]]; then
	local deadline_days_soft_epoch
	deadline_days_soft_epoch=$((workflow_zero_date_epoch + deadline_days_soft_seconds))
	local deadline_days_soft_date
	deadline_days_soft_date=$(date -r "${deadline_days_soft_epoch}" +%Y-%m-%d:%H:%M)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_soft_epoch: ${deadline_days_soft_epoch}"
	if [[ "${deadline_days_soft_epoch}" -lt $(date +%s) ]]; then
		log_super "Status: Soft days deadline of ${deadline_days_soft_date} (${deadline_days_soft} day(s) after ${workflow_zero_date}) HAS passed."
		deadline_days_stauts="SOFT"
	else
		log_super "Status: Soft days deadline of ${deadline_days_soft_date} (${deadline_days_soft} day(s) after ${workflow_zero_date}) NOT passed."
	fi
fi
if [[ -n "${deadline_days_hard}" ]]; then
	local deadline_days_hard_epoch
	deadline_days_hard_epoch=$((workflow_zero_date_epoch + deadline_days_hard_seconds))
	local deadline_days_hard_date
	deadline_days_hard_date=$(date -r "${deadline_days_hard_epoch}" +%Y-%m-%d:%H:%M)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_hard_epoch: ${deadline_days_hard_epoch}"
	if [[ "${deadline_days_hard_epoch}" -lt $(date +%s) ]]; then
		log_super "Status: Days deadline of ${deadline_days_hard_date} (${deadline_days_hard} day(s) after ${workflow_zero_date}) HAS passed."
		deadline_days_stauts="HARD"
	else
		log_super "Status: Days deadline of ${deadline_days_hard_date} (${deadline_days_hard} day(s) after ${workflow_zero_date}) NOT passed."
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_stauts is: ${deadline_days_stauts}"

# For display the ${deadline_days_soft} always results in a sooner date than the ${deadline_days_hard}.
[[ -n ${deadline_days_hard} ]] && deadline_days_epoch="${deadline_days_hard_epoch}"
[[ -n ${deadline_days_soft} ]] && deadline_days_epoch="${deadline_days_soft_epoch}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_days_epoch is: ${deadline_days_epoch}"
if [[ -n "${deadline_days_epoch}" ]]; then
	local display_string_deadline_days_only_date
	display_string_deadline_days_only_date=$(date -r "${deadline_days_epoch}" "${DISPLAY_STRING_FORMAT_DATE}")
	local display_string_deadline_days_only_time
	display_string_deadline_days_only_time=$(date -r "${deadline_days_epoch}" "${DISPLAY_STRING_FORMAT_TIME}" | sed 's/^ *//g')
	if [[ $(date -r "${deadline_days_epoch}" "+%H:%M") == "00:00" ]]; then
		display_string_deadline_days="${display_string_deadline_days_only_date}"
	else
		display_string_deadline_days="${display_string_deadline_days_only_date} - ${display_string_deadline_days_only_time}"
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline_days_only_date is: ${display_string_deadline_days_only_date}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline_days_only_time is: ${display_string_deadline_days_only_time}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline_days is: ${display_string_deadline_days}"
fi

# For display this sets ${display_string_deadline} based on the soonest available date or days deadline.
if [[ -n "${display_string_deadline_date}" ]] && [[ -n "${display_string_deadline_days}" ]]; then
	if [[ "${deadline_date_epoch}" -le "${deadline_days_epoch}" ]]; then
		display_string_deadline="${display_string_deadline_date}"
	else
		display_string_deadline="${display_string_deadline_days}"
	fi
elif [[ -n "${display_string_deadline_date}" ]]; then
	display_string_deadline="${display_string_deadline_date}"
elif [[ -n "${display_string_deadline_days}" ]]; then
	display_string_deadline="${display_string_deadline_days}"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_deadline is: ${display_string_deadline}"
}

# Evaluate ${deadline_count_focus}, ${deadline_count_soft}, and ${deadline_count_hard}, then set ${user_focus_active}, ${deadline_count_status}, ${display_string_deadline_count}, and ${display_string_deadline_count_maximum} accordingly.
check_deadlines_count() {
deadline_count_status="FALSE" # Deadline status modes: FALSE, SOFT, or HARD
if [[ "${user_focus_active}" == "TRUE" ]]; then
	if [[ -n "${deadline_count_focus}" ]]; then
		local deadline_counter_focus_previous
		local deadline_counter_focus_current
		deadline_counter_focus_previous=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus 2> /dev/null)
		if [[ -z "${deadline_counter_focus_previous}" ]]; then
			deadline_counter_focus_current=0
			defaults write "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus -int "${deadline_counter_focus_current}"
		else
			deadline_counter_focus_current=$((deadline_counter_focus_previous + 1))
			defaults write "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus -int "${deadline_counter_focus_current}"
		fi
		if [[ "${deadline_counter_focus_current}" -ge "${deadline_count_focus}" ]]; then
			log_super "Status: Focus maximum deferral count of ${deadline_count_focus} HAS passed."
			deadline_count_status="FOCUS"
			user_focus_active="FALSE"
		else
			display_string_deadline_count_focus=$((deadline_count_focus - deadline_counter_focus_current))
			log_super "Status: Focus maximum deferral count of ${deadline_count_focus} NOT passed with ${display_string_deadline_count_focus} remaining."
		fi
	else
		log_super "Status: Focus or Do Not Disturb active, and no maximum focus deferral, so not incrementing deferral counters."
	fi
fi
if [[ "${user_focus_active}" == "FALSE" ]]; then
	if [[ -n "${deadline_count_soft}" ]]; then
		local deadline_counter_soft_previous
		local deadline_counter_soft_current
		deadline_counter_soft_previous=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft 2> /dev/null)
		if [[ -z "${deadline_counter_soft_previous}" ]]; then
			deadline_counter_soft_current=0
			defaults write "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft -int "${deadline_counter_soft_current}"
		else
			deadline_counter_soft_current=$((deadline_counter_soft_previous + 1))
			defaults write "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft -int "${deadline_counter_soft_current}"
		fi
		if [[ "${deadline_counter_soft_current}" -ge "${deadline_count_soft}" ]]; then
			log_super "Status: Soft maximum deferral count of ${deadline_count_soft} HAS passed."
			deadline_count_status="SOFT"
		else
			display_string_deadline_count_soft=$((deadline_count_soft - deadline_counter_soft_current))
			log_super "Status: Soft maximum deferral count of ${deadline_count_soft} NOT passed with ${display_string_deadline_count_soft} remaining."
		fi
		display_string_deadline_count="${display_string_deadline_count_soft}"
		display_string_deadline_count_maximum="${deadline_count_soft}"
	fi
	if [[ -n "${deadline_count_hard}" ]]; then
		local deadline_counter_hard_previous
		local deadline_counter_hard_current
		deadline_counter_hard_previous=$(defaults read "${SUPER_LOCAL_PLIST}" DeadlineCounterHard 2> /dev/null)
		if [[ -z "${deadline_counter_hard_previous}" ]]; then
			deadline_counter_hard_current=0
			defaults write "${SUPER_LOCAL_PLIST}" DeadlineCounterHard -int "${deadline_counter_hard_current}"
		else
			deadline_counter_hard_current=$((deadline_counter_hard_previous + 1))
			defaults write "${SUPER_LOCAL_PLIST}" DeadlineCounterHard -int "${deadline_counter_hard_current}"
		fi
		if [[ "${deadline_counter_hard_current}" -ge "${deadline_count_hard}" ]]; then
			log_super "Status: Hard maximum deferral count of ${deadline_count_hard} HAS passed."
			deadline_count_status="HARD"
		else
			display_string_deadline_count_hard=$((deadline_count_hard - deadline_counter_hard_current))
			log_super "Status: Hard maximum deferral count of ${deadline_count_hard} NOT passed with ${display_string_deadline_count_hard} remaining."
		fi
		display_string_deadline_count="${display_string_deadline_count_hard}"
		display_string_deadline_count_maximum="${deadline_count_hard}"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: deadline_count_status is: ${deadline_count_status}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: user_focus_active is: ${user_focus_active}"
}

# MARK: *** Software Discovery ***
################################################################################

# This function clears any cached update/upgrade information.
reset_software_status_caches() {
defaults delete "${SUPER_LOCAL_PLIST}" macOSBetaProgramCache 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" ASUListCache 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" macOSNewestMarketingNameCache 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" macOSNewestVersionCache 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULabel 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULastStartup 2> /dev/null
defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null
rm -f "${ASU_LIST_LOG}" 2> /dev/null
touch "${ASU_LIST_LOG}"
rm -f "${INSTALLER_LIST_LOG}" 2> /dev/null
touch "${INSTALLER_LIST_LOG}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Local preference file after reset_software_status_caches: ${SUPER_LOCAL_PLIST}:\n$(defaults read "${SUPER_LOCAL_PLIST}" 2> /dev/null)"
}

# This function checks the validity of recently run software updates/upgrade caches and sets ${workflow_software_full_check_required}.
# If cached information is valid this also sets ${macos_beta_program}, ${asu_available}, ${asu_list}, ${macos_major_upgrade_available}, ${macos_major_upgrade_marketing_name}, ${macos_major_upgrade_version}, ${macos_major_upgrade_version_major}, and ${macos_installers_list} accordingly.
check_software_stauts_caches() {
workflow_software_full_check_required="FALSE"

# Check to when the last successful Apple software check update was.
local asu_last_sccessful_date
local asu_last_sccessful_epoch
asu_last_sccessful_date=$(defaults read "${ASU_PLIST}" LastSuccessfulDate 2> /dev/null)
[[ -n "${asu_last_sccessful_date}" ]] && asu_last_sccessful_epoch=$(date -j -u -f "%Y-%m-%d %H:%M:%S %z" "${asu_last_sccessful_date}" "+%s")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_last_sccessful_date is: ${asu_last_sccessful_date}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_last_sccessful_epoch is: ${asu_last_sccessful_epoch}"
if [[ "${asu_last_sccessful_epoch}" -lt $(($(date "+%s")-21600)) ]]; then
	log_super "Status: Last Apple software update check was more than 6 hours ago, full update/upgrade check required."
	workflow_software_full_check_required="TRUE"
	return 0
fi

# Check macOS beta program status cache.
local macos_beta_program_cache
macos_beta_program_cache=$(defaults read "${SUPER_LOCAL_PLIST}" macOSBetaProgramCache 2> /dev/null)
if [[ -n "${macos_beta_program_cache}" ]] && [[ "${macos_beta_program_cache}" == "0" ]]; then
	macos_beta_program="FALSE"
elif [[ -n "${macos_beta_program_cache}" ]] && [[ "${macos_beta_program_cache}" == "1" ]]; then
	log_super "Status: This system is currently configured to receive macOS beta updates/upgrades."
	macos_beta_program="TRUE"
else # No cached beta program status.
	log_super "Status: No macOS beta program status cache, full update/upgrade check required."
	workflow_software_full_check_required="TRUE"
	return 0
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_beta_program is: ${macos_beta_program}"

# Check Apple software update cache.
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ${ASU_PLIST} is:\n$(defaults read "${ASU_PLIST}"  2> /dev/null)"
asu_available="FALSE"
local asu_last_updates_available
asu_last_updates_available=$(defaults read "${ASU_PLIST}" LastUpdatesAvailable 2> /dev/null)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_last_updates_available is: ${asu_last_updates_available}"
if [[ "${asu_last_updates_available}" -gt 0 ]]; then # Software updates available. Evaluate previous update list and compare them to currently available updates, setting ${workflow_software_full_check_required}, ${asu_list}, and ${asu_available} accordingly.
	local get_asu_list_cache
	get_asu_list_cache=$(defaults read "${SUPER_LOCAL_PLIST}" ASUListCache 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: get_asu_list_cache is:\n${get_asu_list_cache}"
	if [[ -n "${get_asu_list_cache}" ]] && [[ "${get_asu_list_cache}" != "0" ]]; then
		local asu_recommended_updates
		asu_recommended_updates=$(defaults read "${ASU_PLIST}" RecommendedUpdates | grep 'Identifier' | sed -e 's/        Identifier = //g' -e 's/"//g' -e 's/;//g' | sort)
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_recommended_updates is:\n${asu_recommended_updates}"
		if [[ "${macos_version_major}" -ge 12 ]]; then
			local get_asu_list_cache_sorted
			get_asu_list_cache_sorted=$(echo "${get_asu_list_cache}" | tail -n +2 | sed -e 's/    //g' -e 's/"//g' -e 's/",//g' -e 's/,//g' -e '$d' | sort)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: get_asu_list_cache_sorted is:\n${get_asu_list_cache_sorted}"
			if [[ "${asu_recommended_updates}" == "${get_asu_list_cache_sorted}" ]]; then  # Previous update list matches current update list.
				asu_list=$(<"${ASU_LIST_LOG}") 2> /dev/null
			else
				log_super "Status: Cached Apple software update list does not match the current list, full update/upgrade check required."
				workflow_software_full_check_required="TRUE"
				return 0
			fi
		else # macOS 11 has less reliable ${asu_recommended_updates} responses.
			if [[ "${get_asu_list_cache}" == $(echo "${asu_recommended_updates}" | wc -l | tr -d -c 0-9) ]]; then # Previous number of updates matches current number of updates.
				asu_list=$(<"${ASU_LIST_LOG}") 2> /dev/null
			else
				log_super "Status: Cached number of Apple software updates does not match the current number of updates, full update/upgrade check required."
				workflow_software_full_check_required="TRUE"
				return 0
			fi
		fi
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_list is:\n${asu_list}"
		if [[ $(echo "${asu_list}" | grep -c 'Software Update found') -eq 0 ]] || [[ $(echo "${asu_list}" | grep -c 'No new software available.') -gt 1 ]]; then
			log_super "Status: ${ASU_LIST_LOG} does not contain any updates but it should, full update/upgrade check required."
			unset asu_list
			workflow_software_full_check_required="TRUE"
			return 0
		else # Apple software update list appears valid.
			asu_available="TRUE"
		fi
	else
		log_super "Status: No Apple software update list cache, full update/upgrade check required."
		workflow_software_full_check_required="TRUE"
		return 0
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_available is: ${asu_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_list is:\n${asu_list}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_software_full_check_required is: ${workflow_software_full_check_required}"

# Check macOS major upgrade available cache.
macos_major_upgrade_available="FALSE"
local macos_major_upgrade_marketing_name_cache
macos_major_upgrade_marketing_name_cache=$(defaults read "${SUPER_LOCAL_PLIST}" macOSNewestMarketingNameCache 2> /dev/null)
local macos_major_upgrade_version_cache
macos_major_upgrade_version_cache=$(defaults read "${SUPER_LOCAL_PLIST}" macOSNewestVersionCache 2> /dev/null)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_marketing_name_cache is: ${macos_major_upgrade_marketing_name_cache}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_cache is: ${macos_major_upgrade_version_cache}"
if [[ -n "${macos_major_upgrade_marketing_name_cache}" ]] && [[ -n "${macos_major_upgrade_version_cache}" ]]; then
	if [[ "${macos_major_upgrade_marketing_name_cache}" != "0" ]] && [[ "${macos_major_upgrade_version_cache}" != "0" ]]; then
		macos_major_upgrade_marketing_name="${macos_major_upgrade_marketing_name_cache}"
		macos_major_upgrade_version="${macos_major_upgrade_version_cache}"
		macos_major_upgrade_version_major=$(echo "${macos_major_upgrade_version}" | cut -d '.' -f1)
		[[ "${macos_major_upgrade_version_major}" -gt "${macos_version_major}" ]] && macos_major_upgrade_available="TRUE"
	else # Previous check showed no macOS major upgrades available.
		macos_major_upgrade_marketing_name="FALSE"
		macos_major_upgrade_version="FALSE"
		macos_major_upgrade_version_major="FALSE"
		macos_major_upgrade_available="FALSE"
	fi
else
	log_super "Status: No available macOS major upgrades cache, full update/upgrade check required."
	workflow_software_full_check_required="TRUE"
	return 0
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_marketing_name is: ${macos_major_upgrade_marketing_name}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version is: ${macos_major_upgrade_version}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major is: ${macos_major_upgrade_version_major}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_available is: ${macos_major_upgrade_available}"

# If needed, check macOS installer list cache.
if [[ "${macos_major_upgrade_available}" == "TRUE" ]] && [[ "${install_macos_major_upgrades_option}" == "TRUE" ]] && [[ "${macos_version_major}" -lt 13 ]] && { [[ "${macos_version_number}" -lt 1203 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" == "JAMF" ]]; }; }; then # macOS major upgrade only possible via installer application.
	macos_installers_list=$(<"${INSTALLER_LIST_LOG}") 2> /dev/null
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installers_list is:\n${macos_installers_list}"
	if [[ -n "${macos_installers_list}" ]];then # Cached macOS installer list exists.
		if [[ $(echo "${log_line}" | grep -c 'Found 0') -gt 0 ]]; then
			log_super "Status: Invalid macOS installer list cache, full update/upgrade check required."
			unset macos_installers_list
			workflow_software_full_check_required="TRUE"
		fi
	else
		log_super "Status: No macOS installer list cache, full update/upgrade check required."
		unset macos_installers_list
		workflow_software_full_check_required="TRUE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_software_full_check_required is: ${workflow_software_full_check_required}"
}

# Check for macOS beta program enrollment and set ${macos_beta_program} accordingly.
check_macos_beta_program()
{
macos_beta_program="FALSE"
if [[ "${macos_version_number}" -ge 1304 ]]; then
	local mdmclient_response
	mdmclient_response=$(/usr/libexec/mdmclient QueryDeviceInformation 2> /dev/null | grep 'IsDefaultCatalog')
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdmclient_response is:\n${mdmclient_response}"
	if [[ $(echo "${mdmclient_response}" | grep -c '1') -eq 0 ]]; then
		log_super "Status: This system is currently configured to receive macOS beta updates/upgrades."
		macos_beta_program="TRUE"
	fi
else # macOS versions prior to 13.4.
	local seedutil_response
	seedutil_response=$(/System/Library/PrivateFrameworks/Seeding.framework/Versions/A/Resources/seedutil current)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: seedutil_response is:\n${seedutil_response}"
	if [[ $(echo "${seedutil_response}" | grep -c 'Is Enrolled: YES') -gt 0 ]]; then
		log_super "Status: This system is currently configured to receive macOS beta updates/upgrades."
		macos_beta_program="TRUE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_beta_program is: ${macos_beta_program}"
if [[ "${macos_beta_program}" == "FALSE" ]]; then
	defaults write "${SUPER_LOCAL_PLIST}" macOSBetaProgramCache -bool false
else # "${macos_beta_program}" == "TRUE"
	defaults write "${SUPER_LOCAL_PLIST}" macOSBetaProgramCache -bool true
fi
}

# This restarts various softwareupdate daemon processes.
kick_softwareupdated() {
log_super "Status: Restarting various softwareupdate daemon processes..."
defaults delete /Library/Preferences/com.apple.Softwareupdate.plist > /dev/null 2>&1

if ! launchctl kickstart -k "system/com.apple.mobile.softwareupdated"; then
	log_super "Warning: Restarting mobile softwareupdate daemon didn't respond, trying again in 10 seconds..."
	sleep 10
	launchctl kickstart -k "system/com.apple.mobile.softwareupdated"
fi

if ! launchctl kickstart -k "system/com.apple.softwareupdated"; then
	log_super "Warning: Restarting system softwareupdate daemon didn't respond, trying again in 10 seconds..."
	sleep 10
	launchctl kickstart -k "system/com.apple.softwareupdated"
fi

# If a user is logged in then also restart the Software Update Notification Manager daemon.
if [[ "${current_user_account_name}" != "FALSE" ]]; then
	if ! launchctl kickstart -k "gui/${current_user_id}/com.apple.SoftwareUpdateNotificationManager"; then
		log_super "Warning: Restarting Software Update Notification Manager didn't respond, trying again in 10 seconds..."
		sleep 10
		launchctl kickstart -k "gui/${current_user_id}/com.apple.SoftwareUpdateNotificationManager"
	fi
fi
}

# This function checks for updates via softwareupdate and sets ${asu_available}, ${asu_macos_available}, and ${asu_list} accordingly. This is in a separate function to facilitate list caching and multiple run workflows.
get_asu_list() {
asu_available="FALSE"
asu_macos_available="FALSE"
log_super "softwareupdate: Waiting for available Apple software updates..."

# Background the softwareupdate checking process and send to ${ASU_LIST_LOG}.
sudo -u root softwareupdate --list > "${ASU_LIST_LOG}" 2>&1 &
local get_asu_list_pid
get_asu_list_pid="$!"

# Watch ${ASU_LIST_LOG} while waiting for the softwareupdate list process to complete. Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS}.
get_asu_list_error="TRUE"
get_asu_list_timeout="TRUE"
local get_asu_list_timeout_seconds
get_asu_list_timeout_seconds="${TIMEOUT_START_SECONDS}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: get_asu_list_timeout is: ${get_asu_list_timeout}"
while read -t "${get_asu_list_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c "Can’t connect" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c "Couldn't communicate" ) -gt 0 ]]; then
		break
	elif [[ $(echo "${log_line}" | grep -c 'Software Update found') -gt 0 ]]; then
		asu_available="TRUE"
		get_asu_list_error="FALSE"
		get_asu_list_timeout="FALSE"
		wait "${get_asu_list_pid}"
		break
	elif [[ $(echo "${log_line}" | grep -c 'No new software available.') -gt 0 ]]; then
		get_asu_list_error="FALSE"
		get_asu_list_timeout="FALSE"
		break
	fi
done < <(tail -n1 -F "${ASU_LIST_LOG}")

# If the softwareupdate list completed, then collect information.
if [[ "${get_asu_list_error}" == "FALSE" ]] && [[ "${get_asu_list_timeout}" == "FALSE" ]]; then
	asu_list=$(<"${ASU_LIST_LOG}")
	[[ $(echo "${asu_list}" | grep -c 'macOS') -gt 0 ]] && asu_macos_available="TRUE"
elif [[ "${get_asu_list_error}" == "TRUE" ]]; then
	log_super "softwareupdate Error: Apple software update check failed, check ${ASU_LIST_LOG} for more detail."
	kill -9 "${get_asu_list_pid}" > /dev/null 2>&1
else # "${get_asu_list_timeout}" == "TRUE"
	log_super "softwareupdate Error: Apple software update check failed to complete, as indicated by no progress after watiting for ${get_asu_list_timeout_seconds} seconds."
	kill -9 "${get_asu_list_pid}" > /dev/null 2>&1
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_available is: ${asu_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_available is: ${asu_macos_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: get_asu_list_error is: ${get_asu_list_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: get_asu_list_timeout is: ${get_asu_list_timeout}"
}

# This function evaluates software updates collected from the get_asu_list() function and sets super software update caches, ${asu_macos_minor_update_available}, ${asu_rapid_security_response_available}, and ${asu_non_system_update_available} accordingly.
# This also sets ${asu_all_labels_array}, ${asu_all_titles_array}, ${asu_macos_all_labels_array}, ${asu_macos_all_titles_array}, ${asu_macos_all_versions_array}, ${asu_macos_minor_update_label}, ${asu_macos_minor_update_title}, ${asu_macos_minor_update_version}, ${asu_non_system_update_labels_array}, and ${asu_non_system_update_titles_array}.
workflow_check_asu() {
local workflow_check_asu_error
workflow_check_asu_error="FALSE"
asu_macos_minor_update_available="FALSE"
asu_rapid_security_response_available="FALSE"
asu_non_system_update_available="FALSE"
unset asu_all_labels_array
unset asu_all_titles_array
unset asu_macos_all_labels_array
unset asu_macos_all_titles_array
unset asu_macos_all_versions_array
unset asu_macos_all_sizes_array
unset asu_macos_minor_update_label
unset asu_macos_minor_update_title
unset asu_macos_minor_update_version
unset asu_macos_minor_update_size
unset asu_non_system_update_labels_array
unset asu_non_system_update_titles_array

# Only need to create a new ${asu_list} if a full check is required.
if [[ "${workflow_software_full_check_required}" == "TRUE" ]]; then
	log_super "Status: Starting full check for all available system software..."
	restart_deadline_counters
	restart_workflow_automatic_zero_date
	reset_software_status_caches
	check_macos_beta_program
	get_asu_list
	
	# Double-checking in case softwareupdate is misbehaving.
	if [[ "${get_asu_list_error}" == "TRUE" ]] || [[ "${get_asu_list_timeout}" == "TRUE" ]]; then
		log_super "Warning: Re-starting check for available Apple software updates..."
		kick_softwareupdated
		sleep 10
		get_asu_list
	elif [[ "${macos_version_number}" -lt 1303 ]] && { [[ "${asu_available}" == "FALSE" ]] || [[ "${asu_macos_available}" == "FALSE" ]]; }; then
		log_super "Status: macOS 11.x - macOS 13.2, double-checking for available Apple software updates..."
		kick_softwareupdated
		sleep 10
		get_asu_list
	fi
	
	# If softwareupdate check failed after multiple attempts.
	if [[ "${get_asu_list_error}" == "TRUE" ]] || [[ "${get_asu_list_timeout}" == "TRUE" ]]; then
		log_super "Error: Checking for updates via Apple software update did not complete after multiple attempts."
		workflow_check_asu_error="TRUE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_check_asu_error is: ${workflow_check_asu_error}"

# If no errors, then parse Apple software updates.
if [[ "${workflow_check_asu_error}" == "FALSE" ]]; then
	# Extract software update information from from ${ASU_PLIST} and ${ASU_LIST_LOG}.
	if [[ "${asu_available}" == "TRUE" ]]; then
		# Extract softare update list cache from ${ASU_PLIST} and save to ${SUPER_LOCAL_PLIST}. This is to be used in future runs of the check_software_stauts_caches() function.
		local previous_ifs
		previous_ifs="${IFS}"; IFS=$'\n'
		local asu_recommended_updates_array
		asu_recommended_updates_array=($(defaults read "${ASU_PLIST}" RecommendedUpdates | grep 'Identifier' | sed -e 's/        Identifier = //g' -e 's/"//g' -e 's/;//g'))
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_recommended_updates_array is:\n${asu_recommended_updates_array[*]}"
		defaults delete "${SUPER_LOCAL_PLIST}" ASUListCache 2> /dev/null
		if [[ "${macos_version_major}" -ge 12 ]]; then
			for array_index in "${!asu_recommended_updates_array[@]}"; do
				defaults write "${SUPER_LOCAL_PLIST}" ASUListCache -array-add "${asu_recommended_updates_array[array_index]}"
			done
		else # macOS 11
			defaults write "${SUPER_LOCAL_PLIST}" ASUListCache -string "${#asu_recommended_updates_array[@]}"
		fi
	
		# Parse ${asu_list} for software update labels, titles, and macOS updates.
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_list is:\n${asu_list}"
		if [[ "${macos_version_number}" -ge 1203 ]]; then # For macOS 12.03 or newer softwareupdate can list multiple macOS updates/upgrades.
			asu_all_labels_array=($(echo "${asu_list}" | awk -F ': ' '/Label:/{print $2}'))
			asu_all_titles_array=($(echo "${asu_list}" | awk -F ',' '/Title:/{print $1}' | cut -d ' ' -f 2-))
			asu_macos_all_labels_array=($(echo "${asu_list}" | grep 'Label: macOS' | sed -e 's/* Label: //' | sort -t '-' -k2 -r -V))
			asu_macos_all_titles_array=($(echo "${asu_list}" | grep 'Title: macOS' | tr ',' ':' | sort -t ':' -k4 -r -V | awk -F ': ' '{print $2}'))
			asu_macos_all_versions_array=($(echo "${asu_list}" | grep 'Title: macOS' | tr ',' ':' | sort -t ':' -k4 -r -V | awk -F ': ' '{print $4}'))
			asu_macos_all_sizes_array=($(echo "${asu_list}" | grep 'Title: macOS' | tr ',' ':' | sort -t ':' -k4 -r -V | awk -F ': ' '{print $6}' | grep -o -E '[0-9]+' | awk '{print $1"/1000000 +1"}' | bc))
			asu_macos_minor_update_label=$(echo "${asu_macos_all_labels_array[*]}" | grep "${macos_version_major}.\d")
			asu_macos_minor_update_title=$(echo "${asu_macos_all_titles_array[*]}" | grep "${macos_version_major}.\d")
			asu_macos_minor_update_version=$(echo "${asu_macos_all_versions_array[*]}" | grep "${macos_version_major}.\d")
			asu_macos_minor_update_size=$(echo "${asu_list}" | grep 'Title: macOS' | grep "Version: ${macos_version_major}.\d" | awk -F ': ' '{print $4}' | grep -o -E '[0-9]+' | awk '{print $1"/1000000 +1"}' | bc)
		else # macOS version prior to macOS 12.3.
			asu_all_labels_array=($(echo "${asu_list}" | awk -F ': ' '/Label:/{print $2}'))
			asu_all_titles_array=($(echo "${asu_list}" | awk -F ',' '/Title:/{print $1}' | cut -d ' ' -f 2-))
			asu_macos_minor_update_label=$(echo "${asu_list}" | grep 'Label: macOS' | sed -e 's/* Label: //')
			asu_macos_minor_update_title=$(echo "${asu_list}" | grep 'Title: macOS' | sed -e 's/,/:/g' | awk -F ': ' '{print $2}')
			[[ "${macos_version_major}" -eq 12 ]] && asu_macos_minor_update_version=$(echo "${asu_macos_minor_update_label}" | grep -o '12.\d*.\d*')
			[[ "${macos_version_major}" -eq 11 ]] && asu_macos_minor_update_version=$(echo "${asu_macos_minor_update_label}" | grep -o '11.\d*.\d*')
			asu_macos_minor_update_size=$(echo "${asu_list}" | grep 'Title: macOS' | awk -F ': ' '{print $4}' | grep -o -E '[0-9]+' | awk '{print $1"/1000000 +1"}' | bc)
		fi
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_all_labels_array is:\n${asu_all_labels_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_all_titles_array is:\n${asu_all_titles_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_all_labels_array is:\n${asu_macos_all_labels_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_all_titles_array is:\n${asu_macos_all_titles_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_all_versions_array is:\n${asu_macos_all_versions_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_all_sizes_array is:\n${asu_macos_all_sizes_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_label is: ${asu_macos_minor_update_label}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_title is: ${asu_macos_minor_update_title}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_version is: ${asu_macos_minor_update_version}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_size is: ${asu_macos_minor_update_size}"
		[[ "${asu_all_labels_array[*]}" != "${asu_macos_minor_update_label}" ]] && asu_non_system_update_labels_array=($(echo "${asu_all_labels_array[*]}" | grep -v 'macOS'))
		[[ "${asu_all_titles_array[*]}" != "${asu_macos_minor_update_title}" ]] && asu_non_system_update_titles_array=($(echo "${asu_all_titles_array[*]}" | grep -v 'macOS'))
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_non_system_update_labels_array is:\n${asu_non_system_update_labels_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_non_system_update_titles_array is:\n${asu_non_system_update_titles_array[*]}"
	
		# If software updates were found then output to log and set ${asu_macos_minor_update_available} and ${asu_non_system_update_available} accordingly.
		if [[ -n "${asu_all_labels_array[*]}" ]]; then
			if [[ -n "${asu_macos_minor_update_label}" ]]; then
				if [[ "${macos_version_major}" -ge 12 ]] && [[ "${#asu_macos_all_labels_array[@]}" -gt 1 ]]; then
					log_super "Status: ${#asu_macos_all_labels_array[@]} macOS versions available via Apple software update."
					for array_index in "${!asu_macos_all_labels_array[@]}"; do
						log_super "Status: macOS update/upgrade $((array_index + 1)): ${asu_macos_all_labels_array[array_index]}"
					done
				fi
				if [[ "${macos_version_major}" -ge 13 ]]; then
					[[ $(echo "${asu_macos_minor_update_version}" | grep -c '[a-z]') -gt 0 ]] && asu_rapid_security_response_available="TRUE"
					if [[ "${asu_rapid_security_response_available}" == "TRUE" ]]; then
						if [[ "${install_rapid_security_responses_option}" == "TRUE" ]]; then
							log_super "Status: A macOS Rapid Security Response update is available: ${asu_macos_minor_update_label}."
							asu_macos_minor_update_available="TRUE"
						else # RSR updates should are not allowed.
							log_super "Status: A macOS Rapid Security Response update is available but not allowed: ${asu_macos_minor_update_label}."
						fi
					else
						log_super "Status: A macOS minor update is available: ${asu_macos_minor_update_label}"
						asu_macos_minor_update_available="TRUE"
					fi
				else
					log_super "Status: A macOS minor update is available: ${asu_macos_minor_update_label}"
					asu_macos_minor_update_available="TRUE"
				fi
			else
				log_super "Status: No available macOS minor updates or they may be deferred via configuration profile."
			fi
			if [[ -n "${asu_non_system_update_labels_array[*]}" ]]; then
				log_super "Status: ${#asu_non_system_update_labels_array[@]} available non-system update(s)."
				for array_index in "${!asu_non_system_update_labels_array[@]}"; do
					log_super "Status: Recommended (non-system) update $((array_index + 1)): ${asu_non_system_update_labels_array[array_index]}"
				done
				asu_non_system_update_available="TRUE"
			else
				log_super "Status: No available non-system Apple software updates or they may be deferred via configuration profile."
			fi
		else # No ${asu_all_labels_array[*]}.
			log_super "Error: Unable to parse Apple software update results."
			workflow_check_asu_error="TRUE"
		fi
		IFS="${previous_ifs}"
	else # No available software updates.
		log_super "Status: No available Apple software updates or they may be deferred via configuration profile."
		defaults delete "${SUPER_LOCAL_PLIST}" ASUListCache 2> /dev/null
		defaults write "${SUPER_LOCAL_PLIST}" ASUListCache -bool false
		defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULabel 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULastStartup 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available is: ${asu_macos_minor_update_available}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_rapid_security_response_available is: ${asu_rapid_security_response_available}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_non_system_update_available is: ${asu_non_system_update_available}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_check_asu_error is: ${workflow_check_asu_error}"
fi

# Handle workflow failure options.
if [[ "${workflow_check_asu_error}" == "TRUE" ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_super "Error: Checking for Apple software updates workflow failed, install now workflow can not continue."
		log_status "Inactive Error: Checking for Apple software updates workflow failed, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: Checking for Apple software updates workflow failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Checking for Apple software updates workflow failed, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

# This function leverages the mdmclient command to determine the newest available macOS major upgrades and sets ${macos_major_upgrade_available} accordingly. This is in a separate function to facilitate list caching and multiple run workflows.
# Also sets ${macos_major_upgrade_marketing_name}, ${macos_major_upgrade_version}, and ${macos_major_upgrade_version_major}.
get_macos_major_upgrade() {
get_macos_major_upgrade_error="TRUE"
macos_major_upgrade_available="FALSE"
log_super "mdmclient: Waiting for available macOS major upgrades..."

# Use the mdmclient command to determine the newest available version of macOS and set ${mdmclient_macos_major_upgrade}.
local mdmclient_response
mdmclient_response=$(/usr/libexec/mdmclient AvailableOSUpdates 2> /dev/null)
if [[ -n "${mdmclient_response}" ]]; then
	if [[ $(echo "${mdmclient_response}" | grep -c 'Available updates') -gt 0 ]]; then
		local mdmclient_macos_major_upgrade
		{ [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_beta_program}" == "FALSE" ]]; } && mdmclient_macos_major_upgrade=$(echo "${mdmclient_response}" | grep -e ' HumanReadableName =' -e ' Version =' | tr '\n' '-' | sed -e 's/        HumanReadableName = //g' -e 's/;-        Version = //g' | tr ';-' '\n' | grep -e 'macOS' | sed -e 's/""/:/g' -e 's/"//g' | sort -t: -k2 -r -V | head -1)
		{ [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_beta_program}" == "TRUE" ]]; } && mdmclient_macos_major_upgrade=$(echo "${mdmclient_response}" | grep -e ' HumanReadableName =' -e ' Version =' | tr '\n' '-' | sed -e 's/        HumanReadableName = //g' -e 's/;-        Version = //g' | tr ';-' '\n' | grep -e 'macOS' | grep -e 'beta' -e 'Beta' | sed -e 's/""/:/g' -e 's/"//g' | sort -t: -k2 -r -V | head -1)
		[[ "${macos_version_number}" -lt 1203 ]] && mdmclient_macos_major_upgrade=$(echo "${mdmclient_response}" | grep -e ' HumanReadableName =' -e ' Version =' | tr '\n' '-' | sed -e 's/        HumanReadableName = //g' -e 's/;-        Version = //g' | tr ';-' '\n' | grep -e 'macOS' | sed -e 's/""/:/g' -e 's/"//g' | sort -t: -k2 -r -V | head -1)
	else
		log_super "mdmclient Error: Response did not include a valid list of newer macOS versions."
		return 0
	fi
else
	log_super "mdmclient Error: Response did not include any results."
	return 0
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdmclient_response is:\n${mdmclient_response}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_beta_program is: ${macos_beta_program}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdmclient_macos_major_upgrade is: ${mdmclient_macos_major_upgrade}"

# Parse and validate mdmclient response.
if [[ -n "${mdmclient_macos_major_upgrade}" ]]; then
	macos_major_upgrade_marketing_name=$(echo "${mdmclient_macos_major_upgrade}"| awk -F ':' '{print $1}' | sed -e 's/[0-9]*//g' -e 's/\.*//g' | xargs)
	if [[ ! $(echo "${macos_major_upgrade_marketing_name}" | grep -c 'macOS') -gt 0 ]]; then
			log_super "mdmclient Error: Response did not include a valid macOS upgrade marketing name."
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_marketing_name is: ${macos_major_upgrade_marketing_name}"
			return 0
	fi
	macos_major_upgrade_version=$(echo "${mdmclient_macos_major_upgrade}"| awk -F ':' '{print $2}')
	macos_major_upgrade_version_major=$(echo "${macos_major_upgrade_version}" | cut -d '.' -f1)
	if [[ -n "${macos_major_upgrade_version}" ]] && [[ "${macos_major_upgrade_version_major}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
		get_macos_major_upgrade_error="FALSE"
		[[ "${macos_major_upgrade_version_major}" -gt "${macos_version_major}" ]] && macos_major_upgrade_available="TRUE"
	else
		log_super "mdmclient Error: Response did not include a valid macOS upgrade version number."
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version is: ${macos_major_upgrade_version}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major is: ${macos_major_upgrade_version_major}"
		return 0
	fi
else # No macOS major upgrade.
	macos_major_upgrade_marketing_name="FALSE"
	macos_major_upgrade_version="FALSE"
	macos_major_upgrade_version_major="FALSE"
	get_macos_major_upgrade_error="FALSE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: get_macos_major_upgrade_error is: ${get_macos_major_upgrade_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_marketing_name is: ${macos_major_upgrade_marketing_name}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version is: ${macos_major_upgrade_version}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major is: ${macos_major_upgrade_version_major}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_available is: ${macos_major_upgrade_available}"
}

# This function leverages mist-cli to create the ${INSTALLER_LIST_LOG} and set ${macos_installers_list}. This is in a separate function to facilitate list caching and multiple run workflows.
get_macos_installers_list() {
# Background the mist-cli list process and send to ${INSTALLER_LIST_LOG}.
local get_macos_installers_list_pid
if [[ "${macos_beta_program}" == "FALSE" ]]; then
	"${MIST_CLI_BINARY}" list installer --output-type csv --no-ansi --compatible > "${INSTALLER_LIST_LOG}" 2>&1 &
	get_macos_installers_list_pid="$!"
else # macOS beta workflow.
	"${MIST_CLI_BINARY}" list installer --output-type csv --no-ansi --compatible --include-betas > "${INSTALLER_LIST_LOG}" 2>&1 &
	get_macos_installers_list_pid="$!"
fi

# Watch ${INSTALLER_LIST_LOG} while waiting for the mist-cli list process to complete. Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS}.
get_macos_installers_list_error="TRUE"
get_macos_installers_list_timeout="TRUE"
local get_macos_installers_list_timeout_seconds
get_macos_installers_list_timeout_seconds="${TIMEOUT_START_SECONDS}"
while read -t "${get_macos_installers_list_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c 'SEARCH') -gt 0 ]]; then
		log_super "mist-cli: Waiting for macOS installers list..."
	elif [[ $(echo "${log_line}" | grep -c 'Found 0') -gt 0 ]]; then
		get_macos_installers_list_timeout="FALSE"
		break
	elif [[ $(echo "${log_line}" | grep -c 'Found') -gt 0 ]]; then
		get_macos_installers_list_error="FALSE"
		get_macos_installers_list_timeout="FALSE"
		break
	fi
done < <(tail -n1 -F "${INSTALLER_LIST_LOG}")

# If the mist-cli list completed, then collect information.
if [[ "${get_macos_installers_list_timeout}" == "FALSE" ]] && [[ "${get_macos_installers_list_error}" == "FALSE" ]]; then
	macos_installers_list=$(<"${INSTALLER_LIST_LOG}")
elif [[ "${get_macos_installers_list_timeout}" == "TRUE" ]]; then
	log_super "mist-cli Error: macOS installers list failed to complete, as indicated by no progress after watiting for ${get_macos_installers_list_timeout_seconds} seconds."
	kill -9 "${get_macos_installers_list_pid}" > /dev/null 2>&1
elif [[ "${get_macos_installers_list_error}" == "TRUE" ]]; then
	log_super "mist-cli Error: macOS installers list failed, check ${INSTALLER_LIST_LOG} for more detail."
	kill -9 "${get_macos_installers_list_pid}" > /dev/null 2>&1
fi
}

# This function evaluates macOS upgrade information collected from the workflow_check_asu(), get_macos_major_upgrade(), and get_macos_installers_list() functions to save cache information and set ${macos_major_upgrade_version_major_target} accordingly.
# For systems that can upgrade via Apple software update this alos sets ${asu_macos_major_upgrade_available}, ${asu_macos_major_upgrade_label_target}, ${asu_macos_major_upgrade_title_target}, ${asu_macos_major_upgrade_version_target}, ${asu_macos_major_upgrade_version_major_target}, and ${asu_macos_major_upgrade_size_target}.
# For systems that can only upgrade via installer application this also sets ${macos_installer_id_target}, ${macos_installer_marketing_name_target}, ${macos_installer_version_target}, ${macos_installer_version_major_target}, ${macos_installer_build_target}, ${macos_installer_size_target}, and ${macos_installer_date_target}.
workflow_check_macos_major_upgrades() {
local workflow_check_macos_major_upgrades_error
workflow_check_macos_major_upgrades_error="FALSE"
asu_macos_major_upgrade_available="FALSE"
macos_major_upgrade_version_major_target="FALSE"
unset asu_macos_major_upgrade_label_target
unset asu_macos_major_upgrade_title_target
unset asu_macos_major_upgrade_version_target
unset asu_macos_major_upgrade_version_major_target
unset asu_macos_major_upgrade_size_target
unset macos_installer_id_target
unset macos_installer_marketing_name_target
unset macos_installer_version_target
unset macos_installer_version_major_target
unset macos_installer_build_target
unset macos_installer_size_target
unset macos_installer_date_target

# Only need to check for a newer macOS major version if a full check is required.
if [[ "${workflow_software_full_check_required}" == "TRUE" ]]; then
	get_macos_major_upgrade
	
	# Double-checking in case mdmclient is misbehaving.
	if [[ "${get_macos_major_upgrade_error}" == "TRUE" ]]; then
		log_super "Warning: Re-starting check for macOS major upgrades..."
		kick_softwareupdated
		sleep 10
		get_macos_major_upgrade
	elif [[ "${macos_version_number}" -lt 1303 ]] && [[ "${macos_major_upgrade_available}" == "FALSE" ]]; then
		log_super "Status: macOS 11.x - macOS 13.2, double-checking for macOS major upgrades..."
		kick_softwareupdated
		sleep 10
		get_macos_major_upgrade
	fi
	
	# If mdmclient macOS major upgrade check failed after multiple attempts.
	if [[ "${get_macos_major_upgrade_error}" == "TRUE" ]]; then
		log_super "Error: Checking for macOS major upgrades did not complete after multiple attempts."
		workflow_check_macos_major_upgrades_error="TRUE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_check_macos_major_upgrades_error is: ${workflow_check_macos_major_upgrades_error}"

# If no errors, then only continue this function if there are allowed macOS major upgrades.
if [[ "${workflow_check_macos_major_upgrades_error}" == "FALSE" ]]; then
	if [[ "${macos_major_upgrade_available}" == "TRUE" ]]; then
		log_super "Status: A macOS major upgrade is available: ${macos_major_upgrade_marketing_name} ${macos_major_upgrade_version}"
		defaults write "${SUPER_LOCAL_PLIST}" macOSNewestMarketingNameCache -string "${macos_major_upgrade_marketing_name}"
		defaults write "${SUPER_LOCAL_PLIST}" macOSNewestVersionCache -string "${macos_major_upgrade_version}"
		if [[ "${install_macos_major_upgrades_option}" == "FALSE" ]]; then
			log_super "Warning: To install macOS major upgrades you must enable the --install-macos-major-upgrades option."
			return 0
		fi
	else
		log_super "Status: No available macOS major upgrades or they may be deferred via configuration profile."
		defaults write "${SUPER_LOCAL_PLIST}" macOSNewestMarketingNameCache -bool false
		defaults write "${SUPER_LOCAL_PLIST}" macOSNewestVersionCache -bool false
		return 0
	fi
	local previous_ifs
	previous_ifs="${IFS}"; IFS=$'\n'
	
	# If macOS major upgrade possible via Apple software update then validate if ${asu_macos_all_versions_array[0]} is newer than ${macos_version_major}.
	if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then # macOS major upgrade possible via Apple software update.
		[[ $(echo "${asu_macos_all_versions_array[0]}" | cut -d '.' -f1) -gt "${macos_version_major}" ]] && asu_macos_major_upgrade_available="TRUE"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_all_versions_array is:\n${asu_macos_all_versions_array[*]}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_available is: ${asu_macos_major_upgrade_available}"
	else # macOS major upgrade only possible via installer application, so get ${macos_installers_list_array}.
		if [[ "${workflow_software_full_check_required}" == "TRUE" ]]; then
			get_macos_installers_list
			
			# Double-checking in case macOS installer list workflows are misbehaving.
			if [[ "${get_macos_installers_list_error}" == "TRUE" ]] || [[ "${get_macos_installers_list_timeout}" == "TRUE" ]]; then
				log_super "Warning: Re-starting check for macOS installers..."
				get_macos_installers_list
			fi
			
			# If the macOS installer list worked, the create ${macos_installers_list_array}.
			if [[ "${get_macos_installers_list_error}" == "FALSE" ]] && [[ "${get_macos_installers_list_timeout}" == "FALSE" ]]; then
				local macos_installers_list_array
				macos_installers_list_array=($(echo "${macos_installers_list}" | sed -n 's/"/"/p' | sed -e 's/"//g' -e 's/=//g'))
			fi
		else # Use cached ${macos_installers_list}.
			local macos_installers_list_array
			macos_installers_list_array=($(echo "${macos_installers_list}" | sed -n 's/"/"/p' | sed -e 's/"//g' -e 's/=//g'))
		fi
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installers_list is:\n${macos_installers_list}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installers_list_array is:\n${macos_installers_list_array[*]}"
		
		# Handle any workflow errors.
		if [[ "${get_macos_installers_list_error}" == "TRUE" ]] || [[ "${get_macos_installers_list_timeout}" == "TRUE" ]] || [[ -z "${macos_installers_list_array[*]}" ]]; then
			if [[ "${get_macos_installers_list_error}" == "TRUE" ]] || [[ "${get_macos_installers_list_timeout}" == "TRUE" ]]; then
				log_super "Error: Checking for macOS installers did not complete after multiple attempts."
			else # Missing ${macos_installers_list_array[*]}.
				log_super "Error: No list of compatible macOS installers was returned."
			fi
			workflow_check_macos_major_upgrades_error="FALSE"
		fi
	fi
	
	# Evaluate conditions necessary to set ${macos_major_upgrade_version_major_target}.
	if [[ -n "${install_macos_major_version_target_option}" ]] && [[ "${workflow_check_macos_major_upgrades_error}" == "FALSE" ]]; then
		if [[ "${install_macos_major_version_target_option}" -lt "${macos_version_major}" ]] || [[ "${install_macos_major_version_target_option}" -eq "${macos_version_major}" ]]; then
			[[ "${install_macos_major_version_target_option}" -lt "${macos_version_major}" ]] && log_super "Warning: The --install-macos-major-version-target=${install_macos_major_version_target_option} is less than currently installed macOS ${macos_version_major}."
			[[ "${install_macos_major_version_target_option}" -eq "${macos_version_major}" ]] && log_super "Status: The --install-macos-major-version-target=${install_macos_major_version_target_option} is the same as currently installed macOS ${macos_version_major}."
			macos_major_upgrade_version_major_target="FALSE"
			if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then
				log_super "Status: A macOS major upgrade is available via Apple software update but not allowed: ${asu_macos_all_titles_array[0]}"
			else
				log_super "Status: A macOS major upgrade is available via installer application but not allowed: ${macos_major_upgrade_marketing_name} ${macos_major_upgrade_version}"
			fi
		else # The ${macos_major_upgrade_version_major_target} is greater than current macOS version, so validate target.
			if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then # macOS major upgrade possible via Apple software update.
				asu_macos_major_upgrade_version_major_target=$(echo "${asu_macos_all_versions_array[0]}" | cut -d '.' -f1)
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_version_major_target is: ${asu_macos_major_upgrade_version_major_target}"
				if [[ "${install_macos_major_version_target_option}" -gt "${asu_macos_major_upgrade_version_major_target}" ]]; then  # The ${macos_major_upgrade_version_major_target} is greater than the newest available macOS major upgrade via Apple software update.
					log_super "Warning: Requested --install-macos-major-version-target=${install_macos_major_version_target_option} is greater than the currently available Apple software update version of ${asu_macos_major_upgrade_version_major_target}."
					asu_macos_major_upgrade_label_target="${asu_macos_all_labels_array[0]}"
					asu_macos_major_upgrade_title_target="${asu_macos_all_titles_array[0]}"
					asu_macos_major_upgrade_version_target="${asu_macos_all_versions_array[0]}"
					asu_macos_major_upgrade_size_target="${asu_macos_all_sizes_array[0]}"
					log_super "Status: A macOS major upgrade is available via Apple software update: ${asu_macos_major_upgrade_label_target}"
				else # The ${macos_major_upgrade_version_major_target} is lower than the newest available macOS major upgrade via Apple software update.
					for array_index in "${!asu_macos_all_versions_array[@]}"; do
						asu_macos_major_upgrade_version_major_target=$(echo "${asu_macos_all_versions_array[array_index]}" | cut -d '.' -f1)
						[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_version_major_target is: ${asu_macos_major_upgrade_version_major_target}"
						if [[ "${install_macos_major_version_target_option}" == "${asu_macos_major_upgrade_version_major_target}" ]]; then
							asu_macos_major_upgrade_label_target="${asu_macos_all_labels_array[array_index]}"
							asu_macos_major_upgrade_title_target="${asu_macos_all_titles_array[array_index]}"
							asu_macos_major_upgrade_version_target="${asu_macos_all_versions_array[array_index]}"
							asu_macos_major_upgrade_size_target="${asu_macos_all_sizes_array[array_index]}"
							break
						fi
					done
					log_super "Status: Targeting a specific macOS major upgrade via Apple software update: ${asu_macos_major_upgrade_label_target}"
				fi
				macos_major_upgrade_version_major_target="${asu_macos_major_upgrade_version_major_target}"
			else # macOS major upgrade only possible via installer application.
				macos_installer_version_major_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $3;}' | cut -d '.' -f1)
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_version_major_target is: ${macos_installer_version_major_target}"
				if [[ "${install_macos_major_version_target_option}" -gt "${macos_installer_version_major_target}" ]]; then # macOS upgrade target is greater than the newest available macOS installer.
					log_super "Warning: Requested --install-macos-major-version-target=${install_macos_major_version_target_option} is greater than the currently available macOS installer version of ${macos_installer_version_major_target}."
					macos_installer_id_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $1;}')
					macos_installer_marketing_name_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $2;}')
					macos_installer_version_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $3;}')
					macos_installer_build_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $4;}')
					macos_installer_size_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $5;}' | awk '{print $1"/1000000000 +1"}' | bc)
					macos_installer_date_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $6;}')
					log_super "Status: A macOS major upgrade is available via installer application: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target}"
				else # macOS upgrade target is lower than the newest available macOS installer.
					for macos_installers_list_line in "${macos_installers_list_array[@]}"; do
						macos_installer_version_major_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $3;}' | cut -d '.' -f1)
						[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_version_major_target is: ${macos_installer_version_major_target}"
						if [[ "${install_macos_major_version_target_option}" == "${macos_installer_version_major_target}" ]]; then
							macos_installer_id_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $1;}')
							macos_installer_marketing_name_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $2;}')
							macos_installer_version_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $3;}')
							macos_installer_build_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $4;}')
							macos_installer_size_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $5;}' | awk '{print $1"/1000000000 +1"}' | bc)
							macos_installer_date_target=$(echo "${macos_installers_list_line}" | awk -F ',' '{print $6;}')
							break
						fi
					done
					log_super "Status: Targeting a specific macOS major upgrade via installer application: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target}"
				fi
				macos_major_upgrade_version_major_target="${macos_installer_version_major_target}"
			fi
		fi
	elif [[ "${workflow_check_macos_major_upgrades_error}" == "FALSE" ]]; then # There is no ${macos_major_upgrade_version_major_target}, so assume newest available macOS major upgrade is the target.
		if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then # macOS major upgrade possible via Apple software update.
			asu_macos_major_upgrade_label_target="${asu_macos_all_labels_array[0]}"
			asu_macos_major_upgrade_title_target="${asu_macos_all_titles_array[0]}"
			asu_macos_major_upgrade_version_target="${asu_macos_all_versions_array[0]}"
			asu_macos_major_upgrade_version_major_target=$(echo "${asu_macos_all_versions_array[0]}" | cut -d '.' -f1)
			asu_macos_major_upgrade_size_target="${asu_macos_all_sizes_array[0]}"
			log_super "Status: A macOS major upgrade is available via Apple software update: ${asu_macos_major_upgrade_label_target}"
			macos_major_upgrade_version_major_target="${asu_macos_major_upgrade_version_major_target}"
		else # macOS major upgrade only possible via installer application.
			macos_installer_id_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $1;}')
			macos_installer_marketing_name_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $2;}')
			macos_installer_version_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $3;}')
			macos_installer_version_major_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $3;}' | cut -d '.' -f1)
			macos_installer_build_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $4;}')
			macos_installer_size_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $5;}' | awk '{print $1"/1000000000 +1"}' | bc)
			macos_installer_date_target=$(echo "${macos_installers_list_array[0]}" | awk -F ',' '{print $6;}')
			log_super "Status: A macOS major upgrade is available via installer application: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target}"
			macos_major_upgrade_version_major_target="${macos_installer_version_major_target}"
		fi
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_label_target is: ${asu_macos_major_upgrade_label_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_title_target is: ${asu_macos_major_upgrade_title_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_version_target is: ${asu_macos_major_upgrade_version_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_version_major_target is: ${asu_macos_major_upgrade_version_major_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_size_target is: ${asu_macos_major_upgrade_size_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_id_target is: ${macos_installer_id_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_marketing_name_target is: ${macos_installer_marketing_name_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_version_target is: ${macos_installer_version_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_version_major_target is: ${macos_installer_version_major_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_build_target is: ${macos_installer_build_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_size_target is: ${macos_installer_size_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_date_target is: ${macos_installer_date_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
	IFS="${previous_ifs}"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_check_macos_major_upgrades_error is: ${workflow_check_macos_major_upgrades_error}"

# Handle workflow failure options.
if [[ "${workflow_check_macos_major_upgrades_error}" == "TRUE" ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_super "Error: Checking for macOS major upgrades workflow failed, install now workflow can not continue."
		log_status "Inactive Error: Checking for macOS major upgrades workflow failed, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: Checking for macOS major upgrades workflow failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Checking for macOS major upgrades workflow failed, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

# This function checks the macOS upgrade/update status after a previous super macOS upgrade/update restart.
workflow_restart_validate() {
workflow_software_full_check_required="TRUE"
workflow_check_asu
workflow_check_macos_major_upgrades
check_macos_downloads

# Install any non-system Apple software updates.
if [[ "${asu_non_system_update_available}" == "TRUE" ]]; then
	install_non_system_asu
	if [[ "${install_non_system_asu_error}" != "TRUE" ]]; then
		log_super "Status: Completed installation of all non-system Apple software updates!"
	else
		log_super "Warning: Failed to install all non-system Apple software updates."
	fi
	workflow_software_full_check_required="TRUE"
	workflow_check_asu
	workflow_check_macos_major_upgrades
	check_macos_downloads
fi

# Log status of updates/upgrade completion.
if [[ "${asu_non_system_update_available}" == "FALSE" ]] && [[ "${asu_macos_minor_update_available}" == "FALSE" ]] && { [[ "${macos_major_upgrade_available}" == "FALSE" ]] || { [[ "${macos_major_upgrade_available}" == "TRUE" ]] && [[ "${install_macos_major_upgrades_option}" != "TRUE" ]]; }; }; then
	log_super "Status: All available and enabled Apple software updates/upgrades completed!"
	workflow_software_full_check_required="FALSE"
else
	log_super "Warning: Some Apple software updates/upgrades did not complete after last restart, continuing workflow."
fi

# For computers managed via Jamf Pro, submit inventory and check for policies.
if [[ "${jamf_version}" != "FALSE" ]]; then
	if [[ "${auth_error_jamf}" != "TRUE" ]]; then
		log_super "Status: Submitting updated inventory to Jamf Pro. Use --verbose-mode or check /var/log/jamf.log for more detail..."
		local jamf_response
		if [[ "${verbose_mode_option}" == "TRUE" ]]; then
			jamf_response=$("${JAMF_PRO_BINARY}" recon -verbose 2>&1)
			log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_response is:\n${jamf_response}"
		else
			"${JAMF_PRO_BINARY}" recon > /dev/null 2>&1
		fi
		sleep 5
		log_super "Status: Running Jamf Pro check-in policies. Use --verbose-mode or check /var/log/jamf.log for more detail..."
		if [[ "${verbose_mode_option}" == "TRUE" ]]; then
			jamf_response=$("${JAMF_PRO_BINARY}" policy -verbose 2>&1)
			log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_response is:\n${jamf_response}"
		else
			"${JAMF_PRO_BINARY}" policy > /dev/null 2>&1
		fi
	else # There was an earlier Jamf Pro validation error.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: Unable to submit inventory or perform check-in via Jamf Pro, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Unable to submit inventory or perform check-in via Jamf Pro, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: Local preference file after workflow_restart_validate: ${SUPER_LOCAL_PLIST}:\n$(defaults read "${SUPER_LOCAL_PLIST}" 2> /dev/null)"
}

# MARK: *** Downloads ***
################################################################################

# This function determines which macOS updates, upgrades, or installers should be downloaded and validates any previously downloaded macOS updates, upgrades, or installers and sets ${download_macos_installer_required}, ${download_maocs_asu_required}, ${asu_macos_label_target}, and ${asu_macos_title_target} accordingly.
check_macos_downloads() {
download_macos_installer_required="FALSE"
download_maocs_asu_required="FALSE"
unset asu_macos_label_target
unset asu_macos_title_target

# If needed, evaluate previously downloaded macOS installer and set ${download_macos_installer_required} accordingly.
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_version_number is: ${macos_version_number}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available is: ${asu_macos_minor_update_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_available is: ${macos_major_upgrade_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_auth_macos is: ${workflow_auth_macos}"
if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]] && { [[ "${macos_version_number}" -lt 1203 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_version_major}" -lt 13 ]] && [[ "${workflow_auth_macos}" == "JAMF" ]]; }; }; then
	local downloaded_macos_installer
	downloaded_macos_installer=$(defaults read "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: downloaded_macos_installer is: ${downloaded_macos_installer}"
	if [[ -d "/Applications/Install ${macos_installer_marketing_name_target}.app" ]]; then
		check_macos_installer
		if [[ "${macos_installer_error}" == "TRUE" ]]; then
			[[ -n "${downloaded_macos_installer}" ]] && log_super "Warning: Previously downloaded macOS installer failed local validations, removing installer: /Applications/Install ${macos_installer_marketing_name_target}.app."
			[[ -z "${downloaded_macos_installer}" ]] && log_super "Warning: Existing macOS installer failed local validations, removing installer: /Applications/Install ${macos_installer_marketing_name_target}.app."
			download_macos_installer_required="TRUE"
			defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null
			rm -Rf "/Applications/Install ${macos_installer_marketing_name_target}.app" > /dev/null 2>&1
			restart_workflow_automatic_zero_date
		fi
		defaults write "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller -string "${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target}"
	else # No local macOS installer.
		[[ -n "${downloaded_macos_installer}" ]] && log_super "Warning: Previously downloaded macOS installer could not be found."
		download_macos_installer_required="TRUE"
		defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null
		restart_workflow_automatic_zero_date
	fi
elif [[ "${asu_macos_minor_update_available}" == "TRUE" ]] || [[ "${macos_major_upgrade_available}" == "TRUE" ]]; then # Evaluate previously downloaded macOS updates or upgrades and compare them to currently available, setting ${download_maocs_asu_required} accordingly.
	if [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # macOS 12.3 or newer can upgrade via softwareupdate.
		asu_macos_label_target="${asu_macos_major_upgrade_label_target}"
		asu_macos_title_target="${asu_macos_major_upgrade_title_target}"
	else # macOS minor update.
		asu_macos_label_target="${asu_macos_minor_update_label}"
		asu_macos_title_target="${asu_macos_minor_update_title}"
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_label_target is: ${asu_macos_label_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_title_target is: ${asu_macos_title_target}"
	downloaded_macos_asu_label=$(defaults read "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULabel 2> /dev/null)
	local downloaded_macos_asu_last_startup
	downloaded_macos_asu_last_startup=$(defaults read "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULastStartup 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: downloaded_macos_asu_label is: ${downloaded_macos_asu_label}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: downloaded_macos_asu_last_startup is: ${downloaded_macos_asu_last_startup}"
	# Only validate if we know the list of previous downloads and last startup time.
	if [[ -n "${downloaded_macos_asu_label}" ]] && [[ -n "${downloaded_macos_asu_last_startup}" ]]; then
		local downloaded_asu_error
		downloaded_asu_error="FALSE"
		if [[ "${downloaded_macos_asu_label}" != "${asu_macos_label_target}" ]]; then
			log_super "Warning: Previously downloaded macOS update/upgrade \"${downloaded_macos_asu_label}\" does not match the expected macOS update/upgrade \"${asu_macos_label_target}\", download workflow needs to run again."
			downloaded_asu_error="TRUE"
			restart_workflow_automatic_zero_date
		fi
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mac_last_startup is: ${mac_last_startup}"
		if [[ "${downloaded_macos_asu_last_startup}" != "${mac_last_startup}" ]]; then
			log_super "Warning: The system has been restarted without applying the previously downloaded macOS update/upgrade, download workflow needs to run again."
			downloaded_asu_error="TRUE"
		fi
		# Only validate prepared macOS update/upgrade if needed.
		if [[ "${asu_macos_minor_update_available}" == "TRUE" ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; }; then
			local update_asset_attributes
			update_asset_attributes=$(defaults read /System/Volumes/Update/Update update-asset-attributes 2> /dev/null)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: update_asset_attributes is:\n${update_asset_attributes}"
			local prepared_macos_version
			prepared_macos_version=$(echo "${update_asset_attributes}" | grep -w 'OSVersion' | awk -F '"' '{print $2}')
			if [[ ${macos_version_major} -ge 13 ]]; then
				local prepared_macos_version_extra
				prepared_macos_version_extra=$(echo "${update_asset_attributes}" | grep -w 'ProductVersionExtra' | awk -F '"' '{print $2}')
				[[ -n "${prepared_macos_version_extra}" ]] && prepared_macos_version="${prepared_macos_version} ${prepared_macos_version_extra}"
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: prepared_macos_version_extra is: ${prepared_macos_version_extra}"
			fi
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: prepared_macos_version is: ${prepared_macos_version}"
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_major_upgrade_version_target is: ${asu_macos_major_upgrade_version_target}"
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_version is: ${asu_macos_minor_update_version}"
			if [[ -z "${prepared_macos_version}" ]]; then
				log_super "Warning: Previously downloaded macOS update/upgrade is no longer valid, download workflow needs to run again."
				downloaded_asu_error="TRUE"
			else
				if { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; } && [[ "${prepared_macos_version}" != "${asu_macos_major_upgrade_version_target}" ]]; then
					log_super "Warning: Previously downloaded macOS upgrade version ${prepared_macos_version} doesn't match expected version ${asu_macos_major_upgrade_version_target}, download workflow needs to run again."
					downloaded_asu_error="TRUE"
				fi
				if [[ "${macos_major_upgrade_version_major_target}" == "FALSE" ]] && [[ "${prepared_macos_version}" != "${asu_macos_minor_update_version}" ]]; then
					log_super "Warning: Previously downloaded macOS update version ${prepared_macos_version} doesn't match expected version ${asu_macos_minor_update_version}, download workflow needs to run again."
					downloaded_asu_error="TRUE"
				fi
			fi
			if [[ "${downloaded_asu_error}" == "TRUE" ]]; then
				download_maocs_asu_required="TRUE"
				defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULabel 2> /dev/null
				defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULastStartup 2> /dev/null
			fi
		fi
	else
		download_maocs_asu_required="TRUE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_required is: ${download_macos_installer_required}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_maocs_asu_required is: ${download_maocs_asu_required}"
}

# This function checks the macOS installer to be used for upgrades matches the ${macos_installer_build_target} and passes Gatekeeper validation.
check_macos_installer() {
macos_installer_error="FALSE"
log_super "Status: Validating macOS major upgrade /Applications/Install ${macos_installer_marketing_name_target}.app..."

# First check to see if the downloaded macOS installer build version matches the ${macos_installer_build_target}.
[[ -d "/Volumes/Shared Support" ]] && diskutil unmount force "/Volumes/Shared Support" > /dev/null 2>&1
sleep 1
if [[ -f "/Applications/Install ${macos_installer_marketing_name_target}.app/Contents/SharedSupport/SharedSupport.dmg" ]]; then
	local hidiutil_response
	hidiutil_response=$(hdiutil attach -quiet -noverify -nobrowse "/Applications/Install ${macos_installer_marketing_name_target}.app/Contents/SharedSupport/SharedSupport.dmg" 2>&1)
	sleep 1
	if [[ -d "/Volumes/Shared Support" ]]; then
		if [[ -f "/Volumes/Shared Support/com_apple_MobileAsset_MacSoftwareUpdate/com_apple_MobileAsset_MacSoftwareUpdate.xml" ]]; then
			downloaded_macos_installer_build=$(/usr/libexec/PlistBuddy -c "Print :Assets:0:Build" "/Volumes/Shared Support/com_apple_MobileAsset_MacSoftwareUpdate/com_apple_MobileAsset_MacSoftwareUpdate.xml")
			sleep 1
			diskutil unmount force "/Volumes/Shared Support" > /dev/null 2>&1
			if [[ -n "${downloaded_macos_installer_build}" ]]; then
				if [[ "${downloaded_macos_installer_build}" != "${macos_installer_build_target}" ]]; then
					log_super "Status: Currently downloaded macOS installer build number ${downloaded_macos_installer_build} does not match target build number ${macos_installer_build_target}."; macos_installer_error="TRUE"
				fi
			else
				log_super "Status: Unable to resolve the macOS installer build version."; macos_installer_error="TRUE"
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: downloaded_macos_installer_build is: ${downloaded_macos_installer_build}"
			fi
		else
			log_super "Status: Unable to locate macOS installer com_apple_MobileAsset_MacSoftwareUpdate.xml file for validation."; macos_installer_error="TRUE"
		fi
	else
		log_super "Status: Unable to mount macOS installer SharedSupport.dmg for validation."; macos_installer_error="TRUE"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: hidiutil_response is:\n${hidiutil_response}"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_error is: ${macos_installer_error}"

# If there are no errors, then move on to gatekeeper validation.
if [[ "${macos_installer_error}" == "FALSE" ]]; then
	local startosinstall_response
	startosinstall_response=$("/Applications/Install ${macos_installer_marketing_name_target}.app/Contents/Resources/startosinstall" --usage 2>&1)
	if [[ $(echo "${startosinstall_response}" | grep -c 'Usage: startosinstall') -eq 0 ]]; then
		log_super "Status: Currently downloaded macOS installer failed Gatekeepr validation."; macos_installer_error="TRUE"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: startosinstall_response is:\n${startosinstall_response}"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_installer_error is: ${macos_installer_error}"
}

# Delete any unneeded macOS installers based on the value of ${macos_major_upgrade_version_major_target} in order to save space.
delete_unneeded_macos_installers() {
local previous_ifs
previous_ifs="${IFS}"; IFS=$'\n'
local mdfind_macos_installers_array
mdfind_macos_installers_array=($(mdfind kind:app -name "Install macOS" 2> /dev/null))
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdfind_macos_installers_array is:\n${mdfind_macos_installers_array[*]}"
if [[ -n "${mdfind_macos_installers_array[*]}" ]]; then
	for macos_installer_path in "${mdfind_macos_installers_array[@]}"; do
		if [[ $(echo "${macos_installer_path}" | grep -c '/Users/') -gt 0 ]] && [[ $(echo "${macos_installer_path}" | grep -c '/Users/.*/Applications/') -eq 0 ]] && [[ $(echo "${macos_installer_path}" | grep -c '/Users/.*/Desktop/') -eq 0 ]] && [[ $(echo "${macos_installer_path}" | grep -c '/Users/.*/Downloads/') -eq 0 ]]; then
			log_super "Status: Skipping deletion of assumed archived macOS installer at: ${macos_installer_path}"
		else
			if [[ "${macos_major_upgrade_version_major_target}" == "FALSE" ]]; then
				if [[ "${test_mode_option}" == "TRUE" ]]; then # Test mode.
					log_super "Test Mode: macOS upgrades are not allowed, found unnecessary macOS installer at: ${macos_installer_path}"
				else # Normal workflow.
					log_super "Warning: macOS upgrades are not allowed, removing unnecessary macOS installer at: ${macos_installer_path}"
					rm -Rf "${macos_installer_path}" > /dev/null 2>&1
				fi
			elif [[ "${macos_installer_path}" != "/Applications/Install ${macos_installer_marketing_name_target}.app" ]]; then
				if [[ "${test_mode_option}" == "TRUE" ]]; then # Test mode.
					log_super "Test Mode: Found unnecessary macOS installer at: ${macos_installer_path}"
				else # Normal workflow.
					log_super "Warning: Removing unnecessary macOS installer at: ${macos_installer_path}"
					rm -Rf "${macos_installer_path}" > /dev/null 2>&1
				fi
			fi
		fi
	done
fi
IFS="${previous_ifs}"
}

# Download macOS update or upgrade via softwareupdate command, and also save results to ${SUPER_LOG}, ${ASU_WORKFLOW_LOG}, and ${SUPER_LOCAL_PLIST}.
download_macos_asu() {
log_super "softwareupdate: Starting ${asu_macos_title_target} download workflow, check ${ASU_WORKFLOW_LOG} for more detail."
log_status "Running: softwareupdate: Starting ${asu_macos_title_target} download workflow."
log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD ${asu_macos_title_target} VIA SOFTWAREUPDATE START ****"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_label_target is:\n${asu_macos_label_target[*]}"

# The softwareupdate download process is backgrounded and is watched via a while loop later on. Also note the difference between macOS versions.
local download_macos_asu_pid
if [[ "${macos_version_major}" -ge 13 ]]; then # macOS 13+
	if [[ "${mac_cpu_architecture}" == "arm64" ]]; then  # Apple Silicon.
		echo ' ' | launchctl asuser "${current_user_id}" sudo -u "${current_user_account_name}" softwareupdate --download "${asu_macos_label_target}" --agree-to-license --user "${current_user_account_name}" --stdinpass >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	else # Intel.
		launchctl asuser "${current_user_id}" sudo -u "${current_user_account_name}" softwareupdate --download "${asu_macos_label_target}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	fi
elif [[ "${macos_version_major}" -ge 12 ]]; then # macOS 12
	if [[ "${mac_cpu_architecture}" == "arm64" ]]; then  # Apple Silicon.
		launchctl asuser "${current_user_id}" sudo -u root softwareupdate --download "${asu_macos_label_target}" --agree-to-license --user "root" --stdinpass "" >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	else # Intel.
		launchctl asuser "${current_user_id}" sudo -u root softwareupdate --download "${asu_macos_label_target}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	fi
else # macOS 11
	if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
		echo ' ' | softwareupdate --download "${asu_macos_label_target}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
	else # Intel.
		softwareupdate --download "${asu_macos_label_target}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	fi
fi

# Watch ${ASU_WORKFLOW_LOG} while waiting for the softwareupdate download workflow to complete.
# Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS} then changes to ${TIMEOUT_ASU_SYSTEM_SECONDS}.
local download_macos_asu_start_error
download_macos_asu_start_error="TRUE"
local download_macos_asu_start_timeout
download_macos_asu_start_timeout="TRUE"
local download_macos_asu_timeout_error
download_macos_asu_timeout_error="TRUE"
local download_macos_asu_timeout_seconds
download_macos_asu_timeout_seconds="${TIMEOUT_START_SECONDS}"
local download_macos_asu_phase
download_macos_asu_phase="START"
local download_macos_asu_complete_perecent
download_macos_asu_complete_perecent=0
local download_macos_asu_complete_perecent_previous
download_macos_asu_complete_perecent_previous=0
local download_macos_asu_complete_display
unset downloaded_macos_asu_title
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_timeout_seconds is: ${download_macos_asu_timeout_seconds}"
while read -t "${download_macos_asu_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c "Can’t connect" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c "Couldn't communicate" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'No such update' ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'Failed to download' ) -gt 0 ]]; then
		download_macos_asu_start_error="CONNECT"
		break
	elif [[ $(echo "${log_line}" | grep -c 'No such update' ) -gt 0 ]]; then
		download_macos_asu_start_error="NOUPDATE"
		break
	elif [[ $(echo "${log_line}" | grep -c 'Not enough free disk space' ) -gt 0 ]]; then
		download_macos_asu_start_error="SPACE"
		break
	elif [[ $(echo "${log_line}" | grep -c 'Failed to download & prepare' ) -gt 0 ]]; then
		download_macos_asu_start_error="FAILED"
		break
	elif [[ $(echo "${log_line}" | grep -c 'Downloading') -gt 0 ]] && [[ "${download_macos_asu_phase}" == "START" ]]; then
		downloaded_macos_asu_title="${log_line/Downloading /}"
		log_super "softwareupdate: ${downloaded_macos_asu_title} is downloading..."
		log_asu "**** TIMESTAMP ****"
		download_macos_asu_phase="DOWNLOADING"
		download_macos_asu_timeout_seconds="${TIMEOUT_ASU_SYSTEM_SECONDS}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_timeout_seconds is: ${download_macos_asu_timeout_seconds}"
		download_macos_asu_start_error="FALSE"
		download_macos_asu_start_timeout="FALSE"
		[[ $(echo "${downloaded_macos_asu_title}" | grep -c 'macOS') -gt 0 ]] && download_macos_asu_phase="DOWNLOADING"
	elif [[ $(echo "${log_line}" | grep -c 'Downloading') -gt 0 ]] && [[ "${download_macos_asu_phase}" == "DOWNLOADING" ]]; then
		download_macos_asu_complete_perecent=$(echo "${log_line}" | sed -e 's/Downloading: //' -e 's/\.[0-9][0-9]//' | tr -d '\n' | tr -d '\r')
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_complete_perecent is: ${download_macos_asu_complete_perecent}"
		if [[ "${download_macos_asu_complete_perecent}" -ge 60 ]]; then
			log_echo_replace_line "${downloaded_macos_asu_title} download progress: 100%\n"
			log_super "softwareupdate: ${downloaded_macos_asu_title} download complete, now preparing..."
			log_asu "**** TIMESTAMP ****"
			download_macos_asu_phase="PREPARING"
		elif [[ "${download_macos_asu_complete_perecent}" -gt "${download_macos_asu_complete_perecent_previous}" ]]; then
			download_macos_asu_complete_display=$( (echo "${download_macos_asu_complete_perecent} * 1.69" | bc ) | cut -d '.' -f1)
			log_echo_replace_line "${downloaded_macos_asu_title} download progress: ${download_macos_asu_complete_display}%"
			download_macos_asu_complete_perecent_previous=${download_macos_asu_complete_perecent}
		fi
	elif [[ $(echo "${log_line}" | grep -c 'Downloading') -gt 0 ]] && [[ "${download_macos_asu_phase}" == "PREPARING" ]]; then
		download_macos_asu_complete_perecent=$(echo "${log_line}" | sed -e 's/Downloading: //' -e 's/\.[0-9][0-9]//' | tr -d '\n' | tr -d '\r')
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_complete_perecent is: ${download_macos_asu_complete_perecent}"
		if [[ ${download_macos_asu_complete_perecent} -ge 100 ]]; then
			log_echo_replace_line "${downloaded_macos_asu_title} preparing progress: 100%\n"
			log_asu "**** TIMESTAMP ****"
			download_macos_asu_phase="DONE"
		elif [[ "${download_macos_asu_complete_perecent}" -gt "${download_macos_asu_complete_perecent_previous}" ]]; then
			download_macos_asu_complete_display=$(((download_macos_asu_complete_perecent-60)*2))
			log_echo_replace_line "${downloaded_macos_asu_title} preparing progress: ${download_macos_asu_complete_display}%"
			download_macos_asu_complete_perecent_previous=${download_macos_asu_complete_perecent}
		fi
	elif [[ $(echo "${log_line}" | grep -c 'Downloaded') -gt 0 ]]; then
		downloaded_macos_asu_title=$(echo "${log_line}" | sed -e 's/://' -e 's/Downloaded //')
		log_super "softwareupdate: ${downloaded_macos_asu_title} download and preparation complete."
		download_macos_asu_start_error="FALSE"
		download_macos_asu_start_timeout="FALSE"
		download_macos_asu_timeout_error="FALSE"
		break
	fi
done < <(tail -n1 -F "${ASU_WORKFLOW_LOG}" | tr -u '%' '\n')
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_start_timeout is: ${download_macos_asu_start_timeout}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_start_error is: ${download_macos_asu_start_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_timeout_error is: ${download_macos_asu_timeout_error}"

# If the softwareupdate download workflow completed, then validate the prepared macOS update/upgrade.
if [[ "${download_macos_asu_start_error}" == "FALSE" ]] && [[ "${download_macos_asu_start_timeout}" == "FALSE" ]] && [[ "${download_macos_asu_timeout_error}" == "FALSE" ]]; then
	local download_macos_asu_title_error
	download_macos_asu_title_error="TRUE"
	local download_macos_asu_validation_error
	download_macos_asu_validation_error="TRUE"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_title_target is: ${asu_macos_title_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: downloaded_macos_asu_title is: ${downloaded_macos_asu_title}"
	if [[ "${asu_macos_title_target}" == "${downloaded_macos_asu_title}" ]]; then
		download_macos_asu_title_error="FALSE"
		local update_asset_attributes
		update_asset_attributes=$(defaults read /System/Volumes/Update/Update update-asset-attributes 2> /dev/null)
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: update_asset_attributes is:\n${update_asset_attributes}"
		local prepared_macos_version
		prepared_macos_version=$(echo "${update_asset_attributes}" | grep -w 'OSVersion' | awk -F '"' '{print $2}')
		if [[ "${macos_version_major}" -ge 13 ]]; then
			local prepared_macos_version_extra
			prepared_macos_version_extra=$(echo "${update_asset_attributes}" | grep -w 'ProductVersionExtra' | awk -F '"' '{print $2}')
			[[ -n "${prepared_macos_version_extra}" ]] && prepared_macos_version="${prepared_macos_version} ${prepared_macos_version_extra}"
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: prepared_macos_version_extra is: ${prepared_macos_version_extra}"
		fi
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: prepared_macos_version is: ${prepared_macos_version}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_version is: ${asu_macos_minor_update_version}"
		{ { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; } && [[ "${prepared_macos_version}" == "${macos_major_upgrade_version_major_target}" ]]; } && download_macos_asu_validation_error="FALSE"
		{ [[ "${macos_major_upgrade_version_major_target}" == "FALSE" ]] && [[ "${prepared_macos_version}" == "${asu_macos_minor_update_version}" ]]; } && download_macos_asu_validation_error="FALSE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_title_error is: ${download_macos_asu_title_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_asu_validation_error is: ${download_macos_asu_validation_error}"

# If the macOS update/upgrade is downloaded and prepared, then collect information.
if [[ "${download_macos_asu_start_error}" == "FALSE" ]] || [[ "${download_macos_asu_start_timeout}" == "FALSE" ]] || [[ "${download_macos_asu_timeout_error}" == "FALSE" ]] || [[ "${download_macos_asu_title_error}" == "FALSE" ]] || [[ "${download_macos_asu_validation_error}" == "FALSE" ]]; then
	log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD MACOS VIA SOFTWAREUPDATE COMPLETED ****"
	download_maocs_asu_error="FALSE"
	download_maocs_asu_required="FALSE"
	defaults write "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULabel -string "${asu_macos_label_target}"
	defaults write "${SUPER_LOCAL_PLIST}" DownloadedMacOSASULastStartup -string "${mac_last_startup}"
else # Some part of the softwareupdate download workflow failed.
	if [[ "${download_macos_asu_start_error}" == "CONNECT" ]]; then
		log_asu "Error: Unable to reach Apple software update servers."
		log_super "Error: Unable to reach Apple software update servers."
	elif [[ "${download_macos_asu_start_error}" == "NOUPDATE" ]]; then
		log_asu "Error: Unable to find requested macOS update/upgrade via softwareupdate."
		log_super "Error: Unable to find requested macOS update/upgrade via softwareupdate."
	elif [[ "${download_macos_asu_start_error}" == "SPACE" ]]; then
		log_asu "Error: Not enough available storage to download macOS update/upgrade."
		log_super "Error: Not enough available storage to download macOS update/upgrade."
	elif [[ "${download_macos_asu_start_error}" == "FAILED" ]]; then
		log_asu "Error: Download of macOS update/upgrade via softwareupdate failed to start."
		log_super "Error: Download of macOS update/upgrade via softwareupdate failed to start."
	elif [[ "${download_macos_asu_start_timeout}" == "TRUE" ]]; then
		log_asu "Error: Download of macOS update/upgrade via softwareupdate failed to start after waiting for ${download_macos_asu_timeout_seconds} seconds."
		log_super "Error: Download of macOS update/upgrade via softwareupdate failed to start after waiting for ${download_macos_asu_timeout_seconds} seconds."
	elif [[ "${download_macos_asu_timeout_error}" == "TRUE" ]]; then
		log_asu "Error: Download of macOS update/upgrade via softwareupdate failed to complete, as indicated by no progress after watiting for ${download_macos_asu_timeout_seconds} seconds."
		log_super "Error: Download of macOS update/upgrade via softwareupdate failed to complete, as indicated by no progress after watiting for ${download_macos_asu_timeout_seconds} seconds."
	elif [[ "${download_macos_asu_title_error}" == "TRUE" ]]; then
		log_asu "Error: Download of ${asu_macos_title_target} did not complete or match requested download title."
		log_super "Error: Download of ${asu_macos_title_target} ddid not complete or match requested download title."
	else # "${download_macos_asu_validation_error}" == "TRUE"
		if [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then
			log_asu "Error: Downloaded macOS major upgrade version of ${prepared_macos_version} doesn't match expected version ${macos_major_upgrade_version_major_target}."
			log_super "Error: Downloaded macOS major upgrade version of ${prepared_macos_version} doesn't match expected version ${macos_major_upgrade_version_major_target}."
		else # "${macos_major_upgrade_version_major_target}" == "FALSE"
			log_asu "Error: Downloaded macOS minor update version of ${prepared_macos_version} doesn't match expected version ${asu_macos_minor_update_version}."
			log_super "Error: Downloaded macOS mintor update version of ${prepared_macos_version} doesn't match expected version ${asu_macos_minor_update_version}."
		fi
	fi
	log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD MACOS VIA SOFTWAREUPDATE FAILED ****"
	kill -9 "${download_macos_asu_pid}" > /dev/null 2>&1
	kick_softwareupdated
	download_maocs_asu_error="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_maocs_asu_error is: ${download_maocs_asu_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_maocs_asu_required is: ${download_maocs_asu_required}"
}

# Download macOS installer via ${MIST_CLI_BINARY}, and also save results to ${SUPER_LOG}, ${INSTALLER_WORKFLOW_LOG}, and ${SUPER_LOCAL_PLIST}.
download_macos_installer() {
log_super "mist_cli: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} download installer workflow, check ${INSTALLER_WORKFLOW_LOG} for more detail."
log_status "Running: mist_cli: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} download installer workflow."
log_installer "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} INSTALLER APP START ****"

# Background the ${MIST_CLI_BINARY} download process and send to ${INSTALLER_WORKFLOW_LOG}.
local download_macos_installer_mist_pid
if [[ "${macos_beta_program}" == "FALSE" ]]; then
	"${MIST_CLI_BINARY}" download installer --force --no-ansi --output-directory "/Applications" --compatible "${macos_installer_build_target}" application --application-name "Install %NAME%.app" >> "${INSTALLER_WORKFLOW_LOG}" 2>&1 &
	download_macos_installer_mist_pid="$!"
else # macOS beta workflow.
	"${MIST_CLI_BINARY}" download installer --force --no-ansi --output-directory "/Applications" --compatible --include-betas "${macos_installer_build_target}" application --application-name "Install %NAME%.app" >> "${INSTALLER_WORKFLOW_LOG}" 2>&1 &
	download_macos_installer_mist_pid="$!"
fi

# Watch ${INSTALLER_WORKFLOW_LOG} while waiting for the mist-cli download process to complete.
# Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS} then changes to ${TIMEOUT_INSTALLER_DOWNLOAD_SECONDS}.
local download_macos_installer_start_error
download_macos_installer_start_error="TRUE"
local download_macos_installer_start_timeout
download_macos_installer_start_timeout="TRUE"
local download_macos_installer_timeout_error
download_macos_installer_timeout_error="TRUE"
local download_macos_installer_timeout_seconds
download_macos_installer_timeout_seconds="${TIMEOUT_START_SECONDS}"
local download_macos_installer_phase
download_macos_installer_phase="START"
local download_macos_installer_complete_percent
download_macos_installer_complete_percent=0
local download_macos_installer_complete_percent_previous
download_macos_installer_complete_percent_previous=0
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_timeout_seconds is: ${download_macos_installer_timeout_seconds}"
while read -t "${download_macos_installer_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c 'No macOS Installer found' ) -gt 0 ]]; then
		break
	elif [[ $(echo "${log_line}" | grep -c 'DOWNLOAD') -gt 0 ]] && [[ "${download_macos_installer_phase}" != "DOWNLOADING" ]]; then
		log_super "mist_cli: Install ${macos_installer_marketing_name_target}.app is downloading..."
		log_installer "**** TIMESTAMP ****"
		download_macos_installer_timeout_seconds="${TIMEOUT_INSTALLER_DOWNLOAD_SECONDS}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_timeout_seconds is: ${download_macos_installer_timeout_seconds}"
		download_macos_installer_phase="DOWNLOADING"
		download_macos_installer_start_error="FALSE"
		download_macos_installer_start_timeout="FALSE"
	elif [[ "${download_macos_installer_phase}" == "DOWNLOADING" ]] && [[ $(echo "${log_line}" | grep -c 'InstallAssistant.pkg' ) -gt 0 ]]; then
		download_macos_installer_complete_percent=$(echo "${log_line}" | awk -F '(' '{print $2}' | awk -F '.' '{print $1}' | tr -d -c 0-9)
		download_macos_installer_complete_percent=${download_macos_installer_complete_percent#0}
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_complete_percent is: ${download_macos_installer_complete_percent}"
		if [[ $download_macos_installer_complete_percent -ge 100 ]]; then
			log_echo_replace_line "Install ${macos_installer_marketing_name_target}.app download progress: 100%\n"
			log_super "mist_cli: Install ${macos_installer_marketing_name_target}.app downloaded, now verifying..."
			log_installer "**** TIMESTAMP ****"
			download_macos_installer_phase="DONE"
		elif [[ $download_macos_installer_complete_percent -gt $download_macos_installer_complete_percent_previous ]]; then
			log_echo_replace_line "Install ${macos_installer_marketing_name_target}.app download progress: ${download_macos_installer_complete_percent}%"
			download_macos_installer_complete_percent_previous=$download_macos_installer_complete_percent
		fi
	elif [[ $(echo "${log_line}" | grep -c 'INSTALL') -gt 0 ]]; then
		log_super "mist_cli: Install ${macos_installer_marketing_name_target}.app verified, now preparing..."
		log_installer "**** TIMESTAMP ****"
	elif [[ $(echo "${log_line}" | grep -c 'APPLICATION') -gt 0 ]]; then
		log_super "mist_cli: Install ${macos_installer_marketing_name_target}.app prepared, now moving to /Applications..."
		log_installer "**** TIMESTAMP ****"
		download_macos_installer_phase="APPLICATION"
	elif [[ $(echo "${log_line}" | grep -c 'TEARDOWN') -gt 0 ]]; then
		log_installer "**** TIMESTAMP ****"
		download_macos_installer_start_error="FALSE"
		download_macos_installer_start_timeout="FALSE"
		download_macos_installer_timeout_error="FALSE"
		break
	fi
done < <(tail -n1 -F "${INSTALLER_WORKFLOW_LOG}")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_start_error is: ${download_macos_installer_start_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_start_timeout is: ${download_macos_installer_start_timeout}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_timeout_error is: ${download_macos_installer_timeout_error}"

# If the mist-cli download workflow completed, then validate the macOS installer application.
if [[ "${download_macos_installer_start_error}" == "FALSE" ]] && [[ "${download_macos_installer_start_timeout}" == "FALSE" ]] && [[ "${download_macos_installer_timeout_error}" == "FALSE" ]]; then
	local download_macos_installer_app_error
	download_macos_installer_app_error="TRUE"
	local download_macos_installer_validation_error
	download_macos_installer_validation_error="TRUE"
	if [[ -d "/Applications/Install ${macos_installer_marketing_name_target}.app" ]]; then
		download_macos_installer_app_error="FALSE"
		check_macos_installer
		[[ "${macos_installer_error}" == "FALSE" ]] && download_macos_installer_validation_error="FALSE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_app_error is: ${download_macos_installer_app_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_validation_error is: ${download_macos_installer_validation_error}"

# If the macOS installer application is downloaded and valid, then collect information.
if [[ "${download_macos_installer_start_error}" == "FALSE" ]] || [[ "${download_macos_installer_start_timeout}" == "FALSE" ]] || [[ "${download_macos_installer_timeout_error}" == "FALSE" ]] || [[ "${download_macos_installer_app_error}" == "FALSE" ]] || [[ "${download_macos_installer_validation_error}" == "FALSE" ]]; then
	log_installer "Status: A macOS installer is now available at: /Applications/Install ${macos_installer_marketing_name_target}.app"
	log_installer "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD MACOS INSTALLER APP COMPLETE ****"
	log_super "Status: A macOS installer is now available at: /Applications/Install ${macos_installer_marketing_name_target}.app"
	download_macos_installer_error="FALSE"
	download_macos_installer_required="FALSE"
	defaults write "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller -string "${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target}"
else # Some part of the macOS installer download workflow failed.
	if [[ "${download_macos_installer_start_error}" == "TRUE" ]]; then
		log_installer "Error: macOS installer download failed start or the requested installer could not be found."
		log_super "Error: macOS installer download failed start or the requested installer could not be found."
	elif [[ "${download_macos_installer_start_timeout}" == "TRUE" ]]; then
		log_installer "Error: macOS installer download failed to start after waiting for ${download_macos_installer_timeout_seconds} seconds."
		log_super "Error: macOS installer download failed to start after waiting for ${download_macos_installer_timeout_seconds} seconds."
	elif [[ "${download_macos_installer_timeout_error}" == "TRUE" ]]; then
		log_installer "Error: macOS installer download failed to complete, as indicated by no progress after watiting for ${download_macos_installer_timeout_seconds} seconds."
		log_super "Error: macOS installer download failed to complete, as indicated by no progress after watiting for ${download_macos_installer_timeout_seconds} seconds."
	elif [[ "${download_macos_installer_app_error}" == "TRUE" ]]; then
		log_installer "Error: The target macOS installer could not be found in the /Applications folder."
		log_super "Error: The target macOS installer could not be found in the /Applications folder."
	else # "${download_macos_installer_validation_error}" == "TRUE"
		log_installer "Error: macOS installer failed local validations, removing installer: /Applications/Install ${macos_installer_marketing_name_target}.app."
		log_super "Error: macOS installer failed local validations, removing installer: /Applications/Install ${macos_installer_marketing_name_target}.app."
		rm -Rf "/Applications/Install ${macos_installer_marketing_name_target}.app" > /dev/null 2>&1
	fi
	log_installer "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD MACOS INSTALLER APP FAILED ****"
	kill -9 "${download_macos_installer_mist_pid}" > /dev/null 2>&1
	download_macos_installer_error="TRUE"
	defaults delete "${SUPER_LOCAL_PLIST}" DownloadedMacOSInstaller 2> /dev/null
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_error is: ${download_macos_installer_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_macos_installer_required is: ${download_macos_installer_required}"
}

# This function contains logic to determine the correct download behavior based on system condition and specified options.
workflow_download_macos() {
workflow_download_macos_error="FALSE"
workflow_download_macos_check_user="FALSE"

# Check to make sure system has enough available storage space.
check_storage_available
if [[ "${check_storage_available_error}" == "FALSE" ]]; then
	if [[ "${storage_ready}" == "FALSE" ]]; then
		if [[ "${current_user_account_name}" == "FALSE" ]]; then
			log_super "Error: Current available storage is at ${storage_available_gigabytes} GBs which is below the ${storage_required_gigabytes} GBs that is required for download. And no active user is logged in to attempt remediation."
			workflow_download_macos_error="TRUE"
		else # A normal user is currently logged in.
			notification_insufficient_storage
			[[ "${notification_insufficient_storage_error}" == "TRUE" ]] && workflow_download_macos_error="TRUE"
		fi
	fi
else # "${check_storage_available_error}" == "TRUE"
	workflow_download_macos_error="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_download_macos_error is: ${workflow_download_macos_error}"

# If no errors, then start the appropriate macOS download workflow.
if [[ "${workflow_download_macos_error}" == "FALSE" ]]; then
	# If ${test_mode_option} then it's not necessary to continue this function.
	if [[ "${test_mode_option}" == "TRUE" ]]; then
		if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
			[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_download
			log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for install now download notification..."
			sleep "${test_mode_timeout_seconds}"
		else
			log_super "Test Mode: Ignoring macOS download workflow."
		fi
		return 0
	fi
	
	# A macOS upgrade is available and option to allow upgrade is enabled.
	if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then
		if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then # macOS major upgrade possible via Apple software update.
			if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
				{ [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; } && notification_install_now_download
				download_macos_asu
				[[ "${download_maocs_asu_error}" == "TRUE" ]] && workflow_download_macos_error="TRUE"
				[[ "${download_maocs_asu_error}" == "FALSE" ]] && workflow_download_macos_check_user="TRUE"
			else
				log_super "Status: Previously downloaded macOS major upgrade is prepared: ${downloaded_macos_asu_label}"
			fi
		else # macOS major upgrade only possible via installer application.
			if [[ "${download_macos_installer_required}" == "TRUE" ]]; then
				{ [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; } && notification_install_now_download
				download_macos_installer
				[[ "${download_macos_installer_error}" == "TRUE" ]] && workflow_download_macos_error="TRUE"
				[[ "${download_macos_installer_error}" == "FALSE" ]] && workflow_download_macos_check_user="TRUE"
			else
				log_super "Status: Previously downloaded ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installer is available at: /Applications/Install ${macos_installer_marketing_name_target}.app"
			fi
		fi
	else # Only macOS updates are available.
		if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
			{ [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; } && notification_install_now_download
			download_macos_asu
			[[ "${download_maocs_asu_error}" == "TRUE" ]] && workflow_download_macos_error="TRUE"
			[[ "${download_maocs_asu_error}" == "FALSE" ]] && workflow_download_macos_check_user="TRUE"
		else
			log_super "Status: Previously downloaded macOS minor update is prepared: ${downloaded_macos_asu_label}"
		fi
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_download_macos_error is: ${workflow_download_macos_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_download_macos_check_user is: ${workflow_download_macos_check_user}"

# Handle workflow failure options.
if [[ "${workflow_download_macos_error}" == "TRUE" ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_super "Error: Download macOS update/upgrade workflow failed, install now workflow can not continue."
		log_status "Inactive Error: Download macOS update/upgrade workflow failed, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: Download macOS update/upgrade workflow failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Download macOS update/upgrade workflow failed, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

# MARK: *** Installation & Restart ***
################################################################################

# Install only non-system Apple software updates via the softwareupdate command, and also save results to ${SUPER_LOG} and ${ASU_WORKFLOW_LOG}.
install_non_system_asu() {
install_non_system_asu_error="TRUE"
log_super "softwareupdate: Starting non-system Apple software updates installation workflow, check ${ASU_WORKFLOW_LOG} for more detail."
log_status "Running: softwareupdate: Starting non-system Apple software updates installation workflow."
log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NON-SYSTEM UPDATES VIA SOFTWAREUPDATE START ****"
local previous_ifs
previous_ifs="${IFS}"; IFS=$' '
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_non_system_update_labels_array is:\n${asu_non_system_update_labels_array[*]}"

# The update process is backgrounded and is watched via a while loop later on. Also note the different requirements between macOS versions.
local download_macos_asu_pid
if [[ ${macos_version_major} -ge 12 ]]; then
	if [[ "${current_user_account_name}" == "FALSE" ]]; then
		sudo -i softwareupdate --install "${asu_non_system_update_labels_array[@]}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	else # Local user is logged in.
		launchctl asuser "${current_user_id}" sudo -i softwareupdate --install "${asu_non_system_update_labels_array[@]}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		download_macos_asu_pid="$!"
	fi
else # macOS 11
	softwareupdate --install "${asu_non_system_update_labels_array[@]}" --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
	download_macos_asu_pid="$!"
fi

# Watch ${ASU_WORKFLOW_LOG} while waiting for the softwareupdate installation workflow to complete.
# Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS} then changes to ${TIMEOUT_NON_SYSTEM_ASU_SECONDS}.
local install_non_system_asu_start_timeout
install_non_system_asu_start_timeout="TRUE"
local install_non_system_asu_start_error
install_non_system_asu_start_error="TRUE"
local install_non_system_asu_timeout_error
install_non_system_asu_timeout_error="TRUE"
local install_non_system_asu_timeout_seconds
install_non_system_asu_timeout_seconds="${TIMEOUT_START_SECONDS}"
local install_non_system_asu_installed_title
local install_non_system_asu_installed_titles_array
install_non_system_asu_installed_titles_array=()
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_non_system_asu_timeout_seconds is: ${install_non_system_asu_timeout_seconds}"
while read -t "${install_non_system_asu_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c "Can’t connect" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c "Couldn't communicate" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'No such update' ) -gt 0 ]]; then
		install_non_system_asu_start_timeout="FALSE"
		break
	elif [[ $(echo "${log_line}" | grep -c 'Downloading') -gt 0 ]]; then
		downloaded_macos_asu_title=$(echo "${log_line}" | sed -e 's/://' | awk -F 'Downloading ' '{print $2}')
		log_super "softwareupdate: ${downloaded_macos_asu_title} is downloading..."
		log_asu "**** TIMESTAMP ****"
		install_non_system_asu_timeout_seconds="${TIMEOUT_NON_SYSTEM_ASU_SECONDS}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_non_system_asu_timeout_seconds is: ${install_non_system_asu_timeout_seconds}"
		install_non_system_asu_start_timeout="FALSE"
		install_non_system_asu_start_error="FALSE"
	elif [[ $(echo "${log_line}" | grep -c 'Downloaded') -gt 0 ]]; then
		downloaded_macos_asu_title=$(echo "${log_line}" | sed -e 's/://' | awk -F 'Downloaded ' '{print $2}')
		log_super "softwareupdate: ${downloaded_macos_asu_title} download complete."
		install_non_system_asu_timeout_seconds="${TIMEOUT_NON_SYSTEM_ASU_SECONDS}"
		log_asu "**** TIMESTAMP ****"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_non_system_asu_timeout_seconds is: ${install_non_system_asu_timeout_seconds}"
		install_non_system_asu_start_timeout="FALSE"
		install_non_system_asu_start_error="FALSE"
	elif [[ $(echo "${log_line}" | grep -c 'Done with') -gt 0 ]]; then
		install_non_system_asu_installed_title=$(echo "${log_line}" | sed -e 's/://' | awk -F 'Done with ' '{print $2}')
		log_super "softwareupdate: ${install_non_system_asu_installed_title} installed."
		install_non_system_asu_installed_titles_array+=("${install_non_system_asu_installed_title}")
		log_asu "**** TIMESTAMP ****"
		install_non_system_asu_start_timeout="FALSE"
		install_non_system_asu_start_error="FALSE"
	elif [[ $(echo "${log_line}" | grep -c 'Done.') -gt 0 ]]; then
		log_asu "**** TIMESTAMP ****"
		install_non_system_asu_timeout_error="FALSE"
		break
	fi
done < <(tail -n1 -F "${ASU_WORKFLOW_LOG}")

# If the softwareupdate installation workflow completed, then validate and collect information.
if [[ "${install_non_system_asu_start_timeout}" == "FALSE" ]] && [[ "${install_non_system_asu_start_error}" == "FALSE" ]] && [[ "${install_non_system_asu_timeout_error}" == "FALSE" ]]; then
	local previous_ifs
	previous_ifs="${IFS}"; IFS=$'\n'
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_non_system_update_titles_array is:\n${asu_non_system_update_titles_array[*]}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_non_system_asu_installed_titles_array is:\n${install_non_system_asu_installed_titles_array[*]}"
	if [[ ! $(echo -e "${asu_non_system_update_titles_array[*]}\n${install_non_system_asu_installed_titles_array[*]}" | sort | uniq -u) ]]; then
		log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NON-SYSTEM UPDATES VIA SOFTWAREUPDATE COMPLETED ****"
		install_non_system_asu_error="FALSE"
	else # The expected ${asu_non_system_update_titles_array} did not match the ${install_non_system_asu_installed_titles_array}.
		log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NON-SYSTEM UPDATES VIA SOFTWAREUPDATE INCOMPLETE ****"
		log_asu "Error: Installation of non-system Apple software updates did not complete."
		log_super "Error: Installation of non-system Apple software updates did not complete."
	fi
else # The softwareupdate installation workflow failed.
	log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NON-SYSTEM UPDATES VIA SOFTWAREUPDATE FAILED ****"
	if [[ "${install_non_system_asu_start_timeout}" == "TRUE" ]]; then
		log_asu "Error: Installation of non-system Apple software updates failed to start after waiting for ${install_non_system_asu_timeout_seconds} seconds."
		log_super "Error: Installation of non-system Apple software updates failed to start after waiting for ${install_non_system_asu_timeout_seconds} seconds."
	elif [[ "${install_non_system_asu_start_error}" == "TRUE" ]]; then
		log_asu "Error: Unable to reach Apple software update server."
		log_super "Error: Unable to reach Apple software update server."
	elif [[ "${install_non_system_asu_timeout_error}" == "TRUE" ]]; then
		log_asu "Error: Installation of non-system Apple software updates failed, as indicated by no progress after watiting for ${install_non_system_asu_timeout_seconds} seconds."
		log_super "Error: Installation of non-system Apple software updates failed, as indicated by no progress after watiting for ${install_non_system_asu_timeout_seconds} seconds."
	fi
	kill -9 "${download_macos_asu_pid}" > /dev/null 2>&1
	kick_softwareupdated
fi
IFS="${previous_ifs}"
}

# Install macOS updates via the softwareupdate command, and also save results to ${SUPER_LOG}, ${ASU_WORKFLOW_LOG}, and ${SUPER_LOCAL_PLIST}.
install_macos_asu() {

# If ${test_mode_option} then it's not necessary to continue this function.
if [[ "${test_mode_option}" == "TRUE" ]]; then
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	log_super "Test Mode: Skipping the macOS update/upgrade via softwareupdate workflow."
	if [[ "${current_user_account_name}" != "FALSE" ]]; then
		log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the restart notification..."
		sleep "${test_mode_timeout_seconds}"
		killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
	fi
	# Reset various items after test macOS update is complete.
	restart_workflow_automatic_zero_date
	restart_deadline_counters
	return 0
fi

# Start with log and status updates.
if [[ "${macos_version_number}" -ge 1203 ]] && [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # macOS 12.3 or newer upgrade via softwareupdate.
	asu_macos_label_target="${asu_macos_major_upgrade_label_target}"
	if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then # If no ${current_user_account_name} then the sytem update was not pre-downloaded.
		log_super "softwareupdate: Starting ${asu_macos_major_upgrade_label_target} download and upgrade workflow, check ${ASU_WORKFLOW_LOG} for more detail."
		log_status "Running: softwareupdate: Starting ${asu_macos_major_upgrade_label_target} download and upgrade workflow."
		log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD AND UPGRADE ${asu_macos_major_upgrade_label_target} VIA SOFTWAREUPDATE START ****"
	else
		log_super "softwareupdate: Starting ${asu_macos_major_upgrade_label_target} upgrade workflow, check ${ASU_WORKFLOW_LOG} for more detail."
		log_status "Running: softwareupdate: Starting ${asu_macos_major_upgrade_label_target} upgrade workflow."
		log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPGRADE ${asu_macos_major_upgrade_label_target} VIA SOFTWAREUPDATE START ****"
	fi
else # Older than macOS 12 and/or only macOS updates available.
	asu_macos_label_target="${asu_macos_minor_update_label}"
	if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then # If no ${current_user_account_name} then the sytem update was not pre-downloaded.
		log_super "softwareupdate: Starting ${asu_macos_minor_update_label} download and update workflow, check ${ASU_WORKFLOW_LOG} for more detail."
		log_status "Running: softwareupdate: Starting ${asu_macos_minor_update_label} download and update workflow."
		log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD AND UPDATE ${asu_macos_minor_update_label} VIA SOFTWAREUPDATE START ****"
	else
		log_super "softwareupdate: Starting ${asu_macos_minor_update_label} update workflow, check ${ASU_WORKFLOW_LOG} for more detail."
		log_status "Running: softwareupdate: Starting ${asu_macos_minor_update_label} update workflow."
		log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE ${asu_macos_minor_update_label} VIA SOFTWAREUPDATE START ****"
	fi
fi

# The update/upgrade process is backgrounded and is watched via while loops later on. Also note the different requirements between macOS versions.
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_label_target is: ${asu_macos_label_target}"
local install_macos_asu_pid
if [[ "${macos_version_major}" -ge 13 ]]; then  # macOS 13+
	if [[ "${current_user_account_name}" == "FALSE" ]]; then # Local user not is logged in.
		if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
			echo "${auth_local_password}" | sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license --user "${auth_local_account}" --stdinpass >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		else # Intel.
			sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		fi
	else # Local user is logged in.
		if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
			echo "${auth_local_password}" | launchctl asuser "${current_user_id}" sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license --user "${auth_local_account}" --stdinpass >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		else # Intel.
			launchctl asuser "${current_user_id}" sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		fi
	fi
elif [[ "${macos_version_major}" -ge 12 ]]; then  # macOS 12
	if [[ "${current_user_account_name}" == "FALSE" ]]; then # Local user not is logged in.
		if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
			sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license --user "${auth_local_account}" --stdinpass "${auth_local_password}" >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		else # Intel.
			sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		fi
	else # Local user is logged in.
		if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
			launchctl asuser "${current_user_id}" sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license --user "${auth_local_account}" --stdinpass "${auth_local_password}" >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		else # Intel.
			launchctl asuser "${current_user_id}" sudo -u root softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
			install_macos_asu_pid="$!"
		fi
	fi
else # macOS 11
	if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
		echo ' ' | softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		install_macos_asu_pid="$!"
	else # Intel.
		softwareupdate --install "${asu_macos_label_target}" --restart --force --no-scan --agree-to-license >> "${ASU_WORKFLOW_LOG}" 2>&1 &
		install_macos_asu_pid="$!"
	fi
fi
disown -a

# Watch ${ASU_WORKFLOW_LOG} while waiting for the softwareupdate installation workflow to complete.
# Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS} then changes to ${TIMEOUT_ASU_SYSTEM_SECONDS}.
local install_macos_asu_start_error
install_macos_asu_start_error="TRUE"
local install_macos_asu_start_timeout
install_macos_asu_start_timeout="TRUE"
local install_macos_asu_timeout_error
install_macos_asu_timeout_error="TRUE"
local install_macos_asu_timeout_seconds
install_macos_asu_timeout_seconds="${TIMEOUT_START_SECONDS}"
local install_macos_asu_phase
install_macos_asu_phase="START"
local install_macos_asu_complete_percent
install_macos_asu_complete_percent=0
local install_macos_asu_complete_percent_previous
install_macos_asu_complete_percent_previous=0
local install_macos_asu_complete_percent_display
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_timeout_seconds is: ${install_macos_asu_timeout_seconds}"
while read -t "${install_macos_asu_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c "Can’t connect" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c "Couldn't communicate" ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'No such update' ) -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'Failed to download' ) -gt 0 ]]; then
		break
	elif [[ $(echo "${log_line}" | grep -c 'Downloading') -gt 0 ]] && [[ $(echo "${log_line}" | grep -c 'Downloading:') -eq 0 ]]; then
		downloaded_macos_asu_title="${log_line/Downloading /}"
		log_super "softwareupdate: ${downloaded_macos_asu_title} is downloading..."
		log_asu "**** TIMESTAMP ****"
		install_macos_asu_timeout_seconds="${TIMEOUT_ASU_SYSTEM_SECONDS}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_timeout_seconds is: ${install_macos_asu_timeout_seconds}"
		install_macos_asu_start_error="FALSE"
		[[ $(echo "${downloaded_macos_asu_title}" | grep -c 'macOS') -gt 0 ]] && install_macos_asu_phase="DOWNLOADING"
	elif [[ $(echo "${log_line}" | grep -c 'Downloading:') -gt 0 ]] && [[ "${install_macos_asu_phase}" == "DOWNLOADING" ]]; then
		install_macos_asu_complete_percent=$(echo "${log_line}" | sed -e 's/Downloading: //' -e 's/\.[0-9][0-9]//' | tr -d '\n' | tr -d '\r')
		install_macos_asu_complete_percent=${install_macos_asu_complete_percent#0}
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_complete_percent is: ${install_macos_asu_complete_percent}"
		if [[ $install_macos_asu_complete_percent -ge 60 ]]; then
			log_echo_replace_line "${downloaded_macos_asu_title} download progress: 100%\n"
			log_super "softwareupdate: ${downloaded_macos_asu_title} download complete, now preparing..."
			log_asu "**** TIMESTAMP ****"
			install_macos_asu_phase="PREPARING"
		elif [[ $install_macos_asu_complete_percent -gt $install_macos_asu_complete_percent_previous ]]; then
			install_macos_asu_complete_percent_display=$( (echo "$install_macos_asu_complete_percent * 1.69" | bc ) | cut -d '.' -f1)
			log_echo_replace_line "${downloaded_macos_asu_title} download progress: ${install_macos_asu_complete_percent_display}%"
			install_macos_asu_complete_percent_previous=$install_macos_asu_complete_percent
		fi
	elif [[ $(echo "${log_line}" | grep -c 'Downloading:') -gt 0 ]] && [[ "${install_macos_asu_phase}" == "PREPARING" ]]; then
		install_macos_asu_complete_percent=$(echo "${log_line}" | sed -e 's/Downloading: //' -e 's/\.[0-9][0-9]//' | tr -d '\n' | tr -d '\r')
		install_macos_asu_complete_percent=${install_macos_asu_complete_percent#0}
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_complete_percent is: ${install_macos_asu_complete_percent}"
		if [[ $install_macos_asu_complete_percent -ge 100 ]]; then
			log_echo_replace_line "${downloaded_macos_asu_title} preparing progress: 100%\n"
			log_asu "**** TIMESTAMP ****"
			install_macos_asu_start_timeout="FALSE"
			break
		elif [[ $install_macos_asu_complete_percent -gt $install_macos_asu_complete_percent_previous ]]; then
			install_macos_asu_complete_percent_display=$(((install_macos_asu_complete_percent-60)*2))
			log_echo_replace_line "${downloaded_macos_asu_title} preparing progress: ${install_macos_asu_complete_percent_display}%"
			install_macos_asu_complete_percent_previous=$install_macos_asu_complete_percent
		fi
	elif [[ $(echo "${log_line}" | grep -c 'Downloaded') -gt 0 ]]; then
		downloaded_macos_asu_title=$(echo "${log_line}" | sed -e 's/://' -e 's/Downloaded //')
		log_asu "**** TIMESTAMP ****"
		install_macos_asu_start_error="FALSE"
		install_macos_asu_start_timeout="FALSE"
		install_macos_asu_timeout_error="FALSE"
		break
	fi
done < <(tail -n1 -F "${ASU_WORKFLOW_LOG}" | tr -u '%' '\n')
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_start_error is: ${install_macos_asu_start_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_start_timeout is: ${install_macos_asu_start_timeout}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_asu_timeout_error is: ${install_macos_asu_timeout_error}"

# If the softwareupdate installation workflow completed, then prepare for restart.
if [[ "${install_macos_asu_start_error}" == "FALSE" ]] && [[ "${install_macos_asu_start_timeout}" == "FALSE" ]]  && [[ "${install_macos_asu_timeout_error}" == "FALSE" ]]; then
	touch "${WORKFLOW_RESTART_VALIDATE_FILE}"
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE/UPGRADE MACOS VIA SOFTWAREUPDATE COMPLETED ****"
	log_super "softwareupdate: macOS update/upgrade is prepared and ready for restart!"
else # Some part of the softwareupdate installation workflow failed.
	if [[ "${install_macos_asu_start_error}" == "TRUE" ]]; then
		log_asu "Error: The softwareupdate process was unable to reach Apple software update servers or find the requested macOS update/upgrade."
		log_super "Error: The softwareupdate process was unable to reach Apple software update servers or find the requested macOS update/upgrade."
	elif [[ "${install_macos_asu_start_timeout}" == "TRUE" ]]; then
		log_asu "Error: Installation of macOS update/upgrade via softwareupdate failed to start downloading/preparing after waiting for ${install_macos_asu_timeout_seconds} seconds."
		log_super "Error: Installation of macOS update/upgrade via softwareupdate failed to start downloading/preparing after waiting for ${install_macos_asu_timeout_seconds} seconds."
	else # ${install_macos_asu_timeout_error}" == "TRUE"
		log_asu "Error: Installation of macOS update/upgrade via softwareupdate failed while downloading/preparing, as indicated by no progress after watiting for ${install_macos_asu_timeout_seconds} seconds."
		log_super "Error: Installation of macOS update/upgrade via softwareupdate failed while downloading/preparing, as indicated by no progress after watiting for ${install_macos_asu_timeout_seconds} seconds."
	fi
	log_asu "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE/UPGRADE MACOS VIA SOFTWAREUPDATE FAILED ****"
	kill -9 "${install_macos_asu_pid}" > /dev/null 2>&1
	kick_softwareupdated
	
	# Handle workflow failure options.
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_asu "Error: Installation of macOS update/upgrade via softwareupdate failed, install now workflow can not continue."
		log_super "Error: Installation of macOS update/upgrade via softwareupdate failed, install now workflow can not continue."
		log_status "Inactive Error: Installation of macOS update/upgrade via softwareupdate failed, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_asu "Error: Installation of macOS update/upgrade via softwareupdate failed, trying again in ${deferral_timer_minutes} minutes."
		log_super "Error: Installation of macOS update/upgrade via softwareupdate failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Installation of macOS update/upgrade via softwareupdate failed, trying again in ${deferral_timer_minutes} minutes."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_failed
		set_auto_launch_deferral
	fi
fi
}

# Install macOS update/upgrade via MDM push command, and also save results to ${SUPER_LOG}, ${MDM_COMMAND_LOG}, ${MDM_WORKFLOW_LOG}, and ${SUPER_LOCAL_PLIST}.
install_macos_mdm() {
# If ${test_mode_option} then it's not necessary to continue this function.
if [[ "${test_mode_option}" == "TRUE" ]]; then
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	log_super "Test Mode: Skipping the macOS update/upgrade via MDM workflow."
	if [[ "${current_user_account_name}" != "FALSE" ]]; then
		log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the MDM preparation notification..."
		sleep "${test_mode_timeout_seconds}"
		notification_restart
		log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the restart notification..."
		sleep "${test_mode_timeout_seconds}"
		killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
	fi
	# Reset various items after test macOS update is complete.
	restart_workflow_automatic_zero_date
	restart_deadline_counters
	return 0
fi

# Start with log and status updates.
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: download_maocs_asu_required is: ${download_maocs_asu_required}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_mdm_failover is: ${auth_mdm_failover}"
local install_macos_mdm_workflow_type
if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # macOS major upgrade.
	if [[ "${macos_version_major}" -ge 13 ]]; then # macOS major upgrade possible via MDM with Apple software update.
		install_macos_mdm_workflow_type="UPGRADE"
		if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
			if [[ "${auth_mdm_failover}" == "TRUE" ]]; then
				log_super "MDM: Starting macOS ${asu_macos_major_upgrade_version_target} download and upgrade workflow with user authenticated failover."
				log_status "Running: MDM: Starting macOS ${asu_macos_major_upgrade_version_target} download and upgrade workflow with user authenticated failover."
			else
				log_super "MDM: Starting macOS ${asu_macos_major_upgrade_version_target} download and upgrade workflow."
				log_status "Running: MDM: Starting macOS ${asu_macos_major_upgrade_version_target} download and upgrade workflow."
			fi
			log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD AND UPGRADE MACOS ${asu_macos_major_upgrade_version_target} VIA MDM START ****"
			log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD AND UPGRADE MACOS ${asu_macos_major_upgrade_version_target} VIA MDM START ****"
		else # Download already completed.
			if [[ "${auth_mdm_failover}" == "TRUE" ]]; then
				log_super "MDM: Starting macOS ${asu_macos_major_upgrade_version_target} upgrade workflow with user authenticated failover."
				log_status "Running: MDM: Starting macOS ${asu_macos_major_upgrade_version_target} upgrade workflow with user authenticated failover."
			else
				log_super "MDM: Starting macOS ${asu_macos_major_upgrade_version_target} upgrade workflow."
				log_status "Running: MDM: Starting macOS ${asu_macos_major_upgrade_version_target} upgrade workflow."
			fi
			log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPGRADE MACOS ${asu_macos_major_upgrade_version_target} VIA MDM START ****"
			log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPGRADE MACOS ${asu_macos_major_upgrade_version_target} VIA MDM START ****"
		fi
	else # macOS major upgrade via MDM only possible via installer application, all macOS installers are pre-downloaded.
		install_macos_mdm_workflow_type="INSTALLER"
		if [[ "${auth_mdm_failover}" == "TRUE" ]]; then
			log_super "MDM: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} install workflow with user authenticated failover."
			log_status "Running: MDM: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} install workflow with user authenticated failover."
		else # Download already completed.
			log_super "MDM: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} install workflow."
			log_status "Running: MDM: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} install workflow."
		fi
		log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} VIA MDM START ****"
		log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} VIA MDM START ****"
	fi
else # macOS minor update.
	install_macos_mdm_workflow_type="UPDATE"
	if [[ "${download_maocs_asu_required}" == "TRUE" ]]; then
		if [[ "${auth_mdm_failover}" == "TRUE" ]]; then
			log_super "MDM: Starting macOS ${asu_macos_minor_update_version} download and update workflow with user authenticated failover."
			log_status "Running: MDM: Starting macOS ${asu_macos_minor_update_version} download and update workflow with user authenticated failover."
		else
			log_super "MDM: Starting macOS ${asu_macos_minor_update_version} download and update workflow."
			log_status "Running: MDM: Starting macOS ${asu_macos_minor_update_version} download and update workflow."
		fi
		log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD AND UPDATE MACOS ${asu_macos_minor_update_version} VIA MDM START ****"
		log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - DOWNLOAD AND UPDATE MACOS ${asu_macos_minor_update_version} VIA MDM START ****"
	else
		if [[ "${auth_mdm_failover}" == "TRUE" ]]; then
			log_super "MDM: Starting macOS ${asu_macos_minor_update_version} update workflow with user authenticated failover."
			log_status "Running: MDM: Starting macOS ${asu_macos_minor_update_version} update workflow with user authenticated failover."
		else
			log_super "MDM: Starting macOS ${asu_macos_minor_update_version} update workflow."
			log_status "Running: MDM: Starting macOS ${asu_macos_minor_update_version} update workflow."
		fi
		log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE MACOS ${asu_macos_minor_update_version} VIA MDM START ****"
		log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE MACOS ${asu_macos_minor_update_version} VIA MDM START ****"
	fi
fi
log_super "MDM: check ${MDM_COMMAND_LOG} and ${MDM_WORKFLOW_LOG} for more detail."
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_workflow_type is: ${install_macos_mdm_workflow_type}"

# Validate Jamf Pro API token and update workflow.
check_jamf_api_access_token
check_jamf_api_update_workflow
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: auth_error_jamf is: ${auth_error_jamf}"

# Only continue workflow if Jamf Pro API configuration is valid.
if [[ "${auth_error_jamf}" == "FALSE" ]]; then
	# This pre-flights the MDM query locally and may also be useful for troubleshooting.
	kick_softwareupdated
	mdmclient_response=$(/usr/libexec/mdmclient AvailableOSUpdates 2> /dev/null)
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: mdmclient_response is: ${mdmclient_response}"

	# Start log streaming for MDM push commands and send to ${MDM_COMMAND_LOG}.
	local log_stream_mdm_command_pid
	log stream --style compact --predicate 'subsystem == "com.apple.ManagedClient" AND category == "HTTPUtil"' >> "${MDM_COMMAND_LOG}" &
	log_stream_mdm_command_pid="$!"
	if [[ "${verbose_mode_option}" == "TRUE" ]]; then
		log_super "Verbose Mode: Starting debug log for MDM client command progress at: ${MDM_COMMAND_DEBUG_LOG}"
		local log_stream_mdm_command_debug_pid
		log stream --style compact --predicate 'subsystem == "com.apple.ManagedClient"' >> "${MDM_COMMAND_DEBUG_LOG}" &
		log_stream_mdm_command_debug_pid="$!"
		
	fi

	# Start log streaming for MDM update/upgrade progress and send to ${MDM_WORKFLOW_LOG}.
	local log_stream_mdm_workflow_pid
	log stream --style compact --predicate 'process == "softwareupdated" AND composedMessage CONTAINS "Reported progress"' >> "${MDM_WORKFLOW_LOG}" &
	log_stream_mdm_workflow_pid="$!"
	if [[ "${verbose_mode_option}" == "TRUE" ]]; then
		log_super "Verbose Mode: Starting debug log for MDM update/upgrade workflow progress at: ${MDM_WORKFLOW_DEBUG_LOG}"
		local log_stream_mdm_workflow_debug_pid
		log stream --style compact --predicate 'process == "softwareupdated"' >> "${MDM_WORKFLOW_DEBUG_LOG}" &
		log_stream_mdm_workflow_debug_pid="$!"
	fi
	
	# Send the Jamf Pro API command to update/upgrade and restart via MDM.
	local install_macos_mdm_api_error
	install_macos_mdm_api_error="FALSE"
	local jamf_api_update_url
	local jamf_api_update_json
	if [[ "${jamf_api_update_workflow}" == "NEW" ]]; then # Jamf Pro API new managed update workflow.
		jamf_api_update_url="${jamf_api_url}api/v1/managed-software-updates/plans"
		if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # macOS major upgrade.
			jamf_api_update_json='{ "devices": [ { "objectType": "COMPUTER",  "deviceId": "'${jamf_computer_id}'" } ], "config": { "updateAction": "DOWNLOAD_INSTALL_RESTART", "versionType": "LATEST_MAJOR" } }'
		else # macOS minor update.
			jamf_api_update_json='{ "devices": [ { "objectType": "COMPUTER",  "deviceId": "'${jamf_computer_id}'" } ], "config": { "updateAction": "DOWNLOAD_INSTALL_RESTART", "versionType": "LATEST_MINOR" } }'
		fi
	else # Jamf Pro API legacy managed update workflow.
		jamf_api_update_url="${jamf_api_url}api/v1/macos-managed-software-updates/send-updates"
		if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # macOS major upgrade.
			if [[ "${macos_beta_program}" == "FALSE" ]]; then
				jamf_api_update_json='{ "deviceIds": ["'${jamf_computer_id}'"], "applyMajorUpdate": true, "updateAction": "DOWNLOAD_AND_INSTALL" }'
			else # macOS beta workflow.
				jamf_api_update_json='{ "deviceIds": ["'${jamf_computer_id}'"], "applyMajorUpdate": true, "skipVersionVerification": true, "updateAction": "DOWNLOAD_AND_INSTALL" }'
			fi
		else # macOS minor update.
			if [[ "${macos_beta_program}" == "FALSE" ]] || [[ "${asu_rapid_security_response_available}" == "TRUE" ]]; then
				jamf_api_update_json='{ "deviceIds": ["'${jamf_computer_id}'"], "applyMajorUpdate": false, "updateAction": "DOWNLOAD_AND_INSTALL", "forceRestart": true }'
			else # macOS beta workflow.
				jamf_api_update_json='{ "deviceIds": ["'${jamf_computer_id}'"], "applyMajorUpdate": false, "skipVersionVerification": true, "updateAction": "DOWNLOAD_AND_INSTALL", "forceRestart": true }'
			fi
		fi
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_update_workflow is: ${jamf_api_update_workflow}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_update_url is: ${jamf_api_update_url}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_update_json is: ${jamf_api_update_json}"
	local curl_response
	curl_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request POST "${jamf_api_update_url}" --header "Authorization: Bearer ${jamf_access_token}" --header 'accept: application/json' --header 'content-type: application/json' --data "${jamf_api_update_json}")
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is:\n${curl_response}"

	# If the Jamf Pro API managed update was not successful then it's not necessary to continue this function.
	if [[ $(echo "${curl_response}" | grep -c '200') -gt 0 ]] || [[ $(echo "${curl_response}" | grep -c '201') -gt 0 ]]; then
		log_super "MDM: Successful macOS update/upgrade command request."
		send_jamf_api_blank_push
	else
		install_macos_mdm_api_error="TRUE"
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_api_error is: ${install_macos_mdm_api_error}"

# Only continue workflow if Jamf Pro API managed update command was successful.
if [[ "${auth_error_jamf}" == "FALSE" ]] && [[ "${install_macos_mdm_api_error}" == "FALSE" ]]; then
	# Some helpfull logging while waiting for Jamf Pro's mandatory 5 minute delay. Note this while read loop has a timeout based on ${TIMEOUT_MDM_COMMAND_SECONDS}.
	local install_macos_mdm_start_error
	install_macos_mdm_start_error="TRUE"
	while read -t "${TIMEOUT_MDM_COMMAND_SECONDS}" -r log_line ; do
		# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
		if [[ $(echo "${log_line}" | grep -c 'Received HTTP response (200) \[Error') -gt 0 ]]; then
			log_super "MDM: Workflow error detected."
			log_mdm_command "**** TIMESTAMP ****"
			break
		elif [[ $(echo "${log_line}" | grep -c 'Received HTTP response (200) \[Acknowledged(ScheduleOSUpdateScan)') -gt 0 ]]; then
			log_super "MDM: Received push command \"ScheduleOSUpdateScan\", checking back after Jamf Pro's mandatory 5 minute delay..."
			log_mdm_command "**** TIMESTAMP ****"
			install_macos_mdm_start_error="FALSE"
			pkill -P $$ tail
			break
		fi
	done < <(tail -n1 -F "${MDM_COMMAND_LOG}")
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_start_error is: ${install_macos_mdm_start_error}"

# Only continue workflow if the initial managed update commands were received.
if [[ "${auth_error_jamf}" == "FALSE" ]] && [[ "${install_macos_mdm_api_error}" == "FALSE" ]] && [[ "${install_macos_mdm_start_error}" == "FALSE" ]]; then
	local install_macos_mdm_start_timeout
	install_macos_mdm_start_timeout="TRUE"
	local timer_end
	timer_end=300
	while [[ "${timer_end}" -ge 0 ]]; do
		log_echo_replace_line "Waiting for Jamf Pro's mandatory 5 minute delay: -$(date -u -r ${timer_end} +%M:%S)"
		timer_end=$((timer_end - 1))
		sleep 1
	done
	log_echo_replace_line "Waiting for Jamf Pro's mandatory 5 minute delay: 00:00\n)"
	log_super "MDM: Jamf Pro's mandatory 5 minute delay should be complete, sending Blank Push..."
	send_jamf_api_blank_push
	if [[ "${current_user_account_name}" != "FALSE" ]]; then
		if [[ "${install_macos_mdm_workflow_type}" == "INSTALLER" ]]; then
			display_string_prepare_time_estimate="20-25"
			notification_prepare
		else
			notification_restart
		fi
	fi
	
	# Watch ${MDM_COMMAND_LOG} while waiting for the MDM workflow to complete. Note this while read loop has a timeout based on ${TIMEOUT_MDM_COMMAND_SECONDS}.
	while read -t "${TIMEOUT_MDM_COMMAND_SECONDS}" -r log_line ; do
		# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
		if [[ $(echo "${log_line}" | grep -c 'Received HTTP response (200) \[Error') -gt 0 ]]; then
			log_super "MDM: Workflow error detected."
			log_mdm_command "**** TIMESTAMP ****"
			install_macos_mdm_start_error="TRUE"
			break
		elif [[ $(echo "${log_line}" | grep -c 'Received HTTP response (200) \[Idle\]') -gt 0 ]]; then
			log_super "MDM: Received blank push."
			log_mdm_command "**** TIMESTAMP ****"
		elif [[ $(echo "${log_line}" | grep -c 'Received HTTP response (200) \[Acknowledged(AvailableOSUpdates)') -gt 0 ]]; then
			log_super "MDM: Received push command \"AvailableOSUpdates\"."
			log_mdm_command "**** TIMESTAMP ****"
		elif [[ $(echo "${log_line}" | grep -c 'Received HTTP response (200) \[Acknowledged(ScheduleOSUpdate)') -gt 0 ]]; then
			kill -9 "${log_stream_mdm_command_pid}" > /dev/null 2>&1
			[[ "${verbose_mode_option}" == "TRUE" ]] && kill -9 "${log_stream_mdm_command_debug_pid}" > /dev/null 2>&1
			log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE/UPGRADE MACOS VIA MDM COMMAND COMPLETED ****"
			log_super "MDM: Received push command \"ScheduleOSUpdate\", local update/upgrade workflow should start soon..."
			install_macos_mdm_start_timeout="FALSE"
			break
		fi
	done < <(tail -n1 -F "${MDM_COMMAND_LOG}")
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_start_error is: ${install_macos_mdm_start_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_start_timeout is: ${install_macos_mdm_start_timeout}"

# Only continue workflow if the the final (required) 'ScheduleOSUpdate' MDM command was received.
if [[ "${auth_error_jamf}" == "FALSE" ]] && [[ "${install_macos_mdm_api_error}" == "FALSE" ]] && [[ "${install_macos_mdm_start_error}" == "FALSE" ]] && [[ "${install_macos_mdm_start_timeout}" == "FALSE" ]]; then
	local install_macos_mdm_timeout_error
	install_macos_mdm_timeout_error="TRUE"
	local install_macos_mdm_timeout_seconds
	install_macos_mdm_timeout_seconds="${TIMEOUT_MDM_COMMAND_SECONDS}"
	local install_macos_mdm_phase
	install_macos_mdm_phase="START"
	local install_macos_mdm_complete_percent
	install_macos_mdm_complete_percent=0
	local install_macos_mdm_complete_percent_previous
	install_macos_mdm_complete_percent_previous=0
	local install_macos_mdm_complete_percent_display
	
	# Watch ${MDM_WORKFLOW_LOG} while waiting for the update/upgrade workflow to complete.
	# Note this while read loop has a timeout based on ${TIMEOUT_MDM_COMMAND_SECONDS} then may change to ${TIMEOUT_MDM_WORKFLOW_SECONDS}.
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_workflow_type is: ${install_macos_mdm_workflow_type}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_timeout_seconds is: ${install_macos_mdm_timeout_seconds}"
	if [[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] || [[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]]; then
		while read -t "${install_macos_mdm_timeout_seconds}" -r log_line ; do
			# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
			if [[ $(echo "${log_line}" | grep -c 'phase:PREFLIGHT') -gt 0 ]]; then
				if [[ "${install_macos_mdm_phase}" != "PREFLIGHT" ]] && [[ "${install_macos_mdm_phase}" != "DOWNLOADING" ]] && [[ "${install_macos_mdm_phase}" != "PREPARING" ]]; then
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_super "MDM: ${asu_macos_major_upgrade_label_target} upgrade preflight..."
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_super "MDM: ${asu_macos_minor_update_label} update preflight..."
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_timeout_seconds="${TIMEOUT_MDM_WORKFLOW_SECONDS}"
					[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_timeout_seconds is: ${install_macos_mdm_timeout_seconds}"
					install_macos_mdm_phase="PREFLIGHT"
				fi
			elif [[ $(echo "${log_line}" | grep -c 'phase:DOWNLOADING_UPDATE') -gt 0 ]]; then
				if [[ "${install_macos_mdm_phase}" != "DOWNLOADING" ]]; then
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_super "MDM: ${asu_macos_major_upgrade_label_target} upgrade is downloading..."
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_super "MDM: ${asu_macos_minor_update_label} update is downloading..."
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_timeout_seconds="${TIMEOUT_MDM_WORKFLOW_SECONDS}"
					[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_timeout_seconds is: ${install_macos_mdm_timeout_seconds}"
					install_macos_mdm_phase="DOWNLOADING"
				fi
				install_macos_mdm_complete_percent=$(echo "${log_line}" | awk '{print $17}' | sed -e 's/portionComplete:0.//' | cut -c 1-2)
				install_macos_mdm_complete_percent=${install_macos_mdm_complete_percent#0}
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_complete_percent is: ${install_macos_mdm_complete_percent}"
				if [[ $install_macos_mdm_complete_percent -ge 60 ]]; then
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_echo_replace_line "${asu_macos_major_upgrade_label_target} upgrade download progress: 100%\n"
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_echo_replace_line "${asu_macos_minor_update_label} update download progress: 100%\n"
				elif [[ $install_macos_mdm_complete_percent -gt $install_macos_mdm_complete_percent_previous ]]; then
					install_macos_mdm_complete_percent_display=$( (echo "$install_macos_mdm_complete_percent * 1.69" | bc ) | cut -d '.' -f1)
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_echo_replace_line "${asu_macos_major_upgrade_label_target} upgrade download progress: ${install_macos_mdm_complete_percent_display}%"
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_echo_replace_line "${asu_macos_minor_update_label} update download progress: ${install_macos_mdm_complete_percent_display}%"
					install_macos_mdm_complete_percent_previous=$install_macos_mdm_complete_percent
				fi
			elif [[ $(echo "${log_line}" | grep -c 'phase:PREPARING_UPDATE') -gt 0 ]]; then
				if [[ "${install_macos_mdm_phase}" != "PREPARING" ]]; then
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_super "MDM: ${asu_macos_major_upgrade_label_target} upgrade download complete, now preparing..."
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_super "MDM: ${asu_macos_minor_update_label} update download complete, now preparing..."
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_timeout_seconds=${TIMEOUT_MDM_WORKFLOW_SECONDS}
					[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_timeout_seconds is: ${install_macos_mdm_timeout_seconds}"
					install_macos_mdm_phase="PREPARING"
				fi
				install_macos_mdm_complete_percent=$(echo "${log_line}" | awk '{print $17}' | sed -e 's/portionComplete:0.//' | cut -c 1-2)
				install_macos_mdm_complete_percent=${install_macos_mdm_complete_percent#0}
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_complete_percent is: ${install_macos_mdm_complete_percent}"
				if [[ $install_macos_mdm_complete_percent -ge 98 ]]; then
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_echo_replace_line "${asu_macos_major_upgrade_label_target} upgrade preparing progress: 100%\n"
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_super "MDM: ${asu_macos_major_upgrade_label_target} upgrade is downloaded and prepared, system restart is soon..."
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_echo_replace_line "${asu_macos_minor_update_label} update preparing progress: 100%\n"
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_super "MDM: ${asu_macos_minor_update_label} update is downloaded and prepared, system restart is soon..."
					log_mdm_workflow "**** TIMESTAMP ****"
				elif [[ $install_macos_mdm_complete_percent -gt $install_macos_mdm_complete_percent_previous ]]; then
					install_macos_mdm_complete_percent_display=$(((install_macos_mdm_complete_percent-60)*2))
					[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_echo_replace_line "${asu_macos_major_upgrade_label_target} upgrade preparing progress: ${install_macos_mdm_complete_percent_display}%"
					[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_echo_replace_line "${asu_macos_minor_update_label} update preparing progress: ${install_macos_mdm_complete_percent_display}%"
					install_macos_mdm_complete_percent_previous=$install_macos_mdm_complete_percent
				fi
			elif [[ $(echo "${log_line}" | grep -c 'phase:PREPARED_COMMITTING_STASH') -gt 0 ]]; then
				log_mdm_workflow "**** TIMESTAMP ****"
				install_macos_mdm_timeout_error="FALSE"
				install_macos_mdm_phase="DONE"
				break
			fi
		done < <(tail -n1 -F "${MDM_WORKFLOW_LOG}")
	else # ${install_macos_mdm_workflow_type} == "INSTALLER"
		# This while loop is broken into sections to allow for the notification_prepare function to update. Putting this function inside the while loop breaks the tail.
		while read -t "${install_macos_mdm_timeout_seconds}" -r log_line ; do
			# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
			if [[ $(echo "${log_line}" | grep -c 'phase:PREFLIGHT') -gt 0 ]]; then
				log_super "MDM: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installer preflight..."
				log_mdm_workflow "**** TIMESTAMP ****"
				install_macos_mdm_timeout_seconds="${TIMEOUT_MDM_WORKFLOW_SECONDS}"
				[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_timeout_seconds is: ${install_macos_mdm_timeout_seconds}"
				install_macos_mdm_timeout_error="FALSE"
				install_macos_mdm_phase="PREFLIGHT"
				break
			fi
		done < <(tail -n1 -F "${MDM_WORKFLOW_LOG}")
		if [[ "${install_macos_mdm_timeout_error}" == "FALSE" ]]; then
		install_macos_mdm_timeout_error="TRUE"
			while read -t "${install_macos_mdm_timeout_seconds}" -r log_line ; do
				# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
				if [[ $(echo "${log_line}" | grep -c 'phase:DOWNLOADING_SFR') -gt 0 ]]; then
					log_super "MDM: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} downloading additional items..."
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_phase="DOWNLOADING"
				elif [[ $(echo "${log_line}" | grep -c 'phase:PREPARING_UPDATE') -gt 0 ]]; then
					log_super "MDM: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installer preparing..."
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_timeout_error="FALSE"
					install_macos_mdm_phase="PREPARING"
					break
				fi
			done < <(tail -n1 -F "${MDM_WORKFLOW_LOG}")
		fi
		if [[ "${install_macos_mdm_timeout_error}" == "FALSE" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; then
			display_string_prepare_time_estimate="10-15"
			notification_prepare
		fi
		if [[ "${install_macos_mdm_timeout_error}" == "FALSE" ]]; then
		install_macos_mdm_timeout_error="TRUE"
			while read -t "${install_macos_mdm_timeout_seconds}" -r log_line ; do
				# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
				if [[ $(echo "${log_line}" | grep -c 'phase:PREPARED') -gt 0 ]]; then
					log_super "MDM: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installer is prepared, system restart is soon..."
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_timeout_error="FALSE"
					install_macos_mdm_phase="DONE"
					break
				fi
			done < <(tail -n1 -F "${MDM_WORKFLOW_LOG}")
		fi
		{ [[ "${install_macos_mdm_timeout_error}" == "FALSE" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; } && notification_restart 
		if [[ "${install_macos_mdm_timeout_error}" == "FALSE" ]]; then
		install_macos_mdm_timeout_error="TRUE"
			while read -t "${install_macos_mdm_timeout_seconds}" -r log_line ; do
				# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
				if [[ $(echo "${log_line}" | grep -c 'phase:ACCEPTED') -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'phase:APPLYING') -gt 0 ]] || [[ $(echo "${log_line}" | grep -c 'phase:APPLYING') -gt 0 ]]; then
					log_mdm_workflow "**** TIMESTAMP ****"
					install_macos_mdm_timeout_error="FALSE"
					install_macos_mdm_phase="DONE"
					break
				fi
			done < <(tail -n1 -F "${MDM_WORKFLOW_LOG}")
		fi
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_timeout_error is: ${install_macos_mdm_timeout_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_mdm_phase is: ${install_macos_mdm_phase}"

# If the macOS update/upgrade completed, then prepare for restart.
if [[ "${auth_error_jamf}" == "FALSE" ]] && [[ "${install_macos_mdm_api_error}" == "FALSE" ]] && [[ "${install_macos_mdm_start_error}" == "FALSE" ]] && [[ "${install_macos_mdm_start_timeout}" == "FALSE" ]] && [[ "${install_macos_mdm_timeout_error}" == "FALSE" ]]; then
	touch "${WORKFLOW_RESTART_VALIDATE_FILE}"
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	kill -9 "${log_stream_mdm_workflow_pid}" > /dev/null 2>&1
	[[ "${verbose_mode_option}" == "TRUE" ]] && kill -9 "${log_stream_mdm_workflow_debug_pid}" > /dev/null 2>&1
	log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE/UPGRADE MACOS VIA MDM COMPLETED ****"
	[[ "${install_macos_mdm_workflow_type}" == "UPGRADE" ]] && log_super "MDM: ${asu_macos_major_upgrade_label_target} upgrade is prepared and ready for restart!"
	[[ "${install_macos_mdm_workflow_type}" == "UPDATE" ]] && log_super "MDM: ${asu_macos_minor_update_label} update is prepared and ready for restart!"
	[[ "${install_macos_mdm_workflow_type}" == "INSTALLER" ]] && log_super "MDM: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installer is prepared and ready for restart!"
	if [[ "${install_macos_mdm_workflow_type}" == "INSTALLER" ]] && [[ "${current_user_account_name}" != "FALSE" ]]; then
		log_super "MDM: Forcing logout for current user: ${current_user_account_name}."
		launchctl bootout "user/${current_user_id}" &
		disown %
	fi
else # Some part of the MDM workflow failed.
	kill -9 "${log_stream_mdm_command_pid}" > /dev/null 2>&1
	[[ "${verbose_mode_option}" == "TRUE" ]] && kill -9 "${log_stream_mdm_command_debug_pid}" > /dev/null 2>&1
	log_mdm_command "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE/UPGRADE MACOS VIA MDM FAILED ****"
	[[ "${verbose_mode_option}" == "TRUE" ]] && kill -9 "${log_stream_mdm_workflow_debug_pid}" > /dev/null 2>&1
	kill -9 "${log_stream_mdm_workflow_pid}" > /dev/null 2>&1
	log_mdm_workflow "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - UPDATE/UPGRADE MACOS VIA MDM FAILED ****"
	if [[ "${auth_error_jamf}" == "TRUE" ]]; then
		log_mdm_command "Error: Failed to validate Jamf Pro API configuration. Verify Jamf Pro API configuration: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials"
		log_mdm_workflow "Error: Failed to validate Jamf Pro API configuration. Verify Jamf Pro API configuration: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials"
		log_super "Error: Failed to validate Jamf Pro API configuration. Verify Jamf Pro API configuration: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials"
	elif [[ "${install_macos_mdm_api_error}" == "TRUE" ]]; then
		log_mdm_command "Error: Failed to send MDM install update/upgrade macOS request. Verify that this account has appropriate privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-account-privileges"
		log_mdm_workflow "Error: Failed to send MDM install update/upgrade macOS request. Verify that this account has appropriate privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-account-privileges"
		log_super "Error: Failed to send MDM install update/upgrade macOS request. Verify that this account has appropriate privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-account-privileges"
	elif [[ "${install_macos_mdm_start_error}" == "TRUE" ]]; then
		log_mdm_command "Error: Push workflow for macOS update/upgrade via MDM failed."
		log_mdm_workflow "Error: Push workflow for macOS update/upgrade via MDM failed."
		log_super "Error: Push workflow for macOS update/upgrade via MDM failed."
	elif [[ "${install_macos_mdm_start_timeout}" == "TRUE" ]]; then
		log_mdm_command "Error: Push workflow for macOS update/upgrade via MDM failed to complete, as indicated by no progress after watiting for ${TIMEOUT_MDM_COMMAND_SECONDS} seconds."
		log_mdm_workflow "Error: Push workflow for macOS update/upgrade via MDM failed to complete, as indicated by no progress after watiting for ${TIMEOUT_MDM_COMMAND_SECONDS} seconds."
		log_super "Error: Push workflow for macOS update/upgrade via MDM failed to complete, as indicated by no progress after watiting for ${TIMEOUT_MDM_COMMAND_SECONDS} seconds."
	else # "${install_macos_mdm_timeout_error}" == "TRUE"
		log_mdm_workflow "Error: Installation of macOS update/upgrade via MDM failed to complete, as indicated by no progress after watiting for ${install_macos_mdm_timeout_seconds} seconds."
		log_super "Error: Installation of macOS update/upgrade via MDM failed to complete, as indicated by no progress after watiting for ${install_macos_mdm_timeout_seconds} seconds."
	fi
	
	# Handle workflow failure options.
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		if [[ "${auth_mdm_failover}" == "TRUE" ]]; then # User authentication MDM failover option enabled.
			log_super "Error: Installation of macOS update/upgrade via MDM failed, failing over to user authenticated workflow."
			[[ "${install_macos_major_upgrades_option}" == "TRUE" ]] && workflow_auth_macos="FAILOVER"
			workflow_auth_macos="FAILOVER"
			unset workflow_jamf_policy_triggers_option
			workflow_install_macos_active_user
			return 0
		else # No user authentication MDM failover option.
			log_super "Error: Installation of  macOS update/upgrade via MDM failed, install now workflow can not continue."
			log_status "Inactive Error: Installation of macOS update/upgrade via MDM failed, install now workflow can not continue."
			[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
			exit_error
		fi
	else # Default super workflow.
		if [[ "${current_user_account_name}" != "FALSE" ]] && [[ "${auth_mdm_failover}" == "TRUE" ]]; then
			log_super "Error: Installation of update/upgrade via MDM failed, failing over to user authenticated workflow."
			[[ "${install_macos_major_upgrades_option}" == "TRUE" ]] && workflow_auth_macos="FAILOVER"
			workflow_auth_macos="FAILOVER"
			unset workflow_jamf_policy_triggers_option
			workflow_install_macos_active_user
			return 0
		else # No current user, or no user authentication MDM failover option.
			deferral_timer_minutes="${deferral_timer_error_minutes}"
			log_super "Error: Installation of macOS update/upgrade via MDM failed, trying again in ${deferral_timer_minutes} minutes."
			log_status "Pending: Installation of macOS update/upgrade via MDM failed, trying again in ${deferral_timer_minutes} minutes."
			[[ "${current_user_account_name}" != "FALSE" ]] && notification_failed
			set_auto_launch_deferral
		fi
	fi
fi
}

# Install macOS major upgrade via macOS installer application, and also save results to ${SUPER_LOG}, ${INSTALLER_WORKFLOW_LOG}, and ${SUPER_LOCAL_PLIST}.
install_macos_app() {
# If ${test_mode_option} then it's not necessary to continue this function.
if [[ "${test_mode_option}" == "TRUE" ]]; then
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	log_super "Test Mode: Skipping the macOS major upgrade via insaller workflow."
	if [[ "${current_user_account_name}" != "FALSE" ]]; then
		log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the macOS major upgrade via insaller preparation notification..."
		sleep "${test_mode_timeout_seconds}"
		notification_restart
		log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the restart notification..."
		sleep "${test_mode_timeout_seconds}"
		killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
	fi
	# Reset various items after test macOS update is complete.
	restart_workflow_automatic_zero_date
	restart_deadline_counters
	return 0
fi

# Start with log and status updates.
log_super "startosinstall: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} install upgrade workflow, check ${INSTALLER_WORKFLOW_LOG} for more detail."
log_status "Running: Starting ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} install upgrade workflow."
log_installer "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} START ****"

# Background the startosinstall process and send to ${INSTALLER_WORKFLOW_LOG}.
if [[ "${mac_cpu_architecture}" == "arm64" ]]; then # Apple Silicon.
	"/Applications/Install ${macos_installer_marketing_name_target}.app/Contents/Resources/startosinstall" --agreetolicense --forcequitapps --user "${auth_local_account}" --stdinpass <<< "${auth_local_password}" >> "${INSTALLER_WORKFLOW_LOG}" 2>&1 &
else # Intel.
	"/Applications/Install ${macos_installer_marketing_name_target}.app/Contents/Resources/startosinstall" --agreetolicense --forcequitapps >> "${INSTALLER_WORKFLOW_LOG}" 2>&1 &
fi
local install_macos_app_pid
install_macos_app_pid="$!"

# Watch ${INSTALLER_WORKFLOW_LOG} while waiting for the startosinstall process to complete.
# Note this while read loop has a timeout based on ${TIMEOUT_START_SECONDS} then changes to ${TIMEOUT_INSTALLER_WORKFLOW_SECONDS}.
local install_macos_app_start_error
install_macos_app_start_error="TRUE"
local install_macos_app_start_timeout
install_macos_app_start_timeout="TRUE"
local install_macos_app_timeout
install_macos_app_timeout="TRUE"
local install_macos_app_timeout_seconds
install_macos_app_timeout_seconds="${TIMEOUT_START_SECONDS}"
local install_macos_app_phase
install_macos_app_phase="START"
local install_macos_app_complete_percent
install_macos_app_complete_percent=0
local install_macos_app_complete_percent_previous
install_macos_app_complete_percent_previous=0
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_app_timeout_seconds is: ${install_macos_app_timeout_seconds}"
while read -t "${install_macos_app_timeout_seconds}" -r log_line ; do
	# log_super "Debug Mode: Function ${FUNCNAME[0]}: log_line is:\n${log_line}"
	if [[ $(echo "${log_line}" | grep -c 'Preparing to run') -gt 0 ]]; then
		log_super "startosinstall: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} preparing installation..."
		log_installer "**** TIMESTAMP ****"
		install_macos_app_phase="PREPARING"
		install_macos_app_timeout_seconds="${TIMEOUT_INSTALLER_WORKFLOW_SECONDS}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_app_timeout_seconds is: ${install_macos_app_timeout_seconds}"
		install_macos_app_start_error="FALSE"
	elif [[ $(echo "${log_line}" | grep -c 'Preparing:') -gt 0 ]] && [[ "${install_macos_app_phase}" == "PREPARING" ]]; then
		install_macos_app_start_timeout="FALSE"
		install_macos_app_complete_percent=$(echo "${log_line}" | sed -e 's/Preparing: //' -e 's/\.[0-9]//' | tr -d '\n' | tr -d '\r')
		install_macos_app_complete_percent=${install_macos_app_complete_percent#0}
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_app_complete_percent is: ${install_macos_app_complete_percent}"
		if [[ $install_macos_app_complete_percent -ge 99 ]]; then
			log_installer "**** TIMESTAMP ****"
			log_echo_replace_line "${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installation preparing progress: 100%\n"
			install_macos_app_timeout="FALSE"
			break
		elif [[ $install_macos_app_complete_percent -gt $install_macos_app_complete_percent_previous ]]; then
			log_echo_replace_line "${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installation preparing progress: ${install_macos_app_complete_percent}%"
			install_macos_app_complete_percent_previous=$install_macos_app_complete_percent
		fi
	elif [[ $(echo "${log_line}" | grep -c -e 'Preparing: 99' -e 'Preparing: 100' -e 'Restarting') -gt 0 ]]; then
		log_installer "**** TIMESTAMP ****"
		log_echo_replace_line "${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} installation preparing progress: 100%\n"
		install_macos_app_start_error="FALSE"
		install_macos_app_start_timeout="FALSE"
		install_macos_app_timeout="FALSE"
		break
	fi
done < <(tail -n1 -F "${INSTALLER_WORKFLOW_LOG}" | tr -u '%' '\n')
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_app_start_error is: ${install_macos_app_start_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_app_start_timeout is: ${install_macos_app_start_timeout}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: install_macos_app_timeout is: ${install_macos_app_timeout}"

# If the startosinstall workflow completed, then prepare for restart.
if [[ "${install_macos_app_start_error}" == "FALSE" ]] && [[ "${install_macos_app_start_timeout}" == "FALSE" ]] && [[ "${install_macos_app_timeout}" == "FALSE" ]]; then
	touch "${WORKFLOW_RESTART_VALIDATE_FILE}"
	rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
	log_installer "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL MACOS COMPLETED ****"
	log_super "Status: ${macos_installer_marketing_name_target} ${macos_installer_version_target}-${macos_installer_build_target} is prepared and ready for restart!"
	[[ "${current_user_account_name}" != "FALSE" ]] && notification_restart
else # Some part of the startosinstall workflow failed.
	log_installer "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL MACOS FAILED ****"
	kill -9 "${install_macos_app_pid}" > /dev/null 2>&1
	if [[ "${install_macos_app_start_error}" == "TRUE" ]]; then
		log_installer "Error: Installation of macOS major upgrade via installer application failed to start."
		log_super "Error: Installation of macOS major upgrade via installer application failed to start."
	elif [[ "${install_macos_app_start_timeout}" == "TRUE" ]]; then
		log_installer "Error: Installation of macOS major upgrade via installer application failed to start preparing after watiting for ${install_macos_app_timeout_seconds} seconds."
		log_super "Error: Installation of macOS major upgrade via installer application failed to start preparing after watiting for ${install_macos_app_timeout_seconds} seconds."
	else # "${install_macos_app_timeout}" == "TRUE"
		log_installer "Error: Installation of macOS major upgrade via installer application failed to prepare, as indicated by no progress after watiting for ${install_macos_app_timeout_seconds} seconds."
		log_super "Error: Installation of macOS major upgrade via installer application failed to prepare, as indicated by no progress after watiting for ${install_macos_app_timeout_seconds} seconds."
	fi
	
	# Handle workflow failure options.
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_installer "Error: Installation of macOS major upgrade via installer application failed, install now workflow can not continue."
		log_super "Error: Installation of macOS major upgrade via installer application failed, install now workflow can not continue."
		log_status "Inactive Error: Installation of macOS major upgrade via installer application failed, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_installer "Error: Installation of macOS major upgrade via installer application failed, trying again in ${deferral_timer_minutes} minutes."
		log_super "Error: Installation of macOS major upgrade via installer application failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Installation of macOS major upgrade via installer application failed, trying again in ${deferral_timer_minutes} minutes."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_failed
		set_auto_launch_deferral
	fi
fi
}

# This is the install workflow for all (non-system) Apple software updates when enforced.
workflow_install_non_system_asu() {
[[ "${current_user_account_name}" != "FALSE" ]] && notification_non_system_updates

# If ${test_mode_option} then it's not necessary to continue this function.
if [[ "${test_mode_option}" == "TRUE" ]]; then
	log_super "Test Mode: Skipping the install non-system Apple software updates workflow."
	log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the non-system Apple software updates notification..."
	sleep "${test_mode_timeout_seconds}"
	killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
	return 0
fi

# Install and Double-check to make sure all updates are complete.
install_non_system_asu
workflow_software_full_check_required="TRUE"
workflow_check_asu
workflow_check_macos_major_upgrades
check_macos_downloads

# If we had failures, then try again.
if [[ "${install_non_system_asu_error}" == "TRUE" ]]; then
	log_super "Warning: Failed to install all non-system Apple software updates."
	[[ "${asu_non_system_update_available}" == "TRUE" ]] && install_non_system_asu
	# If it failed twice, then try again later.
	if [[ "${install_non_system_asu_error}" == "TRUE" ]]; then
		if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
			log_super "Error: Failed to install all non-system Apple software updates after multiple attempts, install now workflow can not continue."
			log_status "Inactive Error: Failed to install all non-system Apple software updates after multiple attempts, install now workflow can not continue."
			[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
			exit_error
		else
			deferral_timer_minutes="${deferral_timer_error_minutes}"
			log_super "Warning: Failed to install all non-system Apple software updates after multiple attempts, trying again in ${deferral_timer_minutes} minutes."
			log_status "Pending: Failed to install all non-system Apple software updates after multiple attempts, trying again in ${deferral_timer_minutes} minutes."
			set_auto_launch_deferral
		fi
	else # Installation did not fail.
		workflow_software_full_check_required="TRUE"
		workflow_check_asu
		workflow_check_macos_major_upgrades
		check_macos_downloads
	fi
fi

# Log status of non-system update completion.
rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
if [[ "${asu_non_system_update_available}" == "FALSE" ]]; then
	log_super "Status: Completed installation of all non-system Apple software updates!"
	# For computers managed via Jamf Pro, submit inventory.
	if [[ "${jamf_version}" != "FALSE" ]]; then
		if [[ "${auth_error_jamf}" != "TRUE" ]]; then
			log_super "Status: Submitting updated inventory to Jamf Pro. Use --verbose-mode or check /var/log/jamf.log for more detail..."
			if [[ "${verbose_mode_option}" == "TRUE" ]]; then
				local jamf_response
				jamf_response=$("${JAMF_PRO_BINARY}" recon -verbose 2>&1)
				log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_response is:\n${jamf_response}"
			else
				"${JAMF_PRO_BINARY}" recon > /dev/null 2>&1
			fi
		else # There was an earlier Jamf Pro validation error.
			if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
				log_super "Warning: Unable to submit inventory to Jamf Pro."
			else
				deferral_timer_minutes="${deferral_timer_error_minutes}"
				log_super "Error: Unable to submit inventory to Jamf Pro, trying again in ${deferral_timer_minutes} minutes."
				log_status "Pending: Unable to submit inventory to Jamf Pro, trying again in ${deferral_timer_minutes} minutes."
				set_auto_launch_deferral
			fi
		fi
	fi
else # Some software updates did not complete
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
		log_super "Error: Some non-system Apple software updates did not complete, install now workflow can not continue."
		log_status "Inactive Error: Some non-system Apple software updates did not complete, install now workflow can not continue."
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
		exit_error
	else
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Warning: Some non-system Apple software updates did not complete, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: Some non-system Apple software updates did not complete, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

# This is the install and restart workflow when a user is NOT logged in.
workflow_install_macos_no_user() {
local workflow_install_macos_no_user_error
workflow_install_macos_no_user_error="FALSE"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available is: ${asu_macos_minor_update_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_auth_macos is: ${workflow_auth_macos}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_install_now_option is: ${workflow_install_now_option}"

# A macOS update/upgrade is expected.
if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]] || [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then
	# Check to make sure system has enough available storage space.
	check_storage_available
	if [[ "${check_storage_available_error}" == "TRUE" ]]; then
		workflow_install_macos_no_user_error="TRUE"
	elif [[ "${storage_ready}" == "FALSE" ]]; then
		log_super "Status: Current available storage is at ${storage_available_gigabytes} GBs which is below the ${storage_required_gigabytes} GBs that is required for download."; workflow_install_macos_no_user_error="TRUE"
	fi
	
	# Check to make sure system is plugged into AC power or that the current battery level is above ${power_required_battery_percent}.
	check_power_required
	if [[ "${check_power_required_error}" == "TRUE" ]]; then
		workflow_install_macos_no_user_error="TRUE"
	elif [[ "${power_ready}" == "FALSE" ]]; then
		log_super "Status: Current battery level is at ${power_battery_percent}% which is below the minimum required level of ${power_required_battery_percent}%."; workflow_install_macos_no_user_error="TRUE"
	fi
	
	# If MDM workflow is expected, check for MDM service and bootstrap token.
	if [[ "${workflow_auth_macos}" == "JAMF" ]]; then
		check_mdm_service
		if [[ "${auth_error_mdm}" == "FALSE" ]]; then
			check_bootstrap_token_escrow
			if [[ "${auth_error_bootstrap_token}" == "TRUE" ]]; then
				log_super "Error: Can not use MDM workflow because this computer's bootstrap token escrow is not valid."; workflow_install_macos_no_user_error="TRUE"
			fi
		else # MDM service is unavailable.
			log_super "Error: Can not use MDM workflow because the MDM service is not available."; workflow_install_macos_no_user_error="TRUE"
		fi
	fi
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_install_macos_no_user_error is: ${workflow_install_macos_no_user_error}"
	
	# For computers with Apple silicon, get saved authentication.
	if [[ "${mac_cpu_architecture}" == "arm64" ]] && [[ "${workflow_auth_macos}" != "USER" ]] && [[ "${workflow_auth_macos}" != "FAILOVER" ]]; then
		get_saved_authentication
		[[ "${auth_error_saved}" == "TRUE" ]] && workflow_install_macos_no_user_error="TRUE"
	fi
	
	# If no errors, then start the appropriate macOS update/upgrade workflow.
	if [[ "${workflow_install_macos_no_user_error}" == "FALSE" ]]; then
		if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # A macOS major upgrade is available and option to allow upgrade is enabled.
			if [[ "${workflow_auth_macos}" == "LOCAL" ]]; then
				if [[ "${macos_version_number}" -ge 1203 ]]; then # macOS 12.3 or newer upgrade locally via softwareupdate.
					[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
					install_macos_asu
				else # Systems older than macOS 12.3 upgrade via installer application.
					download_macos_installer
					if [[ "${download_macos_installer_error}" == "FALSE" ]]; then
						[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
						install_macos_app
					else # "${download_macos_installer_error}" == "TRUE"
						workflow_install_macos_no_user_error="TRUE"
					fi
				fi
			elif [[ "${workflow_auth_macos}" == "JAMF" ]]; then
				[[ "${macos_version_major}" -lt 13 ]] && download_macos_installer
				[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
				install_macos_mdm
			else # Apple Silicon with no saved update/upgrade credentials can not enforce macOS upgrade.
				log_super "Error: No saved Apple silicon credentials and no active logged in user."; workflow_install_macos_no_user_error="TRUE"
			fi
		elif [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then # A macOS minor update is available.
			if [[ "${workflow_auth_macos}" == "LOCAL" ]]; then
				[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
				install_macos_asu
			elif [[ "${workflow_auth_macos}" == "JAMF" ]]; then
				[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
				install_macos_mdm
			else # Apple Silicon with no valid update/upgrade credentials can not enforce macOS update.
				log_super "Error: No saved Apple silicon credentials and no active logged in user."; workflow_install_macos_no_user_error="TRUE"
			fi
		fi
	fi
else # Workflow when there is no macOS updates/upgrade.
	[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
	if [[ "${workflow_restart_without_updates_option}" == "TRUE" ]]; then # If requested, restart without updates.
		rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
		touch "${WORKFLOW_RESTART_VALIDATE_FILE}"
		log_super "Forced Restart Mode: Restarting computer..."
		shutdown -o -r +1 &
		disown -a
	else # Option to restart without updates is not enabled.
		log_super "Warning: When no macOS update/upgrade is available you must also specify the --workflow-restart-without-updates option to restart automatically."
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_install_macos_no_user_error is: ${workflow_install_macos_no_user_error}"

# Handle workflow failure options.
if [[ "${workflow_install_macos_no_user_error}" == "TRUE" ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_super "Error: macOS update/upgrade workflow failed, install now workflow can not continue."
		log_status "Inactive Error: macOS update/upgrade workflow failed, install now workflow can not continue."
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: macOS update/upgrade workflow failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: macOS update/upgrade workflow failed, trying again in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

# This is the install and restart workflow when a user is logged in.
workflow_install_macos_active_user() {
local workflow_install_macos_active_user_error
workflow_install_macos_active_user_error="FALSE"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available is: ${asu_macos_minor_update_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_auth_macos is: ${workflow_auth_macos}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_install_now_option is: ${workflow_install_now_option}"

# A macOS update/upgrade is expected.
if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]] || [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then
	# Check to make sure system has enough available storage space.
	check_storage_available
	if [[ "${check_storage_available_error}" == "FALSE" ]]; then
		if [[ "${storage_ready}" == "FALSE" ]]; then
			notification_insufficient_storage
			[[ "${notification_insufficient_storage_error}" == "TRUE" ]] && workflow_install_macos_active_user_error="TRUE"
		fi
	else # "${check_storage_available_error}" == "TRUE"
		workflow_install_macos_active_user_error="TRUE"
	fi
	
	# Check to make sure system is plugged into AC power or that the current battery level is above ${power_required_battery_percent}.
	check_power_required
	if [[ "${check_power_required_error}" == "FALSE" ]]; then
		if [[ "${power_ready}" == "FALSE" ]]; then
			notification_power_required
			[[ "${notification_power_required_error}" == "TRUE" ]] && workflow_install_macos_active_user_error="TRUE"
		fi
	else # "${check_power_required_error}" == "TRUE"
		workflow_install_macos_active_user_error="TRUE"
	fi
	
	# If MDM workflow is expected, first check for MDM service, bootstrap token, and possibly failover to user authentication workflow.
	if [[ "${workflow_auth_macos}" == "JAMF" ]]; then
		check_mdm_service
		if [[ "${auth_error_mdm}" == "TRUE" ]]; then
			if [[ "${auth_mdm_failover}" == "TRUE" ]] || [[ "${auth_mdm_failover_no_service}" == "TRUE" ]] || { [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${auth_mdm_failover_install_now}" == "TRUE" ]]; }; then
				log_super "Warning: MDM service is not available, failing over to user authenticated workflow."
				workflow_auth_macos="FAILOVER"
			else
				log_super "Error: Can not use MDM workflow because the MDM service is not available."
				workflow_install_macos_active_user_error="TRUE"
			fi
		else # MDM service is available.
			check_bootstrap_token_escrow
			if [[ "${auth_error_bootstrap_token}" == "TRUE" ]]; then
				if [[ "${auth_mdm_failover}" == "TRUE" ]] || [[ "${auth_mdm_failover_bootstrap}" == "TRUE" ]] || { [[ "${workflow_install_now_option}" == "TRUE" ]] && [[ "${auth_mdm_failover_install_now}" == "TRUE" ]]; }; then
					log_super "Warning: Missing or invalid bootstrap token escrow, failing over to user authenticated workflow."
					workflow_auth_macos="FAILOVER"
				else
					log_super "Error: Can not use MDM workflow because this computer's bootstrap token is not escrowed."
					workflow_install_macos_active_user_error="TRUE"
				fi
			fi
		fi
	fi
	
	# For computers with Apple silicon, get authentication.
	if [[ "${mac_cpu_architecture}" == "arm64" ]]; then
		if [[ "${workflow_auth_macos}" == "LOCAL" ]] || [[ "${workflow_auth_macos}" == "JAMF" ]]; then
			get_saved_authentication
			if [[ "${auth_error_saved}" == "TRUE" ]]; then
				if [[ "${auth_credential_failover_to_user_option}" == "TRUE" ]] || [[ "${auth_ask_user_to_save_password}" == "TRUE" ]]; then
					log_super "Warning: Saved authentication error, failing over to user authenticated workflow."
					workflow_auth_macos="FAILOVER"
					dialog_user_auth
					[[ "${dialog_user_auth_error}" == "TRUE" ]] && workflow_install_macos_active_user_error="TRUE"
				else
					log_super "Error: Can not use saved authentication and the --auth-credential-failover-to-user option is not enabled."
					workflow_install_macos_active_user_error="TRUE"
				fi
			fi
		else # Need to show user authentication dialog.
			dialog_user_auth
			[[ "${dialog_user_auth_error}" == "TRUE" ]] && workflow_install_macos_active_user_error="TRUE"
		fi
	fi
	
	# If no errors, then start the appropriate macOS update/upgrade workflow.
	if [[ "${workflow_install_macos_active_user_error}" == "FALSE" ]]; then
		# Logic to start the appropriate update/upgrade workflow.
		if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # A macOS major upgrade is available and option to allow upgrade is enabled.
			if [[ "${workflow_auth_macos}" == "LOCAL" ]] || [[ "${workflow_auth_macos}" == "USER" ]] || [[ "${workflow_auth_macos}" == "FAILOVER" ]]; then
				if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "FAILOVER" ]]; }; then # macOS 13 or newer always upgrades via softwareupdate. macOS 12.3 or newer can as well but not when the MDM workflow fails.
					notification_restart
					[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
					install_macos_asu
				else # Systems older than macOS 12.3 upgrade via installer application, or when the MDM workflow fails.
					display_string_prepare_time_estimate="15-25"
					notification_prepare
					[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
					install_macos_app
				fi
			elif [[ "${workflow_auth_macos}" == "JAMF" ]]; then
				[[ "${macos_version_major}" -ge 13 ]] && display_string_prepare_time_estimate="5"
				[[ "${macos_version_major}" -lt 13 ]] && display_string_prepare_time_estimate="25-30"
				notification_prepare
				[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
				install_macos_mdm
			fi
		elif [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then # A macOS minor update is available.
			if [[ "${workflow_auth_macos}" == "LOCAL" ]] || [[ "${workflow_auth_macos}" == "USER" ]] || [[ "${workflow_auth_macos}" == "FAILOVER" ]]; then
				notification_restart
				[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
				install_macos_asu
			elif [[ "${workflow_auth_macos}" == "JAMF" ]]; then
				display_string_prepare_time_estimate="5"
				notification_prepare
				[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
				install_macos_mdm
			fi
		fi
	fi
else # Workflow when there is no macOS updates/upgrade.
	notification_restart
	[[ -n "${workflow_jamf_policy_triggers_option}" ]] && run_jamf_policy_triggers
	if [[ "${workflow_restart_without_updates_option}" == "TRUE" ]]; then # If requested, restart without updates.
		rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
		if [[ "${test_mode_option}" != "TRUE" ]]; then
			touch "${WORKFLOW_RESTART_VALIDATE_FILE}"
			log_super "Forced Restart Mode: Restarting computer..."
			shutdown -o -r +1 &
			disown -a
		else # Test mode.
			log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the restart notification..."
			sleep "${test_mode_timeout_seconds}"
			killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
		fi
	else # Option to restart without updates is not enabled.
		log_super "Warning: When no macOS update/upgrade is available you must also specify the --workflow-restart-without-updates option to restart automatically."
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_install_macos_active_user_error is: ${workflow_install_macos_active_user_error}"

# Handle workflow failure options.
if [[ "${workflow_install_macos_active_user_error}" == "TRUE" ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then # Install now workflow mode.
		log_super "Error: macOS update/upgrade workflow failed, install now workflow can not continue."
		log_status "Inactive Error: macOS update/upgrade workflow failed, install now workflow can not continue."
		notification_install_now_failed
		exit_error
	else # Default super workflow.
		deferral_timer_minutes="${deferral_timer_error_minutes}"
		log_super "Error: macOS update/upgrade workflow failed, trying again in ${deferral_timer_minutes} minutes."
		log_status "Pending: macOS update/upgrade workflow failed, trying again in ${deferral_timer_minutes} minutes."
		notification_failed
		set_auto_launch_deferral
	fi
fi
}

# MARK: *** Jamf Pro ***
################################################################################

# Validate connectivity to Jamf Pro service and set ${jamf_version}, ${jamf_management_url}, and ${jamf_api_url}.
check_jamf_management_framework() {
jamf_version="FALSE"
auth_error_jamf="FALSE"
if [[ -f "${JAMF_PRO_BINARY}" ]]; then
	local jamf_response
	jamf_response=$("${JAMF_PRO_BINARY}" -version)
	jamf_version_major="${jamf_response:8:2}" # Expected output: 10
	jamf_version_minor="${jamf_response:11:2}" # Expected output: 30, 31, 32, etc.
	jamf_version="${jamf_version_major}$(printf "%02d" "${jamf_version_minor}")" # Expected output: 1030, 1031, 1032, etc.
	if [[ "${mac_cpu_architecture}" == "arm64" ]] && [[ "${jamf_version}" -lt 1038 ]]; then
		log_super "Error: super requires Jamf Pro version 10.38 or later, the currently installed version of Jamf Pro ${jamf_version_major}.${jamf_version_minor} is not supported."; auth_error_jamf="TRUE"
	elif [[ "${mac_cpu_architecture}" != "arm64" ]] && [[ "${jamf_version}" -lt 1000 ]]; then
		log_super "Error: super requires Jamf Pro version 10.00 or later, the currently installed version of Jamf Pro ${jamf_version_major}.${jamf_version_minor} is not supported."; auth_error_jamf="TRUE"
	else # Jamf Pro version is supported.
		jamf_response=$("${JAMF_PRO_BINARY}" checkJSSConnection -retry 1 2>/dev/null)
		if [[ $(echo "${jamf_response}" | grep -c 'available') -gt 0 ]]; then
			jamf_management_url=$(defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url)
			log_super "Status: System is managed by Jamf Pro ${jamf_version_major}.${jamf_version_minor} hosted at: ${jamf_management_url}"
			jamf_api_url="${jamf_management_url}"
		else
			log_super "Error: Jamf Pro service is unavailable with response:\n${jamf_response}"; auth_error_jamf="TRUE"
		fi
	fi
fi

# Check for ${auth_jamf_custom_url} and sets ${jamf_api_url} accordingly.
if [[ "${jamf_version}" != "FALSE" ]] && [[ "${auth_error_jamf}" != "TRUE" ]] && [[ -n "${auth_jamf_custom_url}" ]]; then
	local curl_response
	curl_response=$(curl -Is "${auth_jamf_custom_url}" | head -n 1)
	if [[ $(echo "${curl_response}" | grep -c 'HTTP') -gt 0 ]] && [[ $(echo "${curl_response}" | grep -c -e '400' -e '40[4-9]' -e '4[1-9][0-9]' -e '5[0-9][0-9]') -eq 0 ]]; then
		jamf_api_url="${auth_jamf_custom_url}"
		log_super "Status: Using custom Jamf Pro API URL hosted at ${jamf_api_url}."
	else
		log_super "Error: Custom Jamf Pro API URL is unavailable: ${curl_response}"; auth_error_jamf="TRUE"
	fi
fi
}

# Use preferences derived ${auth_jamf_computer_id_option} or a jamf recon to resolve the computer's ${jamf_computer_id}.
get_jamf_api_computer_id() {
unset jamf_computer_id
if [[ -n "${auth_jamf_computer_id_option}" ]]; then
	jamf_computer_id="${auth_jamf_computer_id_option}"
else # Resolve the computer's Jamf Pro ID via jamf recon.
	log_super "Warning: Running Jamf Pro inventory to resolve the Jamf Pro Computer ID. To avoid this step use a configuration profile as covered in the super Wiki: https://github.com/Macjutsu/super/wiki/"
	local jamf_response
	local jamf_return
	jamf_response=$("${JAMF_PRO_BINARY}" recon -verbose)
	jamf_return="$?"
	if [[ "${jamf_return}" -eq 0 ]]; then
		jamf_computer_id=$(echo "${jamf_response}" | grep '<computer_id>' | sed -e 's/[^0-9]*//g')
	else
		log_super "Error: Jamf Pro inventory collection failed."; auth_error_jamf="TRUE"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_response is:\n${jamf_response}"
		[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_return is: ${jamf_return}"
	fi
fi
# A bit of error checking to make sure it's a regular number.
if [[ "${jamf_computer_id}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
	defaults write "${SUPER_LOCAL_PLIST}" AuthJamfComputerID -string "${jamf_computer_id}"
else
	log_super "Error: Unable to resolve Jamf Pro Computer ID."; auth_error_jamf="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_computer_id is: ${jamf_computer_id}"
}

# Attempt to acquire a ${jamf_access_token} via ${auth_jamf_client} and ${auth_jamf_secret} credentials or via ${auth_jamf_account} and ${auth_jamf_password} credentials.
get_jamf_api_access_token() {
local curl_response
if [[ -n "${auth_jamf_client}" ]]; then
	curl_response=$(curl --silent --location --request POST "${jamf_api_url}/api/oauth/token" --header "Content-Type: application/x-www-form-urlencoded" --data-urlencode "client_id=${auth_jamf_client}" --data-urlencode "grant_type=client_credentials" --data-urlencode "client_secret=${auth_jamf_secret}")
else # Legacy ${auth_jamf_account} authentication.
	curl_response=$(curl --silent --location --request POST "${jamf_api_url}api/v1/auth/token" --user "${auth_jamf_account}:${auth_jamf_password}")
fi
if [[ $(echo "${curl_response}" | grep -c 'token') -gt 0 ]]; then
	if [[ -n "${auth_jamf_client}" ]]; then
		if [[ "${macos_version_major}" -ge 12 ]]; then
			jamf_access_token=$(echo "${curl_response}" | plutil -extract access_token raw -)
		else # macOS 11.
			jamf_access_token=$(echo "${curl_response}" | awk -F '"' '{print $4}' | xargs)
		fi
	else # Legacy ${auth_jamf_account} authentication.
		if [[ "${macos_version_major}" -ge 12 ]]; then
			jamf_access_token=$(echo "${curl_response}" | plutil -extract token raw -)
		else # macOS 11.
			jamf_access_token=$(echo "${curl_response}" | grep 'token' | awk -F '"' '{print $4}' | xargs)
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

# Use ${jamf_access_token} to attempt a Blank Push request to the Jamf Pro API at ${jamf_api_url}.
send_jamf_api_blank_push() {
jamf_blank_push_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request POST "${jamf_api_url}JSSResource/computercommands/command/BlankPush/id/${jamf_computer_id}" --header "Authorization: Bearer ${jamf_access_token}")
}

# Validate that the account ${auth_jamf_account} and ${auth_jamf_password} are valid credentials and has appropriate permissions to send MDM push commands. If not set ${auth_error_jamf}.
check_jamf_api_credentials() {
auth_error_jamf="FALSE"
[[ -z "${jamf_computer_id}" ]] && get_jamf_api_computer_id
[[ "${auth_error_jamf}" == "TRUE" ]] && return 0
get_jamf_api_access_token
[[ "${auth_error_jamf}" == "TRUE" ]] && return 0
send_jamf_api_blank_push
[[ "${auth_error_jamf}" == "TRUE" ]] && return 0
if [[ "${jamf_blank_push_response}" != 201 ]]; then
	log_super "Auth Error: Unable to request Blank Push via the Jamf Pro API. Verify that the provided Jamf Pro credentials has appropriate privileges: https://github.com/Macjutsu/super/wiki/Apple-Silicon-Jamf-Pro-API-Credentials#jamf-pro-api-account-privileges"; auth_error_jamf="TRUE"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_blank_push_response is:\n${jamf_blank_push_response}"
fi
}

# Validate existing ${jamf_access_token} and if found invalid, a new token is requested and again validated.
check_jamf_api_access_token() {
auth_error_jamf="FALSE"
[[ -z "${jamf_computer_id}" ]] && get_jamf_api_computer_id
[[ "${auth_error_jamf}" == "TRUE" ]] && return 0
local curl_response
if [[ -n "${jamf_access_token}" ]]; then
	curl_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request GET "${jamf_api_url}api/v1/auth" --header "Authorization: Bearer ${jamf_access_token}")
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is:\n${curl_response}"
fi
if [[ "${curl_response}" -ne 200 ]]; then
	get_jamf_api_access_token
	[[ "${auth_error_jamf}" == "TRUE" ]] && return 0
	curl_response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location --request GET "${jamf_api_url}api/v1/auth" --header "Authorization: Bearer ${jamf_access_token}")
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is:\n${curl_response}"
	if [[ "${curl_response}" -ne 200 ]]; then
		log_super "Auth Error: Unable to validate Jamf Pro API access token."; auth_error_jamf="TRUE"
	fi
fi
}

# Validate if Jamf Pro 10.48 or later is using "the new software updates experience" and set ${jamf_api_update_workflow} accordingly.
check_jamf_api_update_workflow() {
jamf_api_update_workflow="LEGACY"
if [[ "${jamf_version}" -ge 1048 ]]; then
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
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_api_update_workflow is: ${jamf_api_update_workflow}"
}

# Invalidate and remove from local memory the ${jamf_access_token}.
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

# Install any optional ${workflow_jamf_policy_triggers_option}.
run_jamf_policy_triggers() {
jamf_policy_error="FALSE"
log_super "Status: Starting Jamf Policy triggers. Use --verbose-mode or check /var/log/jamf.log for more detail..."
log_status "Running: Starting Jamf Policy triggers."
local previous_ifs
previous_ifs="${IFS}"; IFS=','
local jamf_policy_triggers_array
read -r -a jamf_policy_triggers_array <<< "${workflow_jamf_policy_triggers_option}"
for jamf_policy_trigger in "${jamf_policy_triggers_array[@]}"; do
	if [[ "${test_mode_option}" != "TRUE" ]]; then
		log_super "Status: Jamf Policy with Trigger \"${jamf_policy_trigger}\" is starting..."
		local jamf_response
		local jamf_return
		if [[ "${verbose_mode_option}" == "TRUE" ]]; then
			jamf_response=$("${JAMF_PRO_BINARY}" policy -event "${jamf_policy_trigger}" -verbose 2>&1)
			jamf_return="$?"
			log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_response is:\n${jamf_response}"
			log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_return is: ${jamf_return}"
		else
			"${JAMF_PRO_BINARY}" policy -event "${jamf_policy_trigger}" > /dev/null 2>&1
			jamf_return="$?"
		fi
		if [[ "${jamf_return}" -ne 0 ]]; then
			log_super "Error: Jamf Policy with Trigger \"${jamf_policy_trigger}\" failed!"; jamf_policy_error="TRUE"
		else
			log_super "Status: Jamf Policy with Trigger \"${jamf_policy_trigger}\" was successful."
		fi
	else
		log_super "Test Mode: Skipping Jamf Policy with Trigger: ${jamf_policy_trigger}."
	fi
done
IFS="${previous_ifs}"
if [[ "${test_mode_option}" != "TRUE" ]]; then
	if [[ "${jamf_policy_error}" != "TRUE" ]]; then
		log_super "Status: All Jamf Policies completed, deleting local policy triggers preference."
		defaults delete "${SUPER_LOCAL_PLIST}" WorkflowJamfPolicyTriggers 2> /dev/null
	else
		log_super "Status: Some Jamf Policies failed, not deleting local --workflow-jamf-policy-triggers option."
	fi
else
	log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the restart notification..."
	sleep "${test_mode_timeout_seconds}"
	killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
fi
}

# MARK: *** User Interface Management ***
################################################################################

# Set language strings for dialogs and notifications.
set_display_strings_language() {
#### Langauge for the restart button in dialogs. Note that for deadline dialogs this is the default button.
display_string_restart_button="Restart"

#### Language for the deferral button in dialogs.
display_string_deferral_button="Defer"

### Language for various deferral time durations.
display_string_minutes="Minutes"
display_string_hour="Hour"
display_string_hours="Hours"
display_string_day="Day"
display_string_days="Days"
display_string_week="Week"
display_string_and="and"

#### Language for the ok button in certain notifications.
display_string_ok_button="OK"

#### This code generates the ${display_string_workflow_title} variable to include the appropriate macOS update or upgrade.
if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # A macOS upgrade is available and option to allow upgrade is enabled.
	if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then # macOS 13 or newer always upgrades via softwareupdate. macOS 12.3 or later can upgrade via softwareupdate unless via MDM workflow.
		display_string_workflow_title="${asu_macos_major_upgrade_title_target} Major Upgrade"
	else # Systems older than macOS 12.3 or older than macOS 13 and using the MDM workflow upgrade via installer application.
		display_string_workflow_title="macOS ${macos_installer_marketing_name_target} ${macos_installer_version_target} Major Upgrade"
	fi
elif [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then # macOS updates are available.
	display_string_workflow_title="${macos_marketing_name} ${asu_macos_minor_update_version} Minor Update"
else # Only non-system Apple software updates are available.
	display_string_workflow_title="Apple Software Updates"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_string_workflow_title is: ${display_string_workflow_title}"

#### Useful display variables and info:
# ${display_string_workflow_title} is the macOS update or upgrade workflow title that includes the target macOS version number.
# ${storage_available_gigabytes} is the number of gigabytes of currently available storage.
# ${storage_required_gigabytes} is the number of gigabytes required for the current macOS update/upgrade workflow.
# ${display_string_deadline_count} is the current number of user soft/hard deferrals.
# ${display_string_deadline_count_maximum} is the maximum number of user soft/hard deferrals.
# ${deadline_days_soft} is the maximum number of deferral days before a soft deadline.
# ${deadline_days_hard} is the maximum number of deferral days before a hard deadline.
# ${display_string_workflow_zero_date} is the date:time of the zero day that is used for calculating the maximum days deferral deadlines.
# ${display_string_deadline_days} is the soonest date:time based on evaluating the maximum days deferral deadlines.
# ${display_string_deadline_date} is the soonest date:time based on evaluating the maximum date deferral deadlines.
# ${display_string_deadline} is the soonest date:time based on evaluating both the maximum date and days deferral deadlines.
# ${display_string_prepare_time_estimate} is a estimated number of minutes that an update/upgrade process needs for preparation before a restart.
# ${current_user_real_name} is the current users full (display friendly) name.
# See ${DISPLAY_STRING_FORMAT_DATE} and ${DISPLAY_STRING_FORMAT_TIME} in the set_defaults() function to adjust how the date:time is shown.
# For body text note that IBM Notifier interprets "\n" as a return.

#### Language for notification_install_now_start(), a non-interactive notification informing the user that the install now workflow has started.
display_string_install_now_start_title="Apple Software Update Workflow Starting"
display_string_install_now_start_body="The Apple software update workflow has started, and you will be notified if this computer needs to restart.\n\nDuring this time you can continue to use the computer or lock the screen, but please do not restart or sleep the computer as it will prolong the Apple software update process."

#### Language for notification_install_now_download(), a non-interactive notification informing the user that the install now workflow is downloading the macOS update/upgrade.
display_string_install_now_download_title="Downloading ${display_string_workflow_title}"
display_string_install_now_download_body="The ${display_string_workflow_title} is downloading from Apple. This may take a while, but you will be notified before this computer automatically restarts.\n\nDuring this time you can continue to use the computer or lock the screen, but please do not restart or sleep the computer as it will prolong the update/upgrade process."

#### Language for notification_install_now_up_to_date(), a non-interactive notification informing the user that the install now workflow doesn't have anything else to do.
display_string_install_now_up_to_date_title="Apple software update Complete"
display_string_install_now_up_to_date_body="Apple system software is already up to date or is the latest version allowed by management."

#### Language for notification_install_now_failed(), a non-interactive notification informing the user that the install now workflow has failed.
# This is used for all update/upgrade workflows if they fail to start or timeout after a pending restart notification has been shown.
display_string_install_now_failed_title="${display_string_workflow_title} Failed"
display_string_install_now_failed_body="The ${display_string_workflow_title} failed to complete, the computer will not be restarting.\n\nYou can try again or consider contacting your technical support team if you're experiencing consistent failures."

#### Language for notification_insufficient_storage(), a non-interactive notification informing the user that there is insufficient storage for macOS update/upgrade.
# This is used for both non-deadline and deadline workflows.
display_string_insufficient_storage_title="Insufficient Storage For ${display_string_workflow_title}"
display_string_insufficient_storage_default_body="A required macOS update needs ${storage_required_gigabytes} GBs of storage space and only ${storage_available_gigabytes} GBs is available.\n\nPlease use the storage settings (shown behind this notification) to remove unnecessary items."
display_string_insufficient_storage_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times.\n\nA required macOS update needs ${storage_required_gigabytes} GBs of storage space and only ${storage_available_gigabytes} GBs is available.\n\nPlease use the storage settings (shown behind this notification) to remove unnecessary items."
display_string_insufficient_storage_deadline_days_body="You have deferred the maximum number of ${deadline_days_hard} days.\n\nA required macOS update needs ${storage_required_gigabytes} GBs of storage space and only ${storage_available_gigabytes} GBs is available.\n\nPlease use the storage settings (shown behind this notification) to remove unnecessary items."
display_string_insufficient_storage_deadline_date_body="The deferment deadline of ${display_string_deadline_date} has passed.\n\nA required macOS update needs ${storage_required_gigabytes} GBs of storage space and only ${storage_available_gigabytes} GBs is available.\n\nPlease use the storage settings (shown behind this notification) to remove unnecessary items."

#### Language for notification_power_required(), a non-interactive notification informing the user that they need to plug the computer into AC power.
# This is used for both non-deadline and deadline workflows.
display_string_power_required_title="${display_string_workflow_title} Requires Power Source"
display_string_power_required_default_body="You must connect this computer to a power supply in order to install the required macOS update."
display_string_power_required_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times.\n\nYou must connect this computer to a power supply in order to install the required macOS update."
display_string_power_required_deadline_days_body="You have deferred the maximum number of ${deadline_days_hard} days.\n\nYou must connect this computer to a power supply in order to install the required macOS update."
display_string_power_required_deadline_date_body="The deferment deadline of ${display_string_deadline_date} has passed.\n\nYou must connect this computer to a power supply in order to install the required macOS update."

#### Language for notification_prepare(), a non-interactive notification informing the user that a update/upgrade preparation process has started.
# This is used for both non-deadline and deadline workflows.
display_string_prepare_title="${display_string_workflow_title} Requires Restart"
display_string_prepare_default_body="A required software update will automatically restart this computer in about ${display_string_prepare_time_estimate} minutes.\n\nDuring this time you can continue to use the computer or lock the screen, but please do not restart or sleep the computer as it will prolong the update process."
display_string_prepare_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times.\n\nA required software update will automatically restart this computer in about ${display_string_prepare_time_estimate} minutes.\n\nDuring this time you can continue to use the computer or lock the screen, but please do not restart or sleep the computer as it will prolong the update process."
display_string_prepare_deadline_days_body="You have deferred the maximum number of ${deadline_days_hard} days.\n\nA required software update will automatically restart this computer in about ${display_string_prepare_time_estimate} minutes.\n\nDuring this time you can continue to use the computer or lock the screen, but please do not restart or sleep the computer as it will prolong the update process."
display_string_prepare_deadline_date_body="The deferment deadline of ${display_string_deadline_date} has passed.\n\nA required software update will automatically restart this computer in about ${display_string_prepare_time_estimate} minutes.\n\nDuring this time you can continue to use the computer or lock the screen, but please do not restart or sleep the computer as it will prolong the update process."

#### Language for notification_restart(), a non-interactive notification informing the user that the computer is going to restart very soon.
# This is used for all softwareupdate workflows and near the end of the MDM workflow.
# This is used for both non-deadline and deadline workflows.
display_string_restart_title="${display_string_workflow_title} Requires Restart"
display_string_restart_default_body="This computer will automatically restart very soon.\n\nSave any open documents now."
display_string_restart_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times.\n\nThis computer will automatically restart very soon.\n\nSave any open documents now."
display_string_restart_deadline_days_body="You have deferred the maximum number of ${deadline_days_hard} days.\n\nThis computer will automatically restart very soon.\n\nSave any open documents now."
display_string_restart_deadline_date_body="The deferment deadline of ${display_string_deadline_date} has passed.\n\nThis computer will automatically restart very soon.\n\nSave any open documents now."

#### Language for notification_non_system_updates(), a non-interactive notification informing the user that the install now workflow is installing non-system Apple software updates.
display_string_non_system_updates_title="Installing ${display_string_workflow_title}"
display_string_non_system_updates_body="Required Apple software updates are now installing.\n\nThe computer will not restart but some Apple applications (like Safari) may automatically restart.\n\nThis should only take a few minutes, but please do not restart or sleep the computer as it will prolong the update process."

#### Language for notification_failed(), a non-interactive notification informing the user that the managed update/upgrade process has failed.
# This is used for all update/upgrade workflows if they fail to start or timeout after a pending restart notification has been shown.
display_string_failed_title="${display_string_workflow_title} Failed"
display_string_failed_body="The ${display_string_workflow_title} failed to complete.\n\nThe computer will not restart right now, but you will be notified later when the software update is attempted again."

#### Language for dialog_restart_or_defer(), an interactive dialog giving the user a choice to defer the update or restart.
display_string_restart_or_defer_title="${display_string_workflow_title} Requires Restart"
display_string_restart_or_defer_timeout="Please make selection in"
display_string_restart_or_defer_menu_title="Defer software update for:"
display_string_restart_or_defer_default_body="• No deadline date and unlimited deferrals.\n"
display_string_restart_or_defer_date_body="• Deferral available until ${display_string_deadline}.\n"
display_string_restart_or_defer_count_body="• ${display_string_deadline_count} out of ${display_string_deadline_count_maximum} deferrals remaining.\n"
display_string_restart_or_defer_date_count_body="• Deferral available until ${display_string_deadline}.\n\n• ${display_string_deadline_count} out of ${display_string_deadline_count_maximum} deferrals remaining.\n"

#### Language for dialog_soft_deadline(), an interactive dialog when a soft deadline has passed, giving the user only one button to continue the workflow.
display_string_soft_deadline_title="${display_string_workflow_title} Requires Restart"
display_string_soft_deadline_timeout="Automatic restart in"
display_string_soft_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times."
display_string_soft_deadline_days_body="You have deferred the maximum number of ${deadline_days_soft} days."
display_string_soft_deadline_date_body="The deferment deadline has passed:\n${display_string_deadline_date}."

#### Language for dialog_user_auth(), an interactive dialog to collect user credentials for macOS update/upgrade workflow
display_string_user_auth_title="${display_string_workflow_title} Requires Authentication"
display_string_user_auth_timeout="Please enter password in"
display_string_user_auth_default_body="You must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_deadline_days_soft_body="You have deferred the maximum number of ${deadline_days_soft} days.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_deadline_days_hard_body="You have deferred the maximum number of ${deadline_days_hard} days.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_deadline_date_body="The deferment deadline of ${display_string_deadline_date} has passed.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_password_title="Enter Password Here:"
display_string_user_auth_password_placeholder="Password Required"
display_string_user_auth_retry_default_body="You must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_retry_deadline_count_body="You have deferred the maximum number of ${display_string_deadline_count_maximum} times.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_retry_deadline_days_soft_body="You have deferred the maximum number of ${deadline_days_soft} days.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_retry_deadline_days_hard_body="You have deferred the maximum number of ${deadline_days_hard} days.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_retry_deadline_date_body="The deferment deadline of ${display_string_deadline_date} has passed.\n\nYou must enter the password for user \"${current_user_real_name}\" to install the ${display_string_workflow_title}.\n"
display_string_user_auth_retry_password_title="Authentication Failed - Try Password Again:"
display_string_user_auth_retry_password_placeholder="Password Required"
}

# Set the ${display_string_deferral_button} based on the ${deferral_timer_minutes}.
set_display_strings_deferral_button() {
if [[ "${deferral_timer_minutes}" -lt 60 ]]; then
	display_string_deferral_button="${display_string_deferral_button} ${deferral_timer_minutes} ${display_string_minutes}"
elif [[ "${deferral_timer_minutes}" -eq 60 ]]; then
	display_string_deferral_button="${display_string_deferral_button} 1 ${display_string_hour}"
elif [[ "${deferral_timer_minutes}" -gt 60 ]] && [[ "${deferral_timer_minutes}" -lt 120 ]]; then
	display_string_deferral_button="${display_string_deferral_button} 1 ${display_string_hour} ${display_string_and} $((deferral_timer_minutes - 60)) ${display_string_minutes}"
elif [[ "${deferral_timer_minutes}" -ge 120 ]] && [[ "${deferral_timer_minutes}" -lt 1440 ]] && [[ $((deferral_timer_minutes % 60)) -eq 0 ]]; then
	display_string_deferral_button="${display_string_deferral_button} $((deferral_timer_minutes / 60)) ${display_string_hours}"
elif [[ "${deferral_timer_minutes}" -ge 120 ]] && [[ "${deferral_timer_minutes}" -lt 1440 ]] && [[ $((deferral_timer_minutes % 60)) -ne 0 ]]; then
	display_string_deferral_button="${display_string_deferral_button} $((deferral_timer_minutes / 60)) ${display_string_hours} ${display_string_and} $((deferral_timer_minutes % 60)) ${display_string_minutes}"
elif [[ "${deferral_timer_minutes}" -ge 1440 ]] && [[ "${deferral_timer_minutes}" -lt 1500 ]]; then
	display_string_deferral_button="${display_string_deferral_button} 1 ${display_string_day}"
elif [[ "${deferral_timer_minutes}" -ge 1500 ]] && [[ "${deferral_timer_minutes}" -lt 2880 ]]; then
	display_string_deferral_button="${display_string_deferral_button} 1 ${display_string_day} ${display_string_and} $(((deferral_timer_minutes - 1440) / 60)) ${display_string_hours}"
elif [[ "${deferral_timer_minutes}" -ge 2880 ]] && [[ "${deferral_timer_minutes}" -lt 10080 ]]; then
	display_string_deferral_button="${display_string_deferral_button} $((deferral_timer_minutes / 1440)) ${display_string_days}"
elif [[ "${deferral_timer_minutes}" -ge 10080 ]]; then
	display_string_deferral_button="${display_string_deferral_button} 1 ${display_string_week}"
fi
}

# Set the ${display_help_button_string} and ${display_warning_button_string} options for the ${ibm_notifier_array}.
set_display_strings_optional_buttons() {
local curl_response
if [[ -n "${display_help_button_string}" ]]; then
	if [[ $(echo "${display_help_button_string}" | grep -c '^http://\|^https://\|^mailto:\|^jamfselfservice://') -gt 0 ]]; then
		if [[ $(echo "${display_help_button_string_option}" | grep -c '^http://\|^https://') -gt 0 ]]; then
			curl_response=$(curl -Is "${display_help_button_string_option}" | head -1)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is: ${curl_response}"
			if [[ $(echo "${curl_response}" | grep -c '200') -gt 0 ]] || [[ $(echo "${curl_response}" | grep -c '302') -gt 0 ]]; then
				ibm_notifier_array+=(-help_button_cta_type link -help_button_cta_payload "${display_help_button_string}")
			else
				log_super "Warning: Help button not shown because URL cannot be reached: ${display_help_button_string}"
			fi
		else
			ibm_notifier_array+=(-help_button_cta_type link -help_button_cta_payload "${display_help_button_string}")
		fi
	else
		ibm_notifier_array+=(-help_button_cta_type infopopup -help_button_cta_payload "${display_help_button_string}")
	fi
fi
if [[ -n "${display_warning_button_string}" ]]; then
	if [[ $(echo "${display_warning_button_string}" | grep -c '^http://\|^https://\|^mailto:\|^jamfselfservice://') -gt 0 ]]; then
		if [[ $(echo "${display_warning_button_string_option}" | grep -c '^http://\|^https://') -gt 0 ]]; then
			curl_response=$(curl -Is "${display_warning_button_string_option}" | head -1)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is: ${curl_response}"
			if [[ $(echo "${curl_response}" | grep -c '200') -gt 0 ]] || [[ $(echo "${curl_response}" | grep -c '302') -gt 0 ]]; then
				ibm_notifier_array+=(-warning_button_cta_type link -warning_button_cta_payload "${display_warning_button_string}")
			else
				log_super "Warning: Warning button not shown because URL cannot be reached: ${display_warning_button_string}"
			fi
		else
			ibm_notifier_array+=(-warning_button_cta_type link -warning_button_cta_payload "${display_warning_button_string}")
		fi
	else
		ibm_notifier_array+=(-warning_button_cta_type infopopup -warning_button_cta_payload "${display_warning_button_string}")
	fi
fi
}

# Open ${IBM_NOTIFIER_BINARY} for non-interactive notifications using the ${ibm_notifier_array} options.
open_notification_ibm_notifier() {
# Append any additional display options to the ${ibm_notifier_array}.
set_display_strings_optional_buttons
{ [[ "${display_unmovable_status}" == "TRUE" ]] || [[ "${display_unmovable_status}" == "TEMP" ]]; } && ibm_notifier_array+=(-unmovable)
{ [[ "${display_hide_background_status}" == "TRUE" ]] || [[ "${display_hide_background_status}" == "TEMP" ]]; } && ibm_notifier_array+=(-background_panel translucent)
{ [[ "${display_silently_status}" == "TRUE" ]] || [[ "${display_silently_status}" == "TEMP" ]]; } && ibm_notifier_array+=(-silent)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"

# Kill any previous notifications so new ones can take its place.
killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1

# Start IBM Notifier and wait for for ${notification_response} and ${notification_return}.
unset notification_response
unset notification_return
notification_response=$("${IBM_NOTIFIER_BINARY}" "${ibm_notifier_array[@]}")
notification_return="$?"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: notification_response is: ${notification_response}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: notification_return is: ${notification_return}"

# Restart IBM Notifier if the user quits.
while [[ "${notification_return}" -eq 239 ]]; do
	log_super "Warning: User attempted to quit IBM Notifier.app via Command-Q keyboard shortcut."
	unset notification_response
	unset notification_return
	notification_response=$("${IBM_NOTIFIER_BINARY}" "${ibm_notifier_array[@]}")
	notification_return="$?"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: notification_response is: ${notification_response}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: notification_return is: ${notification_return}"
done
}

# Open ${IBM_NOTIFIER_BINARY} for interactive dialogs using the ${ibm_notifier_array} options, also handle any ${dialog_timeout_seconds}, ${display_accessory_content}, and ${display_accessory_payload} options, and set ${dialog_response} and ${dialog_return}.
open_dialog_ibm_notifier() {
# Append any additional display options to the ${ibm_notifier_array}.
local display_accessory_payload
local display_accessory_enabled
display_accessory_enabled="FALSE"
local curl_response
if [[ -n "${display_accessory_content}" ]]; then
	if [[ $(echo "${display_accessory_content}" | grep -c '^http://\|^https://') -gt 0 ]]; then
		if [[ "${display_accessory_type}" =~ ^TEXTBOX$|^HTMLBOX$|^HTML$ ]]; then
			display_accessory_payload=$(curl -s -f "${display_accessory_content}")
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_payload is:\n${display_accessory_payload}"
			if [[ -n "${display_accessory_payload}" ]]; then
				display_accessory_enabled="TRUE"
			else
				log_super "Warning: Custom display accessory not shown because URL cannot be downloaded: ${display_accessory_content}"
			fi
		else # ${display_accessory_type} is IMAGE or VIDEO or VIDEOAUTO.
			curl_response=$(curl -Is "${display_accessory_content}" | head -1)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: curl_response is: ${curl_response}"
			if [[ $(echo "${curl_response}" | grep -c '200') -gt 0 ]] || [[ $(echo "${curl_response}" | grep -c '302') -gt 0 ]]; then
				display_accessory_payload="${display_accessory_content}"
				display_accessory_enabled="TRUE"
			else
				log_super "Warning: Custom display accessory not shown because URL cannot be found: ${display_accessory_content}"
			fi
		fi
	else # Assume it's a local path.
		if [[ "${display_accessory_type}" =~ ^TEXTBOX$|^HTMLBOX$|^HTML$ ]]; then
			display_accessory_payload=$(<"${display_accessory_content}")
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_payload is:\n${display_accessory_payload}"
			if [[ -n "${display_accessory_payload}" ]]; then
				display_accessory_enabled="TRUE"
			else
				log_super "Warning: Custom display accessory not shown because file path cannot be read: ${display_accessory_content}"
			fi
		else # ${display_accessory_type} is IMAGE or VIDEO or VIDEOAUTO.
			if [[ -f "${display_accessory_content}" ]]; then
				display_accessory_payload="${display_accessory_content}"
				display_accessory_enabled="TRUE"
			else
				log_super "Warning: Custom display accessory not shown because file path cannot be found: ${display_accessory_content}"
			fi
		fi
	fi
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: display_accessory_enabled is: ${display_accessory_enabled}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_user_auth_enabled is: ${dialog_user_auth_enabled}"
if [[ "${display_accessory_enabled}" == "TRUE" ]]; then # Custom display accessory enabled.
	[[ "${display_accessory_type}" == "TEXTBOX" ]] && ibm_notifier_array+=(-accessory_view_type whitebox -accessory_view_payload "${display_accessory_payload}")
	[[ "${display_accessory_type}" == "HTMLBOX" ]] && ibm_notifier_array+=(-accessory_view_type htmlwhitebox -accessory_view_payload "${display_accessory_payload}")
	[[ "${display_accessory_type}" == "HTML" ]] && ibm_notifier_array+=(-accessory_view_type html -accessory_view_payload "${display_accessory_payload}")
	[[ "${display_accessory_type}" == "IMAGE" ]] && ibm_notifier_array+=(-accessory_view_type image -accessory_view_payload "${display_accessory_payload}")
	[[ "${display_accessory_type}" == "VIDEO" ]] && ibm_notifier_array+=(-accessory_view_type video -accessory_view_payload "/url ${display_accessory_payload}")
	[[ "${display_accessory_type}" == "VIDEOAUTO" ]] && ibm_notifier_array+=(-accessory_view_type video -accessory_view_payload "/url ${display_accessory_payload} /autoplay")
	if [[ "${dialog_user_auth_enabled}" == "TRUE" ]]; then # User authentication takes priority as secondary accessory.
		[[ -n "${dialog_timeout_seconds}" ]] && ibm_notifier_array+=(-secondary_accessory_view_type secureinput -secondary_accessory_view_payload "${display_accessory_secure_payload}" -timeout "${dialog_timeout_seconds}")
		[[ -z "${dialog_timeout_seconds}" ]] && ibm_notifier_array+=(-secondary_accessory_view_type secureinput -secondary_accessory_view_payload "${display_accessory_secure_payload}")
	else # Not the user authentication dialog.
		{ [[ -n "${deferral_timer_menu_minutes}" ]] && [[ -z "${dialog_timeout_seconds}" ]]; } && ibm_notifier_array+=(-secondary_accessory_view_type dropdown -secondary_accessory_view_payload "/title ${display_string_restart_or_defer_menu_title} /list ${display_string_deferral_menu} /selected 0")
		{ [[ -z "${deferral_timer_menu_minutes}" ]] && [[ -n "${dialog_timeout_seconds}" ]]; } && ibm_notifier_array+=(-secondary_accessory_view_type timer -secondary_accessory_view_payload "${display_string_dialog_timeout} %@" -timeout "${dialog_timeout_seconds}")
		if [[ -n "${deferral_timer_menu_minutes}" ]] && [[ -n "${dialog_timeout_seconds}" ]]; then
			log_super "Warning: Unable to show --dialog-timeout-* countdown due to the --display-accessory-* option. However, there is still a display timeout at ${dialog_timeout_seconds} seconds."
			ibm_notifier_array+=(-secondary_accessory_view_type dropdown -secondary_accessory_view_payload "/title ${display_string_restart_or_defer_menu_title} /list ${display_string_deferral_menu} /selected 0" -timeout "${dialog_timeout_seconds}")
		fi
	fi
else # No custom display accessory.
	if [[ "${dialog_user_auth_enabled}" == "TRUE" ]]; then # User authentication dialog.
		[[ -n "${dialog_timeout_seconds}" ]] && ibm_notifier_array+=(-accessory_view_type timer -accessory_view_payload "${display_string_dialog_timeout} %@" -timeout "${dialog_timeout_seconds}" -secondary_accessory_view_type secureinput -secondary_accessory_view_payload "${display_accessory_secure_payload}")
		[[ -z "${dialog_timeout_seconds}" ]] && ibm_notifier_array+=(-accessory_view_type secureinput -accessory_view_payload "${display_accessory_secure_payload}")
	else # Not the user authentication dialog.
		{ [[ -n "${deferral_timer_menu_minutes}" ]] && [[ -z "${dialog_timeout_seconds}" ]]; } && ibm_notifier_array+=(-accessory_view_type dropdown -accessory_view_payload "/title ${display_string_restart_or_defer_menu_title} /list ${display_string_deferral_menu} /selected 0")
		{ [[ -z "${deferral_timer_menu_minutes}" ]] && [[ -n "${dialog_timeout_seconds}" ]]; } && ibm_notifier_array+=(-accessory_view_type timer -accessory_view_payload "${display_string_dialog_timeout} %@" -timeout "${dialog_timeout_seconds}")
		{ [[ -n "${dialog_timeout_seconds}" ]] && [[ -n "${deferral_timer_menu_minutes}" ]]; } && ibm_notifier_array+=(-accessory_view_type dropdown -accessory_view_payload "/title ${display_string_restart_or_defer_menu_title} /list ${display_string_deferral_menu} /selected 0" -secondary_accessory_view_type timer -secondary_accessory_view_payload "${display_string_dialog_timeout} %@" -timeout "${dialog_timeout_seconds}")
	fi
fi
set_display_strings_optional_buttons
{ [[ "${display_unmovable_status}" == "TRUE" ]] || [[ "${display_unmovable_status}" == "TEMP" ]]; } && ibm_notifier_array+=(-unmovable)
{ [[ "${display_hide_background_status}" == "TRUE" ]] || [[ "${display_hide_background_status}" == "TEMP" ]]; } && ibm_notifier_array+=(-background_panel translucent)
{ [[ "${display_silently_status}" == "TRUE" ]] || [[ "${display_silently_status}" == "TEMP" ]]; } && ibm_notifier_array+=(-silent)
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"

# Kill any previous notifications so new ones can take its place.
killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1

# Start IBM Notifier and wait for ${dialog_response} and ${dialog_return}.
unset dialog_response
unset dialog_return
dialog_response=$("${IBM_NOTIFIER_BINARY}" "${ibm_notifier_array[@]}")
dialog_return="$?"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ "${dialog_user_auth_enabled}" != "TRUE" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_response is: ${dialog_response}"
{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ "${dialog_user_auth_enabled}" == "TRUE" ]]; } && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: dialog_response is: ${dialog_response}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_return is: ${dialog_return}"

# Restart IBM Notifier if the user quits.
while [[ "${dialog_return}" -eq 239 ]]; do
	log_super "Warning: User attempted to quit IBM Notifier.app via Command-Q keyboard shortcut."
	unset dialog_response
	unset dialog_return
	dialog_response=$("${IBM_NOTIFIER_BINARY}" "${ibm_notifier_array[@]}")
	dialog_return="$?"
	{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ "${dialog_user_auth_enabled}" != "TRUE" ]]; } && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_response is: ${dialog_response}"
	{ [[ "${verbose_mode_option}" == "TRUE" ]] && [[ "${dialog_user_auth_enabled}" == "TRUE" ]]; } && log_echo "Verbose Mode: Function ${FUNCNAME[0]}: dialog_response is: ${dialog_response}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_return is: ${dialog_return}"
done
}

# MARK: *** Install Now Notifications ***
################################################################################

# Display a non-interactive notification informing the user that the install now workflow has started.
notification_install_now_start() {
set_display_strings_language
log_super "IBM Notifier: Install now start notification."
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_install_now_start_title}" -subtitle "${display_string_install_now_start_body}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"
open_notification_ibm_notifier &
}

# Display a non-interactive notification informing the user that the install now workflow is downloading the macOS update/upgrade.
notification_install_now_download() {
set_display_strings_language
log_super "IBM Notifier: Install now downloading notification."
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_install_now_download_title}" -subtitle "${display_string_install_now_download_body}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"
open_notification_ibm_notifier &
}

# Display a non-interactive notification informing the user that macOS is up to date.
notification_install_now_up_to_date() {
rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
set_display_strings_language
log_super "IBM Notifier: Install now Apple software is already up to date notification."
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_install_now_up_to_date_title}" -subtitle "${display_string_install_now_up_to_date_body}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -main_button_label "${display_string_ok_button}")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"
open_notification_ibm_notifier &
disown -a
}

# Display a non-interactive notification informing the user that the install now workflow has failed.
notification_install_now_failed() {
rm -f "${WORKFLOW_INSTALL_NOW_FILE}" 2> /dev/null
set_display_strings_language
log_super "IBM Notifier: Install now failure notification."
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_install_now_failed_title}" -subtitle "${display_string_install_now_failed_body}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -main_button_label "${display_string_ok_button}")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"
open_notification_ibm_notifier &
disown -a
}

# MARK: *** Default Notifications ***
################################################################################

# Display a non-interactive notification informing the user there is insufficient storage for a macOS update/upgrade.
notification_insufficient_storage() {
notification_insufficient_storage_error="FALSE"
log_super "Warning: Current available storage is at ${storage_available_gigabytes} GBs which is below the ${storage_required_gigabytes} GBs that is required for macOS update/upgrade workflow."
log_status "Running: Notification insufficient storage."
local notification_insufficient_storage_timeout_seconds
notification_insufficient_storage_timeout_seconds="${dialog_timeout_insufficient_storage_seconds}"
set_display_strings_language

# The initial ${ibm_notifier_array} settings for the insufficient storage notification.
ibm_notifier_array=(-type popup -always_on_top -bar_title "${display_string_insufficient_storage_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")

# Variations for the main body text of the insufficient storage notification.
if [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_date_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Insufficient storage deadline date notification with a ${notification_insufficient_storage_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_insufficient_storage_deadline_date_body}")
elif [[ "${deadline_days_stauts}" == "SOFT" ]] || [[ "${deadline_days_stauts}" == "HARD" ]]; then
	log_super "IBM Notifier: Insufficient storage deadline days notification with a ${notification_insufficient_storage_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_insufficient_storage_deadline_days_body}")
elif [[ "${deadline_count_status}" == "SOFT" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Insufficient storage deadline count notification with a ${notification_insufficient_storage_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_insufficient_storage_deadline_count_body}")
else # No deadlines, this is the default insufficient storage notification.
	log_super "IBM Notifier: Insufficient storage default notification with a ${notification_insufficient_storage_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_insufficient_storage_default_body}")
fi

# Open the appropriate storage assistant and the insufficient storage notification.
if [[ "${macos_version_major}" -ge 13 ]]; then
	log_super "Status: Opening the Storage pane of the System Settings.app."
	sudo -u "${current_user_account_name}" open "x-apple.systempreferences:com.apple.settings.Storage" &
else
	log_super "Status: Opening the Storage Management.app."
	sudo -u "${current_user_account_name}" open "/System/Library/CoreServices/Applications/Storage Management.app" &
fi

# Evaluate ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
{ [[ "${display_unmovable_status}" != "TRUE" ]] && [[ $(echo "${display_unmovable_option}" | grep -c 'STORAGE') -gt 0 ]]; } && display_unmovable_status="TEMP"
[[ "${display_hide_background_status}" == "TRUE" ]] && display_hide_background_status="TEMPOFF" # Don't want to ever hide the background for this one so the user can try to use the storage optimizer.
{ [[ "${display_silently_status}" != "TRUE" ]] && [[ $(echo "${display_silently_option}" | grep -c 'STORAGE') -gt 0 ]]; } && display_silently_status="TEMP"

# Open the initial power required notification.
open_notification_ibm_notifier &

# This handles waiting for available storage along with the ${dialog_timeout_insufficient_storage_seconds} option.
local notification_insufficient_storage_check_timeout
notification_insufficient_storage_check_timeout="${notification_insufficient_storage_timeout_seconds}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: STORAGE_REQUIRED_RECHECK_SECONDS is: ${STORAGE_REQUIRED_RECHECK_SECONDS}"
while [[ "${notification_insufficient_storage_check_timeout}" -ge 0 ]]; do
	sleep "${STORAGE_REQUIRED_RECHECK_SECONDS}"
	check_storage_available
	if [[ "${check_storage_available_error}" == "FALSE" ]]; then
		if [[ "${storage_ready}" == "TRUE" ]]; then
			log_super "Status: Current available storage is now at ${storage_available_gigabytes} GBs, the macOS update/upgrade workflow can continue."
			killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
			break
		fi
	else # "${check_storage_available_error}" == "FALSE"
		notification_insufficient_storage_error="TRUE"
		break
	fi
	notification_insufficient_storage_check_timeout=$((notification_insufficient_storage_check_timeout-STORAGE_REQUIRED_RECHECK_SECONDS))
done
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: notification_insufficient_storage_error is: ${notification_insufficient_storage_error}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: storage_ready is: ${storage_ready}"

# Reset temporary ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
[[ "${display_unmovable_status}" == "TEMP" ]] && unset display_unmovable_status
[[ "${display_hide_background_status}" == "TEMPOFF" ]] && unset display_hide_background_status
[[ "${display_silently_status}" == "TEMP" ]] && unset display_silently_status

# If there still is not sufficient storage, then exit.
if [[ "${notification_insufficient_storage_error}" == "FALSE" ]] && [[ "${storage_ready}" == "FALSE" ]]; then
	log_super "Error: Waiting for user to make more storage available timed out after ${notification_insufficient_storage_timeout_seconds} seconds."
	notification_insufficient_storage_error="TRUE"
fi
[[ "${display_hide_background_status}" == "TEMPOFF" ]] && display_hide_background_status="TRUE"
}

# Display a non-interactive notification informing the user they need to plug the computer into AC power.
notification_power_required() {
local power_required_charger_connected
power_required_charger_connected="FALSE"
notification_power_required_error="FALSE"
log_super "Warning: Current battery level is at ${power_battery_percent}% which is below the minimum required level of ${power_required_battery_percent}%."
log_status "Running: Notification AC power required."
local notification_power_required_timeout_seconds
notification_power_required_timeout_seconds="${dialog_timeout_power_required_seconds}"
set_display_strings_language

# The initial ${ibm_notifier_array} settings for the power required notification.
ibm_notifier_array=(-type popup -always_on_top -bar_title "${display_string_power_required_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")

# Variations for the main body text of the power required notification.
if [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_date_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Power required deadline date notification with a ${notification_power_required_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_power_required_deadline_date_body}")
elif [[ "${deadline_days_stauts}" == "SOFT" ]] || [[ "${deadline_days_stauts}" == "HARD" ]]; then
	log_super "IBM Notifier: Power required deadline days notification with a ${notification_power_required_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_power_required_deadline_days_body}")
elif [[ "${deadline_count_status}" == "SOFT" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Power required deadline count notification with a ${notification_power_required_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_power_required_deadline_count_body}")
else # No deadlines, this is the default power required notification.
	log_super "IBM Notifier: Power required default notification with a ${notification_power_required_timeout_seconds} second timeout."
	ibm_notifier_array+=(-subtitle "${display_string_power_required_default_body}")
fi

# Evaluate ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
{ [[ "${display_unmovable_status}" != "TRUE" ]] && [[ $(echo "${display_unmovable_option}" | grep -c 'POWER') -gt 0 ]]; } && display_unmovable_status="TEMP"
{ [[ "${display_hide_background_status}" != "TRUE" ]] && [[ $(echo "${display_hide_background_option}" | grep -c 'POWER') -gt 0 ]]; } && display_hide_background_status="TEMP"
{ [[ "${display_silently_status}" != "TRUE" ]] && [[ $(echo "${display_silently_option}" | grep -c 'POWER') -gt 0 ]]; } && display_silently_status="TEMP"

# Open the initial power required notification.
open_notification_ibm_notifier &

# This handles waiting for AC power along with the ${dialog_timeout_power_required_seconds} option.
local notification_power_required_check_timeout
notification_power_required_check_timeout="${notification_power_required_timeout_seconds}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: POWER_REQUIRED_RECHECK_SECONDS is: ${POWER_REQUIRED_RECHECK_SECONDS}"
while [[ "${notification_power_required_check_timeout}" -ge 0 ]]; do
	sleep "${POWER_REQUIRED_RECHECK_SECONDS}"
	[[ $(pmset -g ps | grep -ic 'AC Power') -ne 0 ]] && power_required_charger_connected="TRUE"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_required_charger_connected: ${power_required_charger_connected}"
	if [[ "${power_required_charger_connected}" == "TRUE" ]]; then
		log_super "Status: AC power detected, the macOS update/upgrade workflow can continue."
		killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
		break
	fi
	notification_power_required_check_timeout=$((notification_power_required_check_timeout-POWER_REQUIRED_RECHECK_SECONDS))
done
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: power_required_charger_connected is: ${power_required_charger_connected}"

# Reset temporary ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
[[ "${display_unmovable_status}" == "TEMP" ]] && unset display_unmovable_status
[[ "${display_hide_background_status}" == "TEMP" ]] && unset display_hide_background_status
[[ "${display_silently_status}" == "TEMP" ]] && unset display_silently_status

# If there still is no AC power, then exit.
if [[ "${power_required_charger_connected}" == "FALSE" ]]; then
	log_super "Error: Waiting for user to connect AC power timed out after ${notification_power_required_timeout_seconds} seconds."
	notification_power_required_error="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: notification_power_required_error is: ${notification_power_required_error}"
}

# Display a non-interactive notification informing the user that an update/upgrade that requires preparation has started.
notification_prepare() {
set_display_strings_language

# The initial ${ibm_notifier_array} settings for the preparing update notification.
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_prepare_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")

# Variations for the main body text of the preparing update notification.
if [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_date_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Preparing update/upgrade deadline date notification showing a ${display_string_prepare_time_estimate} minute estimate."
	ibm_notifier_array+=(-subtitle "${display_string_prepare_deadline_date_body}")
elif [[ "${deadline_days_stauts}" == "SOFT" ]] || [[ "${deadline_days_stauts}" == "HARD" ]]; then
	log_super "IBM Notifier: Preparing update/upgrade deadline days notification showing a ${display_string_prepare_time_estimate} minute estimate."
	ibm_notifier_array+=(-subtitle "${display_string_prepare_deadline_days_body}")
elif [[ "${deadline_count_status}" == "SOFT" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Preparing update/upgrade deadline count notification showing a ${display_string_prepare_time_estimate} minute estimate."
	ibm_notifier_array+=(-subtitle "${display_string_prepare_deadline_count_body}")
else # No deadlines, this is the default preparing update notification.
	log_super "IBM Notifier: Preparing update/upgrade default notification showing a ${display_string_prepare_time_estimate} minute estimate."
	ibm_notifier_array+=(-subtitle "${display_string_prepare_default_body}")
fi

# Open notification in the background allowing super to continue.
open_notification_ibm_notifier &
}

# Display a non-interactive notification informing the user that the computer going to restart soon.
notification_restart() {
set_display_strings_language

# The initial ${ibm_notifier_array} settings for the restart notification.
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_restart_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")

# Variations for the main body text of the restart notification.
if [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_date_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Restart deadline date notification."
	ibm_notifier_array+=(-subtitle "${display_string_restart_deadline_date_body}")
elif [[ "${deadline_days_stauts}" == "SOFT" ]] || [[ "${deadline_days_stauts}" == "HARD" ]]; then
	log_super "IBM Notifier: Restart deadline days notification."
	ibm_notifier_array+=(-subtitle "${display_string_restart_deadline_days_body}")
elif [[ "${deadline_count_status}" == "SOFT" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then
	log_super "IBM Notifier: Restart deadline count notification."
	ibm_notifier_array+=(-subtitle "${display_string_restart_deadline_count_body}")
else # No deadlines, this is the default restart notification.
	log_super "IBM Notifier: Restart default notification."
	ibm_notifier_array+=(-subtitle "${display_string_restart_default_body}")
fi

# Open notification in the background allowing super to continue.
open_notification_ibm_notifier &
}

# Display a non-interactive notification informing the user that the install now workflow is installing non-system Apple software updates.
notification_non_system_updates() {
set_display_strings_language
log_super "IBM Notifier: Installing non-system Apple software updates notification."
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_non_system_updates_title}" -subtitle "${display_string_non_system_updates_body}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -accessory_view_type progressbar -accessory_view_payload "/percent indeterminate")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"
open_notification_ibm_notifier &
}

# Display a non-interactive notification informing the user that update process has failed.
notification_failed() {
set_display_strings_language
set_display_strings_deferral_button
log_super "IBM Notifier: Failure notification."
ibm_notifier_array=(-type popup -always_on_top -position top_right -bar_title "${display_string_failed_title}" -subtitle "${display_string_failed_body}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -main_button_label "${display_string_deferral_button}")
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: ibm_notifier_array is:\n${ibm_notifier_array[*]}"
open_notification_ibm_notifier &
disown -a
}

# MARK: *** Interactive Dialogs ***
################################################################################

# Display an interactive dialog with restart and deferral options. This sets ${dialog_user_choice_restart} and if ${deferral_timer_menu_minutes} then also sets ${deferral_timer_minutes}.
dialog_restart_or_defer() {
set_display_strings_language
log_status "Running: Dialog restart or defer."
unset dialog_timeout_seconds
[[ -n "${dialog_timeout_restart_or_defer_seconds}" ]] && dialog_timeout_seconds="${dialog_timeout_restart_or_defer_seconds}"
{ [[ -z "${dialog_timeout_restart_or_defer_seconds}" ]] && [[ -n "${dialog_timeout_default_seconds}" ]]; } && dialog_timeout_seconds="${dialog_timeout_default_seconds}"
[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Restart or defer dialog with a ${dialog_timeout_seconds} second timeout."
[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Restart or defer dialog with no timeout."

# Create initial ${ibm_notifier_array} settings for the dialog.
ibm_notifier_array=(-type popup -always_on_top -bar_title "${display_string_restart_or_defer_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -secondary_button_label "${display_string_restart_button}")

# Body text variations based on deadline options.
if [[ -n "${display_string_deadline}" ]] && [[ -n "${display_string_deadline_count}" ]]; then # Show both date and maximum deferral count deadlines.
	ibm_notifier_array+=(-subtitle "${display_string_restart_or_defer_date_count_body}")
elif [[ -n "${display_string_deadline}" ]]; then # Show only date deadline.
	ibm_notifier_array+=(-subtitle "${display_string_restart_or_defer_date_body}")
elif [[ -n "${display_string_deadline_count}" ]]; then # Show only maximum deferral count deadline.
	ibm_notifier_array+=(-subtitle "${display_string_restart_or_defer_count_body}")
else # Show no deadlines.
	ibm_notifier_array+=(-subtitle "${display_string_restart_or_defer_default_body}")
fi
[[ -n "${dialog_timeout_seconds}" ]] && display_string_dialog_timeout="${display_string_restart_or_defer_timeout}"

# If needed, handle the ${deferral_timer_menu_minutes} option and set ${display_string_deferral_menu}.
if [[ -n "${deferral_timer_menu_minutes}" ]]; then
	local previous_ifs
	previous_ifs="${IFS}"; IFS=','
	local deferral_timer_menu_minutes_array
	read -r -a deferral_timer_menu_minutes_array <<< "${deferral_timer_menu_minutes}"
	local deferral_timer_menu_display_array
	read -r -a deferral_timer_menu_display_array <<< "${deferral_timer_menu_minutes}"
	for array_index in "${!deferral_timer_menu_display_array[@]}"; do
		if [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 60 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} ${deferral_timer_menu_minutes_array[array_index]} ${display_string_minutes}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -eq 60 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} 1 ${display_string_hour}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -gt 60 ]] && [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 120 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} 1 ${display_string_hour} ${display_string_and} $((deferral_timer_menu_minutes_array[array_index] - 60)) ${display_string_minutes}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -ge 120 ]] && [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 1440 ]] && [[ $((deferral_timer_menu_minutes_array[array_index] % 60)) -eq 0 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} $((deferral_timer_menu_minutes_array[array_index] / 60)) ${display_string_hours}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -ge 120 ]] && [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 1440 ]] && [[ $((deferral_timer_menu_minutes_array[array_index] % 60)) -ne 0 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} $((deferral_timer_menu_minutes_array[array_index] / 60)) ${display_string_hours} ${display_string_and} $((deferral_timer_menu_minutes_array[array_index] % 60)) ${display_string_minutes}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -ge 1440 ]] && [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 1500 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} 1 ${display_string_day}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -ge 1500 ]] && [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 2880 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} 1 ${display_string_day} ${display_string_and} $(((deferral_timer_menu_minutes_array[array_index] - 1440) / 60)) ${display_string_hours}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -ge 2880 ]] && [[ "${deferral_timer_menu_minutes_array[array_index]}" -lt 10080 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} $((deferral_timer_menu_minutes_array[array_index] / 1440)) ${display_string_days}"
		elif [[ "${deferral_timer_menu_minutes_array[array_index]}" -ge 10080 ]]; then
			deferral_timer_menu_display_array[array_index]="${display_string_deferral_button} 1 ${display_string_week}"
		fi
	done
	IFS=$'\n'
	display_string_deferral_menu="${deferral_timer_menu_display_array[*]}"
	IFS="${previous_ifs}"
else # Instead, add a defer button containing the text based off ${deferral_timer_minutes} time.
	set_display_strings_deferral_button
fi
ibm_notifier_array+=(-main_button_label "${display_string_deferral_button}")

# Evaluate ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
{ [[ "${display_unmovable_status}" != "TRUE" ]] && [[ $(echo "${display_unmovable_option}" | grep -c 'DEFER') -gt 0 ]]; } && display_unmovable_status="TEMP"
{ [[ "${display_hide_background_status}" != "TRUE" ]] && [[ $(echo "${display_hide_background_option}" | grep -c 'DEFER') -gt 0 ]]; } && display_hide_background_status="TEMP"
{ [[ "${display_silently_status}" != "TRUE" ]] && [[ $(echo "${display_silently_option}" | grep -c 'DEFER') -gt 0 ]]; } && display_silently_status="TEMP"

# Start the dialog.
open_dialog_ibm_notifier

# Reset temporary ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
[[ "${display_unmovable_status}" == "TEMP" ]] && unset display_unmovable_status
[[ "${display_hide_background_status}" == "TEMP" ]] && unset display_hide_background_status
[[ "${display_silently_status}" == "TEMP" ]] && unset display_silently_status

# The ${dialog_return} contains the IBM Notifier.app return code. If ${deferral_timer_menu_minutes} was enabled then set ${deferral_timer_minutes}.
case "${dialog_return}" in
	0)
		dialog_user_choice_restart="FALSE"
		if [[ -n "${deferral_timer_menu_minutes}" ]]; then
			deferral_timer_minutes="${deferral_timer_menu_minutes_array[${dialog_response}]}"
			log_super "Status: User chose to defer update for ${deferral_timer_minutes} minutes."
			log_status "Pending: User chose to defer update for ${deferral_timer_minutes} minutes."
		else
			log_super "Status: User chose to defer update, using the default defer of ${deferral_timer_minutes} minutes."
			log_status "Pending: User chose to defer update, using the default defer of ${deferral_timer_minutes} minutes."
		fi
		;;
	4|255)
		dialog_user_choice_restart="FALSE"
		if [[ -n "${deferral_timer_menu_minutes}" ]]; then
			deferral_timer_minutes="${deferral_timer_menu_minutes_array[${dialog_response}]}"
			log_super "Status: Display timeout automatically chose to defer update for ${deferral_timer_minutes} minutes."
			log_status "Pending: Display timeout automatically chose to defer update for ${deferral_timer_minutes} minutes."
		else
			log_super "Status: Display timeout automatically chose to defer update, using the default defer of ${deferral_timer_minutes} minutes."
			log_status "Pending: Display timeout automatically chose to defer update, using the default defer of ${deferral_timer_minutes} minutes."
		fi
		;;
	2)
		log_super "Status: User chose to restart now."
		dialog_user_choice_restart="TRUE"
		;;
esac
}

# Display an interactive dialog when a soft deadline has passed, giving the user only one button to continue the workflow.
dialog_soft_deadline() {
set_display_strings_language
log_status "Running: Dialog soft deadline."
unset dialog_timeout_seconds
[[ -n "${dialog_timeout_soft_deadline_seconds}" ]] && dialog_timeout_seconds="${dialog_timeout_soft_deadline_seconds}"
{ [[ -z "${dialog_timeout_soft_deadline_seconds}" ]] && [[ -n "${dialog_timeout_default_seconds}" ]]; } && dialog_timeout_seconds="${dialog_timeout_default_seconds}"

# The initial ${ibm_notifier_array} settings for the soft deadline dialog.
ibm_notifier_array=(-type popup -always_on_top -bar_title "${display_string_soft_deadline_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -main_button_label "${display_string_restart_button}")

# Variations for the main body text of the soft deadline dialog.
if [[ "${deadline_date_status}" == "SOFT" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Soft deadline date dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Soft deadline date dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_soft_deadline_date_body}")
elif [[ "${deadline_days_stauts}" == "SOFT" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Soft deadline days dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Soft deadline days dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_soft_deadline_days_body}")
elif [[ "${deadline_count_status}" == "SOFT" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Soft deadline count dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: Soft deadline count dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_soft_deadline_count_body}")
fi
[[ -n "${dialog_timeout_seconds}" ]] && display_string_dialog_timeout="${display_string_soft_deadline_timeout}"

# Start the dialog.
unset deferral_timer_menu_minutes
open_dialog_ibm_notifier

# The ${dialog_return} contains the IBM Notifier.app return code.
case "${dialog_return}" in
	0)
		log_super "Status: User chose to restart."
		;;
	255)
		log_super "Status: Display timeout automatically chose to restart."
		;;
esac
}

# Display an interactive IBM Notifier dialog to collect user credentials for macOS update/upgrade workflow.
dialog_user_auth() {
dialog_user_auth_error="FALSE"

# First, check to make sure the current user is a valid volume owner.
if [[ "${current_user_is_volume_owner}" == "FALSE" ]]; then
	log_super "Error: Current user is not a volume owner: ${current_user_account_name}"
	dialog_user_auth_error="TRUE"
	return 0
fi

# The initial ${ibm_notifier_array} and variations for the main body text for the user authentication dialog.
set_display_strings_language
log_status "Running: Dialog user authentication."
unset dialog_timeout_seconds
[[ -n "${dialog_timeout_user_auth_seconds}" ]] && dialog_timeout_seconds="${dialog_timeout_user_auth_seconds}"
{ [[ -z "${dialog_timeout_user_auth_seconds}" ]] && [[ -n "${dialog_timeout_default_seconds}" ]]; } && dialog_timeout_seconds="${dialog_timeout_default_seconds}"

# The initial ${ibm_notifier_array} settings for the initial run of the user authentication dialog.
ibm_notifier_array=(-type popup -always_on_top -bar_title "${display_string_user_auth_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -main_button_label "${display_string_restart_button}")

# Variations for the main body text of the initial run of the user authentication dialog.
if [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_date_status}" == "HARD" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline date dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline date dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_user_auth_deadline_date_body}")
elif [[ "${deadline_days_stauts}" == "SOFT" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline soft days dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline soft days dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_user_auth_deadline_days_soft_body}")
elif [[ "${deadline_days_stauts}" == "HARD" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline hard days dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline hard days dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_user_auth_deadline_days_hard_body}")
elif [[ "${deadline_count_status}" == "SOFT" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then
	[[ -n "${dialog_timeout_seconds}" ]] &&  log_super "IBM Notifier: User authentication deadline count dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication deadline count dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_user_auth_deadline_count_body}")
else # No deadlines, this is the default user authentication dialog.
	[[ -n "${dialog_timeout_seconds}" ]] &&  log_super "IBM Notifier: User authentication default dialog with a ${dialog_timeout_seconds} second timeout."
	[[ -z "${dialog_timeout_seconds}" ]] && log_super "IBM Notifier: User authentication default dialog with no timeout."
	ibm_notifier_array+=(-subtitle "${display_string_user_auth_default_body}")
fi
display_accessory_secure_payload="/title ${display_string_user_auth_password_title} /placeholder ${display_string_user_auth_password_placeholder} /required"
[[ -n "${dialog_timeout_seconds}" ]] && display_string_dialog_timeout="${display_string_user_auth_timeout}"

# Evaluate ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
{ [[ "${display_unmovable_status}" != "TRUE" ]] && [[ $(echo "${display_unmovable_option}" | grep -c 'USERAUTH') -gt 0 ]]; } && display_unmovable_status="TEMP"
{ [[ "${display_hide_background_status}" != "TRUE" ]] && [[ $(echo "${display_hide_background_option}" | grep -c 'USERAUTH') -gt 0 ]]; } && display_hide_background_status="TEMP"
{ [[ "${display_silently_status}" != "TRUE" ]] && [[ $(echo "${display_silently_option}" | grep -c 'USERAUTH') -gt 0 ]]; } && display_silently_status="TEMP"

# Open the user authentication dialog including handling of the ${dialog_timeout_seconds} and user password validation.
if [[ -n "${display_accessory_user_auth}" ]]; then
	local display_accessory_content_backup
	[[ -n "${display_accessory_content}" ]] && display_accessory_content_backup="${display_accessory_content}"
	display_accessory_content="${display_accessory_user_auth}"
fi
dialog_user_auth_enabled="TRUE"
dialog_user_auth_valid="FALSE"
local dialog_user_auth_timeout
dialog_user_auth_timeout="FALSE"
local dialog_user_auth_attempt
dialog_user_auth_attempt=0
while true; do
	if [[ "${dialog_user_auth_attempt}" -eq 1 ]]; then
		# Re-create ${ibm_notifier_array} settings for the user authentication dialog when the user authentication fails.
		ibm_notifier_array=(-type popup -always_on_top -bar_title "${display_string_user_auth_title}" -icon_path "${DISPLAY_ICON_FILE_CACHE}" -icon_width "${display_icon_size}" -icon_height "${display_icon_size}" -main_button_label "${display_string_restart_button}")
		if [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_date_status}" == "HARD" ]]; then
			ibm_notifier_array+=(-subtitle "${display_string_user_auth_retry_deadline_date_body}")
		elif [[ "${deadline_days_stauts}" == "SOFT" ]]; then
			ibm_notifier_array+=(-subtitle "${display_string_user_auth_retry_deadline_days_soft_body}")
		elif [[ "${deadline_days_stauts}" == "HARD" ]]; then
			ibm_notifier_array+=(-subtitle "${display_string_user_auth_retry_deadline_days_hard_body}")
		elif [[ "${deadline_count_status}" == "SOFT" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then
			ibm_notifier_array+=(-subtitle "${display_string_user_auth_retry_deadline_count_body}")
		else # No deadlines, this is the default user authentication dialog.
			ibm_notifier_array+=(-subtitle "${display_string_user_auth_retry_default_body}")
		fi
		display_accessory_secure_payload="/title ${display_string_user_auth_retry_password_title} /placeholder ${display_string_user_auth_retry_password_placeholder} /required"
	fi
	open_dialog_ibm_notifier
	((dialog_user_auth_attempt++))
	if [[ "${dialog_return}" -eq 0 ]]; then
		if [[ $(dscl /Local/Default -authonly "${current_user_account_name}" "${dialog_response}" 2>&1) == "" ]]; then
			auth_local_account="${current_user_account_name}"
			auth_local_password="${dialog_response}"
			dialog_user_auth_valid="TRUE"
			break
		fi
	elif [[ "${dialog_return}" -eq 4 ]]; then
		dialog_user_auth_timeout="TRUE"
		break
	else # If ${dialog_return} contains any other error code.
		break
	fi
done
if [[ -n "${display_accessory_content_backup}" ]]; then
	display_accessory_content="${display_accessory_content_backup}"
else
	unset display_accessory_content
fi
unset dialog_user_auth_enabled

# Reset temporary ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
[[ "${display_unmovable_status}" == "TEMP" ]] && unset display_unmovable_status
[[ "${display_hide_background_status}" == "TEMP" ]] && unset display_hide_background_status
[[ "${display_silently_status}" == "TEMP" ]] && unset display_silently_status

# If user authentication was successful then evaluate options to save password or fix bootstrap token.
if [[ "${dialog_user_auth_valid}" == "TRUE" ]]; then
	log_super "Status: Credentials verified for current user: ${auth_local_account}"
	if [[ "${auth_ask_user_to_save_password}" -eq 1 ]] || [[ "${auth_ask_user_to_save_password}" == "TRUE" ]]; then
		sudo -u "${auth_local_account}" security add-generic-password -a "super_auth_user_password" -s "Super Update Service" -w "${auth_local_password}" > /dev/null 2>&1
		local auth_user_password_keychain
		auth_user_password_keychain=$(sudo -u "${auth_local_account}" security find-generic-password -w -a "super_auth_user_password" 2> /dev/null)
		if [[ "${auth_local_password}" == "${auth_user_password_keychain}" ]]; then
			log_super "Status: Saved new --auth-ask-user-to-save-password credentials for current user: ${auth_local_account}"
		else
			log_super "Warning: Unable to validate keychain item for --auth-ask-user-to-save-password, deleting keychain item."
			sudo -u "${auth_local_account}" security delete-generic-password -a "super_auth_user_password" > /dev/null 2>&1
		fi
	elif [[ "${mdm_enrolled}" == "TRUE" ]] && [[ "${auth_error_bootstrap_token}" == "TRUE" ]] && { [[ "${auth_mdm_failover}" == "TRUE" ]] || [[ "${auth_mdm_failover_bootstrap}" == "TRUE" ]]; }; then
		bootstrap_token_attempt_fix="TRUE"
		if [[ "${current_user_is_admin}" == "FALSE" ]]; then
			log_super "Warning: Local user account \"${auth_local_account}\" can not be used to escrow bootstrap token because they are not a local admin."
			bootstrap_token_attempt_fix="FALSE"
		fi
		if [[ "${current_user_has_secure_token}" == "FALSE" ]]; then
			log_super "Warning: Local user account \"${auth_local_account}\" can not be used to escrow bootstrap token because they do not have a secure token."
			bootstrap_token_attempt_fix="FALSE"
		fi
		if [[ "${auth_error_mdm}" == "TRUE" ]]; then
			log_super "Warning: Can not escrow bootstrap token because the MDM service is not available."
			bootstrap_token_attempt_fix="FALSE"
		fi
		if [[ "${bootstrap_token_attempt_fix}" == "TRUE" ]]; then
			log_super "Status: Attempting to use the credentials from user \"${auth_local_account}\" to escrow bootstrap token..."
			local profiles_response
			profiles_response=$(profiles install -type bootstraptoken -user "${auth_local_account}" -password "${auth_local_password}" 2>&1)
			[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: profiles_response is: ${profiles_response}"
			check_bootstrap_token_escrow
		fi
	fi
else # The user authentication dialog timed out or failed.
	if [[ "${dialog_user_auth_timeout}" == "TRUE" ]]; then
		log_super "Error: Waiting for user authentication timed out after ${dialog_timeout_seconds} seconds."
	else
		log_super "Error: User authentication failed."
	fi
	dialog_user_auth_error="TRUE"
fi
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: dialog_user_auth_error is: ${dialog_user_auth_error}"
}

# MARK: *** Main Workflow ***
################################################################################

main() {
# Initial super workflow preparations.
set_defaults
get_options "$@"
workflow_startup

# If restarting from a macOS update/upgrade this workflow starts before all others.
if [[ -f "${WORKFLOW_RESTART_VALIDATE_FILE}" ]]; then
	log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - RESTART VALIDATION WORKFLOW ****"
	log_status "Running: macOS update/upgrade restart validation."
	workflow_restart_validate
	rm -f "${WORKFLOW_RESTART_VALIDATE_FILE}" 2> /dev/null
fi

# If requested then restart counters.
[[ "${deadline_days_restart_all_option}" == "TRUE" ]] && restart_workflow_automatic_zero_date
[[ "${deadline_count_restart_all_option}" == "TRUE" ]] && restart_deadline_counters

# Start the appropriate main workflow based on user options.
if [[ "${workflow_disable_update_check_option}" == "TRUE" ]]; then # Skip software updates/upgrade mode option.
	log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - SKIP UPDATES/UPGRADE WORKFLOW ****"
	[[ "${workflow_disable_relaunch_option}" != "TRUE" ]] && log_super "Warning: When using the --skip-updates option you should also use the --workflow-disable-relaunch option to prevent super from unecissarily re-launching."
	asu_non_system_update_available="FALSE"
	macos_major_upgrade_version_major_target="FALSE"
	asu_macos_minor_update_available="FALSE"
	if [[ "${test_mode_option}" == "TRUE" ]]; then
		log_super "Test Mode: Simulating skip updates workflow."
		{ [[ "${workflow_restart_without_updates_option}" != "TRUE" ]] && [[ -z "${workflow_jamf_policy_triggers_option}" ]]; } && log_super "Warning: When using the --skip-updates option you need to also use --workflow-restart-without-updates or --workflow-jamf-policy-triggers to simulate notification and dialog workflows."
	fi
else # Default software update/upgrade workflows.
	# Check for updates/upgrades.
	if [[ "${test_mode_option}" != "TRUE" ]]; then
		log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - CHECK SOFTWARE UPDATES/UPGRADE ****"
		[[ "${workflow_software_full_check_required}" != "TRUE" ]] && check_software_stauts_caches
		workflow_check_asu
		workflow_check_macos_major_upgrades
		check_macos_downloads
	else # Test mode.
		asu_non_system_update_available="FALSE"
		macos_major_upgrade_version_major_target="FALSE"
		asu_macos_minor_update_available="FALSE"
		if [[ "${install_non_system_updates_without_restarting_option}" == "TRUE" ]]; then
			asu_non_system_update_available="TRUE"
			log_super "Test Mode: Simulating enforce all non-system updates workflow."
		elif [[ "${install_macos_major_upgrades_option}" == "TRUE" ]]; then
			asu_macos_major_upgrade_label_target="${macos_marketing_name} ${macos_version_major}.${macos_version_minor}-${macos_build}"
			asu_macos_major_upgrade_title_target="${macos_marketing_name} ${macos_version_major}.${macos_version_minor}"
			asu_macos_major_upgrade_version_target="${macos_version_major}.${macos_version_minor}"
			asu_macos_major_upgrade_version_major_target="${macos_version_major}"
			asu_macos_major_upgrade_size_target=15
			asu_macos_major_upgrade_title_target="${macos_marketing_name}"
			macos_installer_marketing_name_target="${macos_marketing_name}"
			macos_installer_version_target="${macos_version_major}.${macos_version_minor}"
			macos_installer_version_major_target="${macos_version_major}"
			macos_installer_build_target="${macos_build}"
			macos_major_upgrade_version_major_target="${macos_version_major}"
			macos_installer_size_target=15
			download_maocs_asu_required="TRUE"
			download_macos_installer_required="TRUE"
			log_super "Test Mode: Simulating macOS ${macos_major_upgrade_version_major_target} upgrade workflow."
		elif [[ "${workflow_restart_without_updates_option}" == "TRUE" ]]; then
			log_super "Test Mode: Simulating restart without updates workflow."
		else # Simulate a macOS update.
			asu_macos_minor_update_available="TRUE"
			asu_macos_minor_update_label="${macos_marketing_name} ${macos_version_major}.${macos_version_minor}-${macos_build}"
			asu_macos_minor_update_title="${macos_marketing_name} ${macos_version_major}.${macos_version_minor}"
			asu_macos_minor_update_version="${macos_version_major}.${macos_version_minor}"
			asu_macos_minor_update_size=5
			download_maocs_asu_required="TRUE"
			log_super "Test Mode: Simulating a macOS ${asu_macos_minor_update_version} update workflow."
		fi
	fi
	delete_unneeded_macos_installers # This function includes internal test mode logic.
	# At this point all available updates/upgrades have been evaluated so report different workflow statuses.
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available is: ${asu_macos_minor_update_available}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_auth_macos is: ${workflow_auth_macos}"
	[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_non_system_update_available is: ${asu_non_system_update_available}"
	if [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]]; then # A macOS upgrade is available and option to allow upgrade is enabled.
		if [[ "${macos_version_major}" -ge 13 ]] || { [[ "${macos_version_number}" -ge 1203 ]] && [[ "${workflow_auth_macos}" != "JAMF" ]]; }; then # macOS major upgrade possible via Apple software update.
			if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NOW MACOS ${asu_macos_major_upgrade_version_target} MAJOR UPGRADE VIA SOFTWAREUPDATE ****"
			elif [[ "${workflow_only_download_option}" == "TRUE" ]]; then
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - ONLY DOWNLOAD MACOS ${asu_macos_major_upgrade_version_target} MAJOR UPGRADE VIA SOFTWAREUPDATE ****"
			else # Default super workflow.
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - MACOS ${asu_macos_major_upgrade_version_target} MAJOR UPGRADE VIA SOFTWAREUPDATE ****"
			fi
		else # macOS major upgrade only possible via installer application.
			if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NOW MACOS ${macos_installer_version_target} MAJOR UPGRADE VIA INSTALLER ****"
			elif [[ "${workflow_only_download_option}" == "TRUE" ]]; then
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - ONLY DOWNLOAD MACOS ${macos_installer_version_target} MAJOR UPGRADE VIA INSTALLER ****"
			else # Default super workflow.
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - MACOS ${macos_installer_version_target} MAJOR UPGRADE VIA INSTALLER ****"
			fi
		fi
		if [[ -n ${display_accessory_upgrade} ]]; then
			display_accessory_content="${display_accessory_upgrade}"
		elif [[ -n ${display_accessory_default} ]]; then
			display_accessory_content="${display_accessory_default}"
		fi
	elif [[ "${asu_macos_minor_update_available}" == "TRUE" ]]; then # macOS updates are available.
		if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
			log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NOW UPDATE MACOS ${asu_macos_minor_update_version} MINOR UPDATE ****"
		elif [[ "${workflow_only_download_option}" == "TRUE" ]]; then
			log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - ONLY DOWNLOAD UPDATE MACOS ${asu_macos_minor_update_version} MINOR UPDATE ****"
		else # Default super workflow.
			log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - MACOS ${asu_macos_minor_update_version} MINOR UPDATE ****"
		fi
		if [[ -n ${display_accessory_update} ]]; then
			display_accessory_content="${display_accessory_update}"
		elif [[ -n ${display_accessory_default} ]]; then
			display_accessory_content="${display_accessory_default}"
		fi
	elif [[ "${asu_non_system_update_available}" == "TRUE" ]]; then # Only non-system Apple software updates are available.
		defaults delete "${SUPER_LOCAL_PLIST}" WorkflowAutomaticZeroDate 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterHard 2> /dev/null
		if [[ "${install_non_system_updates_without_restarting_option}" == "TRUE" ]]; then # Option to enforce all software updates is enabled.
			if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - INSTALL NOW NON-SYSTEM SOFTWARE UPDATE ****"
				workflow_install_non_system_asu # This function includes internal install now and test mode logic.
			elif [[ "${workflow_only_download_option}" == "TRUE" ]]; then
				log_super "Warning: The --install-non-system-updates option is ignored when used with the --only-download option."
			else # Default super workflow.
				log_super "**** S.U.P.E.R.M.A.N. ${SUPER_VERSION} - NON-SYSTEM SOFTWARE UPDATE ****"
				workflow_install_non_system_asu # This function includes internal install now and test mode logic.
			fi
		else
			log_super "Status: Available non-system Apple software updates are not enforced. You must use the --install-non-system-updates option for these items to install without a macOS update/upgrade."
		fi
	else # No software updates/upgrade needed so clean up any leftover deferral counters.
		defaults delete "${SUPER_LOCAL_PLIST}" WorkflowAutomaticZeroDate 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterFocus 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterSoft 2> /dev/null
		defaults delete "${SUPER_LOCAL_PLIST}" DeadlineCounterHard 2> /dev/null
	fi
fi

# This is the main logic for determining what to do in the case of available macOS updates, macOS upgrades, ${workflow_jamf_policy_triggers_option}, or the ${workflow_restart_without_updates_option}.
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: asu_macos_minor_update_available is: ${asu_macos_minor_update_available}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: macos_major_upgrade_version_major_target is: ${macos_major_upgrade_version_major_target}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_jamf_policy_triggers_option is: ${workflow_jamf_policy_triggers_option}"
[[ "${verbose_mode_option}" == "TRUE" ]] && log_super "Verbose Mode: Function ${FUNCNAME[0]}: workflow_restart_without_updates_option is: ${workflow_restart_without_updates_option}"
if [[ "${asu_macos_minor_update_available}" == "TRUE" ]] || [[ "${macos_major_upgrade_version_major_target}" != "FALSE" ]] || [[ -n "${workflow_jamf_policy_triggers_option}" ]] || [[ "${workflow_restart_without_updates_option}" == "TRUE" ]]; then
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
		if [[ "${current_user_account_name}" == "FALSE" ]]; then # A normal user is not logged in, start installations immediately.
			workflow_install_macos_no_user # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
		else # A normal user is currently logged in.
			if [[ "${workflow_disable_update_check_option}" != "TRUE" ]]; then
				[[ "${auth_mdm_failover_install_now}" == "TRUE" ]] && auth_mdm_failover="TRUE"
				if [[ "${workflow_auth_macos}" == "USER" ]]; then # Apple silicon computer in need of user authentication.
					dialog_user_auth
					if [[ "${dialog_user_auth_error}" == "TRUE" ]]; then
						log_super "Error: No valid Apple slicon authentication, install now workflow can not continue."
						log_status "Inactive Error: No valid Apple slicon authentication, install now workflow can not continue."
						[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_failed
						exit_error
					fi
				fi
				workflow_download_macos # This function only downloads if needed and includes internal storage checks and test mode logic.
			fi
			workflow_install_macos_active_user # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
		fi
	elif [[ "${workflow_only_download_option}" == "TRUE" ]]; then # Only download workflow doesn't matter if the user is logged in.
		workflow_download_macos # This function only downloads if needed and includes internal storage checks and test mode logic.
	else # Default super workflow, can run with or without logged in user.
		if [[ "${current_user_account_name}" == "FALSE" ]]; then # A normal user is not logged in, start installations immediately.
			workflow_install_macos_no_user # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
		else # A normal user is currently logged in so complete any macOS downloads first.
			[[ "${workflow_disable_update_check_option}" != "TRUE" ]] && workflow_download_macos # This function only downloads if needed and includes internal storage checks and test mode logic.
			# The download may have taken a while so another check to make sure the user is still logged in.
			[[ "${workflow_download_macos_check_user}" == "TRUE" ]] && check_current_user
			if [[ "${current_user_account_name}" == "FALSE" ]]; then
				workflow_install_macos_no_user # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
				return 0
			fi
			# Check deadlines.
			check_zero_date
			check_deadlines_dates
			check_deadlines_days
			# User Focus only needs to be checked if there are no date or day deadlines.
			if [[ "${deadline_date_status}" == "FALSE" ]] && [[ "${deadline_days_stauts}" == "FALSE" ]]; then
				check_user_focus
			else # At this point any date or days deadline would rule out any ${user_focus_active} option.
				user_focus_active="FALSE"
			fi
			check_deadlines_count
			# At this point all deferral and deadline options have been evaluated.
			if [[ "${deadline_date_status}" == "HARD" ]] || [[ "${deadline_days_stauts}" == "HARD" ]] || [[ "${deadline_count_status}" == "HARD" ]]; then # A hard deadline has passed, similar to no logged in user but with a notification.
				[[ "${auth_mdm_failover_hard}" == "TRUE" ]] && auth_mdm_failover="TRUE"
				# Evaluate ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
				[[ $(echo "${display_unmovable_option}" | grep -c 'HARD') -gt 0 ]] && display_unmovable_status="TRUE"
				[[ $(echo "${display_hide_background_option}" | grep -c 'HARD') -gt 0 ]] && display_hide_background_status="TRUE"
				[[ $(echo "${display_silently_option}" | grep -c 'HARD') -gt 0 ]] && display_silently_status="TRUE"
				workflow_install_macos_active_user # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
			elif [[ "${deadline_date_status}" == "SOFT" ]] || [[ "${deadline_days_stauts}" == "SOFT" ]] || [[ "${deadline_count_status}" == "SOFT" ]]; then # A soft deadline has passed.
				[[ "${auth_mdm_failover_soft}" == "TRUE" ]] && auth_mdm_failover="TRUE"
				# Evaluate ${display_unmovable_option}, ${display_hide_background_option}, and ${display_silently_option} options.
				[[ $(echo "${display_unmovable_option}" | grep -c 'SOFT') -gt 0 ]] && display_unmovable_status="TRUE"
				[[ $(echo "${display_hide_background_option}" | grep -c 'SOFT') -gt 0 ]] && display_hide_background_status="TRUE"
				[[ $(echo "${display_silently_option}" | grep -c 'SOFT') -gt 0 ]] && display_silently_status="TRUE"
				[[ "${workflow_auth_macos}" != "USER" ]] && dialog_soft_deadline
				workflow_install_macos_active_user # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
			elif [[ "${user_focus_active}" == "TRUE" ]]; then # No deadlines have passed but a process has told the display to not sleep or the user has enabled Focus or Do Not Disturb.
				deferral_timer_minutes="${deferal_timer_focus_minutes}"
				log_status "Pending: Automatic user focus deferral, trying again in ${deferral_timer_minutes} minutes."
				set_auto_launch_deferral
			else # Logically, this is the only time the choice dialog is shown.
				dialog_restart_or_defer
				if [[ "${dialog_user_choice_restart}" == "TRUE" ]]; then
					workflow_install_macos_active_user  # This function includes internal power, storage, and Apple silicon authentication checks. Sub-functions include test mode logic.
				else # The user chose to defer.
					set_auto_launch_deferral
				fi
			fi
		fi
	fi
fi

# At this point super is about to exit, so wrap up for different workflow exit modes.
if [[ -f "${WORKFLOW_RESTART_VALIDATE_FILE}" ]]; then # An update/upgrade is about to restart the computer.
	log_super "Exit: Full super workflow complete! macOS update/upgrade restart is imminent and the super restart validation workflow is scheduled to automatically relaunch at next startup."
	log_status "Pending: Full super workflow complete! macOS update/upgrade restart is imminent and the super restart validation workflow is scheduled to automatically relaunch at next startup."
else # The super workflow did not complete a macOS update/upgrade workflow.
	# Wrap-up for the ${workflow_install_now_option} if there were no updates/upgrades.
	if [[ "${workflow_install_now_option}" == "TRUE" ]]; then
		[[ "${current_user_account_name}" != "FALSE" ]] && notification_install_now_up_to_date
		if [[ "${test_mode_option}" == "TRUE" ]]; then
			log_super "Test Mode: Pausing ${test_mode_timeout_seconds} seconds for the install now up to date notification..."
			sleep "${test_mode_timeout_seconds}"
			killall -9 "IBM Notifier" "IBM Notifier Popup" > /dev/null 2>&1
		fi
	fi
	# Wrap-up for the ${workflow_only_download_option}.
	if [[ "${workflow_only_download_option}" == "TRUE" ]] && [[ "${workflow_download_macos_error}" == "FALSE" ]]; then
		if [[ "${jamf_version}" != "FALSE" ]]; then
			if [[ "${auth_error_jamf}" != "TRUE" ]]; then
				log_super "Status: Submitting updated inventory to Jamf Pro. Use --verbose-mode or check /var/log/jamf.log for more detail..."
				if [[ "${verbose_mode_option}" == "TRUE" ]]; then
					local jamf_response
					jamf_response=$("${JAMF_PRO_BINARY}" recon -verbose 2>&1)
					log_super "Verbose Mode: Function ${FUNCNAME[0]}: jamf_response is:\n${jamf_response}"
				else
					"${JAMF_PRO_BINARY}" recon > /dev/null 2>&1
				fi
			else # There was an earlier Jamf Pro validation error.
				deferral_timer_minutes="${deferral_timer_error_minutes}"
				log_super "Error: Unable to submit inventory to Jamf Pro, trying again in ${deferral_timer_minutes} minutes."
				log_status "Pending: Unable to submit inventory to Jamf Pro, trying again in ${deferral_timer_minutes} minutes."
				set_auto_launch_deferral
			fi
		fi
	fi
	# Logic for ${workflow_disable_relaunch_option} and ${deferral_timer_workflow_relaunch_minutes}.
	if [[ "${workflow_disable_relaunch_option}" == "TRUE" ]]; then
		log_super "Status: Full super workflow complete! Automatic relaunch is disabled."
		log_status "Inactive: Full super workflow complete! Automatic relaunch is disabled."
		defaults write "${SUPER_LOCAL_PLIST}" NextAutoLaunch -string "FALSE"
	else # Default super workflow automatically relaunches.
		deferral_timer_minutes="${deferral_timer_workflow_relaunch_minutes}"
		log_super "Status: Full super workflow complete! The super workflow is scheduled to automatically relaunch in ${deferral_timer_minutes} minutes."
		log_status "Pending: Full super workflow complete! The super workflow is scheduled to automatically relaunch in ${deferral_timer_minutes} minutes."
		set_auto_launch_deferral
	fi
fi
}

main "$@"
exit_clean
