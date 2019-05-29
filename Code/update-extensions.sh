#!/bin/bash
set -e

cp /Users/tom/Library/Application\ Support/Code/User/keybindings.json ./User/
code --list-extensions > ./list-extensions.txt
