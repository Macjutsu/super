# S.U.P.E.R.M.A.N. Configuration Folder

The content of the `super` __config__ folder consists of:
- The __alternate_configs__ folder is the location for any optional alternate configuration .plist files. These files can be created and modified using various `super --config-*` options or via any other .plist editing method. For more information please visit the `super` Wiki page regarding [Advanced Alternate Configurations](https://github.com/Macjutsu/super/wiki/Advanced-Alternate-Configurations).
- The __alternate_config_examples__ folder contains inactive example alternate configuration .plist files. To use any of these examples in a `super` workflow they would need to be moved or copied to inside the __alternate_configs__ folder and then activated via a `super --config-start-*` option.
- The __DEFAULT_PARAMETERS.json__ file defines a variety of default `super` workflow paramaters that are stored externally to allow for modification. The specific attribute names and their default values are detailed below. __During normal operation it's almost never necessary to edit the values in this file but you might find it useful to make changes for troubleshooting and/or testing purposes. NOTE: The DEFAULT_PARAMETERS.json file is replaced every time `super` is (re)installed from it's original package installer!__

## More details coming soon!
