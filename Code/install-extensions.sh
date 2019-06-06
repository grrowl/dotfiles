#!/bin/bash
set -e

# uninstall extensions not in list-extensions.txt
code --list-extensions | comm -1 -3 list-extensions.txt - | while read -r line; do code --uninstall-extension "$line"; done

# install extensions not currently installed
code --list-extensions | comm -2 -3 list-extensions.txt - | while read -r line; do code --install-extension "$line"; done
