# CHANGELOG

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
