# CHANGELOG

## [3.0b5]

2022-12-22

- __UPGRADE NOTICE: Any version of `super` prior to 3.0b4 may unintentionally upgrade computers with macOS 12.6.2 to macOS 13.1+. You should avoid using any version of `super` prior to version 3.0b4 on macOS 12 or newer.__
- Dialog and Notification title bars now show the macOS update/upgrade version. For example, "macOS 13.1 Upgrade Requires Restart".
- Re-organized (yet again) the macOS upgrade list workflow to better accommodate macOS 12.3 or newer systems, as such...
- All macOS 12.3 or newer Intel computers and Apple Silicon computers using a local authentication workflow now always upgrade macOS via the much faster `softwareupdate` workflow. However...
- All Apple Silicon computers using Jamf Pro API authentication now always upgrade macOS via the traditional installer workflow. (This is due to a limitation in the macOS MDM upgrade workflow, not in Jamf Pro or `super`.)
- All Intel computers now ignore the MDM update/upgrade workflow as it provides no benefit over standard local system (root) authentication.
- Resolved software update list cache validation issues on macOS 13.x.
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
