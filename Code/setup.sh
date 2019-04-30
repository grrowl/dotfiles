#!/bin/bash

set -e

cp ./User/* "${HOME}/Library/Application Support/Code/User/"

cat list-extensions.txt | while read -r line; do code --install-extension "$line"; done
