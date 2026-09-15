# S.U.P.E.R.M.A.N. Display Folder

The content of the `super` __display__ folder consists of:
- The __display_defaults__ folder is the location for the default `super` display configuration files. __You should not modify the contents of this default folder.__ Instead, you should duplicate this folder, modify the duplicate items to your liking, and then use the `--display-config-custom-folder` option to direct `super` to the customized folder. __NOTE: The __display_defaults__ folder is replaced every time `super` is (re)installed from it's original package installer!__
- The most appropriate location for your additional customized display configuration folders is as additional sub-folders at the root of the `super` display folder. Any additional folders here will not be removed or replaced when a new version of `super` is reinstalled.
- A properly configured `super` display configuration folder will have sub-folders for each additional locale identifier you want to support. These folder names need to match the [Apple locale identifier format](https://developer.apple.com/documentation/foundation/nslocale/localeidentifier). For example, the US english display configuration sub-folder is named "en_US". If `super` can not find your custom display configurations folder or a locale identifier that matches the current user's selected locale identifier, then it will default to configuration from the __display_defaults__ folder.

Each local identifier configuration sub-folder should contain:
- Several __dialog\_\*.md__ Markdown files that define the main message area for each type of `super` interactive dialog.
- Several __notification\_\*.md__ Markdown files that define the main message area for each type of `super` non-interactive notification.
- A single __shared_strings.json__ JSON file that defines a variety of shared language strings used throughout the `super` workflow.

## More details coming soon!