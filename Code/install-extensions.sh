#!/bin/bash
set -e

cat list-extensions.txt | while read line; do code --install-extension "$line"; done
