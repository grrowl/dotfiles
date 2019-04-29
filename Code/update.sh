#!/bin/bash

set -e

grep -v 'oauth' /Users/tom/Library/Application\ Support/Code/User/settings.json > ./User/settings.json
cp /Users/tom/Library/Application\ Support/Code/User/keybindings.json ./User/
code --list-extensions > ./list-extensions.txt

# install extensions using:
# cat list-extensions.txt | while read line; do code --install-extension "$line"; done
