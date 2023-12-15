# CHANGELOG

## [4.0.3]

2023-12-14

### Highlights

- New option to save the user's password for future automatic macOS updates and upgrades. Literally, "Save Password" but for automatic macOS updates and upgrades.
- New display customization options including unmovable dialogs and hide background mode courtesy of [IBM Notifier 3.x](https://github.com/IBM/mac-ibm-notifications).
- New macOS installer workflows are now handled by [`mist-cli`](https://github.com/ninxsoft/mist-cli) integration, thus removing all `python` dependencies.
- New LaunchDaemon architecture significantly improves automatic launch and deferment reliability for all `super` workflows.
- New default "always on" behavior automatically checks for Apple software updates on a regular basis.
- Support for Jamf Pro 10.48+ [(Beta) Managed Software Updates](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Updating_macOS_Groups_Using_Beta_Managed_Software_Updates.html).
- Support for Jamf Pro 10.49+ [API Roles and Clients](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/API_Roles_and_Clients.html).
- Please check out the [updated `super` Wiki](https://github.com/Macjutsu/super/wiki) for more details!

### Compatibility Notes

- `super` 4.x requires macOS 11 or newer (all code supporting macOS 10.x has been removed).
- All `super` 4.x code has been refactored for [style](https://google.github.io/styleguide/shellguide.html), clarity, and uniformity. __As such nearly every single option name has been changed.__
- __Most `super` 3.0 command line options and managed preferences are not compatible with `super` 4.x__
- __Previously saved `super` 3.0 Apple silicon authentication credentials are automatically migrated the first time `super` 4.x runs.__
- It is safe to mix `super` version 3.0 and 4.x managed preferences (except for the DisplaySilently key) in a single configuration profile. However each version only recognizes the managed preference keys that are compatible for that version.
- Refer to this [spreadsheet (tab separated values) for migrating `super` 3.0 command line options to version 4.x](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-3to4-migration-options.tsv).
- Refer to this [spreadsheet (tab separated values) for migrating `super` 3.0 managed preferences to version 4.x](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-3to4-migration-managed-preferences.tsv).
- Updated [Jamf Pro Extension Attribute scripts](https://github.com/Macjutsu/super/blob/main/Super-Friends/) now supports both `super` versions 3.0 and 4.x.
- Updated [example MDM configuration profiles for `super` v4.x](https://github.com/Macjutsu/super/tree/main/Example-MDM).

### Known Issues

- The Jamf Pro [(Beta) Managed Software Updates](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Updating_macOS_Groups_Using_Beta_Managed_Software_Updates.html) workflow is not compatible with the `--install-macos-major-version-target` option. Until this issue is resolved you can revert your Jamf Pro service back to the current macOS software update workflow.

### Specific Changes (4.0.3)

- New [IBM Notifier 3.1.0](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-3.1.0-b-110) is automatically installed. (Thanks to @SMartorelli for his dedication to the project!)
- Improved IBM Notifier behavior no longer clips the end of line wrapped text.
- Improved IBM Notifier behavior now fully ignores the Command-Q keyboard shortcut. Previously `super` had to restart IBM Notifier when a user quit with the Command-Q keyboard shortcut.
- Resolved a workflow issue that could prevent the restart validation workflow from installing non-system updates.
- Resolved an issue preventing accurate reporting of the current macOS version.
- Resolved an issue where macOS installers on any non-system volume were being accidentally deleted.
- `super` 4.0.3 SHA-256: 2c7411a4bfa84a63e20955d18d6c6ba19933b2cf35b04f91bbcac98c666e335c

### Specific Changes (4.0.2)

- Improved `--open-logs` option behavior now opens all possible `super` logs.
- Improved Apple silicon authentication options behavior when there is no actively logged in user. In most cases, if user authentication is required but there is no active user, the `super` workflow automatically tries again later.
- New error detection for the combination of the Jamf Pro [(Beta) Managed Software Updates](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Updating_macOS_Groups_Using_Beta_Managed_Software_Updates.html) workflow with the `--install-macos-major-version-target` option.
- Improved non-system updates workflow has better handling of errors and user notifications.
- Resolved issues causing inaccurate log file size estimates and recursively larger log archives. This recursion issue was exacerbated by prolonged use of the `--verbose-mode` option, as such the [`super` Wiki has also been updated](https://github.com/Macjutsu/super/wiki/Troubleshooting#use-super-verbose-mode).
- New failsafe log archive mechanism automatically removes any files larger than 10000 KB (10 MB) in the log archive folder. Given that the `super` logs are automatically archived once any individual log reaches just 1000 KB (1 MB), no compressed log archive should ever reach 10 MB.
- Resolved an issue causing erroneous text in the current user's "real name".
- Fixed various typos and improved a few log reporting behaviors.
- New Jamf Pro API testing scripts in the [Super Friends folder](https://github.com/Macjutsu/super/tree/main/Super-Friends): Create-MDM-Logs.sh, Create-MDM-Update-Jamf-API-Latest.sh, and Create-MDM-Update-Jamf-API-Version.sh
- `super` 4.0.2 SHA-256: a3568c093bd220a642c1bd9f51f8bf98d474b9e57a6f827fb7733d3dde2dbf6b

### Specific Changes (4.0.1)

- New super.log behavior, if there is a current active user then the UID is now also shown in the log.
- Reduced the minium storage space required for a macOS major upgrade to 25 GB plus the size of the download (previously it was 35 GB plus the size of the download).
- Resolved a regression issue that wasn't installing the latest version of [IBM Notifier 3.0.3](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-3.0.3-b-108).
- Resolved an issue preventing reliable detection of a system currently at the login window, thus causing download workflow errors.
- Resolved an issue preventing the successful installation of macOS updates when there is no current active user.
- Resolved an issue where some `softwareupdate` errors were not being reported accurately.
- Resolved an issue where some authentication log entries were not being reported. (Thanks to @blakeusblade for finding this one!)
- Fixed a small typo in a Jamf Pro API call. (Thanks to @master-vodawagner for finding this one!)
- `super` 4.0.1 SHA-256: 49de57115dc6c280e30edc20023c4376f9a52da99fba44610f055a0cd51164dd

### Specific Changes (4.0.0)

- Resolved an issue where the `--display-unmovable` option was preventing IBM Notifier dialogs from appearing on top of other windows or in the correct location on the screen. (Thanks to @SMartorelli for the workaround!)
- Resolved an issue preventing the Jamf Pro [(Beta) Managed Software Update API](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Updating_macOS_Groups_Using_Beta_Managed_Software_Updates.html) from installing macOS beta updates and upgrades.
- Resolved an issue where an apostrophe in a user's "real name" was causing `super` to error.
- Resolved an issue where setting the `--workflow-jamf-policy-triggers` was unintentionally running the dialog workflows again.
- Improved logging when using the `--auth-ask-user-to-save-password` option.
- Fixed typos.
- [The main `super` Wiki has also been updated to v4.0.0](https://github.com/Macjutsu/super/wiki).
- `super` 4.0.0 SHA-256: fc82babefa316afeaf6507b1babae0f7fb6f499c0e0b1d3dedecd3fa53f16eb2

### Specific Changes (4.0.0-rc1)

- Resolved a workflow issue where macOS 12.3-12.x systems are no longer able to leverage `softwareupdate` when targeting major upgrades to macOS 13. This workflow now uses the full macOS installer.
- Resolved an issue were the `--auth-mdm-failover-to-user=ALWAYS` option was not failing over to user authentication.
- `super` 4.0.0-rc1 SHA-256: 6eeff90acf6589b07c6f66a46f125f4b4faed7b7c84dccbb336bc6e1e8c2a4c3

### Specific Changes (4.0.0-beta7)

- Resolved (third time's a charm?) issues preventing the last startup date collection from working properly. (Thanks to @ofirgalcon for testing this time!)
- `super` 4.0.0-beta7 SHA-256: fa3cc35a0224169128b5388fec1c2d09f3627597dd569bcc8e928e8966e0f242

### Specific Changes (4.0.0-beta6)

- Resolved issues preventing the last startup date collection from working properly. (Thanks to Michael Z on on MacAdmins Slack for helping on this one!)
- `super` 4.0.0-beta6 SHA-256: a57710bb200e7bd702be87019b87675c8f1afefcabc284eeff63a966eeaf79ba

### Specific Changes (4.0.0-beta5)

- New automatic archival of active `super` logs to the "logs-archive" folder if any individual `super` log file grows larger than 1000 KB in size. This new default behavior can be modified by manually editing parameters in the `set_defaults()` function.
- New automatic archival of any legacy `super` logs to the "logs-archive" folder.
- New deadline behavior, users are no longer allowed to chose a deferral past a days or date deadline. If a deadline is sooner than any user deferral option then the deferral times are reduced to match the closest deadline.
- New deadline behavior, if a deadline is soon then any dialog timeout option times above 120 seconds (2 minutes) are reduced to 120 seconds.
- New deadline behavior, if the `super` workflow is running within 120 seconds of a deadline, it waits for the deadline to expire instead of offering any deferral.
- The new `--display-notifications-centered` option shows non-interactive notifications in the center of the screen (as opposed to the top right) via the following types:
	- ALWAYS - Always show non-interactive notifications in the center of the screen.
	- SOFT - Show non-interactive notifications in the center of the screen during a soft deadline.
	- HARD - Show non-interactive notifications in the center of the screen during a soft deadline.
	- INSTALLNOW - Show non-interactive notifications in the center of the screen during the install now workflow.
- New support for local user account names if they have spaces. (Thanks to Emmanuel Ergand on on MacAdmins Slack for testing this one!)
- New automatic error deferral when the "only download" workflow is enabled, but there is no active user. This is necessary because `softwareupdate` is unable to "only" download macOS updates (but it can fully install them) if there is no active user.
- Rearchitected last startup date collection to support multiple time formats. (Thanks to @ofirgalcon for helping with this one!)
- Rearchitected Jamf Pro version detection to provide more accurate version numbers.
- Resolved several issues preventing the user's password from being saved or retrieved from Keychain.
- Resolved issues preventing the [super-Deadline-Counter-Soft-Jamf-Pro-EA.sh](https://github.com/Macjutsu/super/blob/4.0.0-beta5/Super-Friends/super-Deadline-Counter-Soft-Jamf-Pro-EA.sh) script from working properly.
- `super` 4.0.0-beta5 SHA-256: ffd6e599a399109e9d2d881ef9f92ffdd96bb6c1bc8d8c80b267f28282f73079

### Specific Changes (4.0.0-beta4)

- First draft of the [new `super` v4.0.0-beta Wiki](https://github.com/Macjutsu/super-beta-wiki/wiki)! Please note that this Wiki itself is also a "beta", so expect updates and corrections.
- Rearchitected Jamf Pro API calls to specify the exact macOS update or upgrade version. This change avoids Jamf Pro/macOS product issues that are known to unintentionally upgrade macOS even when an update was requested.
- Rearchitected automatic zero day now also saves the target macOS version along with the zero day date. This prevents the zero day date from unintentionally reseting when the available update caches are rechecked.
- Rearchitected the insufficient storage and power required alerts as dialogs (previously used notification functions). This resolved several issues preventing those dialogs from respecting display timeouts.
- Updated insufficient storage and power required alerts now support optional display customizations including the dialog timeout countdown, the help button, and the warning button.
- Resolved (no really this time?) a permissions issue preventing display of the custom display icon cache. (Thanks to @master-vodawagner for helping with this one.)
- Resolved an issue that prevented `super` from saving the user password to the keychain when a standard (non-admin) user was active.
- Fixed a few typos and improved variable logging.
- `super` 4.0.0-beta4 SHA-256: 574fb4822211e1efc136629310ffec89b14a4a5d7dc1477e4dd1e61ce4e3050c

### Specific Changes (4.0.0-beta3)

- New automatic installation of [`mist-cli` version 2.0](https://github.com/ninxsoft/mist-cli) if required to facilitate macOS installer workflows. (Huge shout out to @ninxsoft)
- If the `--auth-delete-all` option is used with other authentication options the `--auth-delete-all` option takes priority and no longer allows for other credential options.
- Further refinements to the saved user authentication workflow.
- Resolved an issue where previously saved authentication credentials were being unintentionally deleted.
- `super` 4.0.0-beta3 SHA-256: fca929a284893e6019f337acc2993a8b254490981920a8afcb56c69b40b3d399

### Specific Changes (4.0.0-beta2)

- New startup behavior now waits for the `loginwindow` process before continuing. This reduces `softwareupdate` errors during the restart validation workflow.
- Further refinements of the `--auth-ask-user-to-save-password` workflow including that the local account name is no longer stored in the `super` preference file.
- Resolved an issue preventing the identification of last startup date on macOS 14.
- Resolved an issue preventing user authentication failover if the previously saved user password was invalid.
- Resolved an issue preventing macOS major beta upgrades from being properly discovered.
- Resolved an issue causing calculation errors in macOS minor update required installation size.
- Resolved an issue that caused repeated download attempts of macOS major upgrades.
- Resolved issues causing some display behavior options (`--display-unmovable`, `--display-hide-background`, and `--display-silently`) from being applied when multiple dialogs or notifications are shown.
- Resolved an issue preventing the `--auth-mdm-failover-to-user` option from working. (Thanks to @croaker-1 for suggesting a fix to this one.)
- Resolved a potential permission issue preventing display of the custom display icon cache. (Thanks to @master-vodawagner for suggesting a fix to this one.)
- Updated [Jamf Pro config profile external application custom schema for `super` 4.0.0-beta2](https://github.com/Macjutsu/super/blob/4.0.0-beta2/Example-MDM/Jamf-Pro-External-Application-Custom-Schema-com.macjutsu.super-v4.0.0-beta2.json). (Thanks to @robjschroeder for updating this!)
- `super` 4.0.0-beta2 SHA-256: 40824d6425757022af8c78a9942e81c4a9c442f83c808950429efcf71afcfb2e

### Specific Changes (4.0.0-beta1)

- New `--usage` and `--help` options behavior now no longer requires `sudo`, or installs `super` items, or writes anything to the super.log, or interferes with any running `super` workflow. However, `super` still installs automatically (if needed) when using any other options.
- New default behavior if no updates/upgrades are available (or allowed), `super` now automatically checks for new updates/upgrades on a reoccurring basis. Thus, the `--recheck-defer` option has been replaced by this default behavior.
- New deferral timer behavior, all deferral timer options are now in minutes (dialog timeouts remain in seconds).
- New deferral timer behavior, all deferral timer options now allow you to specify up to 10080 minutes (1 week).
- New `--deferral-timer-workflow-relaunch=minutes` option allows you to override the default check for new updates/upgrades deferral interval time of six hours (360 minutes).
- New `--workflow-disable-relaunch` option prevents `super` from checking for new updates/upgrades on a reoccurring basis.
- New `--auth-ask-user-to-save-password` option to save the user's password to the user's keychain after a succesfull user authentication dialog.
- New `--auth-credential-failover-to-user` option enables fail over to user authentication if any new or previously saved authentication option fails. (The `--auth-mdm-failover-to-user` option remains as is still used to facilitate failover specific to MDM workflows.)
- New saved authentication behavior, only one authentication option can be active at any given time. If multiple authentication options have been specified the priority order is; `--auth-ask-user-to-save-password` > `--auth-local-account` > `--auth-service-add-via-admin-account` > `--auth-jamf-client` > `--auth-jamf-account`
- New Apple silicon credential storage mechanism now encodes all keychain items as base64. This allows for storing unicode text strings and further obfuscates the authentication credentials.
- New Apple silicon credential storage mechanism now also stores all saved administrator credential "account names" in the system keychain. The "account names" were previously stored in the `super` preference file.
- Previously saved `super` 3 Apple silicon authentication credentials are automatically migrated to this new storage mechanism the first time `super` 4 runs.
- New support for Jamf Pro 10.48+ [(Beta) Managed Software Updates API](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Updating_macOS_Groups_Using_Beta_Managed_Software_Updates.html). `super` automatically detects if this feature is enabled on your Jamf Pro server
- New permisions requirements for the [(Beta) Managed Software Updates API](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Updating_macOS_Groups_Using_Beta_Managed_Software_Updates.html):
	- Jamf Pro Server Objects > Managed Software Updates > Read & Create
	- Jamf Pro Server Objects > Computers > Read
	- Jamf Pro Server Objects > Mobile Devices > Read
	- Jamf Pro Server Actions > Send Computer Remote Command to Download and Install macOS Update
	- Jamf Pro Server Actions > Send Mobile Device Remote Command to Download and Install iOS Update
- New support for Jamf Pro 10.49+ [API roles and clients authentication](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/API_Roles_and_Clients.html). The new `--auth-jamf-client=ClientID` and `--auth-jamf-secret=ClientSecret` options allow you to specify credentials for this new authentication mechanism.
- New Jamf Pro API computer ID discovery method leverages the Jamf binary if no Jamf Pro ID is provided via [`super` MDM configuration profile](https://github.com/Macjutsu/super/blob/main/Example-MDM/Jamf-Pro-ID-Only-Example-com.macjutsu.super.plist). (The Jamf Pro API privilege for "Computers Read" is no longer used to resolve the Jamf Pro ID.)
- New `--jamf-custom-url=URL` option allows you to override the default Jamf Pro management URL for a custom Jamf Pro API URL.
- New [IBM Notifier 3.0.3](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-3.0.3-b-108) is automatically installed.
- New dialog and notification behavior now automatically re-opens if the user attempts to quit via Command-Q keyboard shortcut.
- Updated `--display-silently` option now allows for selectable display type behavior, see below for the available types.
- New `--display-unmovable` option prevents the user from moving dialogs and notifications. Thus, the `--display-redraw` option has been removed.
- New `--display-hide-background` option hides (via translucent blur) the background when displaying dialogs and notifications.
- The new `--display-silently`, `--display-hide-background`, `--display-hide-background` options modify display behavior via the following types:
	- ALWAYS - Modify display behavior for all dialogs and notifications.
	- SOFT - Modify display behavior for Dialogs and notifications during a soft deadline.
	- HARD - Modify display behavior for Dialogs and notifications during a soft deadline.
	- INSTALLNOW - Modify display behavior for Dialogs and notifications during the install now workflow.
	- DEFER - Modify display behavior for the defer or restart dialog.
	- USERAUTH - Modify display behavior for the user authentication dialog.
	- POWER - Modify display behavior for the power required notification.
	- STORAGE - Modify display behavior for the insufficient storage notification.
- New default behavior, no `super` dialog ever times out unless you use the `--dialog-timeout-default=seconds` option. This option sets the default timeout for any dialog that doesn't have a specific timeout setting.
- New individual dialog timeout options now includes the following options:
	- `--dialog-timeout-restart-or-defer=seconds`
	- `--dialog-timeout-soft-deadline=seconds`
	- `--dialog-timeout-user-auth=seconds`
	- `--dialog-timeout-insufficient-storage=seconds`
	- `--dialog-timeout-power-required=seconds`
- The user authentication dialog now shows the dialog timeout countdown (only when no custom display accessory is enabled).
- New (renamed) `--workflow-install-now` option behavior now works when there is no active users.
- New (renamed) `--workflow-install-now` option behavior is now a temporary option that is not saved for future runs of `super`. As such the `InstallNow` managed preference has been removed.
- New rearchitected macOS installer workflows leverage `mist-cli` instead of `erase-install.sh` for installer listings and downloads. (Thanks for your service @grahampugh)
- New automatic installation of [`mist-cli` version 1.15](https://github.com/ninxsoft/mist-cli) if required to facilitate macOS installer workflows. (Huge shout out to @ninxsoft)
- New internal mechanisms to validate downloaded macOS installers. (Thanks to @grahampugh code inspiration!)
- Upgrade workflows using the macOS installer now use more accurate storage space requirements courtesy of `mist-cli` (previously this was statically set to 13GB for all macOS installers).
- Systems with macOS 13 and newer no longer check for macOS installers (as they should be able to perform a macOS major upgrade via `softwareupdate` for all workflows).
- `jamfHelper` is no loger supported, as such the following options have been removed: `--icon-size-jamf=pixels` `--prefer-jamf-helper` `--prefer-jamf-helper-off`
- `jamfHelper` is no longer a display option (all code supporting jamfHelper has been removed). Thus, the `--icon-size-jamf` and `--prefer-jamf-helper` options have been removed.
- The default battery level required percentage for Mac computers with Apple Silicon is now 20% (Intel remains at 50%).
- Improved `--reset-super` clears local preferences for all versions of `super` including legacy preferences.
- Improved temporary file methods for helper installation are now more secure. (Thanks to @giantwombat and @paragonsec for recommending this one!)
- All `super` logs are now stored in the "logs" folder inside the `super` working folder. At this time legacy `super` logs are not moved to this new location.
- Removed python dependency for Jamf Pro API token extraction. (Thanks to @jelockwood for this one!)
- Resolved an issue where MacBook computers with M2 chips were not being properly identified as portables.
- Resolved an issue where the patch version number (11.7.10 <- this last number) of macOS minor updates were not being properly identified.
- Countless improvements to both regular and verbose log output.
- `super` 4.0.0-beta1 SHA-256: f179ef824b128510f8867388d6d0252044cd2b4b36036181293a7601873c9ee3

## [3.0]

2023-06-01
- New reporting of Jamf Pro version number in super.log, if computer is managed by Jamf Pro. (Thanks to @wacko for recommending this one!)
- New [Jamf Pro External Application Custom Schema for MDM Configuration Profiles](https://github.com/Macjutsu/super/blob/main/Example-MDM/Jamf-Pro-External-Application-Custom-Schema-com.macjutsu.super-v3.json) courtesy of @wacko and @theadamcraig!
- Improved verbose mode now shows the saved `super` settings (com.macjutsu.super.plist) on exit.
- Resolved an issuing causing the cached macOS upgrade status to fail which also lead to inadvertently deleting macOS installers. (Thanks to multiple folks in #super on MacAdmins Slack for spotting this one!)
- Resolved an issue where, in verbose mode only, the local user authentication dialog was erroneously sending the user's password to the super.log. Now, similar to other password displays in verbose mode, it's only sent to command line output. (Thanks to Lewis B in #super on MacAdmins Slack for finding this one!)
- Fixed. So. Many. Typos.
- `super` 3.0 SHA-256: ac297dd3f5496a20648e35b73313ccddd8843a75cc95c9dadb9d900a60b8edd8

## [3.0rc2]

2023-05-30

- [The Wiki has finally been updated with a first draft for `super` version 3!](https://github.com/Macjutsu/super/wiki)
- Added a bit of additional verbose mode logging.
- Resolved an issue that prevented the correct number of days from showing in the soft days deadline user authentication dialog.
- Resolved an issue that was unnecessarily deleting update and upgrade cache information. (Thanks to @gzilla13 for finding this one!)
- `super` 3.0rc2 SHA-256: 8999783b7fd29e43360b167a61d7e566b0de9be89e7d5c6cca2d3bf7112a593c

## [3.0rc1]

2023-05-18

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New additional MDM failover type of `--user-auth-mdm-failover=NOSERVICE` fails over to the user authentication workflow any time the MDM service is unavailable or the API account fails to authenticate.
- Updated macOS beta program detection method for macOS 13.4 and later.
- New Jamf Pro [extension attribute script](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-Deferral-Counter-Focus-Jamf-Pro-EA.sh) collects the number of times the Focus Deadline had been deferred.
- New Jamf Pro [extension attribute script](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-Deferral-Counter-Soft-Jamf-Pro-EA.sh) collects the number of times the Soft Deadline had been deferred.
- New Jamf Pro [extension attribute script](https://github.com/Macjutsu/super/blob/main/Super-Friends/super-Deferral-Counter-Hard-Jamf-Pro-EA.sh) collects the number of times the Hard Deadline had been deferred.
- Resolved issues causing bad macOS update size calculation in non-USA regions. (Thanks to @davidjimenezm for fixing this one!)
- `super` 3.0rc1 SHA-256: 88e8b15c02bff48dcab1842092289f66eea1b38a2d470ae6361ecc71ed0fe7b3

## [3.0b12]

2023-05-04

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- Resolved an issue preventing the macOS update via MDM workflow properly starting.
- Resolved an issue causing erroneous test mode timeout warning dialogs. (Thanks to Connor Garside in #super on MacAdmins Slack for finding this one!)
- Resolved an issue where the MDM service check was too agressive. (Thanks to Julien vander Straeten in #super on MacAdmins Slack for finding this one!)
- Resolved an issue causing the script to exit due to a bad macOS update size calculation. (Thanks to David C. in #super on MacAdmins Slack for finding this one!)
- `super` 3.0b12 SHA-256: 747d9311ff411904b4a0e0cd0d17ab1ad7e4169f5c364e8e41c39751e0940dd5

## [3.0b11]

2023-05-04

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- New support for macOS 13 Rapid Security Response (RSR) updates. By (Apple) design, RSR updates still require a system restart to completely install and must also be installed separately from other macOS updates/upgrades. For example, macOS 13.3.1 must be installed before the system can install the macOS RSR 13.3.1 (a) update. However, the total workflow time for completing a RSR update is much faster than a standard macOS update.
- New `--allow-rsr-updates` option must be specified to install RSR updates, otherwise the default `super` behavior is to not install RSR updates.
- New`--display-accessory-user-auth=/local/path or URL` option can accept a local path or a web URL (this option also requires setting the `--display-accessory-type=TYPE` option). This shows specific display accessory content for the user authentication dialog.
- New bootstrap token validation for computers running macOS 13.3 or later. Earlier versions of macOS can only report if the bootstrap token was previously escrowed but unfortunately there is no local method to determine if the escrowed token is still valid.
- Renamed `--enforce-non-system-updates` option replaces the `--enforce-all-updates` option. This is only a name change to improve clarity of the feature.
- Renamed `--defer-dialog-timeout=seconds` option replaces the `--defer-display-timeout=seconds` option. This is only a name change to improve clarity of the feature.
- Renamed `--soft-dialog-timeout=seconds` option replaces the `--soft-display-timeout=seconds` option. This is only a name change to improve clarity of the feature.
- Renamed `--restart-without-updates` option replaces the `--force-restart` option. This is only a name change to improve clarity of the feature.
- Updated MDM workflow is now more reliable when used with newer versions of Jamf Pro.
- Updated [Generate-MDM-Update-Jamf-API.sh](https://github.com/Macjutsu/super/blob/main/Super-Friends/Create-MDM-Update-Jamf-API.sh) script aligns with updated MDM workflow.
- Updated `--verbose-mode` option now creates two additional debug-level logs for troubleshooting the MDM workflow located at `/Library/Management/super/mdmCommandDebug.log` and `/Library/Management/super/mdmWorkflowDebug.log`.
- Updated user authentication MDM failover workflow can now prompt for credentials earlier, detect more potential MDM failures, and only attempts to escrow the bootstrap token when the MDM service is actually available.
- Updated test mode validation temporarily adjusts timeouts to improve the test mode behavior. (Thanks to Dustin Nikles in #super on MacAdmins Slack for finding this one!)
- Updated method for detecting if the Jamf binary is the parent process. (Thanks to @iDrewbs for finding this one!)
- Updated method for finding available storage space when no user is logged in. (Thanks to @gzilla13 for finding this one!)
- Resolved issues causing improper calculation of macOS update sizes in non-USA regions. (Thanks to @gzilla13 and @davidjimenezm for helping with this!)
- Resolved issues causing improper validation of dialog timeout options. (Thanks to @gzilla13 for finding this one!)
- Resolved issues preventing the Defer button from showing the correct deferment time. (Thanks to @iDrewbs for finding this one!)
- Resolved issues preventing the completion of the install non-system updates workflow.
- As always, countless logging refinements and correction of typos.
- Updated [example logs](https://github.com/Macjutsu/super/blob/main/Example-Logs). (Still more to examples to come in the future!)
- Updated [example MDM configuration profiles for `super` 3.0b11](https://github.com/Macjutsu/super/tree/main/Example-MDM).
- `super` 3.0b11 SHA-256: 7e74c463511b2962c7b984db889256a98c606219fe70af89c2d9d32981f89fd0

## [3.0b10]

2023-03-29

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- Updated `--user-auth-mdm-failover=TYPE,TYPE,TYPE` option now allows you to specify __one or more failover types separated by commas (no spaces)__ for when the macOS update/upgrade via MDM workflow fails. The supported MDM failover types have also changed slightly...
	- `--user-auth-mdm-failover=ALWAYS` fail over to the user authentication workflow any time the MDM workflow fails.
	- `--user-auth-mdm-failover=HARD` fail over to the user authentication workflow when the MDM workflow fails and a hard deadline has passed.
	- `--user-auth-mdm-failover=SOFT` fail over to the user authentication workflow when the MDM workflow fails and a soft deadline has passed.
	- `--user-auth-mdm-failover=INSTALLNOW` fail over to the user authentication workflow when the MDM workflow fails and during an install now workflow.
	- `--user-auth-mdm-failover=BOOTSTRAP` fail over to the user authentication workflow if the computer's bootstrap token has not been escrowed with the MDM service. This option also automatically repairs the bootstrap token escrow if the local user is an administrator with a secure token.
- The `--display-accessory-content=/local/path or URL` option has been replaced by multiple new display accessory content options (as before these options also require setting the `--display-accessory-type=TYPE` option)...
	- New`--display-accessory-default=/local/path or URL` option can accept a local path or a web URL. This shows the display accessory content for all macOS updates and upgrades.
	- New`--display-accessory-update=/local/path or URL` option can accept a local path or a web URL. This shows the display accessory content for only macOS updates.
	- New`--display-accessory-upgrade=/local/path or URL` option can accept a local path or a web URL. This shows the display accessory content for only macOS upgrades.
- Updated [Generate-MDM-Logs-Filtered.sh](https://github.com/Macjutsu/super/blob/main/Super-Friends/Create-MDM-Logs-Filtered.sh) script replaces `Generate-MDM-Logs.sh` and creates filtered logs similar to what `super` generates for troubleshooting MDM workflow issues.
- New [Generate-MDM-Logs-Unfiltered.sh](https://github.com/Macjutsu/super/blob/main/Super-Friends/Create-MDM-Logs-Unfiltered.sh) script creates detailed ManagedClient and softwareupdated logs for troubleshooting MDM workflow issues.
- New [Example-Logs](https://github.com/Macjutsu/super/blob/main/Example-Logs) folder contains multiple examples of successful macOS update/upgrades with different plaforms and workflows. (More to examples to come in the future!)
- The `$softwareUpdateTimeoutSECONDS` increased to 1200 seconds because `softwareupdate` fails to report macOS preparation progress reliably even when it's working.
- The automatic removal of unnecessary macOS installers now ignores installers found in user home folders, except for installers found in ~/Applications, ~/Desktop, and ~/Downloads. In other words, if an unnecessary macOS installer is found in ~/Documents or ~/Library it will be ignored (the presumption being that it's an intentional archive), but if found in ~/Downloads it will be deleted. (Thanks to @dustin and @julienvs in #super on MacAdmins Slack for sacrificing their personal macOS installer archive!)
- Resolved an issue during installation if the `/user/local/bin` folder was missing from the local system. (Thanks to Matthieu Sibilleau in #super on MacAdmins Slack for finding this one!)
- Resolved several issues where the deferral timer was not being set properly. (Thanks to Dustin Nikles and Scott Thompson in #super on MacAdmins Slack for finding this one!)
- Resolved an issue where the enforce all items workflow was no properly closing notifications. (Thanks to Scott Thompson in #super on MacAdmins Slack for finding this one!)
- Resolved an issue where the macOS update/upgrade download sizes were improperly calculated when a comma was used in the download size. (Thanks to MiWeMP in #super on MacAdmins Slack for finding this one!)
- As always, countless logging refinements and correction of typos.
- Updated [example MDM configuration profiles for `super` 3.0b10](https://github.com/Macjutsu/super/tree/main/Example-MDM).
- `super` 3.0b10 SHA-256: 737f9a054d86173bc08e07bfdf23045b869b6c54a9cf6d3851f2f638aed07105

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
- New [Generate-MDM-Logs.sh](https://github.com/Macjutsu/super/blob/main/Super-Friends/Create-MDM-Logs.sh) script creates filtered logs for troubleshooting `super` MDM workflow issues.
- New [Generate-MDM-Update-Jamf-API.sh](https://github.com/Macjutsu/super/blob/main/Super-Friends/Create-MDM-Update-Jamf-API.sh) starts a macOS update/upgrade MDM workflow via the Jamf Pro API for troubleshooting `super` MDM workflow issues.
- Per Apple guidance, macOS 13.3 and later no longer double-check for available software updates when no updates are found.
- Improved download mechanism now only pre-downloads macOS updates/upgrades. This resolves issues where pre-downloading updates for actively running software (specifically Safari) would require the application to quit even though the update was only downloading.
- Improved `--test-mode` now simulates install now workflows, storage validation, power validation, and user authentication workflows.
- Improved restart validation mechanism (after macOS update/upgrade restart) is now more reliable.
- Improved soft and hard deadline information now shows in all appropriate macOS update/upgrade dialogs and notifications.
- Resolved an issue preventing the proper Deferral button text from showing. (Thanks to @homert83 and multiple folks in #super on MacAdmins Slack for spotting this one!)
- Resolved an issue that caused incompatible macOS Installers to download on older Mac computers. (Thanks to Kasper Andresen in #super on MacAdmins Slack for spotting this one!)
- Resolved several issues causing incorrect macOS Installer download status.
- Removed the `--display-timeout=seconds` option in favor of new specific timeout options.
- Updates to the `setDisplayLanguage()` function to allow for new install now workflow, available free space notification, power required notification, and user authentication dialog.
- As always, countless logging refinements and correction of typos.
- Updated [example MDM configuration profiles for `super` 3.0b9](https://github.com/Macjutsu/super/tree/main/Example-MDM).
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
	- `--display-accessory-type=VIDEOAUTO` display a video that will auto-play inside the interactive dialogs.
	- The `--display-accessory-content=/local/path or URL` option can accept a local path or a web URL. If the specified local path or URL can not be found then the custom display accessory will not be shown.
	- The Super-Friends folder now contains several [display accessory examples](https://github.com/Macjutsu/super/tree/main/Super-Friends).
- New `--help-button=plain text or URL` option allows you to specify a [help button for IBM Notifier](https://raw.githubusercontent.com/IBM/mac-ibm-notifications/main/Images/Popup/popup.png) interactive dialogs (jamfHelper dialogs do not support this option).
- New `--warning-button=plain text or URL` option allows you to specify a [warning button for IBM Notifier](https://raw.githubusercontent.com/IBM/mac-ibm-notifications/main/Images/Popup/popup.png) interactive dialogs (jamfHelper dialogs do not support this option).
	- If you specify a plain text string for either help or warning buttons, a pop-up will appear when the user selects the button.
	- If you specify a URL for either help or warning buttons, the URL will open in another application. Supported URL types are; http://, https://, mailto:, and jamfselfservice://. If a specified web URL cannot be found then the button will not be shown.
- New `--display-silently` option will open all IBM Notifier dialogs and notifications without playing the system warning sound (jamfHelper dialogs and notifications do not support this option).
- New Defer button will show the deferral time for IBM Notifier interactive dialogs and notifications (jamfHelper dialogs and notifications do not support this option). However, if the `--menu-defer=` option is also specified, then the default button will not show the deferral time as it's already displayed in the deferral pop-up menu.
- When using the `--test-mode` option with the self-update workflow the failure dialog is now also displayed (for testing validation).
- Improved Apple Silicon self-update/upgrade workflow notification dialogs describe required actions more accurately.
- Resolved an issue where the Apple Silicon self-update/upgrade workflow was not opening the correct application for macOS 12.3 or newer.
- Resolved an issue where the macOS via MDM workflow timeout was not properly trigger the failure notification. (Thanks to @marcelpogorzelski for spotting this one!)
- Bootstrap token validation now happens earlier in the credential management workflow and generates less logging on subsequent runs.
- Updates to the `setDisplayLanguage()` function to allow for new IBM Notifier display options and improved self-update/upgrade workflow text.
- As always, countless logging refinements and correction of typos.
- Updated [example MDM configuration profiles for `super` 3.0b8](https://github.com/Macjutsu/super/tree/main/Example-MDM).
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
- Updated [example MDM configuration profiles for `super` 3.0b7](https://github.com/Macjutsu/super/tree/main/Example-MDM).
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
- IBM Notifier [Version 2.8.0 Build 87](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-2.8.0-b-87) is automatically downloaded and installed to the `super` working folder.
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
- IBM Notifier [Version 2.7.1 Build 81](https://github.com/IBM/mac-ibm-notifications/releases/tag/v-2.7.1-b-81) is automatically downloaded and installed to the `super` working folder.
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

 - [IBM Notifier](https://github.com/IBM/mac-ibm-notifications) is automatically downloaded and installed to the `super` working folder.
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
