# Example Logs for 12.0 -> 13.3

__Architecture:__ Apple Silicon

__Credential:__ User Authenticated

__Workflow:__ For macOS 12.2 and older all macOS "major" upgrade workflows use the full macOS installer application.

__Relevant Logs:__
- `super.log` is the primary log showing all general workflow progress.
- `asu.log` is output from the `softwareupdate` command line. In this example `softwareupdate` was only responsible for the post-restart non-macOS software updates.
- `installer.log` first shows the macOS installer download progress from `erase-isntall.py` and then the macOS upgrade installation progress from `startosinstall`.
- `installerList.log` shows the available macOS installer download list from `erase-isntall.py`.
