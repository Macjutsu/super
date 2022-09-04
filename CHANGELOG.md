# CHANGELOG

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
- Significant rewrite of the `softwarupdate` workflows to fully support macOS 11 and later on both Intel and Apple Silicon computers. The previous "macOS Monterey Notification Fix" is no longer necessary. (Huge thanks to @StephenGrall for help on this!)
- The MDM update workflow via Jamf Pro is now supported on both Intel and Apple Silicon computers running macOS 11.5 and later.
- Credentials for the MDM update workflow via Jamf Pro are now validated and saved on all versions of macOS, thus allowing for use of the MDM update workflow once the system has reached macOS 11.5 or later.
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

- When used with Jamf Pro 10.38 or later, all MDM software update commands now use the Jamf Pro API (as opposed to the Classic API).
- When used with Jamf Pro 10.38 or later, system updates via MDM now forces a restart by killing any apps that don't quit when requested.
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
- The `--open-logs` option now works with older versions of macOS. However, detailed MDM and `softwareupdate` logs are still only available for macOS 11 or later.
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
