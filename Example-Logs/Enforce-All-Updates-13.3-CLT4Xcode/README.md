# Example Logs for enforcing Command Line Tools for Xcode update

__Architecture:__ Apple Silicon and Intel

__Credential:__ System (root)

__Workflow:__ All non-macOS software update workflows use `softwareupdate`. In this example the `--enforce-all-updates` option is enabled.

__Relevant Logs:__
- `super.log` is the primary log showing all general workflow progress.
- `asu.log` is output from the `softwareupdate` command line. In this example `softwareupdate` was responsible for non-macOS software updates.
