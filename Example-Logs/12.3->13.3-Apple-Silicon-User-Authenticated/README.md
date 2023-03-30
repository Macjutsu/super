# Example Logs for 12.3 -> 13.3

__Architecture:__ Apple Silicon

__Credential:__ User Authenticated

__Workflow:__ For macOS 12.3 and newer all local credential (non-MDM) macOS "major" upgrade workflows use `softwareupdate`.

__Relevant Logs:__
- `super.log` is the primary log showing all general workflow progress.
- `asu.log` is output from the `softwareupdate` command line showing macOS download and installation progress.
