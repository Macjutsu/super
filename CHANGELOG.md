# CHANGELOG

## [3.0b9]

2023-03-21

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New `--install-now` workflow option provides full support for "self-servicing" workflows that are started by an active user. With this option enabled the macOS update/upgrade workflow starts immediately. Additionally, if the `--install-now` option is enabled via command-line, and the workflow is successful, this option is not be saved for future runs of `super`. Finally, any failures during the install now workflow do not create an automatic deferral to try again later.
- New progress notifications for the install now workflow include...
	- An install now workflow "geting started" notification that appears as soon as the workflow starts.
	- An install now workflow "downloading" notification that appears if the macOS update/upgrade has not yet downloaded.
	- An install now workflow "up to date" notification that appears if macOS is fully updated/upgraded.
	- An install now workflow "failure" notification that appears if the macOS update/upgrade workflow fails.
	- When applicable, the standard macOS update/upgrade progress notifications are also used with the install now workflow.
- New `--only-download` workflow option allows you to pre-cache (but not install) macOS update/upgrades silently in the background. This significantly shortens the restart time when an installation workflow is started. If you use this option along with the `--recheck-defer` option then `super` always keeps the latest available macOS updates and allowed macOS upgrades ready for installation.
- New Jamf Pro [extension attribute script](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-Downloaded-macOS-Jamf-Pro-EA.sh) collects the name and version of the currently cached macOS update/upgrade. Thus allowing for the creation of Jamf Pro Smart Groups to facilitate automatic scoping for Self Service Polices.
- New (Apple Silicon only) macOS update/upgrade via user authentication workflow can prompt the local user for their credentials via an IBM Notifier dialog. This dialog features all the `super` display customization options. This workflow replaces the "Nudge-like" experience (that opens the native macOS update/upgrade interfaces) when no Apple Silicon update credentials passed into `super`.
- New `--user-auth-mdm-failover=TYPE` option allows you to specify when the macOS update/upgrade via user authentication workflow should be used as a failover for when the macOS update/upgrade via MDM workflow fails. The supported MDM failover types are...
	- `--user-auth-mdm-failover=ALWAYS` fail over to the user authentication workflow any time the MDM workflow fails.
	- `--user-auth-mdm-failover=HARD` fail over to the user authentication workflow only when the MDM workflow fails and a hard deadline has passed.
	- `--user-auth-mdm-failover=SOFT` fail over to the user authentication workflow only when the MDM workflow fails and a soft deadline has passed.
	- `--user-auth-mdm-failover=DEADLINE` fail over to the user authentication workflow only when the MDM workflow fails and any hard or soft deadline has passed.
	- `--user-auth-mdm-failover=INSTALLNOW` fail over to the user authentication workflow only when the MDM workflow fails and during an install now workflow.
- New `--user-auth-timeout=seconds` option allows you to set a timeout for the macOS update/upgrade via user authentication dialog (default is no timeout). If the user doesn't authenticate the macOS update/upgrade within this timeout then the workflow exits.
- New `--defer-display-timeout=seconds` option allows you to set a timeout for the restart or defer dialog (default is no timeout). If the user doesn't make a selection to restart or defer within this timeout then the workflow automatically defers.
- New `--soft-display-timeout=seconds` option allows you to set a timeout for the soft deadline restart dialog (default is no timeout). If the user doesn't choose to restart within this timeout then the workflow automatically starts the macOS update/upgrade restart.
- New notification for the `--enforce-all-updates` option informing the user that (non-macOS) Apple software updates are installing.
- New storage validation automatically calculates the required available free space for macOS update/upgrade workflows. This includes a new notification that automatically opens the Storage pane of the System Settings.app or (for older versions of macOS) the Storage Manager.app.
- New automatic deletion of any unnecessary (not allowed or not matching the targeted version) macOS Installers. This is necessary to accurately calculate the required available free space for macOS updates/upgrades.
- New automatic deletion of the targeted macOS installer if it fails Gatekeeper validation.
- New MacBook power validation automatically detects the required AC power or battery level for macOS update/upgrade workflows. This includes a new notification that prompts the user to plug in to AC power if the battery level is below 50%.
- New automatic error deferral if no user is logged in and there is not enough available free space for the macOS update/upgrade workflow.
- New automatic error deferral if no user is logged in and connecting to AC power is required for the macOS update/upgrade workflow.
- New `--free-space-timeout=seconds` option allows you to set a timeout for the required available free space notification (default is one hour). If the minimum available free space requirement is not met within this timeout then the workflow automatically defers.
- New `--battery-timeout=seconds` option allows you to set a timeout for the AC power required notification (default is one hour). If AC power is not connected within this timeout then the workflow automatically defers.
- New `--error-defer=seconds` option allows you to set a deferral time specifically for errors (as opposed to using the default defer time).
- New `--free-space-update=gigabytes` and `--free-space-upgrade=gigabytes` options allow you to override the default available free space requirements. These options should be reserved for testing purposes only as the default available free space requirements are set to reasonable minimums.
- New `--battery-level=percentage` option allows you to override the default battery level requirement. This option should be reserved for testing purposes only as the default battery level requirement is set to a reasonable minimum.
- New [Generate-MDM-Logs.sh](https://github.com/Macjutsu/super/tree/main/Super-Friends/Generate-MDM-Logs.sh) script creates filtered logs for troubleshooting `super` MDM workflow issues.
- New [Generate-MDM-Update-Jamf-API.sh](https://github.com/Macjutsu/super/tree/main/Super-Friends/Generate-MDM-Update-Jamf-API.sh) starts a macOS update/upgrade MDM workflow via the Jamf Pro API for troubleshooting `super` MDM workflow issues.
- Per Apple guidance, macOS 13.3 and later no longer double-check for available software updates when no updates are found.
- Improved download mechanism now only pre-downloads macOS updates/upgrades. This resolves issues where pre-downloading updates for actively running software (specifically Safari) would require the application to quit even though the update was only downloading.
- Improved `--test-mode` now simulates install now workflows, storage validation, power validation, and user authentication workflows.
- Improved restart validation mechanism (after macOS update/upgrade restart) is now more reliable.
- Improved soft and hard deadline information now shows in all appropriate macOS update/upgrade dialogs and notifications.
- Resolved an issue preventing the proper Deferral button text from showing. (Thanks to @homert83 and multiple folks in #super on MacAdmins Slack for spotting this one!)
- Resolved an issue that caused incompatible macOS Installers to download on older Mac computers. (Thanks to @Kasper Andresen on MacAdmins Slack for spotting this one!)
- Resolved several issues causing incorrect macOS Installer download status.
- Removed the `--display-timeout=seconds` option in favor of new specific timeout options.
- Updates to the `setDisplayLanguage()` function to allow for new install now workflow, available free space notification, power required notification, and user authentication dialog.
- As always, countless logging refinements and correction of typos.
- Updated [example MDM profiles for `super` 3.0b9](https://github.com/Macjutsu/super/tree/main/Example-MDM).
- `super` 3.0b9 SHA-256: 07c75419c723a5c7effd520ed52095b83cd7e806e924cb49dcc11260c41a018e

## [3.0b8]

2023-02-20

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New `--display-accessory-type=TYPE` and `--display-accessory-content=/local/path or URL` options allow you to specify a custom display [accessory view for IBM Notifier](https://raw.githubusercontent.com/IBM/mac-ibm-notifications/main/Images/Popup/popup.png) interactive dialogs (jamfHelper dialogs do not support this option). Both options must be specified at the same time, and the supported display accessory types are...
	- `--display-accessory-type=TEXTBOX` display plain text or Markdown styled text in a white box inside interactive dialogs.
	- `--display-accessory-type=HTMLBOX` display HTML styled text in a white box inside interactive dialogs.
	- `--display-accessory-type=HTML` display HTML styled text with a "blank" background as if part of the interactive dialogs.
	- `--display-accessory-type=IMAGE` display an image inside the interactive dialogs.
	- `--display-accessory-type=VIDEO` display a paused video inside the interactive dialogs.
	- `--display-accessory-type=VIDEOAUTO` display a video that auto-plays inside the interactive dialogs.
	- The `--display-accessory-content=/local/path or URL` option can accept both a local path or a web URL. If the specified local path or URL can not be found then the custom display accessory is not shown.
	- The Super-Friends folder now contains several [display accessory examples](https://github.com/Macjutsu/super/tree/main/Super-Friends).
- New `--help-button=plain text or URL` option allows you to specify a [help button for IBM Notifier](https://raw.githubusercontent.com/IBM/mac-ibm-notifications/main/Images/Popup/popup.png) interactive dialogs (jamfHelper dialogs do not support this option).
- New `--warning-button=plain text or URL` option allows you to specify a [warning button for IBM Notifier](https://raw.githubusercontent.com/IBM/mac-ibm-notifications/main/Images/Popup/popup.png) interactive dialogs (jamfHelper dialogs do not support this option).
	- If you specify a plain text string for either help or warning buttons, a pop-up appears when the user selects the button.
	- If you specify a URL for either help or warning buttons, the URL opens in another application. Supported URL types are; http://, https://, mailto:, and jamfselfservice://. If the specified web URL cannot be found then the button is not be shown.
- New `--display-silently` option opens all IBM Notifier dialogs and notifications without playing the system warning sound (jamfHelper dialogs and notifications do not support this option).
- New Defer button shows the deferral time for IBM Notifier interactive dialogs and notifications (jamfHelper dialogs and notifications do not support this option). However, if the `--menu-defer=` option is also specified, then the default button does not show the deferral time as it's already displayed in the deferral pop-up menu.
- When using the `--test-mode` option with the self-update workflow the failure dialog is now also displayed (for testing validation).
- Improved Apple Silicon self-update/upgrade workflow notification dialogs describe required actions more accurately.
- Resolved an issue where the Apple Silicon self-update/upgrade workflow was not opening the correct application for macOS 12.3 or newer.
- Resolved an issue where the macOS via MDM workflow timeout was not properly trigger the failure notification. (Thanks to @marcelpogorzelski for spotting this one!)
- Bootstrap token validation now happens earlier in the credential management workflow and generates less logging on subsequent runs.
- Updates to the `setDisplayLanguage()` function to allow for new IBM Notifier display options and improved self-update/upgrade workflow text.
- As always, countless logging refinements and correction of typos.
- Updated [example MDM profiles for `super` 3.0b8](https://github.com/Macjutsu/super/tree/main/Example-MDM).
- `super` 3.0b8 SHA-256: a38c66833811b2de2839a3c2f2c47523879cf9ce6eb5be40fc54a3793658d45a

## [3.0b7]

2023-02-16

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New `--enforce-all-updates` option installs all recommended (non-macOS) updates silently in the background even if there is no macOS update or upgrade required. Without using this option, the default behavior for `super` is to install recommended updates only after a macOS update/upgrade restart.
- The macOS upgrade via MDM workflow now automatically logs out an active user moments before the system attempts to restart the computer. Thus, now all update and upgrade workflows (Intel, local authenticated, and MDM authenticated) should successfully force a restart.
- Improved notifications for the macOS upgrade via MDM workflow now show restart estimates more often and also warn the user before they are forcibly logged out before restarting.
- If needed, erase-install.sh is automatically updated to [version 27.3](https://github.com/grahampugh/erase-install/releases/tag/v27.3). For compatibility with older systems, `super` continues to use versions of erase-install.sh prior to version 28.
- Resolved issues that caused download workflows to fail when only a single recommended (non-macOS) update was available.
- Resolved an issue that prevented `super` from downlading the latest macOS upgrade installer. Now the latest version is calculated via the macOS installer build number.
- Resolved an issue that prevented `super` from completing the gatekeeper validation for the macOS upgrade installer. This was making macOS upgrades take longer than they should.
- Improved `--test-mode` behavior.
- As always, countless logging refinements.
- Updated Jamf Pro [extension attribute script](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-Installed-Version-Jamf-Pro-EA.sh) now collects older versions of `super` as well. (Thanks to @wakco for this one!)
- Updated [example MDM profiles for `super` 3.0b7](https://github.com/Macjutsu/super/tree/main/Example-MDM).
- `super` 3.0b7 SHA-256: 23c6402379154f249d8ff6e1182bf500960fb118bdf16b4ccb01d6df26a91e85

## [3.0b6]

2023-01-05

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New support for macOS updates/upgrades when a system is enrolled in a beta seed program, as such `super` now properly detects and installs available macOS betas.
- All logs now show the version of `super` that is running.
- New Jamf Pro [extension attribute script](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-Installed-Version-Jamf-Pro-EA.sh) collects the currently installed `super` version.
- macOS upgrade installers are now always downloaded and validated via specific build number (as opposed to version number).
- Resolved an issue that prevented software updates from downloading on macOS 12.0 - 12.2.
- Resolved an issue that prevented update/upgrade version numbers from displaying for MDM workflow dialogs on macOS 12.3 or nerwer.
- Improved failure detection, some logging refinements, and fixed a few typos for good measure.
- Updated `super` [removal script](https://github.com/Macjutsu/super/blob/main/Super-Friends/Remove-super.sh) now removes erase-install items and any update credentials previously saved by `super`.
- `super` 3.0b6 SHA-256: b7bae8e206e6af5b3368a032853926830914a1ee9f6b66cc5e46b60b26d19cd3

## [3.0b5]

2022-12-22

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- Dialog and Notification title bars now show the macOS update/upgrade version. For example, "macOS 13.1 Upgrade Requires Restart".
- Re-organized (yet again) the macOS upgrade list workflow to better accommodate macOS 12.3 or newer systems, as such...
- All macOS 12.3 or newer Intel computers and Apple Silicon computers using a local authentication workflow now always upgrade macOS via the much faster `softwareupdate` workflow. However...
- All Apple Silicon computers using Jamf Pro API authentication now always upgrade macOS via the traditional installer workflow. (This is due to a limitation in the macOS MDM upgrade workflow, not in Jamf Pro or `super`.)
- All Intel computers now ignore the MDM update/upgrade workflow as it provides no benefit over standard local system (root) authentication.
- Resolved software update list cache validation issues on macOS 13.x.
- Resolved software update download issue on macOS 13.x. (Huge thanks to @PicoMitchell for helping with this one!)
- A variety of logging and timeout improvements including live macOS installer download progress status when watching `super` via command line.
- `super` 3.0b5 SHA-256: 84023c8ccff2f22e5000fd35588935e5923b236cfc982b4686bc750f7908c2fc

## [3.0b4]

2022-12-12

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New `--allow-upgrade` option can automatically enforce all contemporary macOS upgrade workflows from macOS 10.14 (older macOS versions may work but are not tested) to macOS 13.x. This includes support for Intel, Apple Silicon via local authentication, Apple Silicon via Jamf Pro API authentication, and Apple Silicon user request (similar to Nudge).
- New `--target-upgrade=version` option allows you to specify a major macOS version (11, 12, or 13) as the maximum allowed macOS upgrade.
- The previously introduced `--push-major-upgrade` option has been removed as it's no longer necessary because `super` automatically selects the most appropriate upgrade workflow.
- New support for the "softwareupdate-based" upgrade workflow from macOS 12.3 or newer to macOS 13.x. This upgrade workflow is much faster than traditional macOS installation-based upgrades.
- New automatic installation of [erase-install.sh](https://github.com/grahampugh/erase-install) to facilitate downloading the full system installer that is required for upgrading older macOS versions.
- To reliably support all macOS upgrade workflows, the minimum supported version of Jamf Pro is now 10.38 or newer.
- Completely re-written download workflow always downloads the appropriate macOS update or upgrade locally (no more failed MDM downloads!) before prompting the user to restart.
- Significantly improved download validation and caching mechanisms further enhance download reliability and performance.
- All recommended (non-macOS) software updates now install immediately after the system is restarted. This is to avoid interrupting the user (when updating things like Safari) and to avoid unnecessary installations if performing a macOS upgrade.
- Boolean options (on/off) can now be specified using a more uniform "on" or "off" in the option's name. For example, test mode can now be enabled with the original `--test-mode` or the new `--test-mode-on` and toggled off with the original `--no-test-mode` or the new `--test-mode-off`.
- For macOS 13 or newer, there is now a [Managed Login Item Configuration Profile](https://github.com/Macjutsu/super/blob/main/Example-MDM/Managed-Login-Item.mobileconfig) example for use when deploying `super` to managed systems.
- The logs maintained by `super` have (once again) been renamed to facilitate the new update/upgrade workflows. As always, the log descriptions and locations can be found in the internal `setDefaults()` function.
- Significantly improved logging now identifies more failure modes and also includes live macOS update/upgrade download progress status when watching `super` via command line.
- Countless log text changes, comment text clarification, and internal object renaming to facilitate new update/upgrade workflows.
- It's no longer necessary to specify the `--skip-updates-on` option with the `--policy-triggers` option to run Jamf Pro Policies when there are no macOS updates/upgrades available.
- `super` 3.0b4 SHA-256: 4e62e721266ccb4e93fad48c9e928f3a29eb2ab62e10a83950a7728a59863fb6

## [3.0b3]

2022-11-03

- New timeouts for each distinct update phase. These timeouts can be customized in the `setDefaults()` function of the script; `checkTimeoutSECONDS=120`, `recommendedTimeoutSECONDS=300`, `mdmTimeoutSECONDS=120`, `downloadTimeoutSECONDS=120`, `prepareTimeoutSECONDS=600`, `applyTimeoutSECONDS=60`, and `asuTimeoutSECONDS=300`.
- Optimizations to the major system upgrade detection that improve reliability and performance.
- Fixed issues that prevented the post-restart validation workflow from running and completing after installing a minor system update via `softwareupdate`.
- A wide variety of general and `--verbose-mode` logging improvements.
- `super` 3.0b3 SHA-256: e845729d8227d5c71e25971464e99ad477aaca7f1b6970fec6aeb05c4beb6948

## [3.0b2]

2022-10-22

- Renamed the option to prefer `jamfHelper` dialogs and notifications to `--prefer-jamf-helper`. Likewise, the managed preference key has also been renamed to `PreferJamfHelper`.
- Resolved issue with invalid logging function reference (Thanks to @iDrewbs!)
- The `<key>PushMajorUpgrade</key>` is now in the All Options config profile examples.
- `super` 3.0b2 SHA-256: a840e6dfeca4ece84b79969e41f2c077fc671f5c71893a23d65030a5c1c77f9c

## [3.0b1]

2022-10-21

- New support for macOS Ventura 13.
- New `--push-major-upgrade` option (macOS 11.5 or newer and managed by Jamf Pro) attempts to perform a major macOS upgrade via MDM command.
- New "Software Update Failed" notification when for when things go wrong after the user has already been notified to expect a restart... keep reading for further explanation...
- New `SuperStauts` key in the `/Library/Management/super/com.macjutsu.super.plist` maintains the current status of `super`. This allows for easy querying of the genreral `super` status without viewing the entire `super.log`. Here is a [Jamf Pro Extension Attribute script](https://github.com/Macjutsu/super/blob/3.0b1/Super-Friends/super-Status-Jamf-Pro-EA.sh) to collect this when inventory is updated.
- New `SuperPending` key in the `/Library/Management/super/com.macjutsu.super.plist` maintains the pending restart date of `super`. This allows for easy querying of the genreral `super` pending restart date without viewing the entire `super.log`. Here is a [Jamf Pro Extension Attribute script](https://github.com/Macjutsu/super/blob/3.0b1/Super-Friends/super-Pending-Date-Jamf-Pro-EA.sh) to collect this when inventory is updated.
- New `super` [removal script](https://github.com/Macjutsu/super/blob/3.0b1/Super-Friends/Remove-super.sh) stops any active `super` instance, super helpers, and removes all `super` items (excluding helpers).
- New local log `/Library/Management/super/check.log` maintains the last `softwareupdate` check results.
- New local log `/Library/Management/super/asu.log` keeps a history of `softwareupdate` download and installation attempts.
- Significant internal rearchitecting to support major macOS upgrades **(more upgrade workflows coming soon including full installer options)**.
- Significant internal rearchitecting to accommodate update/upgrade workflows that hang. Specifically, if any update/upgrade times out after 600 seconds of inactivity, `super` automatically tries again later. (Thanks to @scriptingosx and #scripting on MacAdmins Slack!)
- Significant internal rearchitecting to harden `super` against run-time errors. Specifically, `super` only exits due to errors during the initial installation and startup. After installation and startup is complete, if any error occurs, `super` automatically restarts later, even if the system is unexpectedly restarted.
- Rebuilt initial installation and startup workflow reports all exit errors to the `super` parent process (Terminal, Jamf Pro, etc.). 
- Rebuilt initial installation and startup workflow only installs dependencies when required. For example, the `--prefer-jamf` option prevents the automatic installation of [IBM Notifier](https://github.com/IBM/mac-ibm-notifications).
- Rebuilt update/upgrade checking workflow is instantaneous if a check has already occurred in the last 6 hours (the default for the built-in automatic `softwareupdate` check). (Thanks to @grahampugh for this suggestion!)
- Rebuilt update/upgrade checking workflow times out after 120 seconds of inactivity, in which case `super` automatically tries again later.
- Misbehaving `softwareudated` processes are automatically punished with a "kickstart" restart.
- Improvements to `--verbose-mode` now shows more detail including (when appropriate) the active script function name.
- Improvements to `--reset-super` now resets cached update results and all deferral counters.
- Improvements to `--test-mode` now properly resets deferral counters.
- Reliability improvements to the Jamf Pro API token request workflow.
- Various improvements to general logging including new details regarding system architecture, version, and expected update/upgrade workflows.
- Various improvements to script commenting including new mark directives that appear in supported code editors. (Thanks to @scriptingosx for inspiration.)
- Starting with `super` 3.0b1 checksums are provided with each release...
- `super` 3.0b1 SHA-256: e1b16ed4dd307fa4a19cf987bddd2010dee0ec2cdd33acd25d2b4320507f2136

## [2.0]

2022-09-02

- The [S.U.P.E.R.M.A.N. Wiki](https://github.com/Macjutsu/super/wiki) is finally helpful!
- Detailed help removed from within the `super` script, because...
- If there is a current GUI user the `--help` option now automatically opens the [S.U.P.E.R.M.A.N. Wiki](https://github.com/Macjutsu/super/wiki). If there is no current GUI user this option shows basic usage.
- Spellcheck! So. Many. Typos.

## [2.0rc1]

2022-08-23

- Validated against the late August 2022 Apple Security Updates.
- The Jamf Pro API token is now invalidated when `super` exits (previously it was only deleted from local memory).
- You can now set custom dialog timeout text for both the "Ask for Update" and "Soft Deadline" dialogs in the `setDisplayLanguage()` function.
- IBM Notifier [Version 2.8.0 Build 87](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-2.8.0-b-87) is automatically downloaded and installed in the $superFOLDER.
- Resolved an issue where deleting account credentials did not set the appropriate update workflow.

## [2.0b2]

2022-08-01

- Re-arranged the main workflow so that if there is no current user then the system update is attempted immediately, thus skipping the pre-download functions. This prevents an issue where in some cases `softwareupdate` was re-downloading the system update.
- Significant rewrite of the `softwarupdate` workflows to fully support macOS 11 and newer on both Intel and Apple Silicon computers. The previous "macOS Monterey Notification Fix" is no longer necessary. (Huge thanks to @StephenGrall for help on this!)
- The MDM update workflow via Jamf Pro is now supported on both Intel and Apple Silicon computers running macOS 11.5 and newer.
- Credentials for the MDM update workflow via Jamf Pro are now validated and saved on all versions of macOS, thus allowing for use of the MDM update workflow once the system has reached macOS 11.5 or newer.
- Updated the `checkCurrentUser()` function with more resilient code that now also collects the current UID.
- Resolved an issue when validating the maximum seconds for the `--recheck-defer` option.

## [2.0b1]

2022-06-16

- There are so many new features in `super` 2.x that any existing scripts, Configuration Profiles, or other workflows designed for `super` 1.x are not compatible with `super` 2.x. Please review `sudo super --help` in addition to this change log!
- All option flags with a variable value now require the use of equals ( = ). For example, `--default-defer=3600`. However, quoting is no longer required for option variables (unless they use a reserved character like "space").
- When running `super` via Jamf Pro Policy, you can now use script Parameter Values for configuration. However, you can only use one option per Parameter Value, so you are limited to a total of 8 options with this method. Obviously, you should consider using a [Configuration Profile](https://github.com/Macjutsu/super/blob/main/All_Managed_Options_com.macjutsu.super.plist) for setting more options.
- New `--recheck-defer=seconds` option allows `super` to re-run on a regular basis even when no Apple software updates are found. Thus, `super` "remains active" to enforce ongoing Apple software update checking.
- Significantly updated deferral mechanism now allows for all deadline types (focus, soft, and hard) for all deferral types, including...
- New `--focus-days=number`, `--soft-days=number`, and `--hard-days=number` options allow you specify a maximum number of days to defer after an Apple software update is found.
- New `--zero-day=YYYY-MM-DD:hh:mm` option allows you to specify a manual day zero instead of relying on the default automatic zero day, which is based on when new Apple system updates are available.
- Maximum deferral count and maximum deferral days deadlines can now be restarted with the `--restart-count` and `--restart-days` options.
- Multiple options of a similar type can now be deleted with a single option, this includes; `--delete-deferrals`, `--delete-counts`, `--delete-days`, `--delete-dates`, and `--delete-accounts`.
- Improved icon scaling when using the `--icon-size-ibm` option courtesy of...
- IBM Notifier [Version 2.7.1 Build 81](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-2.7.1-b-81) is automatically downloaded and installed in the $superFOLDER.
- As a default behavior, the `--policy-triggers` option now waits for restart-required system updates to become available before running any Jamf Policy Triggers. Alternately, you can combine this option with the `--skip-updates` option to run the Jamf Policy triggers without waiting for a restart-required system update.
- The `--clear-super` option is renamed to `--reset-super` and also includes improved logging.
- Improved behavior for the `--open-logs` option.
- All notification and dialog text strings are now consolidated into a single, easier to customize, `setDisplayLanguage()` function.
- MDM workflow parsing updates should improve detection of MDM download and install progress.
- A lot of documentation improvements and internal refactoring to align with new features and renamed options.

## [1.1.1]

2022-05-25

- No code changes in `super` script.
- [Significant macOS Monterey requirement changes](https://github.com/Macjutsu/super#requirements) to work around `softwareupdate` workflows that are hanging during system update downloads. Please see the "macOS Monterey Notification Fix Requirement" section. ([#11](https://github.com/Macjutsu/super/pull/11), thanks to @KMudedla).

## [1.1]

2022-05-20

- Resolved missing code that prevented the `PreferJamf` managed preference key from being respected.
- The `--prefer-jamf` option now results in an exit error if run from a computer with no Jamf binary.

## [1.1b2]

2022-05-16

- When used with Jamf Pro 10.38 or newer, all MDM software update commands now use the Jamf Pro API (as opposed to the Classic API).
- When used with Jamf Pro 10.38 or newer, system updates via MDM now forces a restart by killing any apps that don't quit when requested.
- More reliable logging when downloading and preparing updates via MDM.
- The `--verbose-mode` option now shows the percentage complete when downloading and preparing updates via MDM.
- The `--policy-triggers` option now detects when Jamf Pro Policies complete with success or failure. If all Jamf Pro Policies completed, then the `--policy-triggers` option is automatically cleared.
- Various code syntax changes per [ShellCheck](https://github.com/koalaman/shellcheck) recommendations.

## [1.1b1]

2022-05-10

- The super workflow now automatically installs all available non-restart required "recommended" Apple software updates on both Intel and Apple Silicon computers prior to downloading any restart required system updates. Thus, all non-restart required updates are installed before the user is prompted to restart.
- Jamf Pro inventory is now updated immediately after non-restart required "recommended" Apple software updates are automatically installed.
- The current user is now checked immediately before any prompts in case super has been running for a while (due to earlier installations or downloads).
- Re-built softwareupdate checking functions to improve reliability, logging, and allow for future improvements.
- The `--policy-triggers` option no longer requires the `--force-restart` option to take advantage of dialogs, notifications, deferrals, and deadline workflows. This allows Jamf Pro Policies to control when the computer restarts.
- The `--policy-triggers` option now requires a local Jamf binary.
- The `--force-restart` option no longer requires a local Jamf binary. Now using `shutdown -o -r +1` instead.
- The `--open-logs` option now works with older versions of macOS. However, detailed MDM and `softwareupdate` logs are still only available for macOS 11 or newer.
- Startup workflow now kills any previous IBM Notifier instance.
- Jamf Pro Policies now called via `-event` instead of legacy `-trigger` ([#5](https://github.com/Macjutsu/super/pull/5), thanks to @kenchan0130).
- Resolved text encoding issue causing "?" to appear in notifications and dialogs ([#6](https://github.com/Macjutsu/super/pull/6), thanks to @kenchan0130).

## [1.0rc1]

2022-03-14

- Jamf Pro no longer required for `softwareupdate` workflows.
- Initial commits to GitHub including Apache 2.0 LICENSE and CHANGELOG.md.
- Introductory comments moved to README.md.
- Example managed preference file com.macjutsu.super.plist

## [1.0b]

2022-03-09

 - [IBM Notifier](https://github.com/IBM/mac-ibm-notifications) is automatically downloaded and installed in the $superFOLDER.
 - [IBM Notifier](https://github.com/IBM/mac-ibm-notifications) is default for all user interactions, but if IBM Notifier.app can't be downloaded or is invalid then super falls back to `jamfHelper`.
 - Ability to specify custom icon size when using [IBM Notifier](https://github.com/IBM/mac-ibm-notifications) via `--icon-size-ibm pixels` option and managed preference: `<key>IconSizeIbm</key> <string>number</string>`
 - Ability to specify custom icon size when using `jamfHelper` via `--icon-size-jamf pixels` option and managed preference: `<key>IconSizeJamf</key> <string>number</string>`
 - Ability to prefer `jamfHelper` over [IBM Notifier](https://github.com/IBM/mac-ibm-notifications) via `--prefer-jamf | --no-prefer-jamf` options and managed preference: `<key>PreferJamf</key> <true/> | <false/>`
 - Deferral times all normalized to between 120 seconds and 86400 seconds (1 day).
 - Bug fixes and improvements for display redraw, display timeout, and test mode options.
 - Logging and verbose mode improvements.

## [0.9]

2022-02-28

- Initial private release.
