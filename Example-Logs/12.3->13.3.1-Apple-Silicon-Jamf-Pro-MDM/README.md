# Example Logs for 12.0 -> 13.3.1

__Architecture:__ Apple Silicon

__Credential:__ Jamf Pro MDM

__Workflow:__ For macOS 12.x and older macOS "major" upgrade MDM workflows use the full macOS installer application.

__Relevant Logs:__
- `super.log` is the primary log showing all general workflow progress.
- `installer.log` shows the macOS installer download progress from `erase-isntall.py`.
- `installerList.log` shows the available macOS installer download list from `erase-isntall.py`.
- `mdmCommand.log` shows the network connection progress made by the `ManagedClient` system.
- `mdmWorkflow.log` shows the macOS upgrade installation progress reported by `softwareupdated`.
