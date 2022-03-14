# CHANGELOG

## [1.0rc1]

2022-03-14

- Jamf Pro no longer required for `softwareupdate` workflow.
- Initial commits to GitHub including Apache 2.0 LICENSE and CHANGELOG.md.
- Introductory comments moved to README.md.
- Example managed preference file com.macjutsu.super.plist

## [1.0b]

2022-03-09

 - [IBM Notifier.app](https://github.com/IBM/mac-ibm-notifications) is automatically downloaded and installed in the $superFOLDER.
 - [IBM Notifier.app](https://github.com/IBM/mac-ibm-notifications) is default for all user interactions, but if IBM Notifier.app can't be downloaded or is invalid then super will fall back to jamfHelper.
 - Ability to specify custom icon size when using IBM Notifier.app via `--icon-size-ibm pixels` option and managed preference: `<key>IconSizeIbm</key> <string>number</string>`
 - Ability to specify custom icon size when using jamfHelper via `--icon-size-jamf pixels` option and managed preference: `<key>IconSizeJamf</key> <string>number</string>`
 - Ability to prefer jamfHelper over IBM Notifier.app via `--prefer-jamf | --no-prefer-jamf` options and managed preference: `<key>PreferJamf</key> <true/> | <false/>`
 - Deferral times all normalized to between 120 seconds and 86400 seconds (1 day).
 - Bug fixes and improvements for Display Redraw, Display Timeout, and Test Mode options.
 - Logging and Verbose Mode improvements.

## [0.9]

2022-02-28

- Initial private release.
