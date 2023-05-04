# Example Logs for 13.3.1 -> 13.3.1 (a)

__Architecture:__ Apple Silicon

__Credential:__ Jamf Pro MDM

__Workflow:__ All macOS "minor" update workflows, including Rapid Security Response updates, use `softwareupdate`.

__Relevant Logs:__
- `super.log` is the primary log showing all general workflow progress.
- `asu.log` is output from the `softwareupdate` command line showing macOS download and installation progress.
- `mdmCommand.log` shows the network connection progress made by the `ManagedClient` system.
- `mdmWorkflow.log` shows the macOS update installation progress reported by `softwareupdated`.