# S.U.P.E.R.M.A.N.

### Software Update Policy Enforcement (with) Recursive Messaging And Notification

S.U.P.E.R.M.A.N. optimizes the macOS software update experience.

by Kevin M. White

## Introduction

S.U.P.E.R.M.A.N. (or just `super`) is an open source script that provides administrators with a comprehensive workflow to encourage and enforce macOS software updates for both Intel and Apple Silicon computers. Deployed via a single script, `super` creates a background agent (aka LaunchDaemon) that ensures macOS software updates are applied with the least user interference possible. Further, `super` can also enforce macOS software updates with options for customizable deferrals and deadlines. In other words, `super` makes the macOS update experience better for both users and administrators alike.

__Version 2.x Compatibility__

There are so many new features in `super` 2.x that any existing scripts, Configuration Profiles, or other workflows designed for `super` 1.x are not compatible with `super` 2.x. Plese review the [change log](https://github.com/Macjutsu/super/blob/main/CHANGELOG.md) and `sudo super --help`!

## Features and Options

- Fully automated (no user authentication required) macOS software update workflow for both Intel and Apple Silicon computers.
- Customizable software update dialogs and notifications via [IBM Notifier](https://github.com/IBM/mac-ibm-notifications).
- Minimizes user downtime by automatically installing non-restart Apple software updates (Safari, Xcode, etc.) without prompting the user.
- Minimizes user downtime by automatically downloading and preparing system updates before interrupting the user to restart.
- Automatic deferral option for user Focus, Do Not Disturb, and screen sleep assertions (presentations, meetings, etc).
- A variety of enforcement options including maximum deferral counts, maximum deferral days, and date deadlines.
- Background agent (LaunchDaemon) works independently of management (MDM) service.
- Automatic installation of all required items and dependencies.
- Configurable via interactive command line `super` or MDM [managed preference](All_Managed_Options_com.macjutsu.super.plist).
- Substantial validation and logging including both testing and verbose modes.
- For computers managed via Jamf Pro, automatic inventory and policy check-in as soon as possible after computer restarts.
- For computers managed via Jamf Pro, option to run policies prior to system update restart.
- For computers managed via Jamf Pro, option to run policies without Apple software updates and still take advantage of dialogs, notifications, deferrals, and deadline workflows.

## Screenshots

__Update dialog with multiple deadlines and pop-up deferral choice__

![Example update dialog](https://github.com/Macjutsu/super/blob/main/Screenshots/Ask.png)

__Restart notification__

![Example restart notification](https://github.com/Macjutsu/super/blob/main/Screenshots/Restart.png)

## Requirements

__Mac computers with Intel:__

- Update via `softwareupdate` workflow validated on macOS 10.14 and later. Earlier versions of macOS may work, but have not been validated.
- Update via MDM workflow requires macOS 11.5 or later, Jamf Pro 10.35 or later, and providing `super` with credentials to a Jamf Pro API account.

__Mac computers with Apple Silicon:__

- Update via `softwareupdate` workflow requires providing `super` with credentials to an existing local account.
- Update via MDM workflow requires macOS 11.5 or later, Jamf Pro 10.35 or later, and providing `super` with credentials to a Jamf Pro API account.
- If update credentials are not provided to `super` then system updates can not be enforced on Apple Silicon computers. In this case `super` will prompt the user to update locally.

## Update Credential Details

Apple Silicon `softwareupdate` via an __existing local account:__
- Any version of macOS for Apple Silicon (macOS 11.0 or later).
- You must provide credentials for an existing local (standard or admin) user account who already has volume ownership permissions. User accounts created during Setup Assistant that have logged in at least once have volume ownership permissions. For more information see the [Apple Platform Deployment](https://support.apple.com/guide/deployment/use-secure-and-bootstrap-tokens-dep24dbdcf9e) guide.
- The provided credentials are used to authenticate the `softwareupdate` command.
- The provided credentials are stored in the System Keychain and can be viewed by other admin users.

Apple Silicon `softwareupdate` via an __automatically created local service account:__
- Any version of macOS for Apple Silicon (macOS 11.0 or later).
- You must provide credentials for an existing local admin user account who already has volume ownership permissions.  User accounts created during Setup Assistant that have logged in at least once have volume ownership permissions. For more information see the [Apple Platform Deployment](https://support.apple.com/guide/deployment/use-secure-and-bootstrap-tokens-dep24dbdcf9e) guide.
- The provided admin credentials are used to automatically generate a new local service account. This service account provides authentication for the `softwareupdate` command.
- The creation of the service account triggers a system security dialog unless you also deploy a PPPC Configuration Profile granting "SystemPolicySysAdminFiles" to either `com.apple.Terminal` or `/usr/local/jamf/bin/jamf` and `com.jamf.management.Jamf`.
- The admin credentials you provide are never saved to disk, but the local service account credentials are stored in the System Keychain and can be viewed by other admin users.
- The local service account is not an admin and can not log into the Mac, but if FileVault is enabled, this account is visible at startup and can unlock the drive.

Apple Silicon or Intel MDM software update command via the __Jamf Pro API:__
 - macOS 11.5 or later and Jamf Pro 10.35 or later.
 - Jamf Pro must have the bootstrap token escrowed for the computer. This is the default behavior for Jamf Pro via for computers with macOS 11 or later.
 - You must provide credentials that can authorize macOS software update MDM commands via the Jamf Pro API.
 - The Jamf Pro API credentials you provide are stored in the System Keychain and can be viewed by other admin users.
 - The default Jamf Pro privileges required for this account are "Jamf Pro Server Objects > Computers > Create & Read" and "Jamf Pro Server Actions > Send Computer Remote Command to Download and Install macOS Update".
 - You can significantly reduce the security risk of this account by removing the "Computers > Read" privilege requirement. However, this requires also deploying a custom Configuration Profile for the preference domain `com.macjutsu.super` containing the following: `<key>JamfProID</key> <string>$JSSID</string>`

_If multiple valid authorization methods are provided, the priority order is as follows: an existing local account, the local service account, and finally the Jamf Pro API credentials._

## Installation

__Version 2.x Compatibility__

There are so many new features in `super` 2.x that any existing scripts, Configuration Profiles, or other workflows designed for `super` 1.x are not compatible with `super` 2.x. Plese review the [change log](https://github.com/Macjutsu/super/blob/main/CHANGELOG.md) and `sudo super --help`!

__To install and run locally:__

1. Make sure the S.U.P.E.R.M.A.N. script (named just `super`) has appropriate execute permissions and then run it like any other local management script: `sudo /wherever/the/heck/you/downloaded/super --usage`
2. The `super` script automatically installs itself (and various other accoutrements) anytime it's ran from outside its working folder, which is defaulted to /Library/Management/super.
3. There's no step three. After self-installation, `super` automatically restarts itself using your previously specified options. Further, depending on your options, `super` may create a LaunchDeamon to keep itself running.

__To deploy via Jamf Pro:__

1. Create a new Policy adding the `super` script as-is, you don't need to modify it for most workflows.
2. If you only want to install `super` for testing, then use a single script Parameter Value of `--usage`. Alternately, you can specify multiple `super` options in the script Parameter Value fields, but only one option per field. Thus, you are limited to a total of 8 options with this method. Consider using a [Configuration Profile](https://github.com/Macjutsu/super/blob/main/All_Managed_Options_com.macjutsu.super.plist) for setting more options.
3. There's "basically" no step three (besides running the Policy). When run via Jamf Pro `super` automatically installs itself (and various other accoutrements) and then restarts itself using the options from the Parameter Values. Further, depending on your options, `super` may create a LaunchDeamon to keep itself running.

## General Usage

Wiki coming soon! No, really! I was just waiting to finalize `super` 2.x... Until then use: `sudo super --help`

You can also join the conversation at the [Mac Admins Foundation Slack](https://www.macadmins.org) in channel [super](https://macadmins.slack.com/archives/C03LKQ8EN2C).